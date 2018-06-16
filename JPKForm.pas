unit JPKForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, SchemaJPK, Functions, Glowny, app_schema;

type
  TJPKForma = class(TForm)
    DateFrom: TMonthCalendar;
    Label1: TLabel;
    Label2: TLabel;
    btnGenerate: TButton;
    DateTo: TMonthCalendar;
    GroupBox1: TGroupBox;
    EUR: TRadioButton;
    PLN: TRadioButton;
    Label3: TLabel;
    Label4: TLabel;
    KodUrzedu: TEdit;
    Label5: TLabel;
    Podmiot: TComboBox;
    SaveDialog: TSaveDialog;
    procedure btnGenerateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JPKForma: TJPKForma;

implementation

{$R *.dfm}

procedure TJPKForma.btnGenerateClick(Sender: TObject);
var jpk: IXMLJPK; fa: IXMLFaktura; item: IXMLFakturaWiersz;
    podmiot: IXMLSprzedawcaType; klient: IXMLKlientType;
    faktura: IXMLFakturaType; towar: IXMLTowarType;
    i, j, countFV, countItems: Cardinal; sumFV, sumItems: Extended; sum: TSuma;
begin

  jpk := NewJPK;
  jpk.SetAttributeNS('xmlns:etd', '', 'http://crd.gov.pl/xml/schematy/dziedzinowe/mf/2016/01/25/eD/DefinicjeTypy/');

  with jpk.Naglowek do
  begin
    KodFormularza.KodSystemowy := 'JPK_FA (1)';
    KodFormularza.WersjaSchemy := '1-0';
    KodFormularza.Text := 'JPK_FA';
    WariantFormularza := 1;
    CelZlozenia := 1;
    DataWytworzeniaJPK := DateTimeToStr(Date + Time, 'T');
    DataOd := DateToStr(DateFrom.Date);
    DataDo := DateToStr(DateTo.Date);
    if PLN.Checked then
      DomyslnyKodWaluty := 'PLN' else
      DomyslnyKodWaluty := 'EUR';
    KodUrzedu := JPKForma.KodUrzedu.Text;
  end;

  podmiot := App.Sprzedawcy.Sprzedawca[JPKForma.Podmiot.ItemIndex];

  with jpk.Podmiot1 do
  begin
    IdentyfikatorPodmiotu.NIP := podmiot.NIP;
    IdentyfikatorPodmiotu.PelnaNazwa := podmiot.Nazwa1;
//    IdentyfikatorPodmiotu.REGON := '';
    AdresPodmiotu.KodKraju := 'PL';
    AdresPodmiotu.Wojewodztwo := Wojewodztwa[podmiot.Wojew];
    AdresPodmiotu.Powiat := 'nowos¹decki';
    AdresPodmiotu.Gmina := podmiot.Miasto;
    AdresPodmiotu.Miejscowosc := podmiot.Ulica;
    AdresPodmiotu.NrDomu := podmiot.NrDomu;
    AdresPodmiotu.NrLokalu := '';
    AdresPodmiotu.KodPocztowy := podmiot.Kod;
    AdresPodmiotu.Poczta := podmiot.Miasto;
  end;

  countFV := 0;
  countItems := 0;
  sumFV := 0;
  sumItems := 0;

  if App.Faktury.Count > 0 then
  begin
    for i := 0 to App.Faktury.Count - 1 do
    begin
      faktura := App.Faktury.Faktura[i];

      // warunki
      if faktura.Deleted then continue;
      if faktura.DataDok < DateFrom.Date then continue;
      if faktura.DataDok > DateTo.Date then continue;
      if faktura.Towary.Towar[0].PLN <> PLN.Checked then continue;

      if faktura.Sprzedawca.NIP = podmiot.NIP then
      begin
        klient := faktura.Klient;
        fa := jpk.Faktura.Add;
        fa.Typ := 'G';
        fa.P_1 := DateToStr(faktura.DataDok);
        fa.P_2A := IntToStr(i + 1);
        fa.P_3A := klient.Nazwa1;
        fa.P_3B := klient.Kod + ' ' + klient.Miasto + ', ' + klient.Ulica + ' ' + klient.NrDomu;
        fa.P_3C := podmiot.Nazwa1;                                                              
        fa.P_3D := podmiot.Kod + ' ' + podmiot.Miasto + ', ' + podmiot.Ulica + ' ' + podmiot.NrDomu;
        fa.P_4A := 'PL';
        fa.P_4B := podmiot.NIP;

        sum := sumaTowarow(faktura.Towary);
        fa.P_13_1 := JPKPriceFormat(sum.Netto);
        fa.P_14_1 := JPKPriceFormat(sum.VAT);
        fa.P_15   := JPKPriceFormat(sum.Brutto);

        fa.P_16 := false;
        fa.P_17 := false;
        fa.P_18 := false;
        fa.P_19 := false;
        fa.P_20 := false;
        fa.P_21 := false;
        fa.P_23 := false;

        fa.P_106E_2 := false;
        fa.P_106E_3 := false;

        fa.RodzajFaktury := 'VAT';

        Inc(countFV);
        sumFV := sumFV + sum.Brutto;

        // elementy faktury
        if faktura.Towary.Count > 1 then
        begin
          for j := 0 to faktura.Towary.Count - 1 do
          begin
            towar := faktura.Towary.Towar[j];
            item := jpk.FakturaWiersz.Add;
            item.Typ := 'G';
            item.P_2B := IntToStr(i + 1);
            item.P_7 := towar.Nazwa;
            item.P_8A := towar.Jm;
            item.P_8B := JPKPriceFormat(towar.Ilosc);
            item.P_9A := JPKPriceFormat(towar.CenaNSzt);
            item.P_9B := JPKPriceFormat(towar.VatProc / 100);
            item.P_11 := JPKPriceFormat(towar.WartNetto);
            item.P_11A := JPKPriceFormat(towar.WartBrutto);

            Inc(countItems);
            sumItems := sumItems + towar.WartBrutto;
          end;
        end;
        
      end;
    end;
  end;

  if countFV <= 0 then
  begin
     MessageBox(0, 'Nie znaleziono faktur do wygenerowania JPK', PChar(Application.Title), MB_ICONWARNING + MB_OK);
     exit;
  end;

  jpk.FakturaCtrl.LiczbaFaktur := IntToStr(countFV);
  jpk.FakturaCtrl.WartoscFaktur := JPKPriceFormat(sumFV);

  with jpk.StawkiPodatku do
  begin
    Stawka1 := JPKPriceFormat(0.23);
    Stawka2 := JPKPriceFormat(0.08);
    Stawka3 := JPKPriceFormat(0.05);
    Stawka4 := JPKPriceFormat(0.00);
    Stawka5 := JPKPriceFormat(0.00);
  end;

  jpk.FakturaWierszCtrl.LiczbaWierszyFaktur := IntToStr(countItems);
  jpk.FakturaWierszCtrl.WartoscWierszyFaktur := JPKPriceFormat(sumItems);

  // domyœlna nazwa pliku
  SaveDialog.FileName := 'JPK_' + jpk.Naglowek.DomyslnyKodWaluty + '_' +
    jpk.Naglowek.DataOd + '_' + jpk.Naglowek.DataDo + '.xml';

  if not SaveDialog.Execute then Exit;

  jpk.OwnerDocument.SaveToFile(SaveDialog.FileName);
  MessageBox(0, 'Wyeksportowano plik JPK', PChar(Application.Title), MB_ICONINFORMATION+MB_OK);
end;

procedure TJPKForma.FormCreate(Sender: TObject);
var i: Word;
begin
  DateTo.Date := now;
  DateFrom.Date := now;
  Podmiot.Items.Clear;
  if App.Sprzedawcy.Count > 0 then
  begin
    for i := 0 to App.Sprzedawcy.Count - 1 do
    begin
      Podmiot.Items.Add(App.Sprzedawcy.Sprzedawca[i].Nazwa1);
    end;
    Podmiot.ItemIndex := 0;
  end;
end;

end.

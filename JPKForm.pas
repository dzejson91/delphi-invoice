unit JPKForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, SchemaJPK, Functions, Unit1;

type
  TJPKForma = class(TForm)
    DateFrom: TMonthCalendar;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    DateTo: TMonthCalendar;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    EUR: TRadioButton;
    PLN: TRadioButton;
    Label3: TLabel;
    Label4: TLabel;
    KodUrzedu: TEdit;
    Label5: TLabel;
    Podmiot: TComboBox;
    procedure Button1Click(Sender: TObject);
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

procedure TJPKForma.Button1Click(Sender: TObject);
var jpk: IXMLJPK; fa: IXMLFaktura; item: IXMLFakturaWiersz;
podmiot, klient: TKlient; faktura: TFaktura; towar: TTowar;
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
    DomyslnyKodWaluty := 'PLN';
    KodUrzedu := JPKForma.KodUrzedu.Text;
  end;

  podmiot := Sprzed[JPKForma.Podmiot.ItemIndex];

  with jpk.Podmiot1 do
  begin
    IdentyfikatorPodmiotu.NIP := podmiot.NIP;
    IdentyfikatorPodmiotu.PelnaNazwa := podmiot.Nazwa1;
    IdentyfikatorPodmiotu.REGON := '';
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

  if FVIle > 0 then
  begin
    for i := 0 to FVIle - 1 do
    begin
      faktura := FV[i];
      if faktura.Dane.Sprzed.NIP = podmiot.NIP then
      begin
        klient := faktura.Dane.Kontra;
        fa := jpk.Faktura.Add;
        fa.Typ := 'G';
        fa.P_1 := DateToStr(faktura.Dane.DataDok);
        fa.P_2A := IntToStr(i + 1);
        fa.P_3A := klient.Nazwa1;
        fa.P_3B := klient.Kod + ' ' + klient.Miasto + ', ' + klient.Ulica + ' ' + klient.NrDomu;
        fa.P_3C := podmiot.Nazwa1;                                                              
        fa.P_3D := podmiot.Kod + ' ' + podmiot.Miasto + ', ' + podmiot.Ulica + ' ' + podmiot.NrDomu;
        fa.P_4A := 'PL';
        fa.P_4B := podmiot.NIP;

        sum := sumaTowarow(faktura.Towar);
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
        if faktura.TowarIle > 1 then
        begin
          for j := 0 to faktura.TowarIle - 1 do
          begin
            towar := faktura.Towar[j];
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

  Memo1.Lines.Text := jpk.XML;
end;

procedure TJPKForma.FormCreate(Sender: TObject);
var i: Word;
begin
  if SprzedIle > 0 then
  begin
    for i := 0 to SprzedIle - 1 do
    begin
      Podmiot.Items.Add(Sprzed[i].Nazwa1);
    end;
    Podmiot.ItemIndex := 0;
  end;
end;

end.

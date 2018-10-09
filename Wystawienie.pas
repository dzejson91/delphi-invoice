unit Wystawienie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, Buttons, Spin, StrUtils, app_schema;

type
  TWystaw = class(TForm)
    Clos: TButton;
    Pages1: TPageControl;
    TabSheet1: TTabSheet;
    Pages2: TPageControl;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    LSpr: TComboBox;
    GroupBox2: TGroupBox;
    LKon: TComboBox;
    TabSheet4: TTabSheet;
    Typ: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Nr: TEdit;
    Oryg: TComboBox;
    Label3: TLabel;
    Msc: TEdit;
    DataDzis: TDateTimePicker;
    Label4: TLabel;
    TabSheet3: TTabSheet;
    Label6: TLabel;
    DataZaplaty: TDateTimePicker;
    Label5: TLabel;
    Label9: TLabel;
    DataSprzed: TDateTimePicker;
    Label10: TLabel;
    Sposob: TComboBox;
    transport: TComboBox;
    Label11: TLabel;
    TabSheet5: TTabSheet;
    Uwagi: TMemo;
    Lista: TListView;
    btnDelete: TButton;
    btnAdd: TButton;
    btnPrint: TButton;
    btnPreview: TButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    IleDni: TSpinEdit;
    Label2: TLabel;
    KontrSearch: TEdit;
    PrintLogo: TCheckBox;
    procedure ClosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure LKonChange(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListaChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure LSprChange(Sender: TObject);
    procedure DataZaplatyChange(Sender: TObject);
    procedure IleDniChange(Sender: TObject);
    procedure KontrSearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Wystaw: TWystaw;

implementation

uses Glowny, TowarUsluga, Drukowanie, Kontrahenci;

{$R *.dfm}

function GetInfo(i: Cardinal; Spr: Boolean): String;
var k: IXMLKlientType; s: IXMLSprzedawcaType;
begin
  if Spr then
  begin
    s := App.Sprzedawcy.Sprzedawca[i];
    Result := s.NIP + ', '+s.Identyf+', '+s.Nazwa1+' '+s.Nazwa2+', '+s.Kod+' '+s.Miasto+' '+s.Ulica+' '+s.NrDomu;
  end else
  begin
    k := App.Klienci.Klient[i];
    Result := k.NIP + ', '+k.Identyf+', '+k.Nazwa1+' '+k.Nazwa2+', '+k.Kod+' '+k.Miasto+' '+k.Ulica+' '+k.NrDomu;
  end;
end;

function GetSearchKlientInfo(i: Cardinal): String;
var k: IXMLKlientType;
begin
  k := App.Klienci.Klient[i];
  Result:=LowerCase(k.Identyf+' '+k.Nazwa1+' '+k.Nazwa2);
end;

function SzukajKontra(s: String): Integer;
var i: Cardinal;
begin
  Result := -1;
  if App.Klienci.Count > 0 then
    for i := 0 to App.Klienci.Count-1 do
      if(Pos(LowerCase(s), GetSearchKlientInfo(i)) > 0) then
      begin
        result := i;
        break;
      end;
end;

procedure OdswiezListe;
var i: Word;
begin
  with Wystaw do begin
    LSpr.Clear;
    LKon.Clear;
    if App.Sprzedawcy.Count > 0 then
      for i:=0 to App.Sprzedawcy.Count-1 do
        LSpr.Items.Add(GetInfo(i, True));
    if App.Klienci.Count > 0 then
      for i:=0 to App.Klienci.Count-1 do
        LKon.Items.Add(GetInfo(i, False));
  end;
end;

procedure TWystaw.ClosClick(Sender: TObject);
begin
  Close;
end;

procedure TWystaw.FormShow(Sender: TObject);
begin
  Pages1.TabIndex:=0;
  Pages2.TabIndex:=0;
  OdswiezListe;
  DataDzis.DateTime:=Now;
  DataSprzed.DateTime:=Now;
  DataZaplaty.DateTime:=Now;
  //DataZaplaty.MinDate:=DataSprzed.Date;
  Msc.Text:=App.Konfiguracja.Msc;
  Typ.Text:=App.Konfiguracja.TypF;
  Nr.Text:=App.Konfiguracja.NrF;
  Oryg.ItemIndex:=App.Konfiguracja.TypD;
  Sposob.Text:=App.Konfiguracja.SZap;
  Transport.Text:=App.Konfiguracja.Trans;
end;

procedure TWystaw.btnDeleteClick(Sender: TObject);
begin
  Lista.DeleteSelected;
end;

procedure TWystaw.btnAddClick(Sender: TObject);
var L: TListItem;
begin
  Towar.Waluta.Enabled:=Lista.Items.Count = 0;
  if Towar.ShowModal = mrOk then
  begin
    L:=Lista.Items.Add;
    L.Caption:=IntToStr(L.Index+1);
    with Towar do
    begin
      L.SubItems.Add(Nazwa.Text);
      L.SubItems.Add(Jedn.Text);
      L.SubItems.Add(Waluta.Text);
      L.SubItems.Add(FormatFloat('0.00', Ilosc.Value));
      L.SubItems.Add(FormatFloat('0.00', Zl.Value+(Gr.Value/100)));
      L.SubItems.Add(FormatFloat('0', Rabat.Value));
      L.SubItems.Add(WartNetto.Text);
      L.SubItems.Add(FormatFloat('0', PVat.Value));
      L.SubItems.Add(WartVat.Text);
      L.SubItems.Add(WartBrutto.Text);
      L.SubItems.Add(BoolToStr(cbVatNd.Checked));
    end;
  end;
end;

procedure TWystaw.LKonChange(Sender: TObject);
begin
  if LKon.ItemIndex <> -1 then
    Uwagi.Text:=App.Klienci.Klient[LKon.ItemIndex].Uwagi;
end;

procedure TWystaw.btnPrintClick(Sender: TObject);
var AppTmp: IXMLAplikacjaType; F: IXMLFakturaType; i: Word; t: IXMLTowarType;
begin
  if Lista.Items.Count = 0 then Exit;
  if LSpr.ItemIndex < 0 then Exit;
  if LKon.ItemIndex < 0 then Exit;

  if NrFakExist(Nr.Text, App.Sprzedawcy.Sprzedawca[LSpr.ItemIndex]) then
  begin
    if MessageBox(0, 'Numer faktury jest ju¿ u¿ywany! Jesteœ pewnien(a)?', PChar(Application.Title), MB_ICONQUESTION+MB_YESNO) <> 6 then
      Exit;
  end;

  AppTmp := NewAplikacja;

  F := AppTmp.Faktury.Add;
  CopyXMLSprzedawca(App.Sprzedawcy.Sprzedawca[LSpr.ItemIndex], F.Sprzedawca);
  CopyXMLKlient(App.Klienci.Klient[LKon.ItemIndex], F.Klient);
  F.Miejsc:=Msc.Text;
  F.DataDok:=DataDzis.Date;
  F.TypFak:=Typ.Text;
  F.TypDok:=Oryg.Text;
  F.NrFak:=Nr.Text;
  F.DataSprzed:=DataSprzed.Date;
  F.SposZapl:=Sposob.Text;
  F.TermPlat:=DataZaplaty.Date;
  F.Transport:=Transport.Text;
  F.Uwagi:=Uwagi.Text;
  CopyXMLKurs(App.Konfiguracja.Kurs, F.Kurs);
  
  for i:=0 to Lista.Items.Count -1 do
  begin
    t := F.Towary.Add;
    t.Nazwa:=Lista.Items[i].SubItems.Strings[0];
    t.Jm:=Lista.Items[i].SubItems.Strings[1];
    t.PLN:=Lista.Items[i].SubItems.Strings[2] = 'PLN';
    t.Ilosc:=StrToFloat(Lista.Items[i].SubItems.Strings[3]);
    t.CenaNSzt:=StrToFloat(Lista.Items[i].SubItems.Strings[4]);
    t.Rabat:=StrToInt(Lista.Items[i].SubItems.Strings[5]);
    t.WartNetto:=StrToFloat(Lista.Items[i].SubItems.Strings[6]);
    t.VatProc:=StrToInt(Lista.Items[i].SubItems.Strings[7]);
    t.WartVAT:=StrToFloat(Lista.Items[i].SubItems.Strings[8]);
    t.WartBrutto:=StrToFloat(Lista.Items[i].SubItems.Strings[9]);
    t.VatNd:=StrToBool(Lista.Items[i].SubItems.Strings[10]);
    if i = 0 then F.Kurs.Euro:=not t.PLN;
  end;

  // podgl¹d
  if (Sender as TButton).Tag = 1 then
  begin
    Drukuj.Druk(F, True);
  end else
  begin // druk i zapis
    if F.TypDok = Oryg.Items.Strings[0] then
    begin
      CopyXMLFaktura(F, App.Faktury.Add); // zapis to archiwum
      Drukuj.Druk(F, False);
      Drukuj.Druk(F, False);
      end else
    begin
      CopyXMLFaktura(F, App.Faktury.Add);
      Drukuj.Druk(F, False);
    end;
    SaveXML(Path + PlikXML); // zapis pliku
  end;
end;

procedure TWystaw.SpeedButton1Click(Sender: TObject);
begin
  Kontrahent.ShowModal;
  OdswiezListe;
end;

procedure TWystaw.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  App.Konfiguracja.Msc := Msc.Text;
  App.Konfiguracja.TypF := Typ.Text;
  App.Konfiguracja.NrF := Nr.Text;
  App.Konfiguracja.Trans := Transport.Text;
  App.Konfiguracja.TypD := Oryg.ItemIndex;
  App.Konfiguracja.SZap := Sposob.Text;
end;

procedure TWystaw.ListaChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  btnPrint.Enabled:=(Lista.Items.Count > 0) and (LSpr.ItemIndex >= 0) and (LKon.ItemIndex >= 0) ;
  btnPreview.Enabled:=btnPrint.Enabled;
end;

procedure TWystaw.LSprChange(Sender: TObject);
begin
  btnPrint.Enabled:=(Lista.Items.Count > 0) and (LSpr.ItemIndex >= 0) and (LKon.ItemIndex >= 0) ;
  btnPreview.Enabled:=btnPrint.Enabled;
  if LKon.ItemIndex >= 0 then
    Uwagi.Text:=App.Klienci.Klient[LKon.ItemIndex].Uwagi;
end;

procedure TWystaw.KontrSearchChange(Sender: TObject);
begin
  LKon.ItemIndex := SzukajKontra(KontrSearch.Text);
  LSprChange(nil);
end;

procedure TWystaw.DataZaplatyChange(Sender: TObject);
begin
  IleDni.Value:=Round(DataZaplaty.Date-DataSprzed.Date);
end;

procedure TWystaw.IleDniChange(Sender: TObject);
begin
  DataZaplaty.Date:=DataDzis.Date+IleDni.Value;
end;

end.

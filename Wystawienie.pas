unit Wystawienie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, Buttons, Spin, StrUtils;

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
    Usun: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    IleDni: TSpinEdit;
    Label2: TLabel;
    KontrSearch: TEdit;
    PrintLogo: TCheckBox;
    procedure ClosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UsunClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LKonChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
Uses Unit1, TowarUsluga, Drukowanie, Kontrahenci;
{$R *.dfm}

function GetInfo(i: Word; Spr: Boolean): String;
var K: TKlient;
begin
  if Spr then
    K:=Sprzed[i] else
    K:=Kontra[i];
  Result:=Copy(K.NIP, 3, 10)+', '+K.Identyf+', '+K.Nazwa1+' '+K.Nazwa2+', '+K.Kod+' '+K.Miasto+' '+K.Ulica+' '+K.NrDomu;
end;

function GetSearchInfo(i: Word): String;
var K: TKlient;
begin
  K:=Kontra[i];
  Result:=LowerCase(K.Identyf+' '+K.Nazwa1+' '+K.Nazwa2);
end;

function SzukajKontra(s: String): Integer;
var i: Integer;
begin
  Result := -1;
  with Wystaw do
    if KontraIle > 0 then
      for i:=0 to KontraIle-1 do
        if(Pos(LowerCase(s), GetSearchInfo(i)) > 0) then
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
    if SprzedIle > 0 then
      for i:=0 to SprzedIle-1 do
        LSpr.Items.Add(GetInfo(i, True));
    if KontraIle > 0 then
      for i:=0 to KontraIle-1 do
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
  Msc.Text:=Setup.Msc;
  Typ.Text:=Setup.TypF;
  Nr.Text:=Setup.NrF;
  Oryg.ItemIndex:=Setup.TypD;
  Sposob.Text:=Setup.SZap;
  Transport.Text:=Setup.Trans;
end;

procedure TWystaw.UsunClick(Sender: TObject);
begin
  Lista.DeleteSelected;
end;

procedure TWystaw.Button1Click(Sender: TObject);
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
    end;
  end;
end;

procedure TWystaw.LKonChange(Sender: TObject);
begin
  if LKon.ItemIndex <> -1 then
    Uwagi.Text:=Kontra[LKon.ItemIndex].Uwagi;
end;

procedure TWystaw.Button2Click(Sender: TObject);
var F: TFaktura; i: Word;
begin
  if Lista.Items.Count = 0 then Exit;
  if LSpr.ItemIndex < 0 then Exit;
  if LKon.ItemIndex < 0 then Exit;
  F.Dane.Sprzed:=Sprzed[LSpr.ItemIndex];
  F.Dane.Kontra:=Kontra[LKon.ItemIndex];
  F.Dane.Miejsc:=Msc.Text;
  F.Dane.DataDok:=DataDzis.Date;
  F.Dane.TypFak:=Typ.Text;
  F.Dane.TypDok:=Oryg.Text;
  F.Dane.NrFak:=Nr.Text;
  F.Dane.DataSprzed:=DataSprzed.Date;
  F.Dane.SposZapl:=Sposob.Text;
  F.Dane.TermPlat:=DataZaplaty.Date;
  F.Dane.Transport:=Transport.Text;
  F.Dane.Uwagi:=Uwagi.Text;
  F.Dane.Kurs:=Setup.Kurs;
  F.TowarIle:=Lista.Items.Count;
  SetLength(F.Towar, F.TowarIle);
  for i:=0 to F.TowarIle-1 do
  begin
    F.Towar[i].Nazwa:=Lista.Items[i].SubItems.Strings[0];
    F.Towar[i].Jm:=Lista.Items[i].SubItems.Strings[1];
    F.Towar[i].PLN:=Lista.Items[i].SubItems.Strings[2] = 'PLN';
    F.Towar[i].Ilosc:=StrToFloat(Lista.Items[i].SubItems.Strings[3]);
    F.Towar[i].CenaNSzt:=StrToFloat(Lista.Items[i].SubItems.Strings[4]);
    F.Towar[i].Rabat:=StrToInt(Lista.Items[i].SubItems.Strings[5]);
    F.Towar[i].WartNetto:=StrToFloat(Lista.Items[i].SubItems.Strings[6]);
    F.Towar[i].VatProc:=StrToInt(Lista.Items[i].SubItems.Strings[7]);
    F.Towar[i].WartVAT:=StrToFloat(Lista.Items[i].SubItems.Strings[8]);
    F.Towar[i].WartBrutto:=StrToFloat(Lista.Items[i].SubItems.Strings[9]);
    if i = 0 then F.Dane.Kurs.Euro:=not F.Towar[i].PLN;
  end;

  if (Sender as TButton).Tag = 1 then
    Drukuj.Druk(F, True) else
    if F.Dane.TypDok = Oryg.Items.Strings[0] then
    begin
      Forma.AppendFV(F);
      Drukuj.Druk(F, False);
      Drukuj.Druk(F, False);
      end else
    begin
      Forma.AppendFV(F);
      Drukuj.Druk(F, False);
    end;
end;

procedure TWystaw.SpeedButton1Click(Sender: TObject);
begin
  Kontrahent.ShowModal;
  Forma.ZapisKontra;
  OdswiezListe;
end;

procedure TWystaw.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Setup.Msc := Msc.Text;
  Setup.TypF := Typ.Text;
  Setup.NrF := Nr.Text;
  Setup.Trans := Transport.Text;
  Setup.TypD := Oryg.ItemIndex;
  Setup.SZap := Sposob.Text;
end;

procedure TWystaw.ListaChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  Button2.Enabled:=(Lista.Items.Count > 0) and (LSpr.ItemIndex >= 0) and (LKon.ItemIndex >= 0) ;
  Button3.Enabled:=Button2.Enabled;
end;

procedure TWystaw.LSprChange(Sender: TObject);
begin
  Button2.Enabled:=(Lista.Items.Count > 0) and (LSpr.ItemIndex >= 0) and (LKon.ItemIndex >= 0) ;
  Button3.Enabled:=Button2.Enabled;
  if LKon.ItemIndex >= 0 then
    Uwagi.Text:=Kontra[LKon.ItemIndex].Uwagi;
end;

procedure TWystaw.KontrSearchChange(Sender: TObject);
begin
  LKon.ItemIndex := SzukajKontra(KontrSearch.Text);
 // ShowMessage(IntToStr(SzukajKontra(KontrSearch.Text)));
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

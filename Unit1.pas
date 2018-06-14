unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, uLkJSON, app_schema;

const
  PlikSpr = 'Sprzedawcy.baz';
  PlikKon = 'Nabywcy.baz';
  PlikSet = 'Ustawienia.dat';
  PlikFV  = 'Faktury.fv';
  PlikNT  = 'Towary.txt';
  PlikXML = 'App.xml';

  Wojewodztwa: array [0..16] of string = (
    '',
    'dolnoœl¹skie',
    'kujawsko-pomorskie',
    'lubelskie',
    'lubuskie',
    '³ódzkie',
    'ma³opolskie',
    'mazowieckie',
    'opolskie',
    'podkarpackie',
    'podlaskie',
    'pomorskie',
    'œl¹skie',
    'œwiêtokrzyskie',
    'warmiñsko-mazurskie',
    'wielkopolskie',
    'zachodniopomorskie'
  );

type

  TKlient = record
    Identyf: String[128];
    Nazwa1: String[255];
    Nazwa2: String[255];
    NIP: String[13];
    Kod: String[6];
    Miasto: String[128];
    Ulica: String[128];
    NrDomu: String[20];
    Wojew: Byte;
    Oddzial: String[128];
    NBanku1: String[255];
    NrKonta1: String[32];
    NBanku2: String[255];
    NrKonta2: String[32];
    Uwagi: String[255];
  end;

  TKurs = record
    Euro: Boolean;
    Kurs: Single;
    Data: TDate;
    NrTab: String[10];
  end;

  TDane = record
    Sprzed: TKlient;
    Kontra: TKlient;
    Miejsc: String[128];
    DataDok: TDate;
    TypFak: String[15];
    NrFak: String[20];
    TypDok: String[20];
    DataSprzed: TDate;
    SposZapl: String[30];
    TermPlat: TDate;
    Transport: String[64];
    Uwagi: String[255];
    Kurs: TKurs;
  end;

  TTowar = record
    Nazwa: String[255];
    Jm: String[10];
    PLN: Boolean;
    Ilosc: Double;
    CenaNSzt: Double;
    Rabat: Byte;
    WartNetto: Double;
    VatProc: Byte;
    WartVAT: Double;
    WartBrutto: Double;
  end;

  TFaktura = record
    Dane: TDane;
    TowarIle: Byte;
    Towar: array of TTowar;
  end;

  TSetup = record
    Drukarka: SmallInt;
    Podglad: SmallInt;
    Czcionka: String[48];
    Kurs: TKurs;
    Msc: String[128];
    TypF: String[15];
    NrF: String[20];
    TypD: Byte;
    Trans: String[64];
    SZap: String[30];
  end;

  TForma = class(TForm)
    MainMenu: TMainMenu;
    Plik1: TMenuItem;
    Listy1: TMenuItem;
    Listasprzedawcw1: TMenuItem;
    Listanabywcw1: TMenuItem;
    Zamknij1: TMenuItem;
    Wystawfaktur1: TMenuItem;
    Ustawienia1: TMenuItem;
    Archiwumfaktur1: TMenuItem;
    Opcje1: TMenuItem;
    BtnCreateFV: TButton;
    BtnContractor: TButton;
    BtnArchive: TButton;
    btnExportJson: TButton;
    SaveDialog: TSaveDialog;
    BtnJPK: TButton;
    btnParseXML: TButton;
    btnLoadXML: TButton;
    btnSaveXML: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Zamknij1Click(Sender: TObject);
    procedure Listasprzedawcw1Click(Sender: TObject);
    procedure Listanabywcw1Click(Sender: TObject);
    procedure Wystawfaktur1Click(Sender: TObject);
    procedure Ustawienia1Click(Sender: TObject);
    procedure Archiwumfaktur1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure logoClick(Sender: TObject);
    procedure btnExportJsonClick(Sender: TObject);
    procedure BtnJPKClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnParseXMLClick(Sender: TObject);
    procedure btnLoadXMLClick(Sender: TObject);
    procedure btnSaveXMLClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UtworzFolder(S: String);
    procedure OdczytSprzed;
    procedure ZapisSprzed;
    procedure OdczytKontra;
    procedure ZapisKontra;

    procedure ZapiszUst;
    procedure OdczytUst;

    procedure AppendFV(F: TFaktura);
    procedure ZapiszFV;
    procedure ZapiszFVJSON(fileName: string);
    procedure OdczytFV;
    
    { Public declarations }
  end;

var
  App: IXMLAplikacjaType;

  PXMLKursType: ^IXMLKursType;

  Forma: TForma;
  Path: String;
  Sprzed: array of TKlient; SprzedIle: Word;
  Kontra: array of TKlient; KontraIle: Word;
  FV: array of TFaktura; FVIle: Cardinal;

  Setup: TSetup;

  function Maska(S, Mask: String): Boolean;
  function NrFakExist(NrFak: String): Boolean;

implementation

uses Wlasciciele, Kontrahenci, Wystawienie, Ustawienia, Archiwum, JPKForm;

{$R *.dfm}

procedure TKlientToXMLKlient(k: TKlient; xk: IXMLKlientType);
begin
  xk.Identyf := k.Identyf;
  xk.Nazwa1 := k.Nazwa1;
  xk.Nazwa2 := Trim(k.Nazwa2);
  xk.NIP := Trim(k.NIP); 
  xk.Kod := Trim(k.Kod);

  if (Length(xk.NIP) = 0) and (pos('NIP:', xk.Nazwa2) = 1) then
  begin
    xk.NIP := Trim(Copy(xk.Nazwa2, 5, Length(xk.Nazwa2)));
    xk.Nazwa2 := '';
  end;   

  if (Length(xk.NIP) = 0) and (pos('ATU', xk.Nazwa2) = 1) then
  begin
    xk.NIP := StringReplace(xk.Nazwa2, ' ', '', []);
    xk.NIP := StringReplace(xk.NIP, ':', '', []);
    xk.Nazwa2 := '';
  end;

  if Length(Trim(k.Kod)) = 5 then
     xk.Kod := Copy(k.Kod, 1, 2) + '-' + Copy(k.Kod, 3, 3);
     
  xk.Miasto := k.Miasto;
  xk.Ulica := k.Ulica;
  xk.NrDomu := k.NrDomu;
  xk.Wojew := Wojewodztwa[k.Wojew];
  xk.Oddzial := k.Oddzial;
  xk.NBanku1 := k.NBanku1;
  xk.NrKonta1 := k.NrKonta1;
  xk.NBanku2 := k.NBanku2;
  xk.NrKonta2 := k.NrKonta2;
  xk.Uwagi := k.Uwagi;
end;

procedure TKlientToXMLSprzedawca(k: TKlient; xk: IXMLSprzedawcaType);
begin
  xk.Identyf := k.Identyf;
  xk.Nazwa1 := k.Nazwa1;
  xk.Nazwa2 := Trim(k.Nazwa2);
  xk.NIP := Trim(k.NIP);
  xk.Kod := Trim(k.Kod);

  if (Length(xk.NIP) = 0) and (pos('NIP:', xk.Nazwa2) = 1) then
  begin
    xk.NIP := Trim(Copy(xk.Nazwa2, 5, Length(xk.Nazwa2)));
    xk.Nazwa2 := '';
  end;  

  if (Length(xk.NIP) = 0) and (pos('ATU', xk.Nazwa2) = 1) then
  begin
    xk.NIP := StringReplace(xk.Nazwa2, ' ', '', []);
    xk.NIP := StringReplace(xk.NIP, ':', '', []);
    xk.Nazwa2 := '';
  end;

  if Length(Trim(k.Kod)) = 5 then
     xk.Kod := Copy(k.Kod, 1, 2) + '-' + Copy(k.Kod, 3, 3);
     
  xk.Miasto := k.Miasto;
  xk.Ulica := k.Ulica;
  xk.NrDomu := k.NrDomu;
  xk.Wojew := Wojewodztwa[k.Wojew];
  xk.Oddzial := k.Oddzial;
  xk.NBanku1 := k.NBanku1;
  xk.NrKonta1 := k.NrKonta1;
  xk.NBanku2 := k.NBanku2;
  xk.NrKonta2 := k.NrKonta2;
  xk.Uwagi := k.Uwagi;
end;

procedure TKursToXMLKurs(k: TKurs; xk: IXMLKursType);
begin
  xk.Euro := k.Euro;
  xk.Kurs := k.Kurs;
  xk.Data := k.Data;
  xk.NrTab := k.NrTab;
end;

function NrFakExist(NrFak: String): Boolean;
var i: Cardinal;
begin
  if FVIle > 0 then
    for i := 0 to FVIle - 1 do
      if FV[i].Dane.NrFak = NrFak then
      begin
        Result := True;
        exit;
      end;
  Result := false;
end;

function formatDate(data: TDate): string;
begin
  Result := FormatDateTime('yyyy-mm-dd', data);
end;

function KlientToJSONObject(klient: TKlient): TlkJSONobject;
begin
  Result := TlkJSONobject.Create();
  Result.Add('id', klient.Identyf);
  Result.Add('nazwa1', klient.Nazwa1);
  Result.Add('nazwa2', klient.Nazwa2);
  Result.Add('nip', klient.NIP);
  Result.Add('kod', klient.Kod);
  Result.Add('miasto', klient.Miasto);
  Result.Add('ulica', klient.Ulica);
  Result.Add('nr_domu', klient.NrDomu);
  Result.Add('wojewodztwo', klient.Wojew);
  Result.Add('oddzial', klient.Oddzial);
  Result.Add('nr_banku_1', klient.NBanku1);
  Result.Add('nr_konta_1', klient.NrKonta1);
  Result.Add('nr_banku_2', klient.NBanku2);
  Result.Add('nr_konta_2', klient.NrKonta2);
  Result.Add('uwagi', klient.Uwagi);
end;

function KursToJSONObject(kurs: TKurs): TlkJSONobject;
begin
  Result := TlkJSONobject.Create();
  Result.Add('euro', kurs.Euro);
  Result.Add('kurs', kurs.Kurs);
  Result.Add('data', formatDate(kurs.Data));
  Result.Add('nr_tab', kurs.NrTab);
end;

function DaneToJSONObject(dane: TDane): TlkJSONobject;
begin
  Result := TlkJSONobject.Create();
  Result.Add('sprzed', KlientToJSONObject(dane.Sprzed));
  Result.Add('kontra', KlientToJSONObject(dane.Kontra));
  Result.Add('miejsc', dane.Miejsc);
  Result.Add('data_dok', formatDate(dane.DataDok));
  Result.Add('typ_dok', dane.TypDok);
  Result.Add('typ_fv', dane.TypFak);
  Result.Add('nr_fv', dane.NrFak);
  Result.Add('data_sprzed', formatDate(dane.DataSprzed));
  Result.Add('sposob_zapl', dane.SposZapl);
  Result.Add('term_plat', formatDate(dane.TermPlat));
  Result.Add('transport', dane.Transport);
  Result.Add('uwagi', dane.Uwagi);
  Result.Add('kurs', KursToJSONObject(dane.Kurs));
end;

function TowarToJSONObject(towar: TTowar): TlkJSONobject;
begin
  Result := TlkJSONobject.Create();
  Result.Add('nazwa', towar.Nazwa);
  Result.Add('jm', towar.Jm);
  Result.Add('pln', towar.PLN);
  Result.Add('ilosc', towar.Ilosc);
  Result.Add('cena_szt', towar.CenaNSzt);
  Result.Add('rabat', towar.Rabat);
  Result.Add('wart_netto', towar.WartNetto);
  Result.Add('vat', towar.VatProc);
  Result.Add('wart_vat', towar.WartVAT);
  Result.Add('wart_brutto', towar.WartBrutto);
end;

function FakturaToJSONObject(fv: TFaktura): TlkJSONobject;
var i: cardinal; list: TlkJSONlist;
begin
  Result := TlkJSONobject.Create();
  list := TlkJSONlist.Create;
  Result.Add('dane', DaneToJSONObject(fv.Dane));
  for i := 0 to fv.TowarIle - 1 do
  begin
    list.Add(TowarToJSONObject(fv.Towar[i]));
  end;
  Result.Add('produkty', list);
  //list.Free;
end;

function Maska(S, Mask: String): Boolean;
var i: Word;
begin
  Result:=True;
  for i:=1 to Length(S) do
    if Pos(S[i], Mask) = 0 then
    begin
      Result:=False;
      Exit;
    end;
end;

procedure TForma.UtworzFolder(S: String);
begin
  if not DirectoryExists(S) then
    CreateDirectory(PChar(S), nil);
end;

procedure TForma.OdczytSprzed;
var FS: TFileStream; i: Word;
begin
  if not FileExists(Path+PlikSpr) then Exit;
  FS:=TFileStream.Create(Path+PlikSpr, fmOpenRead);
  try
    FS.Read(SprzedIle, SizeOf(SprzedIle));
    SetLength(Sprzed, SprzedIle);
    if SprzedIle > 0 then
      for i:=0 to SprzedIle-1 do
        FS.Read(Sprzed[i], SizeOf(TKlient));
  finally
    FS.Free;
  end;
end;

procedure TForma.ZapisSprzed;
var FS: TFileStream; i: Word;
begin
  if FileExists(Path+PlikSpr) then
  FS:=TFileStream.Create(Path+PlikSpr, fmOpenWrite) else
  FS:=TFileStream.Create(Path+PlikSpr, fmCreate);
  try
    FS.Write(SprzedIle, SizeOf(SprzedIle));
    if SprzedIle > 0 then
      for i:=0 to SprzedIle-1 do
        FS.Write(Sprzed[i], SizeOf(TKlient));
  finally
    FS.Free;
  end;
end;

procedure TForma.OdczytKontra;
var FS: TFileStream; i: Word;
begin
  if not FileExists(Path+PlikKon) then Exit;
  FS:=TFileStream.Create(Path+PlikKon, fmOpenRead);
  try
    FS.Read(KontraIle, SizeOf(KontraIle));
    SetLength(Kontra, KontraIle);
    if KontraIle > 0 then
      for i:=0 to KontraIle-1 do
        FS.Read(Kontra[i], SizeOf(TKlient));
  finally
    FS.Free;
  end;
end;

procedure TForma.ZapisKontra;
var FS: TFileStream; i: Word;
begin
  if FileExists(Path+PlikKon) then
  FS:=TFileStream.Create(Path+PlikKon, fmOpenWrite) else
  FS:=TFileStream.Create(Path+PlikKon, fmCreate);
  try
    FS.Write(KontraIle, SizeOf(KontraIle));
    if KontraIle > 0 then
      for i:=0 to KontraIle-1 do
        FS.Write(Kontra[i], SizeOf(TKlient));
  finally
    FS.Free;
  end;
end;

procedure TForma.ZapiszUst;
var FS: TFileStream;
begin
  if FileExists(Path+PlikSet) then
  FS:=TFileStream.Create(Path+PlikSet, fmOpenWrite) else
  FS:=TFileStream.Create(Path+PlikSet, fmCreate);
  try
    FS.Write(Setup, SizeOf(Setup));
  finally
    FS.Free;
  end;
end;

procedure TForma.OdczytUst;
var FS: TFileStream;
begin
  if not FileExists(Path+PlikSet) then Exit;
  FS:=TFileStream.Create(Path+PlikSet, fmOpenRead);
  try
    FS.Read(Setup, SizeOf(Setup));
  finally
    FS.Free;
  end;
end;

procedure TForma.AppendFV(F: TFaktura);
begin
  Inc(FVIle);
  SetLength(FV, FVIle);
  FV[FVIle-1]:=F;
end;

procedure TForma.ZapiszFV;
var FS: TFileStream; i, j: Cardinal; 
begin
  if FileExists(Path+PlikFV) then
    FS:=TFileStream.Create(Path+PlikFV, fmOpenWrite) else
    FS:=TFileStream.Create(Path+PlikFV, fmCreate);
  try
    FS.Write(FVIle, SizeOf(FVIle));
    if FVIle > 0 then
      for i:=0 to FVIle-1 do
      begin
        FS.Write(FV[i].Dane, SizeOf(FV[i].Dane));
        FS.Write(FV[i].TowarIle, SizeOf(FV[i].TowarIle));
        if FV[i].TowarIle > 0 then
          for j:=0 to FV[i].TowarIle-1 do
            FS.Write(FV[i].Towar[j], SizeOf(FV[i].Towar[j]));
      end;
  finally
    FS.Free;
  end;


end;

procedure TForma.ZapiszFVJSON(fileName: string);
var i: Cardinal; list: TlkJSONlist; stream: TlkJSONstreamed;
begin
  list := TlkJSONlist.Create;
  stream := TlkJSONstreamed.Create;
  try
      for i:=0 to FVIle-1 do
      begin
        list.Add(FakturaToJSONObject(FV[i]));
      end;
      stream.SaveToFile(list, fileName);
  finally
    list.Free;
  end;
end;

procedure TForma.OdczytFV;
var FS: TFileStream; i, j: Cardinal;
begin
  FVIle:=0;
  SetLength(FV, FVIle);
  if not FileExists(Path+PlikFV) then Exit;
  FS:=TFileStream.Create(Path+PlikFV, fmOpenRead);
  try
    FS.Read(FVIle, SizeOf(FVIle));
    SetLength(FV, FVIle);
    if FVIle > 0 then
      for i:=0 to FVIle-1 do
      begin
        FS.Read(FV[i].Dane, SizeOf(FV[i].Dane));
        FS.Read(FV[i].TowarIle, SizeOf(FV[i].TowarIle));
        SetLength(FV[i].Towar, FV[i].TowarIle);
        if FV[i].TowarIle > 0 then
          for j:=0 to FV[i].TowarIle-1 do
            FS.Read(FV[i].Towar[j], SizeOf(FV[i].Towar[j]));
      end;
  finally
    FS.Free;
  end;
end;

procedure TForma.FormCreate(Sender: TObject);
begin
  Width:=900;
  Height:=600;
  Setup.Drukarka:=-1;
  Setup.Podglad:=-1;
  Setup.Czcionka:='Courier New';
  Setup.TypF:='FV';
  Setup.Kurs.Kurs:=4.0253;
  Setup.Kurs.Data:=Now;
  Setup.Kurs.NrTab:='73/2011';
  Setup.TypD:=0;
  Path:=ExtractFilePath(ParamStr(0))+'Dane\';
  UtworzFolder(Path);
  OdczytSprzed;
  OdczytKontra;
  OdczytUst;
  OdczytFV;
  App := NewAplikacja;
end;

procedure TForma.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var i: Word;
begin
  if (ssCtrl in Shift) and (Key = VkKeyScan('h')) then
    for i := 0 to Forma.ComponentCount -1 do
    begin
      if Forma.Components[i].ClassName = 'TButton' then
      begin
        (Forma.Components[i] as TButton).Visible := true;
      end;
    end;
end;

procedure TForma.Zamknij1Click(Sender: TObject);
begin
  Close;
end;

procedure TForma.btnExportJsonClick(Sender: TObject);
begin
  if SaveDialog.Execute() then
  begin
    ZapiszFVJSON(SaveDialog.FileName);
    MessageBox(0, 'Zapisano pomyœlnie', 'Eksport danych do pliku JSON', MB_OK);
  end;
end;

procedure TForma.BtnJPKClick(Sender: TObject);
begin
  JPKForma.ShowModal;
end;

procedure TForma.Listasprzedawcw1Click(Sender: TObject);
begin
  Wlasciciel.ShowModal;
  ZapisSprzed;
end;

procedure TForma.logoClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked;
end;

procedure TForma.Listanabywcw1Click(Sender: TObject);
begin
  Kontrahent.ShowModal;
  ZapisKontra;
end;

procedure TForma.Wystawfaktur1Click(Sender: TObject);
begin
  Wystaw.ShowModal;
end;

procedure TForma.Ustawienia1Click(Sender: TObject);
begin
  Ustaw.ShowModal;
  ZapiszUst;
end;

procedure TForma.Archiwumfaktur1Click(Sender: TObject);
begin
  Archiw.ShowModal;
end;

procedure TForma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ZapiszFV;
  ZapiszUst;
end;

procedure TForma.btnParseXMLClick(Sender: TObject);
var i, j: Cardinal; k: TKlient; f: TFaktura; t: TTowar;
    xk: IXMLKlientType; xs: IXMLSprzedawcaType;
    xf: IXMLFakturaType; xt: IXMLTowarType;
begin

  App := NewAplikacja();

  App.Konfiguracja.Drukarka   := Setup.Drukarka;
  App.Konfiguracja.Podglad    := Setup.Podglad;
  App.Konfiguracja.Czcionka   := Setup.Czcionka;
  TKursToXMLKurs(Setup.Kurs, App.Konfiguracja.Kurs);
  App.Konfiguracja.Msc        := Setup.Msc;
  App.Konfiguracja.TypF       := Setup.TypF;
  App.Konfiguracja.NrF        := Setup.NrF;
  App.Konfiguracja.TypD       := Setup.TypD;
  App.Konfiguracja.Trans      := Setup.Trans;
  App.Konfiguracja.SZap       := Setup.SZap;

  App.Sprzedawcy.Clear;

  if SprzedIle > 0 then
    for i := 0 to SprzedIle-1 do
    begin
      k := Sprzed[i];
      xs := App.Sprzedawcy.Add;
      xs.Uid := i+1; 
      TKlientToXMLSprzedawca(k, xs);
    end;
          
  App.Klienci.Clear;

  if KontraIle > 0 then
    for i := 0 to KontraIle-1 do
    begin
      k := Kontra[i];
      xk := App.Klienci.Add;
      xk.Uid := i+1;    
      TKlientToXMLKlient(k, xk);
    end;

  App.Faktury.Clear;

  if FVIle > 0 then
    for i := 0 to FVIle-1 do
    begin
      f := FV[i];
      xf := App.Faktury.Add;
      xf.Uid := i+1;
      TKlientToXMLKlient(f.Dane.Kontra, xf.Klient);
      TKlientToXMLSprzedawca(f.Dane.Sprzed, xf.Sprzedawca);
      xf.Miejsc := f.Dane.Miejsc;
      xf.DataDok := f.Dane.DataDok;
      xf.TypFak := f.Dane.TypFak;
      xf.NrFak := f.Dane.NrFak;
      xf.TypDok := f.Dane.TypDok;
      xf.DataSprzed := f.Dane.DataSprzed;
      xf.SposZapl := f.Dane.SposZapl;
      xf.TermPlat := f.Dane.TermPlat;
      xf.Transport := f.Dane.Transport;
      xf.Uwagi := f.Dane.Uwagi;
      TKursToXMLKurs(f.Dane.Kurs, xf.Kurs);

      for j := 0 to f.TowarIle - 1 do
      begin
        t := f.Towar[j];
        xt := xf.Towary.Add;
        xt.Nazwa := t.Nazwa;
        xt.Jm := t.Jm;
        xt.PLN := t.PLN;
        xt.Ilosc := t.Ilosc;
        xt.CenaNSzt := t.CenaNSzt;
        xt.Rabat := t.Rabat;
        xt.WartNetto := t.WartNetto;
        xt.VatProc := t.VatProc;
        xt.WartVAT := t.WartVAT;
        xt.WartBrutto := t.WartBrutto;
      end;
    end;

  App.OwnerDocument.SaveToFile(Path + PlikXML);
end;  

procedure TForma.btnLoadXMLClick(Sender: TObject);
begin
  App := LoadAplikacja(Path + PlikXML);
end;

procedure TForma.btnSaveXMLClick(Sender: TObject);
begin
  App.OwnerDocument.SaveToFile(Path + PlikXML);
end;




end.

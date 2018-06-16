unit Glowny;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, app_schema;

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

  TFOptim = record
    id: Integer;
    text: String;
    skip: Boolean;
  end;

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
    BtnCreateFV: TButton;
    BtnContractor: TButton;
    BtnArchive: TButton;
    SaveDialog: TSaveDialog;
    BtnJPK: TButton;
    btnSeller: TButton;
    brnConfig: TButton;
    btnImportStruct: TButton;
    btnBackup: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnJPKClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnImportStructClick(Sender: TObject);
    procedure BtnCreateFVClick(Sender: TObject);
    procedure brnConfigClick(Sender: TObject);
    procedure BtnArchiveClick(Sender: TObject);
    procedure btnSellerClick(Sender: TObject);
    procedure BtnContractorClick(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UtworzFolder(S: String);
    
    { Public declarations }
  end;

var
  App: IXMLAplikacjaType;

  Forma: TForma;
  Path: String;
  Sprzed: array of TKlient; SprzedIle: Word;
  Kontra: array of TKlient; KontraIle: Word;
  FV: array of TFaktura; FVIle: Cardinal; 
  FOptims: array of TFOptim;
  Setup: TSetup;

  function Maska(S, Mask: String): Boolean;
  function NrFakExist(NrFak: string): Boolean;
  
  procedure CopyXMLSprzedawca(src, dst: IXMLSprzedawcaType);
  procedure CopyXMLKlient(src, dst: IXMLKlientType);
  procedure CopyXMLKurs(src, dst: IXMLKursType);
  procedure CopyXMLTowar(src, dst: IXMLTowarType);
  procedure CopyXMLFaktura(src, dst: IXMLFakturaType);   

implementation

uses Ustawienia, Archiwum, Kontrahenci, Wystawienie, Wlasciciele, JPKForm;

{$R *.dfm}

function formatDate(data: TDate): string;
begin
  Result := FormatDateTime('yyyy-mm-dd', data);
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

function NrFakExist(NrFak: string): Boolean;
var i: Cardinal;
begin
  if App.Faktury.Count > 0 then
    for i := 0 to App.Faktury.Count - 1 do
      if App.Faktury.Faktura[i].NrFak = NrFak then
      begin
        Result := true;
        exit;
      end;
  Result := false;
end;

procedure SaveXML(fileName: string);
begin
  App.OwnerDocument.SaveToFile(fileName);
end;

procedure LoadXML(fileName: string);
begin
  if FileExists(fileName) then
  begin
    App := LoadAplikacja(fileName);
  end else
  begin
    App := NewAplikacja;
    App.Konfiguracja.Drukarka := 0;
    App.Konfiguracja.Podglad := 0;
    App.Konfiguracja.Czcionka := 'Courier New';
    App.Konfiguracja.TypF := 'FV';
    App.Konfiguracja.Kurs.Euro := False;
    App.Konfiguracja.Kurs.Kurs := 4.0253;
    App.Konfiguracja.Kurs.Data := Now;
    App.Konfiguracja.Kurs.NrTab := '73/2011';
    App.Konfiguracja.TypD := 0;
  end;
end;

procedure CopyXMLSprzedawca(src, dst: IXMLSprzedawcaType);
begin
  dst.Identyf := src.Identyf;
  dst.Nazwa1 := src.Nazwa1;
  dst.Nazwa2 := src.Nazwa2;
  dst.NIP := src.NIP;
  dst.Kod := src.Kod;
  dst.Miasto := src.Miasto;
  dst.Ulica := src.Ulica;
  dst.NrDomu := src.NrDomu;
  dst.Wojew := src.Wojew;
  dst.Oddzial := src.Oddzial;
  dst.NBanku1 := src.NBanku1;
  dst.NrKonta1 := src.NrKonta1;
  dst.NBanku2 := src.NBanku2;
  dst.NrKonta2 := src.NrKonta2;
  dst.Uwagi := src.Uwagi;
end;

procedure CopyXMLKlient(src, dst: IXMLKlientType);
begin
  dst.Identyf := src.Identyf;
  dst.Nazwa1 := src.Nazwa1;
  dst.Nazwa2 := src.Nazwa2;
  dst.NIP := src.NIP;
  dst.Kod := src.Kod;
  dst.Miasto := src.Miasto;
  dst.Ulica := src.Ulica;
  dst.NrDomu := src.NrDomu;
  dst.Wojew := src.Wojew;
  dst.Oddzial := src.Oddzial;
  dst.NBanku1 := src.NBanku1;
  dst.NrKonta1 := src.NrKonta1;
  dst.NBanku2 := src.NBanku2;
  dst.NrKonta2 := src.NrKonta2;
  dst.Uwagi := src.Uwagi;
end;

procedure CopyXMLKurs(src, dst: IXMLKursType);
begin
  dst.Euro := src.Euro;
  dst.Kurs := src.Kurs;
  dst.Data := src.Data;
  dst.NrTab := src.NrTab;
end;

procedure CopyXMLTowar(src, dst: IXMLTowarType);
begin
  dst.Nazwa := src.Nazwa;
  dst.Jm := src.Jm;
  dst.PLN := src.PLN;
  dst.Ilosc := src.Ilosc;
  dst.CenaNSzt := src.CenaNSzt;
  dst.Rabat := src.Rabat;
  dst.WartNetto := src.WartNetto;
  dst.VatProc := src.VatProc;
  dst.WartVAT := src.WartVAT;
  dst.WartBrutto := src.WartBrutto;
end;

procedure CopyXMLFaktura(src, dst: IXMLFakturaType);
var i: Integer;
begin
  CopyXMLKlient(src.Klient, dst.Klient);
  CopyXMLSprzedawca(src.Sprzedawca, dst.Sprzedawca);
  dst.Miejsc := src.Miejsc;
  dst.DataDok := src.DataDok;
  dst.TypFak := src.TypFak;
  dst.NrFak := src.NrFak;
  dst.TypDok := src.TypDok;
  dst.DataSprzed := src.DataSprzed;
  dst.SposZapl := src.SposZapl;
  dst.TermPlat := src.TermPlat;
  dst.Transport := src.Transport;
  dst.Uwagi := src.Uwagi;
  CopyXMLKurs(src.Kurs, dst.Kurs);
  dst.Deleted := src.Deleted;

  dst.Towary.Clear;
  if src.Towary.Count > 0 then
    for i := 0 to src.Towary.Count - 1 do
      CopyXMLTowar(src.Towary.Towar[i], dst.Towary.Add);
end;

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
  xk.Wojew := k.Wojew;
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
  xk.Wojew := k.Wojew;
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

procedure TForma.UtworzFolder(S: String);
begin
  if not DirectoryExists(S) then
    CreateDirectory(PChar(S), nil);
end;

procedure OdczytSprzed;
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

procedure ZapisSprzed;
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

procedure OdczytKontra;
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

procedure ZapisKontra;
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

procedure ZapiszUst;
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

procedure OdczytUst;
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

procedure ZapiszFV;
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

procedure OdczytFV;
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
  Path:=ExtractFilePath(ParamStr(0))+'Dane\';
  UtworzFolder(Path);
  LoadXML(Path + PlikXML);
  
  Width:=900;
  Height:=600;
end;   

procedure TForma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveXML(Path + PlikXML);
end;

procedure TForma.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var i: Integer;
begin
  if (ssCtrl in Shift) and (ssShift in Shift) and (Key = VK_F1) then
  begin
    for i := 0 to Forma.ComponentCount - 1 do
    begin
      if Forma.Components[i].ClassName = 'TButton' then
        (Forma.Components[i] as TButton).Visible := True;
    end;
  end;
end;

procedure TForma.btnImportStructClick(Sender: TObject);
var i, j: Cardinal; k: TKlient; f: TFaktura; t: TTowar;
    xk: IXMLKlientType; xs: IXMLSprzedawcaType;
    xf: IXMLFakturaType; xt: IXMLTowarType;
begin

  OdczytUst;
  OdczytSprzed;
  OdczytKontra;
  OdczytFV;

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

  if SprzedIle > 0 then
    for i := 0 to SprzedIle-1 do
    begin
      k := Sprzed[i];
      xs := App.Sprzedawcy.Add;
      TKlientToXMLSprzedawca(k, xs);
    end;

  if KontraIle > 0 then
    for i := 0 to KontraIle-1 do
    begin
      k := Kontra[i];
      xk := App.Klienci.Add;
      TKlientToXMLKlient(k, xk);
    end;

  if FVIle > 0 then
    for i := 0 to FVIle-1 do
    begin
      f := FV[i];
      xf := App.Faktury.Add;
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

    SaveXML(Path + PlikXML);
    MessageBox(0, 'Zaimportowano dane strukturalne do XML', PChar(Application.Title), MB_ICONINFORMATION+MB_OK);
end;

procedure TForma.brnConfigClick(Sender: TObject);
begin
  Ustaw.ShowModal;
end;

procedure TForma.BtnArchiveClick(Sender: TObject);
begin
  Archiw.ShowModal;
end;

procedure TForma.btnBackupClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    SaveXML(SaveDialog.FileName);
end;

procedure TForma.BtnContractorClick(Sender: TObject);
begin
  Kontrahent.ShowModal;
end;

procedure TForma.BtnCreateFVClick(Sender: TObject);
begin
  Wystaw.ShowModal;
end; 

procedure TForma.btnSellerClick(Sender: TObject);
begin
  Wlasciciel.ShowModal;
end;

procedure TForma.BtnJPKClick(Sender: TObject);
begin
  JPKForma.ShowModal;
end;

end.

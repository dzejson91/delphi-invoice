unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, uLkJSON;

const
  PlikSpr = 'Sprzedawcy.baz';
  PlikKon = 'Nabywcy.baz';
  PlikSet = 'Ustawienia.dat';
  PlikFV  = 'Faktury.fv';
  PlikNT  = 'Towary.txt';

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
  Forma: TForma;
  Path: String;
  Sprzed: array of TKlient; SprzedIle: Word;
  Kontra: array of TKlient; KontraIle: Word;
  FV: array of TFaktura; FVIle: Cardinal;

  Setup: TSetup;

  function Maska(S, Mask: String): Boolean;

implementation

uses Wlasciciele, Kontrahenci, Wystawienie, Ustawienia, Archiwum, JPKForm;

{$R *.dfm}

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

end.

unit Wlasciciele;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, XPMan;

type               TWlasciciel = class(TForm)
    Lista: TListView;
    Pages: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Ident: TEdit;
    Kod: TMaskEdit;
    Miasto: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Ulica: TEdit;
    Label6: TLabel;
    Nazwa1: TEdit;
    Nazwa2: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    BNazwa1: TEdit;
    TabSheet3: TTabSheet;
    Uwagi: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    BNumer1: TMaskEdit;
    NIP: TMaskEdit;
    Label9: TLabel;
    NrDomu: TEdit;
    Label10: TLabel;
    Oddzial: TEdit;
    Label11: TLabel;
    Wojew: TComboBox;
    Edycja: TLabel;
    BNumer2: TMaskEdit;
    BNazwa2: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListaChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IdentExit(Sender: TObject);
    procedure PagesExit(Sender: TObject);
    procedure ListaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Wlasciciel: TWlasciciel;

implementation
uses Unit1;
{$R *.dfm}

function Sprawdz: Boolean;
begin
  Result:=True;
  with Wlasciciel do
  begin    
    if Lista.SelCount > 0 then Result:=False else
    if Ident.Text = '' then Result:=False else
    if Nazwa1.Text = '' then Result:=False else
    if Miasto.Text = '' then Result:=False else
    if Ulica.Text = '' then Result:=False;
  end;
end;

procedure OdswiezListe;
var i: Word; L: TListItem;
begin
  Wlasciciel.Lista.Clear;
  if SprzedIle > 0 then
    for i:=0 to SprzedIle-1 do
    begin
      L:=Wlasciciel.Lista.Items.Add;
      L.Caption:=Sprzed[i].Identyf;
      L.SubItems.Add(Sprzed[i].Nazwa1);
      L.SubItems.Add(Sprzed[i].NIP);
      L.SubItems.Add(Sprzed[i].Kod+' '+Sprzed[i].Miasto+', '+Sprzed[i].Ulica);
    end;
  Wlasciciel.Button2.Enabled:=Sprawdz;
  Application.ProcessMessages;
end;

procedure TWlasciciel.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TWlasciciel.Button1Click(Sender: TObject);
var id: Word;
begin
  if Lista.SelCount = 0 then Exit;
  if MessageBox(0, 'Czy na pewno usun¹æ dane w³aœciciela?', PChar(Application.Title), MB_ICONQUESTION+MB_YESNO) <> 6 then Exit;
  id:=Lista.Selected.Index;
  while id < SprzedIle-1 do
  begin
    Sprzed[id]:=Sprzed[id+1];
    Inc(id);
  end;
  Dec(SprzedIle);
  SetLength(Sprzed, SprzedIle);
  OdswiezListe;
end;

procedure TWlasciciel.ListaChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var i: Word;
begin
  Button1.Enabled := Lista.SelCount > 0;
  if Lista.SelCount > 0 then
    Edycja.Caption:='Edycja zaznaczonego elementu' else
    Edycja.Caption:='';
    
  //Button2.Enabled:=Sprawdz;
  if Lista.SelCount > 0 then
  begin
    i:=Lista.Selected.Index;
    Ident.Text:=Sprzed[i].Identyf;
    NIP.Text:=Sprzed[i].NIP;
    Nazwa1.Text:=Sprzed[i].Nazwa1;
    Nazwa2.Text:=Sprzed[i].Nazwa2;
    Kod.Text:=Sprzed[i].Kod;
    Miasto.Text:=Sprzed[i].Miasto;
    Ulica.Text:=Sprzed[i].Ulica;
    NrDomu.Text:=Sprzed[i].NrDomu;
    Wojew.ItemIndex:=Sprzed[i].Wojew;
    Oddzial.Text:=Sprzed[i].Oddzial;
    BNazwa1.Text:=Sprzed[i].NBanku1;
    BNumer1.Text:=Sprzed[i].NrKonta1;
    BNazwa2.Text:=Sprzed[i].NBanku2;
    BNumer2.Text:=Sprzed[i].NrKonta2;
    Uwagi.Text:=Sprzed[i].Uwagi;
  end else
  begin
    Ident.Text:='';
    NIP.Text:='';
    Nazwa1.Text:='';
    Nazwa2.Text:='';
    Kod.Text:='';
    Miasto.Text:='';
    Ulica.Text:='';
    NrDomu.Text:='';
    Wojew.ItemIndex:=0;
    Oddzial.Text:='';
    BNazwa1.Text:='';
    BNumer1.Text:='';
    BNazwa2.Text:='';
    BNumer2.Text:='';
    Uwagi.Text:='';
  end;
end;

procedure TWlasciciel.Button2Click(Sender: TObject);
var K: TKlient;
begin
  Button2.Enabled:=Sprawdz;
  if not Button2.Enabled then Exit;
  K.Identyf := Ident.Text;
  K.NIP := NIP.Text;
  K.Nazwa1 := Nazwa1.Text;
  K.Nazwa2 := Nazwa2.Text;
  K.Kod := Kod.Text;
  K.Miasto := Miasto.Text;
  K.Ulica := Ulica.Text;
  K.NrDomu := NrDomu.Text;
  K.Wojew := Wojew.ItemIndex;
  K.Oddzial := Oddzial.Text;
  K.NBanku1 := BNazwa1.Text;
  K.NrKonta1 := BNumer1.Text;
  K.NBanku2 := BNazwa2.Text;
  K.NrKonta2 := BNumer2.Text;
  K.Uwagi := Uwagi.Text;
  Inc(SprzedIle);
  SetLength(Sprzed, SprzedIle);
  Sprzed[SprzedIle-1]:=K;
  OdswiezListe;
end;

procedure TWlasciciel.FormShow(Sender: TObject);
begin
  OdswiezListe;
  Pages.TabIndex:=0;
end;

procedure TWlasciciel.IdentExit(Sender: TObject);
var K: TKlient;
begin
  if Lista.SelCount > 0 then
  begin
    K:=Sprzed[Lista.Selected.Index];
    K.Identyf := Ident.Text;
    K.NIP := NIP.Text;
    K.Nazwa1 := Nazwa1.Text;
    K.Nazwa2 := Nazwa2.Text;
    K.Kod := Kod.Text;
    K.Miasto := Miasto.Text;
    K.Ulica := Ulica.Text;
    K.NrDomu := NrDomu.Text;
    K.Wojew := Wojew.ItemIndex;
    K.Oddzial := Oddzial.Text;
    K.NBanku1 := BNazwa1.Text;
    K.NrKonta1 := BNumer1.Text;
    K.NBanku2 := BNazwa2.Text;
    K.NrKonta2 := BNumer2.Text;
    K.Uwagi := Uwagi.Text;
    Sprzed[Lista.Selected.Index] := K;
  end;
  Button2.Enabled:=Sprawdz;
end;

procedure TWlasciciel.PagesExit(Sender: TObject);
begin
  if Lista.SelCount > 0 then
    OdswiezListe;
end;

procedure TWlasciciel.ListaClick(Sender: TObject);
begin
  Button2.Enabled:=Sprawdz;
end;

end.

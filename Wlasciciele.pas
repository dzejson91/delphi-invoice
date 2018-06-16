unit Wlasciciele;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, XPMan, app_schema;

type
  TWlasciciel = class(TForm)
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

uses Glowny;

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
  if App.Sprzedawcy.Count > 0 then
    for i:=0 to App.Sprzedawcy.Count-1 do
    begin
      //if App.Sprzedawcy.Sprzedawca[i].Deleted then continue;
      L:=Wlasciciel.Lista.Items.Add;
      L.Caption:=App.Sprzedawcy.Sprzedawca[i].Identyf;
      L.SubItems.Add(App.Sprzedawcy.Sprzedawca[i].Nazwa1);
      L.SubItems.Add(App.Sprzedawcy.Sprzedawca[i].NIP);
      L.SubItems.Add(App.Sprzedawcy.Sprzedawca[i].Kod+' '+App.Sprzedawcy.Sprzedawca[i].Miasto+', '+App.Sprzedawcy.Sprzedawca[i].Ulica);
    end;
  Wlasciciel.Button2.Enabled:=Sprawdz;
  Application.ProcessMessages;
end;

procedure TWlasciciel.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TWlasciciel.Button1Click(Sender: TObject);
begin
  if Lista.SelCount = 0 then Exit;
  if MessageBox(0, 'Czy na pewno usun¹æ dane w³aœciciela?', PChar(Application.Title), MB_ICONQUESTION+MB_YESNO) <> 6 then Exit;
  //App.Sprzedawcy.Sprzedawca[Lista.Selected.Index].Deleted := true;
  App.Sprzedawcy.Delete(Lista.Selected.Index);
  OdswiezListe;
end;

procedure TWlasciciel.ListaChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var s: IXMLSprzedawcaType;
begin
  Button1.Enabled := Lista.SelCount > 0;
  if Lista.SelCount > 0 then
    Edycja.Caption:='Edycja zaznaczonego elementu' else
    Edycja.Caption:='';
    
  //Button2.Enabled:=Sprawdz;
  if Lista.SelCount > 0 then
  begin
    s := App.Sprzedawcy.Sprzedawca[Lista.Selected.Index];
    Ident.Text:=s.Identyf;
    NIP.Text:=s.NIP;
    Nazwa1.Text:=s.Nazwa1;
    Nazwa2.Text:=s.Nazwa2;
    Kod.Text:=s.Kod;
    Miasto.Text:=s.Miasto;
    Ulica.Text:=s.Ulica;
    NrDomu.Text:=s.NrDomu;
    Wojew.ItemIndex:=s.Wojew;
    Oddzial.Text:=s.Oddzial;
    BNazwa1.Text:=s.NBanku1;
    BNumer1.Text:=s.NrKonta1;
    BNazwa2.Text:=s.NBanku2;
    BNumer2.Text:=s.NrKonta2;
    Uwagi.Text:=s.Uwagi;
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
var s: IXMLSprzedawcaType;
begin
  Button2.Enabled:=Sprawdz;
  if not Button2.Enabled then Exit;
  s := App.Sprzedawcy.Add;
  s.Identyf := Ident.Text;
  s.NIP := NIP.Text;
  s.Nazwa1 := Nazwa1.Text;
  s.Nazwa2 := Nazwa2.Text;
  s.Kod := Kod.Text;
  s.Miasto := Miasto.Text;
  s.Ulica := Ulica.Text;
  s.NrDomu := NrDomu.Text;
  s.Wojew := Wojew.ItemIndex;
  s.Oddzial := Oddzial.Text;
  s.NBanku1 := BNazwa1.Text;
  s.NrKonta1 := BNumer1.Text;
  s.NBanku2 := BNazwa2.Text;
  s.NrKonta2 := BNumer2.Text;
  s.Uwagi := Uwagi.Text;
  OdswiezListe;
end;

procedure TWlasciciel.FormShow(Sender: TObject);
begin
  OdswiezListe;
  Pages.TabIndex:=0;
end;

procedure TWlasciciel.IdentExit(Sender: TObject);
var s: IXMLSprzedawcaType;
begin
  if Lista.SelCount > 0 then
  begin
    s:=App.Sprzedawcy.Sprzedawca[Lista.Selected.Index];
    s.Identyf := Ident.Text;
    s.NIP := NIP.Text;
    s.Nazwa1 := Nazwa1.Text;
    s.Nazwa2 := Nazwa2.Text;
    s.Kod := Kod.Text;
    s.Miasto := Miasto.Text;
    s.Ulica := Ulica.Text;
    s.NrDomu := NrDomu.Text;
    s.Wojew := Wojew.ItemIndex;
    s.Oddzial := Oddzial.Text;
    s.NBanku1 := BNazwa1.Text;
    s.NrKonta1 := BNumer1.Text;
    s.NBanku2 := BNazwa2.Text;
    s.NrKonta2 := BNumer2.Text;
    s.Uwagi := Uwagi.Text;
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

unit Kontrahenci;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, app_schema;

type
  TKontrahent = class(TForm)
    Lista: TListView;
    Pages: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Ident: TEdit;
    Kod: TMaskEdit;
    Miasto: TEdit;
    Ulica: TEdit;
    Nazwa1: TEdit;
    Nazwa2: TEdit;
    NIP: TMaskEdit;
    NrDomu: TEdit;
    Oddzial: TEdit;
    Wojew: TComboBox;
    TabSheet2: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    BNazwa: TEdit;
    BNumer: TMaskEdit;
    TabSheet3: TTabSheet;
    Uwagi: TMemo;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    Edycja: TLabel;
    Label12: TLabel;
    Search: TEdit;
    procedure PagesExit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListaChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IdentExit(Sender: TObject);
    procedure ListaClick(Sender: TObject);
    procedure SearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Kontrahent: TKontrahent;

implementation

uses Glowny;

{$R *.dfm}

function Sprawdz: Boolean;
begin
 // Result:=True;
  with Kontrahent do
  begin
    if Lista.SelCount > 0 then Result:=False else
    if Ident.Text = '' then Result:=False else
    if Nazwa1.Text = '' then Result:=False else
//    if Miasto.Text = '' then Result:=False else
//    if Ulica.Text = '' then Result:=False else
      Result:=True;
  end;
end;

procedure OdswiezListe;
var i: Word; L: TListItem; s: String; k: IXMLKlientType;
begin
  Kontrahent.Lista.Clear;
  if App.Klienci.Count > 0 then
    for i:=0 to App.Klienci.Count-1 do
    begin
      k := App.Klienci.Klient[i];
//      if k.Deleted then continue;
      
      s:= k.Nazwa1+' '+k.NIP+' '+k.Kod+' '+k.Miasto+', '+k.Ulica;
      if(Length(Kontrahent.Search.Text) > 0) and (Pos(LowerCase(Kontrahent.Search.Text), LowerCase(s)) <= 0) then
          Continue;

      L:=Kontrahent.Lista.Items.Add;
      L.Caption:=k.Identyf;
      L.SubItems.Add(k.Nazwa1);
      L.SubItems.Add(k.NIP);
      L.SubItems.Add(k.Kod+' '+k.Miasto+', '+k.Ulica);
      L.SubItems.Add(IntToStr(i));
    end;
  Kontrahent.Button2.Enabled:=Sprawdz;
  Application.ProcessMessages;
end;

procedure TKontrahent.PagesExit(Sender: TObject);
begin
  if Lista.SelCount > 0 then
    OdswiezListe;
end;

procedure TKontrahent.SearchChange(Sender: TObject);
begin
  OdswiezListe;
end;

procedure TKontrahent.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TKontrahent.Button1Click(Sender: TObject);
var index: Integer;
begin
  if Lista.SelCount = 0 then Exit;
  if MessageBox(0, 'Czy na pewno usun¹æ dane kontrahenta?', PChar(Application.Title), MB_ICONQUESTION+MB_YESNO) <> 6 then Exit;
  index := StrToInt(Lista.Selected.SubItems.Strings[3]);
//  App.Klienci.Klient[index].Deleted := True;
  App.Klienci.Delete(index);
  OdswiezListe;
end;

procedure TKontrahent.ListaChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var k: IXMLKlientType;
begin
  Button1.Enabled := Lista.SelCount > 0;
  if Lista.SelCount > 0 then
    Edycja.Caption:='Edycja zaznaczonego elementu' else
    Edycja.Caption:='';
    
  //Button2.Enabled:=Sprawdz;
  if Lista.SelCount > 0 then
  begin
    k := App.Klienci.Klient[StrToInt(Lista.Selected.SubItems.Strings[3])];
    Ident.Text:=k.Identyf;
    NIP.Text:=k.NIP;
    Nazwa1.Text:=k.Nazwa1;
    Nazwa2.Text:=k.Nazwa2;
    Kod.Text:=k.Kod;
    Miasto.Text:=k.Miasto;
    Ulica.Text:=k.Ulica;
    NrDomu.Text:=k.NrDomu;
    Wojew.ItemIndex:=k.Wojew;
    Oddzial.Text:=k.Oddzial;
    BNazwa.Text:=k.NBanku1;
    BNumer.Text:=k.NrKonta1;
    Uwagi.Text:=k.Uwagi;
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
    BNazwa.Text:='';
    BNumer.Text:='';
    Uwagi.Text:='';
  end;
end;

procedure TKontrahent.Button2Click(Sender: TObject);
var k: IXMLKlientType;
begin
  k := App.Klienci.Add;
  k.Identyf := Ident.Text;
  k.NIP := NIP.Text;
  k.Nazwa1 := Nazwa1.Text;
  k.Nazwa2 := Nazwa2.Text;
  k.Kod := Kod.Text;
  k.Miasto := Miasto.Text;
  k.Ulica := Ulica.Text;
  k.NrDomu := NrDomu.Text;
  k.Wojew := Wojew.ItemIndex;
  k.Oddzial := Oddzial.Text;
  k.NBanku1 := BNazwa.Text;
  k.NrKonta1 := BNumer.Text;
  k.Uwagi := Uwagi.Text;
  OdswiezListe;
end;

procedure TKontrahent.FormShow(Sender: TObject);
begin
  OdswiezListe;
  Pages.TabIndex:=0;
end;

procedure TKontrahent.IdentExit(Sender: TObject);
var k: IXMLKlientType;
begin
  if Lista.SelCount > 0 then
  begin
    k := App.Klienci.Klient[StrToInt(Lista.Selected.SubItems.Strings[3])];
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
    K.NBanku1 := BNazwa.Text;
    K.NrKonta1 := BNumer.Text;
    K.Uwagi := Uwagi.Text;
  end;
  Button2.Enabled:=Sprawdz;
end;

procedure TKontrahent.ListaClick(Sender: TObject);
begin
  Button2.Enabled:=Sprawdz;
end;

end.

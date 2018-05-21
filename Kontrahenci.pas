unit Kontrahenci;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls;

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
uses Unit1;
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
var i: Word; L: TListItem; s: String;
begin
  Kontrahent.Lista.Clear;
  if KontraIle > 0 then
    for i:=0 to KontraIle-1 do
    begin
      s:= Kontra[i].Nazwa1+' '+Kontra[i].NIP+' '+Kontra[i].Kod+' '+Kontra[i].Miasto+', '+Kontra[i].Ulica;
      if(Length(Kontrahent.Search.Text) > 0) and (Pos(LowerCase(Kontrahent.Search.Text), LowerCase(s)) <= 0) then
          Continue;

      L:=Kontrahent.Lista.Items.Add;
      L.Caption:=Kontra[i].Identyf;
      L.SubItems.Add(Kontra[i].Nazwa1);
      L.SubItems.Add(Kontra[i].NIP);
      L.SubItems.Add(Kontra[i].Kod+' '+Kontra[i].Miasto+', '+Kontra[i].Ulica);
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
var i, id: Word; move: Boolean;
begin
  move := false;
  if Lista.SelCount = 0 then Exit;
  if MessageBox(0, 'Czy na pewno usun¹æ dane kontrahenta?', PChar(Application.Title), MB_ICONQUESTION+MB_YESNO) <> 6 then Exit;
  
  if(KontraIle > 1) then
  begin
    id := StrToInt(Lista.Selected.SubItems.Strings[3]);
    for i := 0 to KontraIle - 2 do
    begin
      if (not move) and (i = id) then
      begin
        move := true;
      end;

      if move then
      begin
        Kontra[i]:=Kontra[i+1];
      end;
    end;
  end;

  Dec(KontraIle);
  SetLength(Kontra, KontraIle);
  OdswiezListe;
end;

procedure TKontrahent.ListaChange(Sender: TObject; Item: TListItem;
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
    i:=StrToInt(Lista.Selected.SubItems.Strings[3]);
    Ident.Text:=Kontra[i].Identyf;
    NIP.Text:=Kontra[i].NIP;
    Nazwa1.Text:=Kontra[i].Nazwa1;
    Nazwa2.Text:=Kontra[i].Nazwa2;
    Kod.Text:=Kontra[i].Kod;
    Miasto.Text:=Kontra[i].Miasto;
    Ulica.Text:=Kontra[i].Ulica;
    NrDomu.Text:=Kontra[i].NrDomu;
    Wojew.ItemIndex:=Kontra[i].Wojew;
    Oddzial.Text:=Kontra[i].Oddzial;
    BNazwa.Text:=Kontra[i].NBanku1;
    BNumer.Text:=Kontra[i].NrKonta1;
    Uwagi.Text:=Kontra[i].Uwagi;
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
var i: Word;
begin
  i:=KontraIle;
  Inc(KontraIle);
  SetLength(Kontra, KontraIle);
  Kontra[i].Identyf := Ident.Text;
  Kontra[i].NIP := NIP.Text;
  Kontra[i].Nazwa1 := Nazwa1.Text;
  Kontra[i].Nazwa2 := Nazwa2.Text;
  Kontra[i].Kod := Kod.Text;
  Kontra[i].Miasto := Miasto.Text;
  Kontra[i].Ulica := Ulica.Text;
  Kontra[i].NrDomu := NrDomu.Text;
  Kontra[i].Wojew := Wojew.ItemIndex;
  Kontra[i].Oddzial := Oddzial.Text;
  Kontra[i].NBanku1 := BNazwa.Text;
  Kontra[i].NrKonta1 := BNumer.Text;
  Kontra[i].Uwagi := Uwagi.Text;
  OdswiezListe;
end;

procedure TKontrahent.FormShow(Sender: TObject);
begin
  OdswiezListe;
  Pages.TabIndex:=0;
end;

procedure TKontrahent.IdentExit(Sender: TObject);
var K: TKlient; id: Word;
begin
  if Lista.SelCount > 0 then
  begin
    id:=StrToInt(Lista.Selected.SubItems.Strings[3]);
    K:=Kontra[id];
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
    Kontra[id] := K;
  end;
  Button2.Enabled:=Sprawdz;
end;

procedure TKontrahent.ListaClick(Sender: TObject);
begin
  Button2.Enabled:=Sprawdz;
end;

end.

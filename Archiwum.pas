unit Archiwum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, Unit1;

type
  TArchiw = class(TForm)
    GroupBox1: TGroupBox;
    SData: TDateTimePicker;
    EData: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    SNIP: TMaskEdit;
    Lista: TListView;
    Button2: TButton;
    Button3: TButton;
    Label3: TLabel;
    SNFV: TMaskEdit;
    btnDelete: TButton;
    procedure FormCreate(Sender: TObject);
    procedure SDataCloseUp(Sender: TObject);
    procedure ListaChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure Button3Click(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Archiw: TArchiw;
implementation

uses Drukowanie, Wystawienie;

{$R *.dfm}

procedure TArchiw.FormCreate(Sender: TObject);
begin
  EData.Date:=Now;
end;

procedure Szukaj;
var i: Integer;
L: TListItem; Plus1, Plus2: Boolean;
begin
  Archiw.Lista.Clear;
  if Length(FV) > 0 then
    for i:=0 to Length(FV)-1 do
      if Archiw.SData.Date < FV[i].Dane.DataDok then
        if Archiw.EData.Date+1 >= FV[i].Dane.DataDok then
        begin
          Plus1:=(Archiw.SNIP.Text = '') or (Pos(Archiw.SNIP.Text, FV[i].Dane.Kontra.NIP) > 0);
          if not Plus1 then Continue;

          Plus2:=(Archiw.SNFV.Text = '') or (Pos(Archiw.SNFV.Text, FV[i].Dane.NrFak) > 0);
          if not Plus2 then Continue;

          L:=Archiw.Lista.Items.Insert(0);
          L.Caption:=IntToStr(i);
          L.SubItems.Add(DateToStr(FV[i].Dane.DataDok));
          L.SubItems.Add(FV[i].Dane.NrFak);
          L.SubItems.Add(FV[i].Dane.Kontra.NIP);
          L.SubItems.Add(FV[i].Dane.Kontra.Nazwa1);
        end;
end;

procedure TArchiw.SDataCloseUp(Sender: TObject);
begin
 Szukaj;
end;

procedure TArchiw.ListaChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  Button2.Enabled:=Lista.SelCount > 0;
  Button3.Enabled:=Lista.SelCount > 0;
  btnDelete.Enabled:=Lista.SelCount > 0;
end;

procedure TArchiw.btnDeleteClick(Sender: TObject);
var id: Cardinal;
begin
  if Lista.SelCount = 0 then Exit;
  id:=StrToInt(Lista.Selected.Caption);
  if MessageBox(0, 'Czy na pewno usun¹æ fakturê z historii?', PChar(Application.Title), MB_ICONWARNING+MB_YESNO) <> 6 then Exit;
  while id < FVIle-1 do
  begin
    FV[id]:=FV[id+1];
    Inc(id);
  end;
  Dec(FVIle);
  SetLength(FV, FVIle);
  Szukaj;
end;

procedure TArchiw.Button3Click(Sender: TObject);
var i: Cardinal;
begin
  if Lista.SelCount = 0 then Exit;
  i:=StrToInt(Lista.Selected.Caption);
  if (Sender as TButton).Tag = 1 then
    Drukuj.Druk(FV[i], True) else
    if FV[i].Dane.TypDok = Wystaw.Oryg.Items.Strings[0] then
    begin
      Drukuj.Druk(FV[i], False);
      Drukuj.Druk(FV[i], False);
      end else
    begin
      Drukuj.Druk(FV[i], False);
    end;
end;

end.

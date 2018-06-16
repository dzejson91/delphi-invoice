unit Archiwum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, app_schema;

type
  TArchiw = class(TForm)
    GroupBox1: TGroupBox;
    SData: TDateTimePicker;
    EData: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    SNIP: TMaskEdit;
    Lista: TListView;
    btnPrint: TButton;
    btnPreview: TButton;
    Label3: TLabel;
    SNFV: TMaskEdit;
    btnDelete: TButton;
    chbDeleted: TCheckBox;
    chbDuplicate: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure SDataCloseUp(Sender: TObject);
    procedure ListaChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure chbDeletedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Archiw: TArchiw;
implementation

uses Drukowanie, Wystawienie, Glowny;

{$R *.dfm}

procedure TArchiw.FormCreate(Sender: TObject);
begin
  EData.Date := Now;
  SData.Date := Now - 365;
end;

procedure DodajFaktureDoListy(index: integer; f: IXMLFakturaType);
var L: TListItem;
begin                             
//  L:=Archiw.Lista.Items.Add;
  L:=Archiw.Lista.Items.Insert(0);
  L.Caption:=IntToStr(index);
  L.SubItems.Add(DateToStr(f.DataDok));
  L.SubItems.Add(f.NrFak);
  L.SubItems.Add(f.Klient.NIP);
  L.SubItems.Add(f.Klient.Nazwa1);
end;

function filtruj(f: IXMLFakturaType): Boolean;
begin
  Result :=
    (Archiw.chbDeleted.Checked = f.Deleted) and
    (Archiw.SData.Date < f.DataDok) and
    (Archiw.EData.Date+1 >= f.DataDok) and
    ((Archiw.SNIP.Text = '') or (Pos(Archiw.SNIP.Text, f.Klient.NIP) > 0)) and
    ((Archiw.SNFV.Text = '') or (Pos(Archiw.SNFV.Text, f.NrFak) > 0))
  ;
end;

procedure Odswiez;
var i, j: Integer; f: IXMLFakturaType; Added: Boolean;
begin
  Archiw.Lista.Clear;
  Archiw.Refresh;

  if Archiw.chbDuplicate.Checked then
  begin
    SetLength(FOptims, 0);

    if App.Faktury.Count > 1 then
      for i:=0 to App.Faktury.Count -1 do
        if filtruj(App.Faktury.Faktura[i]) then
        begin
          j := Length(FOptims);
          SetLength(FOptims, j+1);
          FOptims[j].id := i;
          FOptims[j].text := Trim(App.Faktury.Faktura[i].NrFak);
          FOptims[j].skip := False;
        end;

    Added := false;
    if Length(FOptims) > 1 then
    begin
      for i:=0 to Length(FOptims) -1 do
      begin
        if FOptims[i].skip then continue;
        Added := false;
        for j := i+1 to Length(FOptims) - 1 do
        begin
          if FOptims[j].skip then continue;
          if FOptims[i].text = FOptims[j].text then
          begin
            if not Added then
            begin
              DodajFaktureDoListy(FOptims[i].id, App.Faktury.Faktura[FOptims[i].id]);
              FOptims[i].skip := true;
              Added := True;
            end;
            DodajFaktureDoListy(FOptims[j].id, App.Faktury.Faktura[FOptims[j].id]);
            FOptims[j].skip := true;
          end;
        end;
      end;
    end;
  
    if not Added then
    begin
      MessageBox(0, 'Zakoñczono wyszukiwanie duplikatów', PChar(Application.Title), MB_ICONINFORMATION+MB_OK);
    end;
  end else
  begin
    if App.Faktury.Count > 0 then
      for i:=0 to App.Faktury.Count -1 do
      begin
        f := App.Faktury.Faktura[i];
        if filtruj(f) then DodajFaktureDoListy(i, f);
      end;
  end;
end;

procedure TArchiw.SDataCloseUp(Sender: TObject);
begin
  Odswiez;
end;

procedure TArchiw.ListaChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  btnPrint.Enabled:=Lista.SelCount > 0;
  btnPreview.Enabled:=Lista.SelCount > 0;
  btnDelete.Enabled:=(Lista.SelCount > 0) and (chbDeleted.Checked = false);
end;

procedure TArchiw.btnDeleteClick(Sender: TObject);
var index: Integer;
begin
  if Lista.SelCount = 0 then Exit;

  index := StrToInt(Lista.Selected.Caption);
  if MessageBox(0, 'Czy na pewno usun¹æ fakturê z historii?', PChar(Application.Title), MB_ICONWARNING+MB_YESNO) <> 6 then Exit;

  App.Faktury.Faktura[index].Deleted := true;
  Odswiez;
end;

procedure TArchiw.btnPreviewClick(Sender: TObject);
var index: Integer; f: IXMLFakturaType;
begin
  if Lista.SelCount = 0 then Exit;

  index := StrToInt(Lista.Selected.Caption);
  f := App.Faktury.Faktura[index];

  if (Sender as TButton).Tag = 1 then
    Drukuj.Druk(f, True) else
    if f.TypDok = Wystaw.Oryg.Items.Strings[0] then
    begin
      Drukuj.Druk(f, False);
      Drukuj.Druk(f, False);
      end else
    begin
      Drukuj.Druk(f, False);
    end;
end;

procedure TArchiw.chbDeletedClick(Sender: TObject);
begin
  Odswiez;
end;

end.

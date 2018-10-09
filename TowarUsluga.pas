unit TowarUsluga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Mask, Buttons, Math, Functions;

type
  TTowar = class(TForm)
    Label1: TLabel;
    Nazwa: TComboBox;
    Jedn: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Ilosc: TSpinEdit;
    Label4: TLabel;
    Zl: TSpinEdit;
    zl1: TLabel;
    Gr: TSpinEdit;
    gr1: TLabel;
    Label7: TLabel;
    Rabat: TSpinEdit;
    Label8: TLabel;
    Label9: TLabel;
    WartNetto: TEdit;
    zl2: TLabel;
    Label11: TLabel;
    PVAT: TSpinEdit;
    Label12: TLabel;
    zl3: TLabel;
    Label14: TLabel;
    WartVat: TEdit;
    zl4: TLabel;
    Label16: TLabel;
    WartBrutto: TEdit;
    Button1: TButton;
    Button2: TButton;
    Waluta: TComboBox;
    Label17: TLabel;
    Ust: TSpeedButton;
    Label5: TLabel;
    Eur: TLabel;
    Button3: TButton;
    cbVatNd: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PVATChange(Sender: TObject);
    procedure WalutaChange(Sender: TObject);
    procedure UstClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure cbVatNdClick(Sender: TObject);
    procedure cbVatNdKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Towar: TTowar;
  nie_zmieniaj : boolean;
implementation

uses Ustawienia, Glowny;

{$R *.dfm}

procedure TTowar.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TTowar.Button2Click(Sender: TObject);
begin
  ModalResult:=mrOk;
  if Nazwa.ItemIndex = -1 then
  begin
    Nazwa.Items.Add(Nazwa.Text);
    Nazwa.Items.SaveToFile(Path+PlikNT);
  end;
end;

procedure TTowar.Button3Click(Sender: TObject);
var Netto, Vat, Brutto, tmp, cszt: Double;
begin
  if not TryStrToFloat(WartBrutto.Text, Brutto) then
  begin
    MessageBox(0, 'Podano niepoprawne dane! u¿ywaj kropki zamiast przecinka.', 'B³¹d konwersji', MB_OK + MB_ICONWARNING);
    exit;
  end;
  try
    nie_zmieniaj := true;
    tmp := Brutto * 100 / (100 + PVat.Value);
    Vat := Brutto - tmp;
    Netto := tmp * ((100 + Rabat.Value)/100);
    cszt := Netto / Ilosc.Value;
    Zl.Value := Trunc(cszt);
    Gr.Value := Trunc((cszt - Zl.Value)*100);
    WartNetto.Text:=FloatToString(Netto);
    WartVat.Text:=FloatToString(Vat);
    //WartBrutto.Text:=FormatFloat('0.00', Brutto);
  finally
    nie_zmieniaj := false;
  end;
end;

procedure TTowar.cbVatNdClick(Sender: TObject);
begin
  if cbVatNd.Checked then
  begin
    PVAT.Enabled := false;
    PVAT.Text := '0';
  end else
  begin
    PVAT.Enabled := true;
  end;
end;

procedure TTowar.cbVatNdKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  cbVatNdClick(Sender);
end;

procedure TTowar.PVATChange(Sender: TObject);
var Netto, Vat, Brutto: Double;
begin
  if nie_zmieniaj then exit;

  try
    (Sender as TSpinEdit).Value;

    Netto:=Ilosc.Value*(Zl.Value+(Gr.Value/100));
    Netto:=Netto-((Rabat.Value/100)*Netto);
    Vat := FloatToFloat(Netto*(PVat.Value/100));
    Brutto:=Netto+Vat;
    WartNetto.Text:=FloatToString(Netto);
    WartVat.Text:=FloatToString(Vat);
    WartBrutto.Text:=FloatToString(Brutto);
  except
    Exit;
  end;
end;

procedure TTowar.WalutaChange(Sender: TObject);
begin
  Eur.Caption:='1 EURO = '+FormatFloat('0.00000', App.Konfiguracja.Kurs.Kurs);
  case (Sender as TComboBox).ItemIndex of
    0:
    begin
      zl1.Caption:='z³';
      zl2.Caption:='z³';
      zl3.Caption:='z³';
      zl4.Caption:='z³';
      gr1.Caption:='gr';
      Ust.Enabled:=False;
      Eur.Visible:=False;
    end;
    1:
    begin
      zl1.Caption:='euro';
      zl2.Caption:='euro';
      zl3.Caption:='euro';
      zl4.Caption:='euro';
      gr1.Caption:='cent';
      Ust.Enabled:=True;
      Eur.Visible:=True;
    end;
  end;
end;

procedure TTowar.UstClick(Sender: TObject);
begin
  Ustaw.PageControl1.TabIndex:=1;
  Ustaw.ShowModal;
  FormShow(nil);
end;

procedure TTowar.FormShow(Sender: TObject);
begin
  if Nazwa.Items.Count = 0 then
    if FileExists(Path+PlikNT) then
      Nazwa.Items.LoadFromFile(Path+PlikNT);
  Eur.Caption:='1 EURO = '+FormatFloat('0.00000', App.Konfiguracja.Kurs.Kurs);
end;

end.

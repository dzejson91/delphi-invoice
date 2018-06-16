unit Ustawienia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Printers, Buttons;

type
  TUstaw = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    DPodg: TComboBox;
    Label2: TLabel;
    DDruk: TComboBox;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Euro: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    DEuro: TDateTimePicker;
    NrTab: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    czc: TLabel;
    Font: TFontDialog;
    procedure TabSheet1Show(Sender: TObject);
    procedure EuroExit(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure DEuroChange(Sender: TObject);
    procedure DPodgChange(Sender: TObject);
    procedure NrTabChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ustaw: TUstaw;

implementation

uses Glowny;

{$R *.dfm}

procedure TUstaw.TabSheet1Show(Sender: TObject);
begin
  DPodg.Clear;
  DDruk.Clear;
  DPodg.Items.Text:=Printer.Printers.Text;
  DDruk.Items.Text:=Printer.Printers.Text;
  DPodg.ItemIndex:=App.Konfiguracja.Podglad;
  DDruk.ItemIndex:=App.Konfiguracja.Drukarka;
  Czc.Caption:=App.Konfiguracja.Czcionka;
end;

procedure TUstaw.EuroExit(Sender: TObject);
var V: Single;
begin
  if not TryStrToFloat(Euro.Text, V) then
  begin
    MessageBox(0, 'Niepoprawnie wprowadzono kurs', 'Kurs Euro', MB_OK+MB_ICONERROR);
    Euro.SetFocus;
  end else
  begin
    Euro.Text:=FormatFloat('0.0000', V);
    App.Konfiguracja.Kurs.Kurs := V;
  end;
end;

procedure TUstaw.TabSheet2Show(Sender: TObject);
begin
    DEuro.Date := App.Konfiguracja.Kurs.Data;
    NrTab.Text := App.Konfiguracja.Kurs.NrTab;
    Euro.Text := FormatFloat('0.0000', App.Konfiguracja.Kurs.Kurs);
end;

procedure TUstaw.DEuroChange(Sender: TObject);
begin
  App.Konfiguracja.Kurs.Data := DEuro.Date;
end;

procedure TUstaw.DPodgChange(Sender: TObject);
begin
  App.Konfiguracja.Drukarka := DDruk.ItemIndex;
  App.Konfiguracja.Podglad := DPodg.ItemIndex;
end;

procedure TUstaw.NrTabChange(Sender: TObject);
begin
  App.Konfiguracja.Kurs.NrTab := NrTab.Text;
end;

procedure TUstaw.SpeedButton1Click(Sender: TObject);
begin
  if (Sender <> nil) and (Font.Execute) then
    App.Konfiguracja.Czcionka := Font.Font.Name;
  Czc.Caption := App.Konfiguracja.Czcionka;
end;

end.

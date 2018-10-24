unit Drukowanie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Printers, IniFiles, Glowny, Wystawienie, app_schema;

const
  TH = 'Ij';
  CTab1: array [1..10] of TPoint = ((X:0; Y:3), (X:3; Y:41), (X:41; Y:45), (X:45; Y:52), (X:52; Y:61), (X:61; Y:67), (X:67; Y:76), (X:76; Y:82), (X:82; Y:91), (X:91; Y:100));
  Tab1T: array [1..10] of String = ('Lp.', 'Nazwa towaru lub us³ugi', 'J.m.', 'Iloœæ', 'Cena j.', 'Rabat', 'Wart.netto', 'VAT', 'Wart.VAT', 'Wart.brutto');
  Tab2: array[1..4] of TPoint = ((X:0; Y:12), (X:12; Y:24), (X:24; Y:36), (X:36; Y:48));
  Tab2T: array [1..4] of String = ('', 'Wart.netto', 'Wart.VAT', 'Wart.brutto');
  VEU = ' € ';
  VPL = ' z³ ';
type
  TTabelka = record
    RP: TRect;
    RT: TRect;
    Bor: Byte;
    TxtW: Word;
    Txt: String[255];
  end;

  TDrukuj = class(TForm)
  private
    { Private declarations }
  public
    procedure Druk(F: IXMLFakturaType; Podglad: Boolean);
    { Public declarations }
  end;

var
  Drukuj: TDrukuj;
  Tab1: array [1..10] of TTabelka;
implementation

uses TowarUsluga;

{$R *.dfm}

const
  tys: array [1..3] of String = ('tysi¹c', 'tysi¹ce', 'tysiêcy');
  sto: array [1..4] of String = ('sto', 'dwieœcie', 'sta', 'set');
  dzi: array [1..5] of String = ('dziesiêæ', 'dwadzieœcia', 'trzydzieœci', 'czterdzieœci', 'dziesi¹t');
  nas: array [0..9] of String = ('dziesiêæ', 'jedenaœcie ', 'dwanaœcie', 'trzynaœcie', 'czternaœcie', 'piêtnaœcie', 'szesnaœcie', 'siedemnaœcie', 'osiemnaœcie', 'dziewiêtnaœcie');
  jed: array [1..9] of String = ('jeden', 'dwa', 'trzy', 'cztery', 'piêæ', 'szeœæ', 'siedem', 'osiem', 'dziewiêæ');

function Liczba(S: String): String;
var L: Integer;
begin
  case Length(S) of
    4..6:
        begin
          L:=StrToInt(Copy(S, 1, Length(S)-3));
          case L of
            0: Result:='';
            1: Result:=tys[1];
            2..4: Result:=jed[L]+' '+tys[2];           
            5..9: Result:=jed[L]+' '+tys[3];
            else
            begin
              case StrToInt(Copy(S, Length(S)-3, 1)) of
                2..4: if (Length(S) > 4) and (Copy(S, Length(S)-4, 1) = '1') then
                        Result:=Liczba(Copy(S, 1, Length(S)-3))+' '+tys[3] else
                        Result:=Liczba(Copy(S, 1, Length(S)-3))+' '+tys[2];
                else  Result:=Liczba(Copy(S, 1, Length(S)-3))+' '+tys[3];
              end;
            end;                                 
          end;

          if Liczba(Copy(S, Length(S)-2, Length(S))) <> '' then
            Result:=Result+' '+Liczba(Copy(S, Length(S)-2, Length(S)));
        end;
    0: Result:='';
    1:  begin
          L:=StrToInt(S);
          if L = 0 then
            Result:='' else
            Result:=jed[L];
          Exit;
        end;
    2:  begin
          L:=StrToInt(S[1]);
          case L of
            0: Result:='';
            1: Result:=nas[StrToInt(S[2])];
            2..4: Result:=dzi[L];
            5..9: Result:=jed[L]+dzi[5];
          end;
          if (Liczba(S[2]) <> '') and (StrToInt(S[1]) <> 1) then
            Result:=Result+' '+Liczba(S[2]);
          Exit;
        end;
    3:  begin
          L:=StrToInt(S[1]);
          case L of
            0: Result:='';
            1..2: Result:=sto[L];
            3..4: Result:=jed[L]+sto[3];
            5..9: Result:=jed[L]+sto[4];
          end;
          if Liczba(S[2]+S[3]) <> '' then
            Result:=Result+' '+Liczba(S[2]+S[3]);
        end;
  end;

end;

function Slownie(D: Double; cal, res: String): String;
var S, zl, gr: String;
begin
  S:=FormatFloat('0.00', D);
  zl:=Liczba(Copy(S, 1, Length(S)-3));
  gr:=Liczba(Copy(S, Length(S)-1, 2));
  if zl = '' then
  begin
    if gr = '' then
      Result:='' else
      Result:=gr+' '+res;
  end else
  begin
    if gr = '' then
      Result:=zl+' '+cal else
      Result:=zl+' '+cal+', '+gr+' '+res;
  end;
end;

function GetProc(Max: Integer; Proc: Single): Integer;
begin
  Result:=Round(Max*(Proc/100));
end;

function Rozdziel(S: String; Roz: Word): String;
var i: word;
begin
  Result:=S;
  if Pos(' ', S) > 0 then
  begin
    i:=Length(S)-1;
    while i >= 1 do
    begin
      if S[i] = ' ' then
        if Printer.Canvas.TextWidth(Copy(S, 1, i)) < Roz then
        begin
          Result:=Copy(S, 1, i-1)+#13+Copy(S, i+1, Length(S));
          Break;
        end;
      Dec(i);
    end;
  end else
    Result:=Copy(S, 1, Length(S) div 2)+#13+Copy(S, Length(S)div 2 +1, Length(S));
end;

function MalujGrafike(C: TCanvas): Integer;
var ini: TIniFile; bmp: TBitMap; ts: TStringList; s:string; i:integer; R: TRect;
begin
  Result := 5; //domyœlny procent PozY dla tekstów
  if not Wystawienie.Wystaw.PrintLogo.Checked then exit; //jeœli nie zaznaczono opcji drukowania logo
  
  ini := TIniFile.Create(Glowny.Path + 'logo.ini');
  ts := TStringList.Create;
  try
    if not FileExists(Glowny.Path + 'logo.ini') then
    begin
      ini.WriteInteger('Main', 'PozY', 5);
      exit;
    end;
    Result := ini.ReadInteger('Main', 'PozY', 5);
    ini.ReadSections(ts);
    for i:=0 to ts.Count-1 do
    begin
      s := ini.ReadString(ts.Strings[i], 'BMP', 'aaa');
      if(FileExists(Glowny.Path + s)) then
      begin
        bmp := TBitMap.Create;
        try
          bmp.LoadFromFile(Glowny.Path + s);
          R.Left := C.ClipRect.Right * ini.ReadInteger(ts.Strings[i], 'Left', 25) div 100;
          R.Top := C.ClipRect.Bottom * ini.ReadInteger(ts.Strings[i], 'Top', 25) div 100;
          R.Right := C.ClipRect.Right * ini.ReadInteger(ts.Strings[i], 'Right', 75) div 100;
          R.Bottom := C.ClipRect.Bottom * ini.ReadInteger(ts.Strings[i], 'Bottom', 75) div 100;
          C.StretchDraw(R, bmp);
        finally
          bmp.Free;
        end;
      end;
    end;
  finally
    ts.Free;
    ini.Free;
  end;
end;

function MalujText(C: TCanvas; R: TRect; Txt: String; Wyr, OdY: Byte; Roz: Boolean): Byte;
var Li: TStringList; i, t, l: SmallInt;
begin
  Li:=TStringList.Create;
  try
    Li.Text:=Txt;
    if Roz then
    begin
      i:=0;
      while i < Li.Count do
      begin
        if C.TextWidth(Li.Strings[i]) > (R.Right-R.Left) then
          Li.Strings[i]:=Rozdziel(Li.Strings[i], R.Right-R.Left);
        Inc(i);
      end;
    end;
    Txt:=Li.Text;
    Li.Clear;
    Li.Text:=Txt;
    t:=R.Top+((R.Bottom-R.Top)-(OdY*Li.Count)) div 2;
    for i:=0 to Li.Count-1 do
    begin
      case Wyr of
        1: l:=R.Left;
        2: l:=R.Left+((R.Right-R.Left)-(C.TextWidth(Li.Strings[i]))) div 2;
        else l:=R.Right-C.TextWidth(Li.Strings[i]);
      end;
      C.TextOut(l, t+(OdY*i), Li.Strings[i]);
    end;
    Result:=Li.Count;
  finally
    Li.Free;
  end;
end;

procedure TDrukuj.Druk(F: IXMLFakturaType; Podglad: Boolean);
var MaxX, PozY, Marg, TxtY, TmpY, i, sw: Integer; D, kwe: Single;
L: TStringList; val, Tmp: String; towar: IXMLTowarType;
begin
  if (F.Towary.Count > 0) and (not F.Towary.Towar[0].PLN) then
    val:='€' else
    val:='z³';

  if Podglad then
    Printer.PrinterIndex:=App.Konfiguracja.Podglad else
    Printer.PrinterIndex:=App.Konfiguracja.Drukarka;
  Printer.BeginDoc;
  
 // MalujText(Printer.Canvas, Rect(0,0,100,50), 'jestem sobie przeczkolaczek', 3, Printer.Canvas.TextHeight('H'), true);

  Printer.Canvas.Font.Name:=App.Konfiguracja.Czcionka;
  Printer.Title:='Faktura VAT ('+F.TypFak+' '+F.NrFak+')';
  PozY:=GetProc(Printer.PageHeight, MalujGrafike(Printer.Canvas));
  Marg:=GetProc(Printer.PageWidth, 5);
  MaxX:=GetProc(Printer.PageWidth, 90);
  with Printer.Canvas do
  begin
    Font.Name:='Tahoma';
    sw:=TextWidth(' ');
    Tmp:=F.Miejsc+', '+FormatDateTime('yyyy-mm-dd', F.DataDok);
    TextOut(MaxX+Marg-TextWidth(Tmp), PozY, Tmp);

    Font.Size:=24; Font.Style:=[fsBold];
    TextOut(Marg*2, PozY, 'Faktura VAT');
                                             
    Tmp:=F.TypFak+' '+F.NrFak;
    Font.Size:=18; Font.Style:=[];
    TextOut((Printer.PageWidth-TextWidth(Tmp)) div 2, PozY + Marg, Tmp);

    PozY:=(PozY + Marg) + TextHeight(TH)*2;
    Font.Size:=10;

    TextOut((Printer.PageWidth-TextWidth(F.TypDok)) div 2, PozY, F.TypDok);
    //ShowMessage(F.Dane.TypDok);

    Font.Size:=8;
    Font.Style:=[fsBold];
    TxtY:=TextHeight(TH)*5 div 4;
    PozY:=PozY+TxtY*2;

    Tmp:='Nabywca: ';
    TextOut(Marg*3-TextWidth(Tmp), Pozy, Tmp);
    Tmp:=F.Klient.Nazwa1;
    TextOut(Marg*3, PozY, Tmp);
    TextOut(Marg*3, PozY+TxtY, F.Klient.Nazwa2);

    Tmp:='Sprzedawca: ';
    TextOut(MaxX div 2 + Marg*4-TextWidth(Tmp), PozY, Tmp);
    Tmp:=F.Sprzedawca.Nazwa1;
    TextOut(MaxX div 2 + Marg*4, PozY, Tmp);
    TextOut(MaxX div 2 + Marg*4, PozY+TxtY, F.Sprzedawca.Nazwa2);

    PozY:=PozY+TxtY*2;

    Tmp:='Adres: ';
    TextOut(Marg*3-TextWidth(Tmp), Pozy, Tmp);
    if Length(F.Klient.Kod) > 0 then
    begin
       Tmp:=F.Klient.Kod+' '+F.Klient.Miasto;
    end else
    begin
       Tmp:=F.Klient.Miasto;
    end;
    TextOut(Marg*3, PozY, Tmp);
    TextOut(Marg*3, PozY+TxtY, F.Klient.Ulica+' '+F.Klient.NrDomu);

    Tmp:='Adres: ';
    TextOut(MaxX div 2 + Marg*4-TextWidth(Tmp), PozY, Tmp);
    if Length(F.Sprzedawca.Kod) > 0 then
    begin
       Tmp:=F.Sprzedawca.Kod+' '+F.Sprzedawca.Miasto;
    end else
    begin
       Tmp:=F.Sprzedawca.Miasto;
    end;
    TextOut(MaxX div 2 + Marg*4, PozY, Tmp);
    TextOut(MaxX div 2 + Marg*4, PozY+TxtY, F.Sprzedawca.Ulica+' '+F.Sprzedawca.NrDomu);

    PozY:=PozY+TxtY*2;

    Tmp:='NIP: ';
    TextOut(Marg*3-TextWidth(Tmp), Pozy, Tmp);
    Tmp:=F.Klient.NIP;
    TextOut(Marg*3, PozY, Tmp);

    Tmp:='NIP: ';
    TextOut(MaxX div 2 + Marg*4-TextWidth(Tmp), PozY, Tmp);
    Tmp:=F.Sprzedawca.NIP;
    TextOut(MaxX div 2 + Marg*4, PozY, Tmp);

    PozY:=PozY+TxtY;

    Tmp:='Bank: ';
    TextOut(MaxX div 2 + Marg*4-TextWidth(Tmp), PozY, Tmp);
    Tmp:=F.Sprzedawca.NBanku1;
    TextOut(MaxX div 2 + Marg*4, PozY, Tmp);
    Tmp:='Konto: ';
    TextOut(MaxX div 2 + Marg*4-TextWidth(Tmp), PozY+TxtY, Tmp);
    Tmp:=F.Sprzedawca.NrKonta1;
    TextOut(MaxX div 2 + Marg*4, PozY+TxtY, Tmp);

    if (F.Sprzedawca.NBanku2 <> '') and (F.Sprzedawca.NrKonta2 <> '') then
    begin
      PozY:=PozY+(TxtY*2);
      Tmp:='Bank: ';
      TextOut(MaxX div 2 + Marg*4-TextWidth(Tmp), PozY, Tmp);
      Tmp:=F.Sprzedawca.NBanku2;
      TextOut(MaxX div 2 + Marg*4, PozY, Tmp);
      Tmp:='Konto: ';
      TextOut(MaxX div 2 + Marg*4-TextWidth(Tmp), PozY+TxtY, Tmp);
      Tmp:=F.Sprzedawca.NrKonta2;
      TextOut(MaxX div 2 + Marg*4, PozY+TxtY, Tmp);
    end;

    PozY:=PozY+TxtY;
    Font.Style:=[];
    TxtY:=TextHeight(TH)*5 div 4;

    Tmp:='Data Sprzeda¿y: ';
    TextOut(Marg*3-TextWidth(Tmp), PozY, Tmp);
    Tmp:=FormatDateTime('yyyy-mm-dd', F.DataSprzed);
    TextOut(Marg*3, PozY, Tmp);
    Tmp:='Sposób zap³aty: ';
    TextOut(Marg*3-TextWidth(Tmp), PozY+TxtY, Tmp);
    Tmp:=F.SposZapl+' ('+IntToStr(Round(F.TermPlat-F.DataDok))+' dni)';
    TextOut(Marg*3, PozY+TxtY, Tmp);
    Tmp:='Termin zap³aty: ';
    TextOut(Marg*3-TextWidth(Tmp), PozY+TxtY*2, Tmp);
    Tmp:=FormatDateTime('yyyy-mm-dd', F.TermPlat);
    TextOut(Marg*3, PozY+TxtY*2, Tmp);

    PozY:=PozY+TxtY*4;

    if F.Transport <> '' then
    begin
      Tmp:='Transport: '+F.Transport;
      TextOut((Printer.PageWidth-TextWidth(Tmp)) div 2, PozY, Tmp);
      PozY:=PozY+TxtY*2;
    end;

    TmpY:=PozY;

    for i:=1 to 10 do
    begin
      Rectangle(Marg+GetProc(MaxX, CTab1[i].X), PozY, Marg+GetProc(MaxX, CTab1[i].Y), PozY+TxtY*2);
      TextOut(Marg+(GetProc(MaxX, CTab1[i].X)+GetProc(MaxX, CTab1[i].Y)) div 2-(TextWidth(Tab1T[i]) div 2), PozY+(TxtY div 2), Tab1T[i]);
    end;

    PozY:=PozY+TxtY*2;

    if F.Towary.Count > 0 then
    begin
      for i:=0 to F.Towary.Count -1 do
      begin
        towar := F.Towary[i];
        
        MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, CTab1[1].X), PozY, Marg+GetProc(MaxX, CTab1[1].Y), PozY+Round(TextHeight(TH)*2.2)), IntToStr(i+1), 2, TextHeight(TH), False);
        MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, CTab1[2].X), PozY, Marg+GetProc(MaxX, CTab1[2].Y), PozY+Round(TextHeight(TH)*2.2)), towar.Nazwa, 2, TextHeight(TH), True);
        MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, CTab1[3].X), PozY, Marg+GetProc(MaxX, CTab1[3].Y), PozY+Round(TextHeight(TH)*2.2)), towar.Jm, 2, TextHeight(TH), False);

        Tmp:=FormatFloat('0', towar.Ilosc);
        MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, CTab1[4].X), PozY, Marg+GetProc(MaxX, CTab1[4].Y), PozY+Round(TextHeight(TH)*2.2)), Tmp, 2, TextHeight(TH), False);

        if towar.PLN then
          Tmp:=FormatFloat('0.00', towar.CenaNSzt)+VPL else
          Tmp:=FormatFloat('0.00', towar.CenaNSzt * F.Kurs.Kurs)+VPL+#13+FormatFloat('0.00', towar.CenaNSzt)+VEU;
        MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, CTab1[5].X), PozY, Marg+GetProc(MaxX, CTab1[5].Y), PozY+Round(TextHeight(TH)*2.2)), Tmp, 3, TextHeight(TH), False);

        MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, CTab1[6].X), PozY, Marg+GetProc(MaxX, CTab1[6].Y), PozY+Round(TextHeight(TH)*2.2)), IntToStr(towar.Rabat)+' %', 2, TextHeight(TH), False);

        if towar.PLN then
          Tmp:=FormatFloat('0.00', towar.WartNetto)+VPL else
          Tmp:=FormatFloat('0.00', towar.WartNetto * F.Kurs.Kurs)+VPL+#13+FormatFloat('0.00', towar.WartNetto)+VEU;
        MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, CTab1[7].X), PozY, Marg+GetProc(MaxX, CTab1[7].Y), PozY+Round(TextHeight(TH)*2.2)), Tmp, 3, TextHeight(TH), False);

        Tmp:=FormatFloat('0', towar.VatProc)+' %';
        if towar.VatNd then Tmp:= 'np';
        MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, CTab1[8].X), PozY, Marg+GetProc(MaxX, CTab1[8].Y), PozY+Round(TextHeight(TH)*2.2)), Tmp, 2, TextHeight(TH), False);

        if towar.PLN then
          Tmp:=FormatFloat('0.00', towar.WartVAT)+VPL else
          Tmp:=FormatFloat('0.00', towar.WartVAT * F.Kurs.Kurs)+VPL+#13+FormatFloat('0.00', towar.WartVAT)+VEU;
        if towar.VatNd then Tmp:= 'np ';
        MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, CTab1[9].X), PozY, Marg+GetProc(MaxX, CTab1[9].Y), PozY+Round(TextHeight(TH)*2.2)), Tmp, 3, TextHeight(TH), False);

        if towar.PLN then
          Tmp:=FormatFloat('0.00', towar.WartBrutto)+VPL else
          Tmp:=FormatFloat('0.00', towar.WartBrutto * F.Kurs.Kurs)+VPL+#13+FormatFloat('0.00', towar.WartBrutto)+VEU;
        MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, CTab1[10].X), PozY, Marg+GetProc(MaxX, CTab1[10].Y), PozY+Round(TextHeight(TH)*2.2)), Tmp, 3, TextHeight(TH), False);

        PozY:=PozY+Round(TextHeight(TH)*2.2);
        MoveTo(Marg, Pozy); LineTo(Marg+MaxX, PozY);
      end;
    end;

    for i:=1 to 10 do
    begin
      MoveTo(Marg+GetProc(MaxX, CTab1[i].X), TmpY);
      LineTo(Marg+GetProc(MaxX, CTab1[i].X), PozY);
      if i = 10 then
      begin
        MoveTo(Marg+GetProc(MaxX, CTab1[i].Y), TmpY);
        LineTo(Marg+GetProc(MaxX, CTab1[i].Y), PozY);
      end;
    end;
    MoveTo(Marg, Pozy); LineTo(Marg+MaxX, PozY);

    PozY:=PozY+TextHeight(TH);

    for i:=1 to 4 do
    begin
      Rectangle(Marg+GetProc(MaxX, Tab2[i].X), PozY, Marg+GetProc(MaxX, Tab2[i].Y), PozY+TxtY*2);
      TextOut(Marg+(GetProc(MaxX, Tab2[i].X)+GetProc(MaxX, Tab2[i].Y)) div 2-(TextWidth(Tab2T[i]) div 2), PozY+(TxtY div 2), Tab2T[i]);
    end;

    PozY:=PozY+Round(TxtY*2.2);

    MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, Tab2[1].X), PozY, Marg+GetProc(MaxX, Tab2[1].Y), PozY+Round(TextHeight(TH)*2.2)), ' Razem ', 1, TextHeight(TH), False);

    D:=0;
    if F.Towary.Count > 0 then
      for i:=0 to F.Towary.Count -1 do
        D:=D+(F.Towary.Towar[i].WartNetto);
    if (F.Towary.Count > 0) and (not F.Towary.Towar[0].PLN) then
      Tmp:=FormatFloat('0.00', D*F.Kurs.Kurs)+VPL+#13+FormatFloat('0.00', D)+VEU else
      Tmp:=FormatFloat('0.00', D)+VPL;
    MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, Tab2[2].X), PozY, Marg+GetProc(MaxX, Tab2[2].Y), PozY+Round(TextHeight(TH)*2.2)), Tmp, 3, TextHeight(TH), False);

    D:=0;
    if F.Towary.Count > 0 then
      for i:=0 to F.Towary.Count-1 do
        D:=D+(F.Towary.Towar[i].WartVAT);
    if (F.Towary.Count > 0) and (not F.Towary.Towar[0].PLN) then
      Tmp:=FormatFloat('0.00', D*F.Kurs.Kurs)+VPL+#13+FormatFloat('0.00', D)+VEU else
      Tmp:=FormatFloat('0.00', D)+VPL;
    if towar.VatNd then Tmp:= 'np ';
    MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, Tab2[3].X), PozY, Marg+GetProc(MaxX, Tab2[3].Y), PozY+Round(TextHeight(TH)*2.2)), Tmp, 3, TextHeight(TH), False);

   D:=0;
    if F.Towary.Count > 0 then
      for i:=0 to F.Towary.Count -1 do
          D:=D+(F.Towary.Towar[i].Wartbrutto);
    if (F.Towary.Count > 0) and (not F.Towary.Towar[0].PLN) then
      Tmp:=FormatFloat('0.00', D*F.Kurs.Kurs)+VPL+#13+FormatFloat('0.00', D)+VEU else
      Tmp:=FormatFloat('0.00', D)+VPL;
    MalujText(Printer.Canvas, Rect(Marg+GetProc(MaxX, Tab2[4].X), PozY, Marg+GetProc(MaxX, Tab2[4].Y), PozY+Round(TextHeight(TH)*2.2)), Tmp, 3, TextHeight(TH), False);

    PozY:=PozY+TextHeight(TH)*3;

    if (F.Towary.Count > 0) then
      if not F.Towary.Towar[0].PLN then
      begin
        kwe:=0;
        if F.Towary.Count > 0 then
          for i:=0 to F.Towary.Count-1 do
            kwe:=kwe+(F.Towary.Towar[i].WartBrutto);
        TextOut(Marg, PozY, 'Kurs Euro: '+FormatFloat('0.0000', F.Kurs.Kurs));
        TextOut(Marg, PozY+TextHeight(TH), 'Do zap³aty: '+FormatFloat('0.00', kwe)+' '+val+' (Brutto)');
        TextOut(Marg, PozY+TextHeight(TH)*2, 'S³ownie: '+Slownie(kwe, 'euro', 'cent'));
        PozY:=PozY+TextHeight(TH)*4;
//        kwe:=0;
//        if F.TowarIle > 0 then
//          for i:=0 to F.TowarIle-1 do
//            kwe:=kwe+(F.Towar[i].WartVAT*F.Dane.Kurs.Kurs);
//        TextOut(Marg, PozY, 'Do zap³aty: '+FormatFloat('0.00', kwe)+' z³ (VAT)');
//        TextOut(Marg, PozY+TextHeight(TH), 'S³ownie: '+Slownie(kwe, 'z³', 'gr'));
//        PozY:=PozY+TextHeight(TH)*3;
      end;
      
    if (F.Towary.Count > 0) and (F.Towary.Towar[0].PLN) then
    begin
      d:=0;
      if F.Towary.Count > 0 then
        for i:=0 to F.Towary.Count-1 do
          d:=d+(F.Towary.Towar[i].Wartbrutto);
      TextOut(Marg, PozY, 'Do zap³aty: '+FormatFloat('0.00', D)+' z³');
      TextOut(Marg, PozY+TextHeight(TH), 'S³ownie: '+Slownie(D, 'z³', 'gr'));
    end;

    PozY:=PozY+GetProc(Printer.PageHeight, 10);

    MoveTo(Marg+GetProc(MaxX, 40), PozY);
    LineTo(Marg+GetProc(MaxX, 68), PozY);
    MoveTo(Marg+GetProc(MaxX, 77), PozY);
    LineTo(Marg+GetProc(MaxX, 100), PozY);
    PozY:=PozY+TextHeight(TH);

    Tmp:='podpis imienny osoby upowa¿nionej';
    TextOut(Marg+(GetProc(MaxX, 40)+GetProc(MaxX, 68))div 2-TextWidth(Tmp) div 2, PozY, Tmp);
    Tmp:='do odbioru faktury VAT';
    TextOut(Marg+(GetProc(MaxX, 40)+GetProc(MaxX, 68))div 2-TextWidth(Tmp) div 2, PozY+TxtY, Tmp);

    Tmp:='podpis imienny osoby upowa¿nionej';
    TextOut(Marg+(GetProc(MaxX, 77)+GetProc(MaxX, 100))div 2-TextWidth(Tmp) div 2, PozY, Tmp);
    Tmp:='do wystawienia faktury VAT';
    TextOut(Marg+(GetProc(MaxX, 77)+GetProc(MaxX, 100))div 2-TextWidth(Tmp) div 2, PozY+TxtY, Tmp);

    if F.Kurs.Euro then
    begin
      PozY:=PozY+TxtY*3;

      Tmp:='Wartoœæ faktury obliczana na podstawie tabeli kursów œrednich NBP opublikowanych w dniu '+FormatDateTime('yyyy-mm-dd', F.Kurs.Data);
      TextOut(Marg+(MaxX-TextWidth(Tmp)) div 2, PozY, Tmp);
      Tmp:='tab. nr '+F.Kurs.NrTab+'                1 EUR = '+FormatFloat('0.0000', F.Kurs.Kurs);
      TextOut(Marg+(MaxX-TextWidth(Tmp)) div 2, PozY+TxtY, Tmp);
    end;
    
    PozY:=PozY+TxtY*3;

    L:=TStringList.Create;
    try
      L.Text:=F.Uwagi;
      if L.Count > 0 then
        for i:=0 to L.Count-1 do
          TextOut(Marg, PozY+(i*TxtY), L.Strings[i]);
    finally
      L.Free;
    end;
  end;
  Printer.EndDoc;
end;

end.

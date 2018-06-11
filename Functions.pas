unit Functions;

interface

uses SysUtils, Dialogs, Math, Unit1;

type

  TSuma = record
    Netto: Extended;
    VAT: Extended;
    Brutto: Extended;
  end;

function FloatToString(Value: Extended): string;
function FloatToFloat(Value: Extended): Extended;
function JPKPriceFormat(Value: Extended): string;
function DateToStr(date: TDateTime): string;
function TimeToStr(time: TDateTime): string;
function DateTimeToStr(datetime: TDateTime; join: string = 'T'): string;
function sumaTowarow(towary: array of TTowar): TSuma;

implementation

function FloatToString(Value: Extended): string;
begin
  Result := FormatFloat('0.00', FloatToFloat(Value));
end;

function JPKPriceFormat(Value: Extended): string;
begin
  Result := StringReplace(FormatFloat('0.00', FloatToFloat(Value)), ',', '.', [rfReplaceAll]);
end;

function FloatToFloat(Value: Extended): Extended;
begin
  Result := RoundTo(Value, -2);
end;

function DateToStr(date: TDateTime): string;
begin
  Result := FormatDateTime('yyyy-mm-dd', date);
end;

function TimeToStr(time: TDateTime): string;
begin
  Result := FormatDateTime('tt', time);
end;

function DateTimeToStr(datetime: TDateTime; join: string = 'T'): string;
begin
  Result := DateToStr(datetime) + join + TimeToStr(datetime);
end;

function sumaTowarow(towary: array of TTowar): TSuma;
var i: Word;
begin
  Result.Netto := 0;
  Result.VAT := 0;
  Result.Brutto := 0;
  if Length(towary) > 0 then
    for i := 0 to Length(towary) - 1 do
    begin
      Result.Netto := Result.Netto + towary[i].WartNetto;
      Result.VAT := Result.VAT + towary[i].WartVAT;
      Result.Brutto := Result.Brutto + towary[i].WartBrutto;
    end;
end;

end.

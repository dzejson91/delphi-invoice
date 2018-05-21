unit Functions;

interface

uses SysUtils, Dialogs, Math;

function FloatToString(Value: Extended): string;
function FloatToFloat(Value: Extended): Extended;

implementation

function FloatToString(Value: Extended): string;
begin
  Result := FormatFloat('0.00', FloatToFloat(Value));
end;

function FloatToFloat(Value: Extended): Extended;
begin
  Result := RoundTo(Value, -2);
end;

end.

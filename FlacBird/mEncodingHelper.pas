unit mEncodingHelper;

interface

uses
  Windows, SysUtils;

type
  TEncodingHelper = class helper for TEncoding
  private
    { Private �錾 }
    class function GetANSI: TEncoding; static;
  public
    { Public �錾 }
    class property ANSI: TEncoding read GetANSI;
  end;

implementation

class function TEncodingHelper.GetANSI: TEncoding;
begin
  Result := Default;
end;

end.

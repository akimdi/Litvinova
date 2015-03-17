unit UTC;

interface

// �������������� ������� UTC � ���������� ������� � �������
// � ������ Windows-�������� ���������� GMT-�������� � ��������� �������� �� ������ �����
function UTCToLocalTime(AValue: TDateTime): TDateTime;
function LocalTimeToUTC(AValue: TDateTime): TDateTime;

implementation

uses
  SysUtils, Windows;

function UTCToLocalTime(AValue: TDateTime): TDateTime;
// AValue - ����� UTC
// Result - ����� � ������ ���������� GMT-�������� � ��������� �������� �� ������ �����
var
  ST1, ST2: TSystemTime;
  TZ: TTimeZoneInformation;
begin
  // TZ - ��������� ��������� Windows
  GetTimeZoneInformation(TZ);

  // �������������� TDateTime � WindowsSystemTime
  DateTimeToSystemTime(AValue, ST1);

  // ���������� ��������� �������� �� �������
  SystemTimeToTzSpecificLocalTime(@TZ, ST1, ST2);

  // ���������� SystemTime � TDateTime
  Result := SystemTimeToDateTime(ST2);
end;

function LocalTimeToUTC(AValue: TDateTime): TDateTime;
// AValue - ��������� �����
// Result - ����� UTC
var
  ST1, ST2: TSystemTime;
  TZ: TTimeZoneInformation;
begin
  // TZ - ��������� (Windows) ���������
  GetTimeZoneInformation(TZ);
  // �.�. ���� ����� ������ �������� �������������� - ����������� bias
  TZ.Bias := -TZ.Bias;
  TZ.StandardBias := -TZ.StandardBias;
  TZ.DaylightBias := -TZ.DaylightBias;

  DateTimeToSystemTime(AValue, ST1);

  // ���������� ��������� �������� �� �������
  SystemTimeToTzSpecificLocalTime(@TZ, ST1, ST2);

  // ���������� WindowsSystemTime � TDateTime
  Result := SystemTimeToDateTime(ST2);
end;

end.

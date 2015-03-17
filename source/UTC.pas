unit UTC;

interface

// ѕреобразование времени UTC к локальному времени и обратно
// с учЄтом Windows-настроек локального GMT-смещени€ и правилами перехода на летнее врем€
function UTCToLocalTime(AValue: TDateTime): TDateTime;
function LocalTimeToUTC(AValue: TDateTime): TDateTime;

implementation

uses
  SysUtils, Windows;

function UTCToLocalTime(AValue: TDateTime): TDateTime;
// AValue - врем€ UTC
// Result - врем€ с учЄтом локального GMT-смещени€ и правилами перехода на летнее врем€
var
  ST1, ST2: TSystemTime;
  TZ: TTimeZoneInformation;
begin
  // TZ - локальные настройки Windows
  GetTimeZoneInformation(TZ);

  // ѕреобразование TDateTime к WindowsSystemTime
  DateTimeToSystemTime(AValue, ST1);

  // ѕрименение локальных настроек ко времени
  SystemTimeToTzSpecificLocalTime(@TZ, ST1, ST2);

  // ѕриведение SystemTime к TDateTime
  Result := SystemTimeToDateTime(ST2);
end;

function LocalTimeToUTC(AValue: TDateTime): TDateTime;
// AValue - локальное врем€
// Result - врем€ UTC
var
  ST1, ST2: TSystemTime;
  TZ: TTimeZoneInformation;
begin
  // TZ - локальные (Windows) настройки
  GetTimeZoneInformation(TZ);
  // т.к. надо будет делать обратное преобразование - инвертируем bias
  TZ.Bias := -TZ.Bias;
  TZ.StandardBias := -TZ.StandardBias;
  TZ.DaylightBias := -TZ.DaylightBias;

  DateTimeToSystemTime(AValue, ST1);

  // ѕрименение локальных настроек ко времени
  SystemTimeToTzSpecificLocalTime(@TZ, ST1, ST2);

  // ѕриведение WindowsSystemTime к TDateTime
  Result := SystemTimeToDateTime(ST2);
end;

end.

unit UserTimer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdTCPConnection,
  IdTCPClient, IdHTTP, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.ExtCtrls,
  ActiveX, System.win.ScktComp, System.StrUtils, System.DateUtils,
  UTC, Auth;

type
  TUserTimerThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure TimerVK;
  end;

implementation

uses Main;

{ TUserTimer }

procedure TUserTimerThread.Execute;
begin
  Synchronize(TimerVK);
end;

procedure TUserTimerThread.TimerVK;
var
  i: Integer; // �������
  temp_data_time: TDateTime;
begin
  { https://api.vk.com/method/users.get?user_ids=id1&fields=sex,id,first_name,last_name,bdate,city,photo_max_orig,deactivated,lists,blacklisted,verified,site,home_town,domain,followers_count,nickname,occupation,personal,relatives,relation,home_phone,counters,mobile_phone,universities,university_name,faculty,graduation,faculty_name,schools,can_post,connections,exports,status,country,online,online_mobile,online_app,has_mobile,can_see_all_posts,can_see_audio,movies,games,about,can_post,quotes,books,tv,timezone,can_write_private_message,activities,interests,music,wall_comments,contacts,education,last_seen&name_case=nom&v=5.21&access_token
    � ������ users.get ���� user_ids ��� ������ �����, ����������� ����� �������,
    ���������� ��������� ������� ������ ���������� �� ����� 1000 }
  GetVKobj := Main_Form.IdHTTP_1.Get
    ('https://api.vk.com/method/users.get?user_ids=' + Check_ID_Pos_str +
    '&fields=sex,id,first_name,last_name,bdate,' +
    'deactivated,lists,blacklisted,verified,home_town' +
    ',domain,last_seen,nickname,' + 'counters,' +
    'status,online,online_mobile,online_app,' + 'has_mobile,' +
    'timezone,activities,' + '&name_case=nom&v=5.21&access_token');
  // ����������� ����������
  GetParsObj := Copy(GetVKobj, 1, MaxInt);
  GetParsObj_for_name := Copy(GetVKobj, 1, MaxInt);
  GetParsObj_for_status := Copy(GetVKobj, 1, MaxInt);
  GetParsObj_for_last_seen := Copy(GetVKobj, 1, MaxInt);
  GetParsObj_for_bdate := Copy(GetVKobj, 1, MaxInt);
  GetParsObj_for_surname := Copy(GetVKobj, 1, MaxInt);
  GetParsObj_for_sex := Copy(GetVKobj, 1, MaxInt);
  GetParsObj_for_online_offline := Copy(GetVKobj, 1, MaxInt);
  GetParsObj_for_ID := Copy(GetVKobj, 1, MaxInt);
  // ����� JSON ������ � Memo ��� �� ���� ��������� � ��������
  // (� ����� ������ ������)
  Main_Form.Memo_1.Lines.Text := GetParsObj;
  Position_error := AnsiPos('error', GetParsObj);
  Position_deleted := AnsiPos('"deactivated":"deleted"', GetParsObj);
  Position_banned := AnsiPos('"deactivated":"banned"', GetParsObj);
  if (Position_error <> 0) then // ���� ����� ������ (error), ��...
  begin
    // MessageBox(Main_Form.Handle, PChar('�������� ������ !'), PChar('������'),
    // (MB_OK + MB_ICONERROR));
    Main_Form.Label_name.Caption := '�������� ������ !';
    Main_Form.Label_name.Font.Color := clRed;
    Main_Form.Label_surname.Caption := '';
    Main_Form.Label_on_off.Caption := '';
    Main_Form.Label_ID.Caption := '';
    Main_Form.Label_sex.Caption := '';
    Main_Form.Label_status.Caption := '';
    Main_Form.Label_bdate.Caption := '';
    Main_Form.Label_last_seen.Caption := '';
  end
  else
  begin
    if ((Position_banned <> 0) or (Position_deleted <> 0)) then
    // ���� ����� ��� deleted ��� banned, ��...
    begin
      { ������ �������� }
      // ������ ���
      GetParsObj_for_name := AnsiReplaceStr(GetParsObj_for_name, '{', '');
      GetParsObj_for_name := AnsiReplaceStr(GetParsObj_for_name, '}', '');
      GetParsObj_for_name := AnsiReplaceStr(GetParsObj_for_name, ']', '');
      GetParsObj_for_name := AnsiReplaceStr(GetParsObj_for_name, '"', '');
      GetParsObj_for_name := AnsiReplaceStr(GetParsObj_for_name, ':', '');
      GetParsObj_for_name := AnsiReplaceStr(GetParsObj_for_name, '_', '');
      temp_name := Copy(GetParsObj_for_name,
        AnsiPos('firstname', GetParsObj_for_name),
        AnsiPos(',last', GetParsObj_for_name));
      Delete(temp_name, 1, 9);
      Delete(temp_name, AnsiPos(',', temp_name), MaxInt);
      // ������� ���
      Main_Form.Label_name.Caption := temp_name;
      // ������ �������
      GetParsObj_for_surname := AnsiReplaceStr(GetParsObj_for_surname, '{', '');
      GetParsObj_for_surname := AnsiReplaceStr(GetParsObj_for_surname, '}', '');
      GetParsObj_for_surname := AnsiReplaceStr(GetParsObj_for_surname, ']', '');
      GetParsObj_for_surname := AnsiReplaceStr(GetParsObj_for_surname, '"', '');
      GetParsObj_for_surname := AnsiReplaceStr(GetParsObj_for_surname, ':', '');
      GetParsObj_for_surname := AnsiReplaceStr(GetParsObj_for_surname, '_', '');
      Delete(GetParsObj_for_surname, 1, 8);
      GetParsObj_for_surname := Copy(GetParsObj_for_surname,
        AnsiPos('lastname', GetParsObj_for_surname), MaxInt);
      Delete(GetParsObj_for_surname, 1, 8);
      Delete(GetParsObj_for_surname,
        AnsiPos(',', GetParsObj_for_surname), MaxInt);
      // ������� �������
      Main_Form.Label_surname.Caption := GetParsObj_for_surname;
      // ������ ID
      Delete(GetParsObj_for_ID, 1, 19);
      GetParsObj_for_ID := AnsiReplaceStr(GetParsObj_for_ID, '{', '');
      GetParsObj_for_ID := AnsiReplaceStr(GetParsObj_for_ID, '}', '');
      GetParsObj_for_ID := AnsiReplaceStr(GetParsObj_for_ID, ']', '');
      GetParsObj_for_ID := AnsiReplaceStr(GetParsObj_for_ID, '"', '');
      GetParsObj_for_ID := AnsiReplaceStr(GetParsObj_for_ID, ':', '');
      GetParsObj_for_ID := AnsiReplaceStr(GetParsObj_for_ID, '_', '');
      for i := length(GetParsObj_for_ID) downto 1 do
        if not(CharInSet(GetParsObj_for_ID[i], ['0' .. '9'])) then
        begin
          Delete(GetParsObj_for_ID, i, MaxInt);
        end;
      // ������� ID
      Main_Form.Label_ID.Caption := GetParsObj_for_ID;
      // ������ ���
      GetParsObj_for_sex := AnsiReplaceStr(GetParsObj_for_sex, '{', '');
      GetParsObj_for_sex := AnsiReplaceStr(GetParsObj_for_sex, '}', '');
      GetParsObj_for_sex := AnsiReplaceStr(GetParsObj_for_sex, ']', '');
      GetParsObj_for_sex := AnsiReplaceStr(GetParsObj_for_sex, '"', '');
      GetParsObj_for_sex := AnsiReplaceStr(GetParsObj_for_sex, ':', '');
      GetParsObj_for_sex := AnsiReplaceStr(GetParsObj_for_sex, '_', '');
      GetParsObj_for_sex := Copy(GetParsObj_for_sex,
        AnsiPos('sex', GetParsObj_for_sex), MaxInt);
      Delete(GetParsObj_for_sex, 6, MaxInt);
      GetParsObj_for_sex := Copy(GetParsObj_for_sex, 4, 1);
      // ������� ���
      if (GetParsObj_for_sex = '0') then
      begin
        Main_Form.Label_sex.Caption := '�� ������';
        Main_Form.Label_sex.Font.Color := clRed;
        Main_Form.Label_sex.Font.Size := 12;
      end;
      if (GetParsObj_for_sex = '1') then
      begin
        Main_Form.Label_sex.Caption := '�������';
      end;
      if (GetParsObj_for_sex = '2') then
      begin
        Main_Form.Label_sex.Caption := '�������';
      end;
      // ������ ������
      GetParsObj_for_online_offline :=
        AnsiReplaceStr(GetParsObj_for_online_offline, '{', '');
      GetParsObj_for_online_offline :=
        AnsiReplaceStr(GetParsObj_for_online_offline, '}', '');
      GetParsObj_for_online_offline :=
        AnsiReplaceStr(GetParsObj_for_online_offline, ']', '');
      GetParsObj_for_online_offline :=
        AnsiReplaceStr(GetParsObj_for_online_offline, '"', '');
      GetParsObj_for_online_offline :=
        AnsiReplaceStr(GetParsObj_for_online_offline, ':', '');
      GetParsObj_for_online_offline :=
        AnsiReplaceStr(GetParsObj_for_online_offline, '_', '');
      Delete(GetParsObj_for_online_offline, 1, 8);
      GetParsObj_for_online_offline := Copy(GetParsObj_for_online_offline,
        AnsiPos('online', GetParsObj_for_online_offline), MaxInt);
      GetParsObj_for_online_offline :=
        Copy(GetParsObj_for_online_offline, 7, 1);
      // ������� ������
      if GetParsObj_for_online_offline = '0' then
      begin
        Main_Form.Label_on_off.Font.Color := clRed;
        Main_Form.Label_on_off.Font.Size := 12;
        Main_Form.Label_on_off.Caption := '������� ��� ��� �������� ������� !';
        // Main_Form.Timer_2.Enabled := True;
        // Main_Form.Timer_1.Enabled := False;
        Main_Form.Label_status.Caption := '';
        Main_Form.Label_bdate.Caption := '';
        Main_Form.Label_last_seen.Caption := '';
        // MessageBox(Main_Form.Handle,
        // PChar(temp_name + ' ������� ��� ��� �������� ������� !' + #13 +
        // '�� ��� ������ ������������ ����������� ���� �������� ��� ��� ��������, ����� ����� ������ ����� �������� ��������.'),
        // PChar('��������������'), (MB_OK + MB_ICONWARNING));
      end
      else
      begin
        // Main_Form.Timer_2.Enabled := False;
        // Main_Form.Timer_1.Enabled := False;
        Main_Form.Label_on_off.Font.Color := clGreen;
        Main_Form.Label_on_off.Font.Size := 12;
        Main_Form.Label_on_off.Caption := '� ����';
        // MessageBox(Main_Form.Handle, PChar(temp_name + ' ������ ��������� :)' +
        // #13 + '������ ���-������ ��������...'), PChar('����������'),
        // (MB_OK + MB_ICONINFORMATION));
      end;
      { ����� �������� }
    end
    else
    begin
      { ������ ��������� ���� }
      // ������ ���
      GetParsObj_for_name := AnsiReplaceStr(GetParsObj_for_name, '{', '');
      GetParsObj_for_name := AnsiReplaceStr(GetParsObj_for_name, '}', '');
      GetParsObj_for_name := AnsiReplaceStr(GetParsObj_for_name, ']', '');
      GetParsObj_for_name := AnsiReplaceStr(GetParsObj_for_name, '"', '');
      GetParsObj_for_name := AnsiReplaceStr(GetParsObj_for_name, ':', '');
      GetParsObj_for_name := AnsiReplaceStr(GetParsObj_for_name, '_', '');
      temp_name := Copy(GetParsObj_for_name,
        AnsiPos('firstname', GetParsObj_for_name),
        AnsiPos(',last', GetParsObj_for_name));
      Delete(temp_name, 1, 9);
      Delete(temp_name, AnsiPos(',', temp_name), MaxInt);
      // ������� ���
      Main_Form.Label_name.Caption := temp_name;
      // ������ ID
      Delete(GetParsObj_for_ID, 1, 19);
      GetParsObj_for_ID := AnsiReplaceStr(GetParsObj_for_ID, '{', '');
      GetParsObj_for_ID := AnsiReplaceStr(GetParsObj_for_ID, '}', '');
      GetParsObj_for_ID := AnsiReplaceStr(GetParsObj_for_ID, ']', '');
      GetParsObj_for_ID := AnsiReplaceStr(GetParsObj_for_ID, '"', '');
      GetParsObj_for_ID := AnsiReplaceStr(GetParsObj_for_ID, ':', '');
      GetParsObj_for_ID := AnsiReplaceStr(GetParsObj_for_ID, '_', '');
      for i := length(GetParsObj_for_ID) downto 1 do
        if not(CharInSet(GetParsObj_for_ID[i], ['0' .. '9'])) then
        begin
          Delete(GetParsObj_for_ID, i, MaxInt);
        end;
      // ������� ID
      Main_Form.Label_ID.Caption := GetParsObj_for_ID;
      // ������ �������
      GetParsObj_for_surname := AnsiReplaceStr(GetParsObj_for_surname, '{', '');
      GetParsObj_for_surname := AnsiReplaceStr(GetParsObj_for_surname, '}', '');
      GetParsObj_for_surname := AnsiReplaceStr(GetParsObj_for_surname, ']', '');
      GetParsObj_for_surname := AnsiReplaceStr(GetParsObj_for_surname, '"', '');
      GetParsObj_for_surname := AnsiReplaceStr(GetParsObj_for_surname, ':', '');
      GetParsObj_for_surname := AnsiReplaceStr(GetParsObj_for_surname, '_', '');
      Delete(GetParsObj_for_surname, 1, 8);
      GetParsObj_for_surname := Copy(GetParsObj_for_surname,
        AnsiPos('lastname', GetParsObj_for_surname), MaxInt);
      Delete(GetParsObj_for_surname, 1, 8);
      Delete(GetParsObj_for_surname,
        AnsiPos(',', GetParsObj_for_surname), MaxInt);
      // ������� �������
      Main_Form.Label_surname.Caption := GetParsObj_for_surname;
      // ������ ���
      GetParsObj_for_sex := AnsiReplaceStr(GetParsObj_for_sex, '{', '');
      GetParsObj_for_sex := AnsiReplaceStr(GetParsObj_for_sex, '}', '');
      GetParsObj_for_sex := AnsiReplaceStr(GetParsObj_for_sex, ']', '');
      GetParsObj_for_sex := AnsiReplaceStr(GetParsObj_for_sex, '"', '');
      GetParsObj_for_sex := AnsiReplaceStr(GetParsObj_for_sex, ':', '');
      GetParsObj_for_sex := AnsiReplaceStr(GetParsObj_for_sex, '_', '');
      GetParsObj_for_sex := Copy(GetParsObj_for_sex,
        AnsiPos('sex', GetParsObj_for_sex), MaxInt);
      Delete(GetParsObj_for_sex, 6, MaxInt);
      GetParsObj_for_sex := Copy(GetParsObj_for_sex, 4, 1);
      // ������� ���
      if (GetParsObj_for_sex = '0') then
      begin
        Main_Form.Label_sex.Caption := '�� ������';
        Main_Form.Label_sex.Font.Color := clRed;
        Main_Form.Label_sex.Font.Size := 12;
      end;
      if (GetParsObj_for_sex = '1') then
      begin
        Main_Form.Label_sex.Caption := '�������';
      end;
      if (GetParsObj_for_sex = '2') then
      begin
        Main_Form.Label_sex.Caption := '�������';
      end;
      // ������ ������ ������������
      GetParsObj_for_status := Copy(GetParsObj_for_status,
        AnsiPos('status', GetParsObj_for_status), MaxInt);
      Delete(GetParsObj_for_status, 1, 6);
      Delete(GetParsObj_for_status, 1, 3);
      GetParsObj_for_status := Copy(GetParsObj_for_status, 1,
        AnsiPos('","last_seen":{"time":', GetParsObj_for_status));
      temp_status2 := length(GetParsObj_for_status);
      temp_status2 := temp_status2 - 1;
      GetParsObj_for_status := Copy(GetParsObj_for_status, 1, temp_status2);
      GetParsObj_for_status := AnsiReplaceStr(GetParsObj_for_status, '\/', '/');
      GetParsObj_for_status := AnsiReplaceStr(GetParsObj_for_status, '\', '');
      // ������� ������ ������������
      Main_Form.Label_status.Caption := GetParsObj_for_status;
      // ������ ���� �������� ������������
      GetParsObj_for_bdate := AnsiReplaceStr(GetParsObj_for_bdate, '{', '');
      GetParsObj_for_bdate := AnsiReplaceStr(GetParsObj_for_bdate, '}', '');
      GetParsObj_for_bdate := AnsiReplaceStr(GetParsObj_for_bdate, ']', '');
      GetParsObj_for_bdate := AnsiReplaceStr(GetParsObj_for_bdate, '"', '');
      GetParsObj_for_bdate := AnsiReplaceStr(GetParsObj_for_bdate, ':', '');
      GetParsObj_for_bdate := AnsiReplaceStr(GetParsObj_for_bdate, '_', '');
      temp_bdate := AnsiPos('bdate', GetParsObj_for_bdate);
      if temp_bdate = 0 then // ���� �� �� �����, ��...
      begin
        Main_Form.Label_bdate.Caption := '�� ������';
        // Main_Form.Label_bdate.Font.Color := clRed;
        Main_Form.Label_bdate.Font.Size := 12;
      end
      else
      begin
        Delete(GetParsObj_for_bdate, 1, AnsiPos('bdate', GetParsObj_for_bdate));
        Delete(GetParsObj_for_bdate, 1, 4);
        GetParsObj_for_bdate := Copy(GetParsObj_for_bdate, 1,
          AnsiPos(',', GetParsObj_for_bdate));
        GetParsObj_for_bdate := AnsiReplaceStr(GetParsObj_for_bdate, ',', '');
        // ������� ���� �������� ������������
        Main_Form.Label_bdate.Caption := GetParsObj_for_bdate;
      end;
      // ������ ����� ����� ��������� ��� ������� ������������
      GetParsObj_for_last_seen :=
        AnsiReplaceStr(GetParsObj_for_last_seen, '{', '');
      GetParsObj_for_last_seen :=
        AnsiReplaceStr(GetParsObj_for_last_seen, '}', '');
      GetParsObj_for_last_seen :=
        AnsiReplaceStr(GetParsObj_for_last_seen, ']', '');
      GetParsObj_for_last_seen :=
        AnsiReplaceStr(GetParsObj_for_last_seen, '"', '');
      GetParsObj_for_last_seen :=
        AnsiReplaceStr(GetParsObj_for_last_seen, ':', '');
      GetParsObj_for_last_seen :=
        AnsiReplaceStr(GetParsObj_for_last_seen, '_', '');
      Delete(GetParsObj_for_last_seen, 1, AnsiPos('lastseentime',
        GetParsObj_for_last_seen));
      Delete(GetParsObj_for_last_seen, 1, 11);
      GetParsObj_for_last_seen := Copy(GetParsObj_for_last_seen, 1,
        AnsiPos(',', GetParsObj_for_last_seen));
      GetParsObj_for_last_seen :=
        AnsiReplaceStr(GetParsObj_for_last_seen, ',', '');
      // ������������ �������� �� String � Integer
      temp_last_seen := StrToInt(GetParsObj_for_last_seen);
      // ������������ �� Unix Time � Windows Time �������� UnixTimeToDateTime
      GetParsObj_for_last_seen := Main_Form.UnixTimeToDateTime(temp_last_seen);
      // ������������ ���������� �������� � ������� Windows Time ���� String � ��� DateTime, �������� StrToDateTime
      temp_data_time := StrToDateTime(GetParsObj_for_last_seen);
      // ��������� ������� ���� �� �������� ������� �� �������� (GMT ��� UTC�0 => � ������ ������ UTC�0 ��������� � GMT)
      // � ��������� ������� ���� (� ������ ������ ��� ���������� ����� => MSK (UTC+4))
      GetParsObj_for_last_seen :=
        DateTimeToStr(UTC.UTCToLocalTime(temp_data_time));
      // ������� ����� ����� ��������� ��� ������� ������������
      Main_Form.Label_last_seen.Caption := GetParsObj_for_last_seen;
      // ������ ������
      GetParsObj_for_online_offline :=
        AnsiReplaceStr(GetParsObj_for_online_offline, '{', '');
      GetParsObj_for_online_offline :=
        AnsiReplaceStr(GetParsObj_for_online_offline, '}', '');
      GetParsObj_for_online_offline :=
        AnsiReplaceStr(GetParsObj_for_online_offline, ']', '');
      GetParsObj_for_online_offline :=
        AnsiReplaceStr(GetParsObj_for_online_offline, '"', '');
      GetParsObj_for_online_offline :=
        AnsiReplaceStr(GetParsObj_for_online_offline, ':', '');
      GetParsObj_for_online_offline :=
        AnsiReplaceStr(GetParsObj_for_online_offline, '_', '');
      Delete(GetParsObj_for_online_offline, 1, 8);
      GetParsObj_for_online_offline := Copy(GetParsObj_for_online_offline,
        AnsiPos('online', GetParsObj_for_online_offline), MaxInt);
      GetParsObj_for_online_offline :=
        Copy(GetParsObj_for_online_offline, 7, 1);
      // ������� ������
      if GetParsObj_for_online_offline = '0' then
      begin
        Main_Form.Label_on_off.Font.Color := clRed;
        Main_Form.Label_on_off.Font.Size := 12;
        Main_Form.Label_on_off.Caption := '�� � ����';
      end
      else
      begin
        Main_Form.Timer_2.Enabled := False;
        Main_Form.Timer_1.Enabled := True; // Beep()
        Main_Form.Label_on_off.Font.Color := clGreen;
        Main_Form.Label_on_off.Font.Size := 12;
        Main_Form.Label_on_off.Caption := '� ����';
        Main_Form.Button_further.Visible := True;
      end;
      { ����� ��������� ���� }
    end;
  end;
end;

end.

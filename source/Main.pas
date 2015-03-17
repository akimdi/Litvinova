unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdTCPConnection,
  IdTCPClient, IdHTTP, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.ExtCtrls,
  IdAntiFreezeBase, Vcl.IdAntiFreeze, UserGet, ActiveX,
  System.win.ScktComp, System.StrUtils, Winapi.shellapi, Vcl.Clipbrd,
  Winapi.WinInet, System.DateUtils, UTC, UserTimer, ABOUT, Vcl.AppEvnts,
  System.SyncObjs, Auth, Authorization, SendMessage, MessageVK;

type
  TMain_Form = class(TForm)
    Edit_enter: TEdit;
    Button_start: TButton;
    Button_open_URL: TButton;
    Button_paste: TButton;
    Button_hideTray: TButton;
    Timer_1: TTimer;
    Timer_2: TTimer;
    IdSSLIOHandlerSocketOpenSSL_1: TIdSSLIOHandlerSocketOpenSSL;
    IdHTTP_1: TIdHTTP;
    Button_help: TButton;
    Label_1: TLabel;
    Label_2: TLabel;
    Label_3: TLabel;
    Label_name: TLabel;
    Label_surname: TLabel;
    Label_on_off: TLabel;
    Label_4: TLabel;
    Button_off_sound: TButton;
    Edit_temp: TEdit;
    IdAntiFreeze1: TIdAntiFreeze;
    TrayIcon1: TTrayIcon;
    Memo_1: TMemo;
    Label_5: TLabel;
    Label_ID: TLabel;
    Label_7: TLabel;
    Label_sex: TLabel;
    Label_6: TLabel;
    Label_status: TLabel;
    Label_8: TLabel;
    Label_bdate: TLabel;
    Label_9: TLabel;
    Label_last_seen: TLabel;
    Button_copy: TButton;
    Button_about: TButton;
    ApplicationEvents1: TApplicationEvents;
    Button_clear: TButton;
    Button_further: TButton;
    procedure Button_startClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_nameMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_surnameMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_on_offMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer_1Timer(Sender: TObject);
    procedure Button_hideTrayClick(Sender: TObject);
    procedure Button_open_URLClick(Sender: TObject);
    procedure Button_pasteClick(Sender: TObject);
    procedure GetMethodVK;
    function ConnectedToInet: Boolean; // �������� ����������� � ���������
    procedure Timer_2Timer(Sender: TObject);
    procedure TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_off_soundClick(Sender: TObject);
    procedure Label_5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_IDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_sexMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button_startMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_statusMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_bdateMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_9MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_last_seenMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function UnixTimeToDateTime(UnixTime: LongInt): String;
    function DateTimeToUnixTime(DelphiDate: TDate): LongInt;
    procedure FormCreate(Sender: TObject);
    procedure Button_copyClick(Sender: TObject);
    procedure Button_helpClick(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure Button_aboutClick(Sender: TObject);
    procedure Edit_enterEnter(Sender: TObject);
    procedure Edit_enterKeyPress(Sender: TObject; var Key: Char);
    procedure Button_clearClick(Sender: TObject);
    procedure FormMouseLeave(Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure Button_furtherClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;
  GetVKobj, GetParsObj: string;

  My_UserGet_VK: TUserGetThread;
  My_UserTimer_VK: TUserTimerThread;
  My_Auth_VK: TAuthorizationThread;
  My_Message_VK: TSendMessageThread;

  dwConnectionTypes: DWORD;
  Res_Time: TDateTime;

  GetParsObj_for_name, GetParsObj_for_surname, GetParsObj_for_sex,
    GetParsObj_for_online_offline, GetParsObj_for_ID, GetParsObj_for_status,
    GetParsObj_for_bdate, GetParsObj_for_last_seen: string;

  temp_name: string;
  temp_last_seen, temp_bdate, temp_status2: Integer;

  Position_deleted, Position_banned, Position_error: Integer;

  Check_ID_Pos_int: Integer;
  Check_ID_Pos_str: string;

  GetAuth, GetParsAuth, GetAccessToken, GetUserId: string;

const
  My_SecPerDay = 86400; // 86400 ������ � ������ (24 ����)
  My_Offset1970 = 25569;
  My_four_hours = 14400; // 14400 ������ � 4 �����

implementation

{$R *.dfm}

procedure TMain_Form.ApplicationEvents1Activate(Sender: TObject);
begin
  Main_Form.Edit_enter.Clear();
  if Clipboard.HasFormat(CF_TEXT) then // ���� ��� �����, ��...
  begin
    Edit_enter.Text := Clipboard.AsText;
  end;
  Main_Form.Edit_enter.SetFocus();
end;

procedure TMain_Form.Button_aboutClick(Sender: TObject);
begin
  AboutBox.ShowModal();
end;

procedure TMain_Form.Button_clearClick(Sender: TObject);
begin
  Main_Form.Label_name.Caption := '';
  Main_Form.Label_surname.Caption := '';
  Main_Form.Label_on_off.Caption := '';
  Main_Form.Label_ID.Caption := '';
  Main_Form.Label_sex.Caption := '';
  Main_Form.Label_status.Caption := '';
  Main_Form.Label_bdate.Caption := '';
  Main_Form.Label_last_seen.Caption := '';
  Edit_enter.Clear();
  Clipboard.Clear();
  Main_Form.Timer_1.Enabled := False;
  Main_Form.Timer_2.Enabled := False;
  // EmptyClipboard();
end;

procedure TMain_Form.Button_copyClick(Sender: TObject);
begin
  Edit_enter.SelectAll; // �������� ��
  Edit_enter.CopyToClipboard; // ����������� :)
end;

procedure TMain_Form.Button_furtherClick(Sender: TObject);
begin
  Form_Auth.Show();
end;

procedure TMain_Form.Button_helpClick(Sender: TObject);
begin
  // ������� ����� !!!!!!!!!!!
end;

procedure TMain_Form.Button_hideTrayClick(Sender: TObject);
begin
  TrayIcon1.Visible := True;
  Application.MainForm.Hide;
end;

procedure TMain_Form.Button_off_soundClick(Sender: TObject);
begin
  Timer_1.Enabled := False;
end;

procedure TMain_Form.Button_open_URLClick(Sender: TObject);
begin
  // ShellExecute(0, 'open', 'www.google.ru', nil, nil, SW_SHOW); ���� ������� �������� ��� ��������� ��������
  // ShellExecute(Handle, 'Open', PChar(VarToStr(Edit1.Text)), nil, nil,SW_SHOWNORMAL); ���� ��� ��� ��� ���
  ShellExecute(Handle, nil, PChar('https://vk.com/id' + GetParsObj_for_ID), nil,
    nil, SW_SHOW);
  // ���� �� URL ����� ����������� � Edit2 �� ���������� �������� �������� https://vk.com/id ��� �������� �� � ������
end;

procedure TMain_Form.Button_pasteClick(Sender: TObject);
begin
  // Main_Form.Edit_enter.Clear();
  // if Clipboard.HasFormat(CF_TEXT) then // ���� ��� �����, ��...
  // begin
  // Edit_enter.Text := Clipboard.AsText;
  // end;
  // Main_Form.Edit_enter.SetFocus();
end;

procedure TMain_Form.Button_startClick(Sender: TObject);
var
  ask_int: Integer;
begin
  if Edit_enter.Text = '' then
  begin
    MessageBox(Handle, PChar('�� ������ �� ����� :( '), PChar('������'),
      (MB_OK + MB_ICONERROR));
    Main_Form.Label_name.Caption := '';
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
    Check_ID_Pos_int := AnsiPos('vk.com/', Main_Form.Edit_enter.Text);
    if not(Check_ID_Pos_int = 0) then // ���� �� ����� ����������
    begin
      Check_ID_Pos_str := AnsiReplaceStr(Main_Form.Edit_enter.Text, ' ', '');
      Delete(Check_ID_Pos_str, 1, AnsiPos('vk.com/', Check_ID_Pos_str));
      Delete(Check_ID_Pos_str, 1, 6);
      ask_int := AnsiPos('?', Check_ID_Pos_str);
      if not(ask_int = 0) then // ���� ����� ���� "?"
      begin
        Delete(Check_ID_Pos_str, AnsiPos('?', Check_ID_Pos_str), MaxInt);
        Main_Form.Edit_temp.Text := Check_ID_Pos_str;
      end;
      Main_Form.Edit_temp.Text := Check_ID_Pos_str;
      if ConnectedToInet() then
      begin
        GetMethodVK();
      end
      else
      begin
        MessageBox(Handle, PChar('��������� ����������� � ��������� !'),
          PChar('����������� �����������'), (MB_OK + MB_ICONERROR));
      end;
    end
    else
    begin
      MessageBox(Handle, PChar('�������� ������ :('), PChar('������'),
        (MB_OK + MB_ICONERROR));
      Main_Form.Label_name.Caption := '';
      Main_Form.Label_surname.Caption := '';
      Main_Form.Label_on_off.Caption := '';
      Main_Form.Label_ID.Caption := '';
      Main_Form.Label_sex.Caption := '';
      Main_Form.Label_status.Caption := '';
      Main_Form.Label_bdate.Caption := '';
      Main_Form.Label_last_seen.Caption := '';
    end;
  end;
end;

procedure TMain_Form.Button_startMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Main_Form.Button_start.Font.Style := [fsbold];
  Main_Form.Button_start.Font.Size := 15;
end;

function TMain_Form.ConnectedToInet: Boolean;
{ �������� ����������� � ��������� }
begin
  dwConnectionTypes := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN +
    INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@dwConnectionTypes, 0);
end;

function TMain_Form.DateTimeToUnixTime(DelphiDate: TDate): LongInt;
begin
  Result := Trunc((DelphiDate - My_Offset1970) * My_SecPerDay);
end;

procedure TMain_Form.Edit_enterEnter(Sender: TObject);
{ ��� ��������� ������ }
begin
  // ��������
end;

procedure TMain_Form.Edit_enterKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Main_Form.Button_start.Font.Style := [fsbold];
    Main_Form.Button_start.Font.Size := 15;
    Main_Form.Button_startClick(Sender);
  end;
end;

procedure TMain_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; // ������������ ������ ��� �������� �����
  Clipboard.Clear();
end;

procedure TMain_Form.FormCreate(Sender: TObject);
begin
  Clipboard.Clear();
  Main_Form.Label_name.Caption := '';
  Main_Form.Label_surname.Caption := '';
  Main_Form.Label_on_off.Caption := '';
  Main_Form.Label_ID.Caption := '';
  Main_Form.Label_sex.Caption := '';
  Main_Form.Label_status.Caption := '';
  Main_Form.Label_bdate.Caption := '';
  Main_Form.Label_last_seen.Caption := '';
end;

procedure TMain_Form.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Main_Form.Close;
  end;
end;

procedure TMain_Form.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.FormMouseLeave(Sender: TObject);
begin
  if Main_Form.Focused = False then
  begin
    Main_Form.SetFocus();
  end;
end;

procedure TMain_Form.GetMethodVK;
begin
  My_UserGet_VK := TUserGetThread.Create(False);
  {
    ������ ��������� ������
    �������� False ��������� ����� ����� ����� ��������
    True - ������ ������������, ������� Resume
  }
  My_UserGet_VK.Priority := tpLowest;
  {
    ����� ��������� ������
    tpIdle	������ ���������. ����� �������� ����� ������ �����, ����� ����������� ������� ��������� � ��������� �������.
    tpLowest	��������� �� ��� ������ ���� �����������
    tpLower	��������� �� ���� ����� ���� �����������
    tpNormal	���������� ���������
    tpHigher	��������� �� ���� ����� ���� �����������
    tpHighest	��������� �� ��� ������ ���� �����������
    tpTimeCritical	������������ ���������. ��������� �� ������ ������� ���� ������������ �������.

    -----------------------------------------------------------------------------

    tpIdle ��������, ����� ������� �����������
    tplowest ��������
    tplower ������
    tpnormal ����������
    tphigher �������
    tphighest ����������
    tptimecritical �����������
  }
  My_UserGet_VK.FreeOnTerminate := True;
  {
    ���������, ��� ����� ���������� ���� ������ �� ����� ����������, �.�. �� ���� ���������� � ��� ��������.
    � ��������� ������, ���������� ����� �������� ������� terminate.
  }
end;

procedure TMain_Form.Label_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_8MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_9MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_bdateMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_IDMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_last_seenMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_nameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_on_offMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_sexMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_statusMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Label_surnameMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Main_Form.Perform(WM_SysCommand, $F012, 0);
end;

procedure TMain_Form.Timer_1Timer(Sender: TObject);
begin
  Beep();
  // ����� ����������� �������� ������
  // MessageBeep(MM_MIDI_MAPPER);  � ����� � ���, �� � �� ����������� ���
end;

procedure TMain_Form.Timer_2Timer(Sender: TObject);
begin
  {
    �� ������� ������� ����� ���������� � ������� API �� ���� 3 ��� � �������.

    ������������ ����� �������� �� ������� ������� ������� �� ����� �������������, ������������ ����������.
    ���� ���������� ���������� ������ 10 000 �������, �� ����� ��������� 5 �������� � �������, �� 100 000 � 8 ��������, �� 1 000 000 � 20 ��������, ������ 1 ���. � 35 �������� � �������.

    ��� ���������� ���� �������� ������ ������ ������ � ����� 6: "Too many requests per second.".

    ������ ����������� �� ������� ���������, ���������� � �������������� ����������� �� ����� ���������� �������. �� �������� ��������, �� �� ������������� ���������� � ������ �������.
    ���� ������ ������ ���������� ������������� ������� ����� ���������� �������, ����� ����� �������� �������� �� ����� execute.

    ����� ���������� ��������������� ������ ������ � ����������� ������ ����� ��������� ����� ����� (��. captcha_error), � ����� ����� ���� �������� ���������
    (� ����� ������ ������ �� ���������� ����� �� ����� ����������� ������, �� ��� ������� ������������ ����� ������ �������).
  }
  My_UserTimer_VK := TUserTimerThread.Create(False);
  {
    ������ ��������� ������
    �������� False ��������� ����� ����� ����� ��������
    True - ������ ������������, ������� Resume
  }
  My_UserTimer_VK.Priority := tpLower;
  {
    ����� ��������� ������
    tpIdle	������ ���������. ����� �������� ����� ������ �����, ����� ����������� ������� ��������� � ��������� �������.
    tpLowest	��������� �� ��� ������ ���� �����������
    tpLower	��������� �� ���� ����� ���� �����������
    tpNormal	���������� ���������
    tpHigher	��������� �� ���� ����� ���� �����������
    tpHighest	��������� �� ��� ������ ���� �����������
    tpTimeCritical	������������ ���������. ��������� �� ������ ������� ���� ������������ �������.

    -----------------------------------------------------------------------------

    tpIdle ��������, ����� ������� �����������
    tplowest ��������
    tplower ������
    tpnormal ����������
    tphigher �������
    tphighest ����������
    tptimecritical �����������
  }
  My_UserTimer_VK.FreeOnTerminate := True;
  {
    ���������, ��� ����� ���������� ���� ������ �� ����� ����������, �.�. �� ���� ���������� � ��� ��������.
    � ��������� ������, ���������� ����� �������� ������� terminate.
  }
end;

procedure TMain_Form.TrayIcon1Click(Sender: TObject);
begin
  Application.MainForm.Show;
end;

procedure TMain_Form.TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  // posit2 := AnsiPos('online":0', str_temp2);
  // if posit2 = 0 then
  // // ���� �� �� ����� ���������� ��...
  // begin
  // TrayIcon_1.Hint := str_name + ' ' + str_surname + ' � ����  :)';
  // end
  // else
  // begin
  // TrayIcon_1.Hint := str_name + ' ' + str_surname + ' �� � ���� :(';
  // end;
end;

function TMain_Form.UnixTimeToDateTime(UnixTime: Integer): String;
begin
  Result := DateTimeToStr(UnixTime / My_SecPerDay + My_Offset1970);
end;

end.

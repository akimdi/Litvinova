unit Authorization;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdTCPConnection,
  IdTCPClient, IdHTTP, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.ExtCtrls,
  ActiveX, System.win.ScktComp, System.StrUtils, System.DateUtils,
  UTC;

type
  TAuthorizationThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure AuthorizationVK();
  end;

implementation

uses Main, Auth;

{ TAuthorizationThread }

procedure TAuthorizationThread.AuthorizationVK;
begin
  // Прямая авторизация с помощью официального приложения ВКонтакте для Android (ID приложения: 2274003, защищенный ключ: hHbZxrka2uZ6jB1inYsH)
  GetAuth := Main_Form.IdHTTP_1.Get
    ('https://oauth.vk.com/token?grant_type=password&scope=notify,friends,photos,audio,video,docs,notes,pages,status,wall,groups,messages,notifications,stats,ads,offline,email&client_id=2274003&client_secret=hHbZxrka2uZ6jB1inYsH&username='
    + Form_Auth.Edit_login.Text + '&password=' + Form_Auth.Edit_password.Text +
    '&v=5.21');
  GetParsAuth := Copy(GetAuth, 1, MaxInt);
  GetParsAuth := AnsiReplaceStr(GetParsAuth, '}', '');
  GetParsAuth := AnsiReplaceStr(GetParsAuth, '"', '');
  GetParsAuth := AnsiReplaceStr(GetParsAuth, '_', '');
  // парсинг AccessToken
  GetAccessToken := Copy(GetParsAuth, 1, MaxInt);
  Delete(GetAccessToken, 1, 12);
  Delete(GetAccessToken, AnsiPos(',', GetAccessToken), MaxInt);
  GetAccessToken := AnsiReplaceStr(GetAccessToken, ':', '');
  // парсинг UserId которому принадлежит вышеизложенный AccessToken
  GetUserId := Copy(GetParsAuth, AnsiPos('userid:', GetParsAuth), MaxInt);
  Delete(GetUserId, 1, 7);
end;

procedure TAuthorizationThread.Execute;
begin
  { Place thread code here }
  Synchronize(AuthorizationVK);
end;

end.

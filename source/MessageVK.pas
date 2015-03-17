unit MessageVK;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdTCPConnection,
  IdTCPClient, IdHTTP, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, SendMessage;

type
  TSendMessageThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure SendMessageVK();
  end;

implementation

uses Main, UserGet, Authorization;

{ TSendMessageThread }

procedure TSendMessageThread.Execute;
begin
  { Place thread code here }
  Synchronize(SendMessageVK);
end;

procedure TSendMessageThread.SendMessageVK;
var
  temp, temp2: string;
begin
  temp2 := Form_send_message.Memo_1.Lines.Text;
  temp := Main_Form.IdHTTP_1.Get
    ('https://api.vk.com/method/messages.send?user_id=' + GetParsObj_for_ID +
    '&message=' + temp2 + '&v=5.21&access_token=' + GetAccessToken);
  MessageBox(Form_send_message.Handle, PChar('Сообщение отправлено'),
    PChar('Информация'), (MB_OK + MB_ICONINFORMATION));
end;

end.

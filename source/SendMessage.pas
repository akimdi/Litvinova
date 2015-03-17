unit SendMessage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm_send_message = class(TForm)
    Button_send_message: TButton;
    Memo_1: TMemo;
    procedure Button_send_messageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_send_message: TForm_send_message;

implementation

uses Main, MessageVK;

{$R *.dfm}

procedure TForm_send_message.Button_send_messageClick(Sender: TObject);
begin
  // создаём поток
  My_Message_VK := TSendMessageThread.Create(False);
  My_Message_VK.Priority := tpLower;
  My_Message_VK.FreeOnTerminate := True;
end;

end.

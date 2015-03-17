unit Auth;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.StrUtils,
  Authorization, SendMessage;

type
  TForm_Auth = class(TForm)
    Edit_login: TEdit;
    Edit_password: TEdit;
    Button_enter_auth: TButton;
    Label_1: TLabel;
    Button_no_enter_auth: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button_enter_authClick(Sender: TObject);
    procedure Button_no_enter_authClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Auth: TForm_Auth;

implementation

uses Main;

{$R *.dfm}

procedure TForm_Auth.Button_enter_authClick(Sender: TObject);
begin
  // создаём поток
  My_Auth_VK := TAuthorizationThread.Create(False);
  My_Auth_VK.Priority := tpLower;
  My_Auth_VK.FreeOnTerminate := True;
  Form_send_message.Show();
end;

procedure TForm_Auth.Button_no_enter_authClick(Sender: TObject);
begin
  Form_Auth.Close();
  Main_Form.Timer_2.Enabled := True;
  Main_Form.Timer_1.Enabled := False; // Beep()
end;

procedure TForm_Auth.FormCreate(Sender: TObject);
begin
  // Form_Auth.Edit_login.Clear();
  // Form_Auth.Edit_password.Clear();
end;

end.

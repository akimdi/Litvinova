program Litvinova;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Main_Form},
  UserGet in 'UserGet.pas',
  UTC in 'UTC.pas',
  UserTimer in 'UserTimer.pas',
  ABOUT in 'ABOUT.pas' {AboutBox},
  Vcl.Themes,
  Vcl.Styles,
  Auth in 'Auth.pas' {Form_Auth},
  Authorization in 'Authorization.pas',
  SendMessage in 'SendMessage.pas' {Form_send_message},
  MessageVK in 'MessageVK.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm_Auth, Form_Auth);
  Application.CreateForm(TForm_send_message, Form_send_message);
  Application.Run;
end.

unit About;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdTCPConnection,
  IdTCPClient, IdHTTP, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.ExtCtrls,
  IdAntiFreezeBase, Vcl.IdAntiFreeze, UserGet, ActiveX,
  System.win.ScktComp, System.StrUtils, Winapi.shellapi, Vcl.Clipbrd,
  Winapi.WinInet;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Label_source: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CommentsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CopyrightMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_sourceMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ProductNameMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ProgramIconMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure VersionMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Label_sourceMouseEnter(Sender: TObject);
    procedure Label_sourceMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.CommentsMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  AboutBox.Perform(WM_SysCommand, $F012, 0);
end;

procedure TAboutBox.CopyrightMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  AboutBox.Perform(WM_SysCommand, $F012, 0);
end;

procedure TAboutBox.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    AboutBox.Close;
  end;
end;

procedure TAboutBox.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  AboutBox.Perform(WM_SysCommand, $F012, 0);
end;

procedure TAboutBox.Label_sourceMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ShellExecute(Handle, nil, PChar('https://github.com/akimdi/Litvinova'), nil,
    nil, SW_SHOW);
end;

procedure TAboutBox.Label_sourceMouseEnter(Sender: TObject);
begin
  AboutBox.Label_source.Font.Color := clred;
  AboutBox.Label_source.Cursor := crHandPoint;
end;

procedure TAboutBox.Label_sourceMouseLeave(Sender: TObject);
begin
  AboutBox.Label_source.Font.Color := clblue;
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
  AboutBox.Close;
end;

procedure TAboutBox.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  AboutBox.Perform(WM_SysCommand, $F012, 0);
end;

procedure TAboutBox.ProductNameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  AboutBox.Perform(WM_SysCommand, $F012, 0);
end;

procedure TAboutBox.ProgramIconMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  AboutBox.Perform(WM_SysCommand, $F012, 0);
end;

procedure TAboutBox.VersionMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  AboutBox.Perform(WM_SysCommand, $F012, 0);
end;

end.

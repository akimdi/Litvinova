object Form_send_message: TForm_send_message
  Left = 0
  Top = 0
  Caption = 'Form_send_message'
  ClientHeight = 301
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button_send_message: TButton
    Left = 96
    Top = 208
    Width = 177
    Height = 57
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = Button_send_messageClick
  end
  object Memo_1: TMemo
    Left = 16
    Top = 32
    Width = 361
    Height = 129
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    Lines.Strings = (
      'Hello World !')
    ParentFont = False
    TabOrder = 1
  end
end

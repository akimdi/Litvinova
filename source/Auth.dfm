object Form_Auth: TForm_Auth
  Left = 0
  Top = 0
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 213
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 19
  object Label_1: TLabel
    Left = 113
    Top = 14
    Width = 123
    Height = 19
    Caption = #1090#1091#1082'-'#1090#1091#1082', '#1074#1086#1081#1076#1080#1090#1077' : '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Edit_login: TEdit
    Left = 82
    Top = 48
    Width = 185
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Edit_password: TEdit
    Left = 82
    Top = 88
    Width = 185
    Height = 27
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button_enter_auth: TButton
    Left = 10
    Top = 142
    Width = 145
    Height = 57
    Caption = #1042#1093#1086#1076
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button_enter_authClick
  end
  object Button_no_enter_auth: TButton
    Left = 170
    Top = 142
    Width = 145
    Height = 57
    Caption = #1053#1077' '#1093#1086#1095#1091' '#1074#1093#1086#1076#1080#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button_no_enter_authClick
  end
end

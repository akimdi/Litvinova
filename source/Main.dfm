object Main_Form: TMain_Form
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Litvinova (alpha)'
  ClientHeight = 497
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnMouseDown = FormMouseDown
  OnMouseLeave = FormMouseLeave
  PixelsPerInch = 96
  TextHeight = 19
  object Label_1: TLabel
    Left = 8
    Top = 145
    Width = 41
    Height = 19
    Caption = #1048#1084#1103' :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    OnMouseDown = Label_1MouseDown
  end
  object Label_2: TLabel
    Left = 7
    Top = 170
    Width = 78
    Height = 19
    Caption = #1060#1072#1084#1080#1083#1080#1103' :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    OnMouseDown = Label_2MouseDown
  end
  object Label_3: TLabel
    Left = 8
    Top = 195
    Width = 61
    Height = 19
    Caption = #1057#1077#1081#1095#1072#1089' :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    OnMouseDown = Label_3MouseDown
  end
  object Label_name: TLabel
    Left = 212
    Top = 145
    Width = 74
    Height = 19
    Caption = 'Label_name'
    OnMouseDown = Label_nameMouseDown
  end
  object Label_surname: TLabel
    Left = 212
    Top = 170
    Width = 92
    Height = 19
    Caption = 'Label_surname'
    OnMouseDown = Label_surnameMouseDown
  end
  object Label_on_off: TLabel
    Left = 212
    Top = 195
    Width = 81
    Height = 19
    Caption = 'Label_on_off'
    OnMouseDown = Label_on_offMouseDown
  end
  object Label_4: TLabel
    Left = 8
    Top = 8
    Width = 484
    Height = 24
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1072#1076#1088#1077#1089' '#1089#1090#1088#1072#1085#1080#1094#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1042#1082#1086#1085#1090#1072#1082#1090#1077' :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    OnMouseDown = Label_4MouseDown
  end
  object Label_5: TLabel
    Left = 8
    Top = 220
    Width = 27
    Height = 19
    Caption = 'ID :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    OnMouseDown = Label_5MouseDown
  end
  object Label_ID: TLabel
    Left = 212
    Top = 220
    Width = 58
    Height = 19
    Caption = 'Label_ID'
    OnMouseDown = Label_IDMouseDown
  end
  object Label_7: TLabel
    Left = 8
    Top = 245
    Width = 38
    Height = 19
    Caption = #1055#1086#1083' :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    OnMouseDown = Label_7MouseDown
  end
  object Label_sex: TLabel
    Left = 212
    Top = 245
    Width = 62
    Height = 19
    Caption = 'Label_sex'
    OnMouseDown = Label_sexMouseDown
  end
  object Label_6: TLabel
    Left = 8
    Top = 270
    Width = 59
    Height = 19
    Caption = #1057#1090#1072#1090#1091#1089' :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    OnMouseDown = Label_6MouseDown
  end
  object Label_status: TLabel
    Left = 212
    Top = 270
    Width = 76
    Height = 19
    Caption = 'Label_status'
    OnMouseDown = Label_statusMouseDown
  end
  object Label_8: TLabel
    Left = 7
    Top = 295
    Width = 120
    Height = 19
    Caption = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103' :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    OnMouseDown = Label_8MouseDown
  end
  object Label_bdate: TLabel
    Left = 212
    Top = 295
    Width = 76
    Height = 19
    Caption = 'Label_bdate'
    OnMouseDown = Label_bdateMouseDown
  end
  object Label_9: TLabel
    Left = 7
    Top = 320
    Width = 191
    Height = 19
    Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1088#1072#1079' '#1079#1072#1093#1086#1076#1080#1083'('#1072') :'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    OnMouseDown = Label_9MouseDown
  end
  object Label_last_seen: TLabel
    Left = 212
    Top = 320
    Width = 97
    Height = 19
    Caption = 'Label_last_seen'
    OnMouseDown = Label_last_seenMouseDown
  end
  object Edit_enter: TEdit
    Left = 8
    Top = 38
    Width = 524
    Height = 27
    TabOrder = 0
    Text = 'https://vk.com/id156279408'
    OnEnter = Edit_enterEnter
    OnKeyPress = Edit_enterKeyPress
  end
  object Button_start: TButton
    Left = 538
    Top = 39
    Width = 46
    Height = 27
    Caption = '=>'
    TabOrder = 1
    OnClick = Button_startClick
    OnMouseDown = Button_startMouseDown
  end
  object Button_open_URL: TButton
    Left = 8
    Top = 83
    Width = 144
    Height = 45
    Caption = #1086#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077
    TabOrder = 2
    OnClick = Button_open_URLClick
  end
  object Button_paste: TButton
    Left = 471
    Top = 182
    Width = 113
    Height = 32
    Caption = #1042#1089#1090#1072#1074#1080#1090#1100
    TabOrder = 3
    Visible = False
    OnClick = Button_pasteClick
  end
  object Button_hideTray: TButton
    Left = 168
    Top = 83
    Width = 123
    Height = 45
    Caption = #1089#1082#1088#1099#1090#1100' '#1074' '#1090#1088#1077#1081
    TabOrder = 4
    OnClick = Button_hideTrayClick
  end
  object Button_help: TButton
    Left = 498
    Top = 8
    Width = 34
    Height = 25
    Caption = '?'
    TabOrder = 5
    OnClick = Button_helpClick
  end
  object Button_off_sound: TButton
    Left = 311
    Top = 83
    Width = 140
    Height = 45
    Caption = #1074#1099#1082#1083#1102#1095#1080#1090#1100' '#1079#1074#1091#1082
    TabOrder = 6
    OnClick = Button_off_soundClick
  end
  object Edit_temp: TEdit
    Left = 471
    Top = 142
    Width = 113
    Height = 27
    TabOrder = 7
    Visible = False
  end
  object Memo_1: TMemo
    Left = 8
    Top = 428
    Width = 576
    Height = 57
    ScrollBars = ssBoth
    TabOrder = 8
  end
  object Button_copy: TButton
    Left = 471
    Top = 220
    Width = 113
    Height = 39
    Caption = #1089#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1072#1076#1088#1077#1089
    TabOrder = 9
    Visible = False
    OnClick = Button_copyClick
  end
  object Button_about: TButton
    Left = 538
    Top = 8
    Width = 46
    Height = 25
    Caption = 'O'
    TabOrder = 10
    OnClick = Button_aboutClick
  end
  object Button_clear: TButton
    Left = 471
    Top = 83
    Width = 113
    Height = 45
    Caption = #1086#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 11
    OnClick = Button_clearClick
  end
  object Button_further: TButton
    Left = 189
    Top = 363
    Width = 140
    Height = 45
    Caption = #1044#1072#1083#1077#1077
    TabOrder = 12
    Visible = False
    OnClick = Button_furtherClick
  end
  object Timer_1: TTimer
    Enabled = False
    OnTimer = Timer_1Timer
    Left = 359
    Top = 272
  end
  object Timer_2: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = Timer_2Timer
    Left = 439
    Top = 272
  end
  object IdSSLIOHandlerSocketOpenSSL_1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 367
    Top = 200
  end
  object IdHTTP_1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL_1
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 399
    Top = 272
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 519
    Top = 272
  end
  object TrayIcon1: TTrayIcon
    OnClick = TrayIcon1Click
    OnMouseMove = TrayIcon1MouseMove
    Left = 559
    Top = 272
  end
  object ApplicationEvents1: TApplicationEvents
    OnActivate = ApplicationEvents1Activate
    Left = 479
    Top = 272
  end
end

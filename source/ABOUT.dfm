object AboutBox: TAboutBox
  Left = 200
  Top = 108
  AutoSize = True
  BorderStyle = bsDialog
  Caption = 'O '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 274
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyUp = FormKeyUp
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 274
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 0
    OnMouseDown = Panel1MouseDown
    object ProgramIcon: TImage
      Left = 8
      Top = 8
      Width = 65
      Height = 57
      Picture.Data = {
        07544269746D617076020000424D760200000000000076000000280000002000
        0000200000000100040000000000000200000000000000000000100000000000
        000000000000000080000080000000808000800000008000800080800000C0C0
        C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
        FF00000000000000000000000000000000000EE8787878EEEEEEE03F30878EEE
        EEE00EE8787878EEEEEEE03F30878EEEEEE00EE8787878EEEEEEE03F30878EEE
        EEE00EE8787878EEEEEEE03F30878EEEEEE00887787877788888803F3088787E
        EEE00788787878878887803F3088887EEEE00788887888878887803F3088887E
        EEE00877888887788888703F308887EEEEE00888777778888888037883088888
        8EE007777777777777703787883087777EE00888888888888803787FF8830888
        888008888888888880378777778830888880077777777788037873F3F3F87808
        88E00888888888803787FFFFFFFF8830EEE00887777778800001111111111100
        EEE00888888888888899B999B99999EEEEE00888888888888899B9B99BB9B9EE
        EEE0088888888888899BB9BB99BB99EEEEE0078888888888899B999B999999EE
        EEE0087788888778899B9B9BB9BB99EEEEE00888778778888E9B9B9BB9999EEE
        EEE0088888788888EE9B99B9BB9BEEEEEEE00EE8888888EEEEE999B9999EEEEE
        EEE00EEEE888EEEEEEEE99BB999EEEEEEEE00EEEEE8EEEEEEEEEE999B9EEEEEE
        EEE00EEEEE8EEEEEEEEEEEE999EEEEEEEEE00EEEEE8EEEEEEEEEEEEE99EEEEEE
        EEE00EEEEE8EEEEEEEEEEEEE9EEEEEEEEEE00EEEEE8EEEEEEEEEEEEEEEEEEEEE
        EEE00EEEEEEEEEEEEEEEEEEEEEEEEEEEEEE00000000000000000000000000000
        0000}
      Stretch = True
      OnMouseDown = ProgramIconMouseDown
      IsControl = True
    end
    object ProductName: TLabel
      Left = 88
      Top = 8
      Width = 101
      Height = 19
      Caption = 'Litvinova (alpha)'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      OnMouseDown = ProductNameMouseDown
      IsControl = True
    end
    object Version: TLabel
      Left = 88
      Top = 33
      Width = 67
      Height = 19
      Caption = 'version 0.3'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      OnMouseDown = VersionMouseDown
      IsControl = True
    end
    object Copyright: TLabel
      Left = 88
      Top = 58
      Width = 125
      Height = 15
      Caption = 'Copyright '#169' 2013-2014.'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      OnMouseDown = CopyrightMouseDown
      IsControl = True
    end
    object Comments: TLabel
      Left = 22
      Top = 83
      Width = 415
      Height = 95
      Caption = 
        'Litvinova - '#1101#1090#1086' '#1073#1077#1089#1087#1083#1072#1090#1085#1072#1103' '#1080' '#1089#1074#1086#1073#1086#1076#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072','#13#10#1076#1083#1103' '#1086#1090#1089#1083#1077#1078#1080#1074#1072 +
        #1085#1080#1103' '#1089#1086#1089#1090#1086#1103#1085#1080#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081' '#1042#1082#1086#1085#1090#1072#1082#1090#1077'.'#13#10#1054#1085#1072' '#1085#1077' '#1089#1086#1073#1080#1088#1072#1077#1090' '#1085#1080#1082#1072#1082#1080#1093' ' +
        #1083#1080#1095#1085#1099#1093' '#1076#1072#1085#1085#1099#1093#13#10'('#1083#1086#1075#1080#1085#1086#1074', '#1087#1072#1088#1086#1083#1077#1081', '#1086#1090#1095#1105#1090#1086#1074' '#1089#1080#1089#1090#1077#1084#1099' '#1080' '#1090'.'#1087'.).'#13#10#1042#1099' '#1084 +
        #1086#1078#1077#1090#1077' '#1089#1072#1084#1080' '#1091#1073#1077#1076#1080#1090#1100#1089#1103' '#1074' '#1101#1090#1086#1084', '#1087#1086#1089#1084#1086#1090#1088#1077#1074' '#1080#1089#1093#1086#1076#1085#1099#1081' '#1082#1086#1076' :'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      OnMouseDown = CommentsMouseDown
      IsControl = True
    end
    object Label_source: TLabel
      Left = 124
      Top = 200
      Width = 209
      Height = 19
      Caption = 'https://github.com/akimdi/Litvinova'
      Color = clMenu
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
      OnMouseDown = Label_sourceMouseDown
      OnMouseEnter = Label_sourceMouseEnter
      OnMouseLeave = Label_sourceMouseLeave
    end
  end
  object OKButton: TButton
    Left = 191
    Top = 233
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = OKButtonClick
  end
end

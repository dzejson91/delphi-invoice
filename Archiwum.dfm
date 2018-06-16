object Archiw: TArchiw
  Left = 211
  Top = 199
  BorderWidth = 8
  Caption = 'Archiwum'
  ClientHeight = 417
  ClientWidth = 674
  Color = 16448250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = SDataCloseUp
  OnCreate = FormCreate
  DesignSize = (
    674
    417)
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 674
    Height = 74
    Align = alTop
    Caption = ' Wyszukiwarka faktur '
    TabOrder = 0
    object Label1: TLabel
      Left = 108
      Top = 33
      Width = 8
      Height = 16
      Caption = '--'
    end
    object Label2: TLabel
      Left = 433
      Top = 17
      Width = 95
      Height = 16
      AutoSize = False
      Caption = 'NIP kontrahenta'
    end
    object Label3: TLabel
      Left = 332
      Top = 17
      Width = 95
      Height = 16
      AutoSize = False
      Caption = 'Nr faktury'
    end
    object SData: TDateTimePicker
      Left = 8
      Top = 29
      Width = 97
      Height = 24
      Date = 40759.387082245370000000
      Time = 40759.387082245370000000
      TabOrder = 0
      OnCloseUp = SDataCloseUp
    end
    object EData: TDateTimePicker
      Left = 120
      Top = 29
      Width = 97
      Height = 24
      Date = 40759.387082245370000000
      Time = 40759.387082245370000000
      TabOrder = 1
      OnCloseUp = SDataCloseUp
    end
    object SNIP: TMaskEdit
      Left = 433
      Top = 39
      Width = 95
      Height = 24
      TabOrder = 3
      OnChange = SDataCloseUp
    end
    object SNFV: TMaskEdit
      Left = 332
      Top = 39
      Width = 95
      Height = 24
      TabOrder = 2
      OnChange = SDataCloseUp
    end
    object chbDeleted: TCheckBox
      Left = 239
      Top = 18
      Width = 85
      Height = 17
      Caption = 'Usuni'#281'te'
      TabOrder = 4
      OnClick = chbDeletedClick
    end
    object chbDuplicate: TCheckBox
      Left = 239
      Top = 41
      Width = 85
      Height = 17
      Caption = 'Duplikaty'
      TabOrder = 5
      OnClick = chbDeletedClick
    end
  end
  object Lista: TListView
    Left = 0
    Top = 80
    Width = 673
    Height = 299
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Id'
        Width = 55
      end
      item
        Alignment = taCenter
        Caption = 'Data dok.'
        Width = 100
      end
      item
        Caption = 'Nr FV'
        Width = 70
      end
      item
        Alignment = taCenter
        Caption = 'NIP'
        Width = 110
      end
      item
        Caption = 'Nazwa kontrahenta'
        Width = 300
      end>
    ColumnClick = False
    FullDrag = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnChange = ListaChange
    ExplicitHeight = 307
  end
  object btnPrint: TButton
    Tag = 2
    Left = 616
    Top = 385
    Width = 58
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Drukuj'
    TabOrder = 2
    OnClick = btnPreviewClick
    ExplicitTop = 393
  end
  object btnPreview: TButton
    Tag = 1
    Left = 488
    Top = 385
    Width = 122
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Podgl'#261'd wydruku'
    TabOrder = 3
    OnClick = btnPreviewClick
    ExplicitTop = 393
  end
  object btnDelete: TButton
    Tag = 1
    Left = 0
    Top = 385
    Width = 65
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Usu'#324
    TabOrder = 4
    OnClick = btnDeleteClick
    ExplicitTop = 393
  end
end

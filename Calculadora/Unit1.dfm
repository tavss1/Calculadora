object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Calculadora'
  ClientHeight = 409
  ClientWidth = 259
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 53
    Height = 15
    Caption = 'N'#250'mero 1'
  end
  object Label2: TLabel
    Left = 32
    Top = 80
    Width = 53
    Height = 15
    Caption = 'N'#250'mero 2'
  end
  object Label3: TLabel
    Left = 32
    Top = 224
    Width = 52
    Height = 15
    Caption = 'Resultado'
  end
  object txtNum1: TEdit
    Left = 32
    Top = 37
    Width = 177
    Height = 23
    TabOrder = 0
    OnChange = txtNum1Change
  end
  object txtNum2: TEdit
    Left = 32
    Top = 101
    Width = 177
    Height = 23
    TabOrder = 1
    OnChange = txtNum1Change
  end
  object btnSomar: TButton
    Left = 32
    Top = 144
    Width = 33
    Height = 25
    Caption = '+'
    Enabled = False
    TabOrder = 2
    OnClick = btnSomarClick
  end
  object btnSubt: TButton
    Left = 80
    Top = 144
    Width = 33
    Height = 25
    Caption = '-'
    Enabled = False
    TabOrder = 3
    OnClick = btnSubtClick
  end
  object btnMultp: TButton
    Left = 127
    Top = 144
    Width = 33
    Height = 25
    Caption = '*'
    Enabled = False
    TabOrder = 4
    OnClick = btnMultpClick
  end
  object btnDividir: TButton
    Left = 176
    Top = 144
    Width = 33
    Height = 25
    Caption = '/'
    Enabled = False
    TabOrder = 5
    OnClick = btnDividirClick
  end
  object txtNumResultado: TEdit
    Left = 32
    Top = 245
    Width = 177
    Height = 23
    ReadOnly = True
    TabOrder = 6
  end
  object btnLimpar: TButton
    Left = 32
    Top = 185
    Width = 53
    Height = 25
    Caption = 'Limpar'
    TabOrder = 7
    OnClick = btnLimparClick
  end
  object opcVisual: TRadioGroup
    Left = 32
    Top = 288
    Width = 177
    Height = 105
    Caption = 'Alterar o visual da calculadora'
    ItemIndex = 1
    Items.Strings = (
      'Windows Classic'
      'Glow'
      'Aqua Light Slate')
    TabOrder = 8
    OnClick = opcVisualClick
  end
end

object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'SO multithreading bug demo'
  ClientHeight = 211
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btCreateThreads: TButton
    Left = 264
    Top = 88
    Width = 100
    Height = 25
    Caption = 'Create threads'
    TabOrder = 0
    OnClick = btCreateThreadsClick
  end
  object mLog: TMemo
    Left = 0
    Top = 0
    Width = 249
    Height = 211
    Align = alLeft
    TabOrder = 1
  end
  object edThreadsNumber: TSpinEdit
    Left = 264
    Top = 48
    Width = 100
    Height = 22
    MaxValue = 100
    MinValue = 1
    TabOrder = 2
    Value = 50
  end
end

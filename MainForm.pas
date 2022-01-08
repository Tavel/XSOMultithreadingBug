unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TForm2 = class(TForm)
    btCreateThreads: TButton;
    mLog: TMemo;
    edThreadsNumber: TSpinEdit;
    procedure btCreateThreadsClick(Sender: TObject);
  private
  public
  end;

var
  Form2: TForm2;

implementation

uses
    TestThread;

{$R *.dfm}

procedure TForm2.btCreateThreadsClick(Sender: TObject);
var
   i: Word;
   CurrentThread: TTestThread;
begin
     for i := 1 to edThreadsNumber.Value do
     begin
          CurrentThread := TTestThread.Create(True);

          CurrentThread.FreeOnTerminate := True;

          CurrentThread.Name := 'Thread #' + i.ToString;

          CurrentThread.Start;

          mLog.Lines.Add(CurrentThread.Name + ' started successfully');
     end;
end;

end.

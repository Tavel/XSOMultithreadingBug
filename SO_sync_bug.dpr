program SO_sync_bug;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form2},
  TestThread in 'TestThread.pas',
  RandomJSON in 'RandomJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

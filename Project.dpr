program Project;

 
uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UPSD_Storage in 'UPSD_Storage.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

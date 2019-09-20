program antrianloket;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, mplayercontrollaz, Unit1, windows
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;

  CreateMutex(nil, False, 'AntrianLoketQBest');
  if GetLastError = ERROR_ALREADY_EXISTS then begin
    application.MessageBox('sudah ada aplikasi antrian yang berjalan','error');
    Exit;
  end;


  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.


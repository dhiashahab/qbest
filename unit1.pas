unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, DbCtrls, IniPropStorage, MPlayerCtrl, db, BufDataset, mysql57conn,
  sqldb, MMSystem;

type

  { TForm1 }

  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBText1: TDBText;
    DBText4: TDBText;
    IniPropStorage1: TIniPropStorage;
    Label4: TLabel;
    Label5: TLabel;
    PanelRuntext: TPanel;
    panggilloket1: TDBText;
    panggilloket2: TDBText;
    imgLogoRS: TImage;
    lblNamaRS: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblRuntext: TLabel;
    MPlayerControl1: TMPlayerControl;
    MySQL57Connection1: TMySQL57Connection;
    suaraloket1: TDBText;
    Shape1: TShape;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    suaraloket2: TDBText;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IniPropStorage1SavingProperties(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  numLoket: String;
  numAntrian: String;
  namasoundfile: array[0..11] of string;
  tempstr: string;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  namasoundfile[0]:='\';
  namasoundfile[1]:='\satu.wav';
  namasoundfile[2]:='\dua.wav';
  namasoundfile[3]:='\tiga.wav';
  namasoundfile[4]:='\empat.wav';
  namasoundfile[5]:='\lima.wav';
  namasoundfile[6]:='\enam.wav';
  namasoundfile[7]:='\tujuh.wav';
  namasoundfile[8]:='\delapan.wav';
  namasoundfile[9]:='\sembilan.wav';
  namasoundfile[10]:='\sepuluh.wav';
  namasoundfile[11]:='\sebelas.wav';

  mplayercontrol1.MPlayerPath:='mplayer\mplayer.exe';
  MPlayerControl1.Filename:='video.avi';
  mplayercontrol1.StartParam:='-slave -quiet -identify -vf screenshot -vo direct3d -nofontconfig -loop 0';
  MPlayerControl1.Play;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   mysql57connection1.Connected:=true;
   sqlquery1.active:=true;
   sqlquery2.active:=true;
end;


procedure TForm1.IniPropStorage1SavingProperties(Sender: TObject);
begin
  inipropstorage1.Active:=false;
end;


procedure panggil(antrian: Integer; namafoldersuara: string);
begin
  if (antrian<12) then
     begin
        PlaySound(pchar(concat(namafoldersuara,namasoundfile[antrian])),0,SND_SYNC);
     end
  else if (antrian<20) then
     begin
        PlaySound(pchar(concat(namafoldersuara,namasoundfile[antrian-10])),0,SND_SYNC);
        PlaySound(pchar(concat(namafoldersuara,'\belas.wav')),0,SND_SYNC);
     end
  else if (antrian<100) then
     begin
        PlaySound(pchar(concat(namafoldersuara,namasoundfile[antrian div 10])),0,SND_SYNC);
        PlaySound(pchar(concat(namafoldersuara,'\puluh.wav')),0,SND_SYNC);
        if ((antrian mod 10)>0) then
           PlaySound(pchar(concat(namafoldersuara,namasoundfile[antrian mod 10])),0,SND_SYNC);
     end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
  var foldersuara: string;
begin
  sqlquery1.Refresh;
  sqlquery2.Refresh;
   if (panggilloket1.caption='1') then
   begin
    foldersuara:='suara'+suaraloket1.caption;
    dbtext1.Refresh;
    PlaySound(pchar(concat(foldersuara,'\nomor-urut.wav')),0,SND_SYNC);
    panggil(strtoint(DBText1.Caption),foldersuara);
    PlaySound(pchar(concat(foldersuara,'\loket.wav')),0,SND_SYNC);
    PlaySound(pchar(concat(foldersuara,'\satu.wav')),0,SND_SYNC);
    sqlquery3.SQL.Text:='update antriloket set panggil=0 where loket=1';
    sqlquery3.ExecSQL;
    sqltransaction1.Commit;
    sqlquery1.Active:=true;
    sqlquery2.Active:=true;
  end;

   if (panggilloket2.caption='1') then
   begin
    foldersuara:='suara'+suaraloket2.caption;
    dbtext4.Refresh;
    PlaySound(pchar(concat(foldersuara,'\nomor-urut.wav')),0,SND_SYNC);
    panggil(strtoint(DBText4.Caption),foldersuara);
    PlaySound(pchar(concat(foldersuara,'\loket.wav')),0,SND_SYNC);
    PlaySound(pchar(concat(foldersuara,'\dua.wav')),0,SND_SYNC);
    sqlquery3.SQL.Text:='update antriloket set panggil=0 where loket=2';
    sqlquery3.ExecSQL;
    sqltransaction1.Commit;
    sqlquery1.Active:=true;
    sqlquery2.Active:=true;
  end;

end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
    if lblruntext.BoundsRect.Right <= 0 then begin
    lblruntext.Left := panelruntext.Width;
  end else begin
    lblruntext.Left := lblruntext.Left - 1;
  end;

end;

end.


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
    dsloket1: TDataSource;
    dsloket2: TDataSource;
    dsloket3: TDataSource;
    dsloket4: TDataSource;
    dbtloket1: TDBText;
    dbtloket2: TDBText;
    dbtloket3: TDBText;
    dbtloket4: TDBText;
    imgBanner: TImage;
    IniPropStorage1: TIniPropStorage;
    lblloket1: TLabel;
    lblloket2: TLabel;
    lblloket4: TLabel;
    lblloket3: TLabel;
    PanelRuntext: TPanel;
    panggilloket1: TDBText;
    panggilloket2: TDBText;
    imgLogoRS: TImage;
    lblNamaRS: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblRuntext: TLabel;
    panggilloket3: TDBText;
    panggilloket4: TDBText;
    sqlloket3: TSQLQuery;
    sqlloket4: TSQLQuery;
    suaraloket3: TDBText;
    suaraloket4: TDBText;
    videoplayer: TMPlayerControl;
    MySQL57Connection1: TMySQL57Connection;
    suaraloket1: TDBText;
    Shape1: TShape;
    sqlloket1: TSQLQuery;
    sqlloket2: TSQLQuery;
    SQLQuery3: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    suaraloket2: TDBText;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure dbtloket1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IniPropStorage1SavingProperties(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure lblloket1Click(Sender: TObject);
    procedure lblloket4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  numLoket: String;
  numAntrian: String;
  namasoundfile: array[0..900] of string;
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
  namasoundfile[12]:='\duabelas.wav';
  namasoundfile[13]:='\tigabelas.wav';
  namasoundfile[14]:='\empatbelas.wav';
  namasoundfile[15]:='\limabelas.wav';
  namasoundfile[16]:='\enambelas.wav';
  namasoundfile[17]:='\tujuhbelas.wav';
  namasoundfile[18]:='\delapanbelas.wav';
  namasoundfile[19]:='\sembilanbelas.wav';
  namasoundfile[20]:='\duapuluh.wav';
  namasoundfile[30]:='\tigapuluh.wav';
  namasoundfile[40]:='\empatpuluh.wav';
  namasoundfile[50]:='\limapuluh.wav';
  namasoundfile[60]:='\enampuluh.wav';
  namasoundfile[70]:='\tujuhpuluh.wav';
  namasoundfile[80]:='\delapanpuluh.wav';
  namasoundfile[90]:='\sembilanpuluh.wav';
  namasoundfile[100]:='\seratus.wav';
  namasoundfile[200]:='\duaratus.wav';
  namasoundfile[300]:='\tigaratus.wav';
  namasoundfile[400]:='\empatratus.wav';
  namasoundfile[500]:='\limaratus.wav';
  namasoundfile[600]:='\enamratus.wav';
  namasoundfile[700]:='\tujuhratus.wav';
  namasoundfile[800]:='\delapanratus.wav';
  namasoundfile[900]:='\sembilanratus.wav';

  imgLogoRS.Picture.LoadFromFile('logo.jpg');
  imgBanner.Picture.LoadFromFile('banner.png');

  videoplayer.MPlayerPath:='mplayer\mplayer.exe';
  videoplayer.Filename:='video.avi';
  videoplayer.StartParam:='-slave -quiet -identify -vf screenshot -vo direct3d -nofontconfig -loop 0';
  videoplayer.Play;
end;

procedure TForm1.dbtloket1Click(Sender: TObject);
begin

end;


procedure TForm1.FormShow(Sender: TObject);
begin
   mysql57connection1.Connected:=true;
   sqlloket1.active:=true;
   sqlloket2.active:=true;
   sqlloket3.active:=true;
   sqlloket4.active:=true;
end;


procedure TForm1.IniPropStorage1SavingProperties(Sender: TObject);
begin
  inipropstorage1.Active:=false;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;

procedure TForm1.lblloket1Click(Sender: TObject);
begin

end;

procedure TForm1.lblloket4Click(Sender: TObject);
begin

end;


procedure panggil(antrian: Integer; namafoldersuara: string);
begin
  if (antrian<21) then
     begin
        PlaySound(pchar(concat(namafoldersuara,namasoundfile[antrian])),0,SND_SYNC);
     end
  else if (antrian<1000) then
     begin
        if (antrian>99) then
           begin
                PlaySound(pchar(concat(namafoldersuara,namasoundfile[(antrian div 100)*100])),0,SND_SYNC);
                PlaySound(pchar(concat(namafoldersuara,namasoundfile[((antrian mod 100) div 10)*10])),0,SND_SYNC);
                if ((antrian mod 10)>0) then PlaySound(pchar(concat(namafoldersuara,namasoundfile[antrian mod 10])),0,SND_SYNC);
           end
        else
        begin
             PlaySound(pchar(concat(namafoldersuara,namasoundfile[(antrian div 10)*10])),0,SND_SYNC);
             if ((antrian mod 10)>0) then PlaySound(pchar(concat(namafoldersuara,namasoundfile[antrian mod 10])),0,SND_SYNC);
        end;
     end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
  var foldersuara: string;
begin
  sqlloket1.Refresh;
  sqlloket2.Refresh;
  sqlloket3.Refresh;
  sqlloket4.Refresh;
   if (panggilloket1.caption='1') then
   begin
    foldersuara:='suara'+suaraloket1.caption;
    dbtloket1.Refresh;
    PlaySound(pchar(concat(foldersuara,'\nomor-urut.wav')),0,SND_SYNC);
    panggil(strtoint(dbtloket1.Caption),foldersuara);
    PlaySound(pchar(concat(foldersuara,'\loket.wav')),0,SND_SYNC);
    PlaySound(pchar(concat(foldersuara,'\satu.wav')),0,SND_SYNC);
    sqlquery3.SQL.Text:='update antriloket set panggil=0 where loket=1';
    sqlquery3.ExecSQL;
    sqltransaction1.Commit;
    sqlloket1.Active:=true;
    sqlloket2.Active:=true;
    sqlloket3.Active:=true;
    sqlloket4.Active:=true;
  end;

   if (panggilloket2.caption='1') then
   begin
    foldersuara:='suara'+suaraloket2.caption;
    dbtloket2.Refresh;
    PlaySound(pchar(concat(foldersuara,'\nomor-urut.wav')),0,SND_SYNC);
    panggil(strtoint(dbtloket2.Caption),foldersuara);
    PlaySound(pchar(concat(foldersuara,'\loket.wav')),0,SND_SYNC);
    PlaySound(pchar(concat(foldersuara,'\dua.wav')),0,SND_SYNC);
    sqlquery3.SQL.Text:='update antriloket set panggil=0 where loket=2';
    sqlquery3.ExecSQL;
    sqltransaction1.Commit;
    sqlloket1.Active:=true;
    sqlloket2.Active:=true;
    sqlloket3.Active:=true;
    sqlloket4.Active:=true;
  end;

  if (panggilloket3.caption='1') then
   begin
    foldersuara:='suara'+suaraloket3.caption;
    dbtloket3.Refresh;
    PlaySound(pchar(concat(foldersuara,'\nomor-urut.wav')),0,SND_SYNC);
    panggil(strtoint(dbtloket3.Caption),foldersuara);
    PlaySound(pchar(concat(foldersuara,'\loket.wav')),0,SND_SYNC);
    PlaySound(pchar(concat(foldersuara,'\tiga.wav')),0,SND_SYNC);
    sqlquery3.SQL.Text:='update antriloket set panggil=0 where loket=3';
    sqlquery3.ExecSQL;
    sqltransaction1.Commit;
    sqlloket1.Active:=true;
    sqlloket2.Active:=true;
    sqlloket3.Active:=true;
    sqlloket4.Active:=true;

  end;

   if (panggilloket4.caption='1') then
   begin
    foldersuara:='suara'+suaraloket4.caption;
    dbtloket4.Refresh;
    PlaySound(pchar(concat(foldersuara,'\nomor-urut.wav')),0,SND_SYNC);
    panggil(strtoint(dbtloket4.Caption),foldersuara);
    PlaySound(pchar(concat(foldersuara,'\loket.wav')),0,SND_SYNC);
    PlaySound(pchar(concat(foldersuara,'\empat.wav')),0,SND_SYNC);
    sqlquery3.SQL.Text:='update antriloket set panggil=0 where loket=4';
    sqlquery3.ExecSQL;
    sqltransaction1.Commit;
    sqlloket1.Active:=true;
    sqlloket2.Active:=true;
    sqlloket3.Active:=true;
    sqlloket4.Active:=true;
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


unit tombolpanggilan;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, mysql57conn, sqldb, FileUtil, Forms, Controls,
  Graphics, Dialogs, StdCtrls, Buttons, DbCtrls, MaskEdit, IniPropStorage;

type

  { TfrmTombolPanggil }

  TfrmTombolPanggil = class(TForm)
    btnPanggil: TBitBtn;
    btnLanjut: TBitBtn;
    cmbLoket: TComboBox;
    cmbSuara: TComboBox;
    DataSource1: TDataSource;
    dbAntrian: TDBText;
    IniPropStorage1: TIniPropStorage;
    Label1: TLabel;
    edAntrian: TMaskEdit;
    Label2: TLabel;
    MySQL57Connection1: TMySQL57Connection;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure btnLanjutClick(Sender: TObject);
    procedure btnPanggilClick(Sender: TObject);
    procedure cmbLoketChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IniPropStorage1SavingProperties(Sender: TObject);
  private

  public

  end;

var
  frmTombolPanggil: TfrmTombolPanggil;

implementation

{$R *.lfm}

{ TfrmTombolPanggil }



procedure TfrmTombolPanggil.FormShow(Sender: TObject);
begin
   sqlquery1.SQL.Text:='select * from antriloket where loket=' + inipropstorage1.ReadString('cmbLoket_Text','1');
   mysql57connection1.Connected:=true;
   sqlquery1.active:=true;
  edAntrian.Caption:=dbAntrian.Caption;

end;

procedure TfrmTombolPanggil.IniPropStorage1SavingProperties(Sender: TObject);
begin
  inipropstorage1.Active:=false;
end;

procedure TfrmTombolPanggil.cmbLoketChange(Sender: TObject);
begin
  sqlquery1.SQL.Text:='select * from antriloket where loket=' + cmbloket.Text;
  sqlquery1.Refresh;
  edAntrian.Caption:=dbAntrian.Caption;
end;



procedure TfrmTombolPanggil.btnLanjutClick(Sender: TObject);
begin
   if (edAntrian.Text='999') then
   begin
      sqlquery2.SQL.Text:='update antriloket set panggil=1, antrian=1 where loket=' + cmbloket.Text;
   end
   else begin
      sqlquery2.SQL.Text:='update antriloket set panggil=1, antrian=(antrian+1), suara=' + cmbsuara.text + ' where loket=' + cmbloket.Text;
   end;
   sqlquery2.ExecSQL;
   sqltransaction1.Commit;
   sqlquery1.Active:=true;
   edAntrian.Caption:=dbAntrian.Caption;
end;

procedure TfrmTombolPanggil.btnPanggilClick(Sender: TObject);
begin
   sqlquery2.SQL.Text:='update antriloket set panggil=1,antrian=' + edAntrian.Caption + ',suara=' + cmbsuara.Text + ' where loket=' + cmbloket.Text;
   sqlquery2.ExecSQL;
   sqltransaction1.Commit;
   sqlquery1.Active:=true;
   edAntrian.Caption:=dbAntrian.Caption;
end;



end.


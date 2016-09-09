unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI;

type
  TfrmMain = class(TForm)
    imgClose: TImage;
    lblClose: TLabel;
    lblCaption: TLabel;
    lblIP: TLabel;
    edtIpAddr: TEdit;
    lblCIAFile: TLabel;
    imgBrowse: TImage;
    lblBrowse: TLabel;
    edtBrowse: TEdit;
    imgStart: TImage;
    lblStart: TLabel;
    imgAbout: TImage;
    imgHelp: TImage;
    lblHelp: TLabel;
    lblAbout: TLabel;
    imgCloseSmall: TImage;
    imgMin: TImage;
    dlgOpen: TOpenDialog;
    procedure imgCloseClick(Sender: TObject);
    procedure imgCloseSmallClick(Sender: TObject);
    procedure imgMinClick(Sender: TObject);
    procedure imgHelpClick(Sender: TObject);
    procedure imgAboutClick(Sender: TObject);
    procedure edtIpAddrChange(Sender: TObject);
    procedure imgBrowseClick(Sender: TObject);
    procedure imgStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

  ipAddr: string;
  path: string;
  fullParameter: string;
  sfgPath: string;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TfrmMain.imgCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.imgCloseSmallClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.imgMinClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmMain.imgHelpClick(Sender: TObject);
begin
  frmhelp.show;
end;

procedure TfrmMain.imgAboutClick(Sender: TObject);
begin
  frmabout.show;
end;

procedure TfrmMain.edtIpAddrChange(Sender: TObject);
begin
  ipAddr:= edtIpAddr.Text;
end;

procedure TfrmMain.imgBrowseClick(Sender: TObject);
begin
  dlgOpen.Filter:='CIA文件(*.cia)|*.cia';
  dlgOpen.Execute;
  path:=  dlgOpen.FileName;
  edtBrowse.Text := dlgOpen.FileName;
end;

procedure TfrmMain.imgStartClick(Sender: TObject);
begin
  fullParameter:= ' '+ipaddr+' '+'"'+path+'"';
   if MessageBox(0,'开始传输？','确认',MB_OKCANCEL+mb_ICONASTERISK)=id_ok then
     begin
    ShellExecute(Handle,'open','sockfilego.exe',PChar(fullParameter),PChar(sfgPath),SW_SHOWNORMAL);
     end;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  sfgPath:=GetCurrentDir + '\';
end;

end.

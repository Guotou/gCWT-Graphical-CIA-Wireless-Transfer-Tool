unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TfrmAbout = class(TForm)
    imgLogo: TImage;
    lblName: TLabel;
    lblVer: TLabel;
    lblIns: TLabel;
    lblAuthor: TLabel;
    mmoIns: TMemo;
    btnOK: TButton;
    btnUinfo: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnUinfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

procedure TfrmAbout.btnOKClick(Sender: TObject);
begin
 frmAbout.Hide;
end;

procedure TfrmAbout.btnUinfoClick(Sender: TObject);
begin
  MessageBox(0,'版本1.1'+#13+'-更新了用户界面'+#13+'-修复文件名BUG'+#13+'-更新了更快速的FBI程序','Ver 1.1',mb_ok+mb_ICONASTERISK);
end;

end.

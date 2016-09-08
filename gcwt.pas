(*

MIT License

Copyright (c) 2016 Guotou

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


*)







unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, StdCtrls, jpeg, ExtCtrls;

type
  TfrmMain = class(TForm)
    lblTop: TLabel;
    lblIpAddr: TLabel;
    edtIpAddr: TEdit;
    edtCIAFile: TEdit;
    lblCIAFile: TLabel;
    btnBrowse: TButton;
    lblStpMin1: TLabel;
    lblStp3: TLabel;
    btnStart: TButton;
    btnExit: TButton;
    lblVer: TLabel;
    imgLogo: TImage;
    lblExtInfo: TLabel;
    lblStp0: TLabel;
    dlgOpen: TOpenDialog;
    procedure btnBrowseClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure edtIpAddrChange(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

  ipAddr: string;        //ip地址
  filePath: string;          //路径
  ipWithPath: string;       //传输全ip地址+文件
  path:string;

implementation

{$R *.dfm}


//浏览CIA文件
procedure TfrmMain.btnBrowseClick(Sender: TObject);
begin
  dlgOpen.Filter:='CIA文件(*.cia)|*.cia';
  dlgOpen.Execute;
  filePath:=dlgOpen.GetNamePath;
  edtCIAFile.Text:=dlgOpen.FileName;  //将文件完整路径写入文本框
end;


//退出
procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Application.Terminate
end;


//ip地址输入框
procedure TfrmMain.edtIpAddrChange(Sender: TObject);
begin
  ipAddr:= edtIpAddr.Text
end;




//开始传输按钮
procedure TfrmMain.btnStartClick(Sender: TObject);
begin
  ipWithPath:= PChar(ipAddr)+' '+'"'+dlgOpen.FileName+'"';       //完整ip+文件名 //0.2版修复文件名不能带空格问题
    if MessageBox(0,'开始传输？','确认',MB_ICONINFORMATION+MB_OkCancel)=ID_OK then          //确认
      begin


        ShellExecute(Handle,'open','sockfilego.exe',PChar(ipWithPath),PChar(path),SW_SHOWNORMAL);      //使用sockfilego传输


      end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
        path:=GetCurrentDir + '\';
end;

end.



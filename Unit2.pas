unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmHelp = class(TForm)
    mmoHelp: TMemo;
    btnOK: TButton;
    procedure btnOKClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHelp: TfrmHelp;

implementation

{$R *.dfm}


procedure TfrmHelp.btnOKClick(Sender: TObject);
begin
  frmHelp.Hide;
end;

end.

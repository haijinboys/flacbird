unit mProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TProgressForm = class(TForm)
    ProgressLabel: TLabel;
    ProgressBar: TProgressBar;
    StopButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StopButtonClick(Sender: TObject);
  private
    { Private êÈåæ }
    FWindowList: TTaskWindowList;
  protected
    { Protected êÈåæ }
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public êÈåæ }
    Stop: Boolean;
    procedure Progress(const ACaption, AText: string; P: NativeInt = 0; M: Boolean = False);
  end;

var
  ProgressForm: TProgressForm;

implementation

uses
  mConsts, mCommon, mMain;

{$R *.dfm}

{ TProgressForm }

procedure TProgressForm.FormCreate(Sender: TObject);
begin
  Caption := SName;
  Font.Assign(FlacBirdForm.Font);
end;

procedure TProgressForm.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TProgressForm.FormShow(Sender: TObject);
begin
  Stop := False;
  FWindowList := DisableTaskWindows(0);
end;

procedure TProgressForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EnableTaskWindows(FWindowList);
  Stop := True;
end;

procedure TProgressForm.StopButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TProgressForm.Progress(const ACaption, AText: string;
  P: NativeInt = 0; M: Boolean = False);
begin
  Caption := ACaption;
  ProgressLabel.Caption := AText;
  with ProgressBar do
  begin
    Position := P;
    if M then
      Style := pbstMarquee
    else
      Style := pbstNormal;
  end;
  Update;
  Application.ProcessMessages;
end;

procedure TProgressForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := TWinControl(Owner).Handle;
end;

end.

unit mAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage;

type
  TAboutForm = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LinkLabel1: TLinkLabel;
    LinkLabel2: TLinkLabel;
    OKButton: TButton;
    Label4: TLabel;
    Label5: TLabel;
    LinkLabel3: TLinkLabel;
    Label6: TLabel;
    LinkLabel4: TLinkLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure Image2Click(Sender: TObject);
  private
    { Private 宣言 }
  protected
    { Protected 宣言 }
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public 宣言 }
  end;

function About(AOwner: TComponent): Boolean;

var
  AboutForm: TAboutForm;

implementation

uses
  Types, ShellAPI, MediaInfoDLL, mConsts, mCommon, mMain;

{$R *.dfm}


function About(AOwner: TComponent): Boolean;
begin
  with TAboutForm.Create(AOwner) do
    try
      Result := ShowModal = mrOk;
    finally
      Release;
    end;
end;

{ TAboutForm }

procedure TAboutForm.FormCreate(Sender: TObject);
begin
  Font.Assign(FlacBirdForm.Font);
  Image1.Picture.Icon.Handle := GetIcon(128);
  Label1.Caption := SName;
  Label2.Caption := Format('Build: %s', [GetFileVersion]);
end;

procedure TAboutForm.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TAboutForm.FormShow(Sender: TObject);
begin
  //
end;

procedure TAboutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TAboutForm.LinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShellExecute(0, PChar('OPEN'), PChar(Link), '', '', SW_SHOW);
end;

procedure TAboutForm.Image2Click(Sender: TObject);
begin
  ShellExecute(0, PChar('OPEN'), PChar('http://www.gracenote.com/'), '', '', SW_SHOW);
end;

procedure TAboutForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := TWinControl(Owner).Handle;
end;

end.

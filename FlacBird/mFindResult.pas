unit mFindResult;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, mCommon;

type
  TFindResultForm = class(TForm)
    FindResultLabel: TLabel;
    ListBox: TListBox;
    OKButton: TButton;
    CancelButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListBoxClick(Sender: TObject);
    procedure ListBoxDblClick(Sender: TObject);
  private
    { Private éŒ¾ }
  protected
    { Protected éŒ¾ }
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public éŒ¾ }
  end;

function FindResult(AOwner: TComponent; AList: TAlbumList; var AGNID: string): Boolean;

var
  FindResultForm: TFindResultForm;

implementation

uses
  Math, mMain;

{$R *.dfm}


function FindResult(AOwner: TComponent; AList: TAlbumList;
  var AGNID: string): Boolean;
var
  AItem: TAlbumItem;
begin
  Result := False;
  if not Assigned(AList) then
    Exit;
  with TFindResultForm.Create(AOwner) do
    try
      ListBox.Clear;
      for AItem in AList do
        with AItem do
          ListBox.Items.Add(Format('%s - %s', [Artist, Name]));
      ListBoxClick(nil);
      Result := ShowModal = mrOk;
      if Result then
      begin
        with ListBox do
          if InRange(ItemIndex, 0, AList.Count - 1) then
            AGNID := AList[ItemIndex].ID;
      end;
    finally
      Release;
    end;
end;

procedure TFindResultForm.FormCreate(Sender: TObject);
begin
  Font.Assign(FlacBirdForm.Font);
end;

procedure TFindResultForm.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TFindResultForm.FormShow(Sender: TObject);
begin
  //
end;

procedure TFindResultForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TFindResultForm.ListBoxClick(Sender: TObject);
begin
  OKButton.Enabled := ListBox.ItemIndex > -1;
end;

procedure TFindResultForm.ListBoxDblClick(Sender: TObject);
begin
  if ListBox.ItemIndex > -1 then
    OKButton.Click;
end;

procedure TFindResultForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.WndParent := TWinControl(Owner).Handle;
end;

end.

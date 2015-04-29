unit mPreference;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, MeryCtrls, StdCtrls, ExtCtrls, mMain, Menus, ActnList;

resourcestring
  SFormatPopup01 = '%albumartist%'#9'アルバムアーティスト';
  SFormatPopup02 = '%album%'#9'アルバム';

const
  FormatPopup: array [0 .. 1] of string = (
    SFormatPopup01,
    SFormatPopup02
    );

type
  TOption = record
    GeneralGridLines: Boolean;
    GeneralKeepFileTime: Boolean;
    GeneralSortByTrack: Boolean;
    GeneralPregap: NativeInt;
    GeneralFileFilter: string;
    TagRemove: Boolean;
    MPEGWriteID3v1: Boolean;
    MPEGWriteID3v2: Boolean;
    MPEGWriteAPEv2: Boolean;
    MPEGRemoveID3v1: Boolean;
    MPEGRemoveID3v2: Boolean;
    MPEGRemoveAPE: Boolean;
    APEWriteID3v1: Boolean;
    APEWriteAPEv2: Boolean;
    APERemoveID3v1: Boolean;
    APERemoveID3v2: Boolean;
    APERemoveAPE: Boolean;
    WAVWriteWAV: Boolean;
    WAVWriteID3v2: Boolean;
    WAVRemoveWAV: Boolean;
    WAVRemoveID3v2: Boolean;
    CUESaveBackup: Boolean;
    CUEWritePerformer: Boolean;
    ArtworkFormat: TWICImageFormat;
    ArtworkFileName: string;
    ArtworkSaveToFile: Boolean;
    ArtworkSoundsLike: Boolean;
    ArtworkUseLastfm: Boolean;
  end;

  TPreferenceForm = class(TForm)
    PopupMenu: TPopupMenu;
    ActionList: TActionList;
    ArtworkFileNameAction: TAction;
    TreeView: TTreeView;
    PageControl: TPageControl;
    GeneralTabSheet: TTabSheet;
    GeneralLabel: TLabel;
    GeneralBevel: TBevel;
    GeneralGridLinesCheckBox: TCheckBox;
    GeneralKeepFileTimeCheckBox: TCheckBox;
    GeneralSortByTrackCheckBox: TCheckBox;
    GeneralPregapSpinEdit: TSpinEditEx;
    GeneralPregapLabel: TLabel;
    GeneralFileFilterLabel: TLabel;
    GeneralFileFilterEdit: TEdit;
    TagTabSheet: TTabSheet;
    TagLabel: TLabel;
    TagBevel: TBevel;
    TagRemoveCheckBox: TCheckBox;
    MP4TabSheet: TTabSheet;
    MP4Bevel: TBevel;
    MP4Label: TLabel;
    FLACTabSheet: TTabSheet;
    FLACLabel: TLabel;
    FLACBevel: TBevel;
    MPEGTabSheet: TTabSheet;
    MPEGBevel: TBevel;
    MPEGLabel: TLabel;
    MPEGWriteGroupBox: TGroupBox;
    MPEGWriteID3v1CheckBox: TCheckBox;
    MPEGWriteID3v2CheckBox: TCheckBox;
    MPEGWriteAPEv2CheckBox: TCheckBox;
    MPEGRemoveGroupBox: TGroupBox;
    MPEGRemoveID3v1CheckBox: TCheckBox;
    MPEGRemoveID3v2CheckBox: TCheckBox;
    MPEGRemoveAPECheckBox: TCheckBox;
    APETabSheet: TTabSheet;
    APEBevel: TBevel;
    APELabel: TLabel;
    APEWriteGroupBox: TGroupBox;
    APEWriteID3v1CheckBox: TCheckBox;
    APEWriteAPEv2CheckBox: TCheckBox;
    APERemoveGroupBox: TGroupBox;
    APERemoveID3v1CheckBox: TCheckBox;
    APERemoveID3v2CheckBox: TCheckBox;
    APERemoveAPECheckBox: TCheckBox;
    OGGTabSheet: TTabSheet;
    OGGLabel: TLabel;
    OGGBevel: TBevel;
    WAVTabSheet: TTabSheet;
    WAVBevel: TBevel;
    WAVLabel: TLabel;
    WAVWriteGroupBox: TGroupBox;
    WAVWriteWAVCheckBox: TCheckBox;
    WAVWriteID3v2CheckBox: TCheckBox;
    WAVRemoveGroupBox: TGroupBox;
    WAVRemoveWAVCheckBox: TCheckBox;
    WAVRemoveID3v2CheckBox: TCheckBox;
    WMATabSheet: TTabSheet;
    WMALabel: TLabel;
    WMABevel: TBevel;
    CUETabSheet: TTabSheet;
    CUELabel: TLabel;
    CUEBevel: TBevel;
    CUESaveBackupCheckBox: TCheckBox;
    CUEWritePerformerCheckBox: TCheckBox;
    ArtworkTabSheet: TTabSheet;
    ArtworkLabel: TLabel;
    ArtworkBevel: TBevel;
    ArtworkFormatLabel: TLabel;
    ArtworkFormatComboBox: TComboBox;
    ArtworkFileNameLabel: TLabel;
    ArtworkFileNameEdit: TEdit;
    ArtworkFileNameButton: TButton;
    ArtworkSaveToFileCheckBox: TCheckBox;
    ArtworkSoundsLikeCheckBox: TCheckBox;
    ArtworkUseLastfmCheckBox: TCheckBox;
    ResetButton: TButton;
    OKButton: TButton;
    CancelButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ArtworkFileNameActionExecute(Sender: TObject);
    procedure ArtworkFileNameActionUpdate(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure ArtworkSaveToFileCheckBoxClick(Sender: TObject);
    procedure ResetButtonClick(Sender: TObject);
  private
    { Private 宣言 }
    procedure ArtworkFileNameMenuClick(Sender: TObject);
  public
    { Public 宣言 }
  end;

function CreateOption: TOption;
function Preferences(AOwner: TComponent; var AOption: TOption): Boolean;

var
  PreferenceForm: TPreferenceForm;

var
  FOption: TOption;

implementation

uses
  Types, Math, mCommon;

{$R *.dfm}


function CreateOption: TOption;
begin
  with Result do
  begin
    GeneralGridLines := False;
    GeneralKeepFileTime := False;
    GeneralSortByTrack := True;
    GeneralPregap := 150;
    GeneralFileFilter := '*.afc;*.aif;*.aifc;*.aiff;*.alac;*.ape;*.asf;*.bwf;*.dsf;*.fla;*.flac;*.flc;*.m4a;*.m4b;*.mp1;*.mp2;*.mp3;*.mp4;*.mpa;*.mpc;*.mpg;*.ofr;*.oga;*.ogg;*.ogv;*.opus;*.rf64;*.wav;*.wave;*.wma;*.wmv;*.wv;*.cue';
    TagRemove := True;
    MPEGWriteID3v1 := True;
    MPEGWriteID3v2 := True;
    MPEGWriteAPEv2 := False;
    MPEGRemoveID3v1 := True;
    MPEGRemoveID3v2 := True;
    MPEGRemoveAPE := True;
    APEWriteID3v1 := False;
    APEWriteAPEv2 := True;
    APERemoveID3v1 := True;
    APERemoveID3v2 := True;
    APERemoveAPE := True;
    WAVWriteWAV := True;
    WAVWriteID3v2 := True;
    WAVRemoveWAV := True;
    WAVRemoveID3v2 := True;
    CUESaveBackup := True;
    CUEWritePerformer := True;
    ArtworkFormat := wifJpeg;
    ArtworkFileName := 'folder';
    ArtworkSaveToFile := False;
    ArtworkSoundsLike := False;
    ArtworkUseLastfm := True;
  end;
end;

function Preferences(AOwner: TComponent; var AOption: TOption): Boolean;
begin
  with TPreferenceForm.Create(AOwner) do
    try
      with AOption do
      begin
        GeneralGridLinesCheckBox.Checked := GeneralGridLines;
        GeneralKeepFileTimeCheckBox.Checked := GeneralKeepFileTime;
        GeneralSortByTrackCheckBox.Checked := GeneralSortByTrack;
        GeneralPregapSpinEdit.Value := GeneralPregap;
        GeneralFileFilterEdit.Text := GeneralFileFilter;
        TagRemoveCheckBox.Checked := TagRemove;
        MPEGWriteID3v1CheckBox.Checked := MPEGWriteID3v1;
        MPEGWriteID3v2CheckBox.Checked := MPEGWriteID3v2;
        MPEGWriteAPEv2CheckBox.Checked := MPEGWriteAPEv2;
        MPEGRemoveID3v1CheckBox.Checked := MPEGRemoveID3v1;
        MPEGRemoveID3v2CheckBox.Checked := MPEGRemoveID3v2;
        MPEGRemoveAPECheckBox.Checked := MPEGRemoveAPE;
        APEWriteID3v1CheckBox.Checked := APEWriteID3v1;
        APEWriteAPEv2CheckBox.Checked := APEWriteAPEv2;
        APERemoveID3v1CheckBox.Checked := APERemoveID3v1;
        APERemoveID3v2CheckBox.Checked := APERemoveID3v2;
        APERemoveAPECheckBox.Checked := APERemoveAPE;
        WAVWriteWAVCheckBox.Checked := WAVWriteWAV;
        WAVWriteID3v2CheckBox.Checked := WAVWriteID3v2;
        WAVRemoveWAVCheckBox.Checked := WAVRemoveWAV;
        WAVRemoveID3v2CheckBox.Checked := WAVRemoveID3v2;
        CUESaveBackupCheckBox.Checked := CUESaveBackup;
        CUEWritePerformerCheckBox.Checked := CUEWritePerformer;
        ArtworkFormatComboBox.ItemIndex := NativeInt(ArtworkFormat);
        ArtworkFileNameEdit.Text := ArtworkFileName;
        ArtworkSaveToFileCheckBox.Checked := ArtworkSaveToFile;
        ArtworkSoundsLikeCheckBox.Checked := ArtworkSoundsLike;
        ArtworkUseLastfmCheckBox.Checked := ArtworkUseLastfm;
      end;
      ArtworkSaveToFileCheckBoxClick(nil);
      Result := ShowModal = mrOk;
      if Result then
      begin
        with AOption do
        begin
          GeneralGridLines := GeneralGridLinesCheckBox.Checked;
          GeneralKeepFileTime := GeneralKeepFileTimeCheckBox.Checked;
          GeneralSortByTrack := GeneralSortByTrackCheckBox.Checked;
          GeneralPregap := GeneralPregapSpinEdit.Value;
          GeneralFileFilter := GeneralFileFilterEdit.Text;
          TagRemove := TagRemoveCheckBox.Checked;
          MPEGWriteID3v1 := MPEGWriteID3v1CheckBox.Checked;
          MPEGWriteID3v2 := MPEGWriteID3v2CheckBox.Checked;
          MPEGWriteAPEv2 := MPEGWriteAPEv2CheckBox.Checked;
          MPEGRemoveID3v1 := MPEGRemoveID3v1CheckBox.Checked;
          MPEGRemoveID3v2 := MPEGRemoveID3v2CheckBox.Checked;
          MPEGRemoveAPE := MPEGRemoveAPECheckBox.Checked;
          APEWriteID3v1 := APEWriteID3v1CheckBox.Checked;
          APEWriteAPEv2 := APEWriteAPEv2CheckBox.Checked;
          APERemoveID3v1 := APERemoveID3v1CheckBox.Checked;
          APERemoveID3v2 := APERemoveID3v2CheckBox.Checked;
          APERemoveAPE := APERemoveAPECheckBox.Checked;
          WAVWriteWAV := WAVWriteWAVCheckBox.Checked;
          WAVWriteID3v2 := WAVWriteID3v2CheckBox.Checked;
          WAVRemoveWAV := WAVRemoveWAVCheckBox.Checked;
          WAVRemoveID3v2 := WAVRemoveID3v2CheckBox.Checked;
          CUESaveBackup := CUESaveBackupCheckBox.Checked;
          CUEWritePerformer := CUEWritePerformerCheckBox.Checked;
          ArtworkFormat := TWICImageFormat(ArtworkFormatComboBox.ItemIndex);
          ArtworkFileName := ArtworkFileNameEdit.Text;
          ArtworkSaveToFile := ArtworkSaveToFileCheckBox.Checked;
          ArtworkSoundsLike := ArtworkSoundsLikeCheckBox.Checked;
          ArtworkUseLastfm := ArtworkUseLastfmCheckBox.Checked;
        end;
      end;
    finally
      Release;
    end;
end;

procedure TPreferenceForm.FormCreate(Sender: TObject);
var
  I: NativeInt;
  ANode: TTreeNode;
begin
  Font.Assign(FlacBirdForm.Font);
  with TreeView, PageControl do
  begin
    for I := 0 to PageCount - 1 do
      Pages[I].TabVisible := False;
    ActivePage := GeneralTabSheet;
    ANode := Items.Add(nil, GeneralTabSheet.Caption);
    ANode.Data := GeneralTabSheet;
    ANode := Items.Add(nil, TagTabSheet.Caption);
    ANode.Data := TagTabSheet;
    with Items.AddChild(ANode, MPEGTabSheet.Caption) do
      Data := MPEGTabSheet;
    with Items.AddChild(ANode, APETabSheet.Caption) do
      Data := APETabSheet;
    with Items.AddChild(ANode, WAVTabSheet.Caption) do
      Data := WAVTabSheet;
    with Items.AddChild(ANode, CUETabSheet.Caption) do
      Data := CUETabSheet;
    ANode := Items.Add(nil, ArtworkTabSheet.Caption);
    ANode.Data := ArtworkTabSheet;
    FullExpand;
    Items[0].Selected := True;
  end;
end;

procedure TPreferenceForm.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TPreferenceForm.FormShow(Sender: TObject);
begin
  //
end;

procedure TPreferenceForm.ResetButtonClick(Sender: TObject);
begin
  with CreateOption do
  begin
    GeneralGridLinesCheckBox.Checked := GeneralGridLines;
    GeneralKeepFileTimeCheckBox.Checked := GeneralKeepFileTime;
    GeneralSortByTrackCheckBox.Checked := GeneralSortByTrack;
    GeneralPregapSpinEdit.Value := GeneralPregap;
    GeneralFileFilterEdit.Text := GeneralFileFilter;
    TagRemoveCheckBox.Checked := TagRemove;
    MPEGWriteID3v1CheckBox.Checked := MPEGWriteID3v1;
    MPEGWriteID3v2CheckBox.Checked := MPEGWriteID3v2;
    MPEGWriteAPEv2CheckBox.Checked := MPEGWriteAPEv2;
    MPEGRemoveID3v1CheckBox.Checked := MPEGRemoveID3v1;
    MPEGRemoveID3v2CheckBox.Checked := MPEGRemoveID3v2;
    MPEGRemoveAPECheckBox.Checked := MPEGRemoveAPE;
    APEWriteID3v1CheckBox.Checked := APEWriteID3v1;
    APEWriteAPEv2CheckBox.Checked := APEWriteAPEv2;
    APERemoveID3v1CheckBox.Checked := APERemoveID3v1;
    APERemoveID3v2CheckBox.Checked := APERemoveID3v2;
    APERemoveAPECheckBox.Checked := APERemoveAPE;
    WAVWriteWAVCheckBox.Checked := WAVWriteWAV;
    WAVWriteID3v2CheckBox.Checked := WAVWriteID3v2;
    WAVRemoveWAVCheckBox.Checked := WAVRemoveWAV;
    WAVRemoveID3v2CheckBox.Checked := WAVRemoveID3v2;
    CUESaveBackupCheckBox.Checked := CUESaveBackup;
    CUEWritePerformerCheckBox.Checked := CUEWritePerformer;
    ArtworkFormatComboBox.ItemIndex := NativeInt(ArtworkFormat);
    ArtworkFileNameEdit.Text := ArtworkFileName;
    ArtworkSaveToFileCheckBox.Checked := ArtworkSaveToFile;
    ArtworkSoundsLikeCheckBox.Checked := ArtworkSoundsLike;
    ArtworkUseLastfmCheckBox.Checked := ArtworkUseLastfm;
  end;
end;

procedure TPreferenceForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TPreferenceForm.ArtworkFileNameActionExecute(Sender: TObject);
var
  P: TPoint;
  I: NativeInt;
  MI: TMenuItem;
begin
  with ArtworkFileNameButton do
    P := Point(ClientOrigin.X + Width, Pred(ClientOrigin.Y));
  with PopupMenu do
  begin
    Items.Clear;
    for I := 0 to High(FormatPopup) do
    begin
      MI := TMenuItem.Create(Self);
      MI.Caption := FormatPopup[I];
      MI.OnClick := ArtworkFileNameMenuClick;
      Items.Add(MI);
    end;
    Popup(P.X, P.Y);
  end;
end;

procedure TPreferenceForm.ArtworkFileNameActionUpdate(Sender: TObject);
begin
  //
end;

procedure TPreferenceForm.TreeViewChange(Sender: TObject; Node: TTreeNode);
begin
  with TreeView, PageControl do
    if (Selected <> nil) and (Selected.Data <> nil) then
      ActivePage := TTabSheet(Selected.Data);
end;

procedure TPreferenceForm.ArtworkSaveToFileCheckBoxClick(Sender: TObject);
begin
  if ArtworkSaveToFileCheckBox.Checked then
  begin
    with ArtworkFileNameEdit do
    begin
      Enabled := True;
      Color := clWindow;
    end;
    ArtworkFileNameAction.Enabled := True;
  end
  else
  begin
    with ArtworkFileNameEdit do
    begin
      Enabled := False;
      Color := clBtnFace;
    end;
    ArtworkFileNameAction.Enabled := False;
  end;
end;

procedure TPreferenceForm.ArtworkFileNameMenuClick(Sender: TObject);
var
  S: string;
begin
  S := (Sender as TMenuItem).Caption;
  with ArtworkFileNameEdit do
    SelText := Copy(S, 0, Pred(Pos(#9, S)));
end;

end.

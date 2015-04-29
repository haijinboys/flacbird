program FlacBird;

uses
  Windows,
  SysUtils,
  Forms,
  mConsts in 'mConsts.pas',
  mCommon in 'mCommon.pas',
  mWICImageHelper in 'mWICImageHelper.pas',
  mEncodingHelper in 'mEncodingHelper.pas',
  mMain in 'mMain.pas' {FlacBirdForm},
  mPreference in 'mPreference.pas' {PreferenceForm},
  mFindResult in 'mFindResult.pas' {FindResultForm},
  mOrganizeFolder in 'mOrganizeFolder.pas' {OrganizeFolderForm},
  mGetInfo in 'mGetInfo.pas' {GetInfoForm},
  mProgress in 'mProgress.pas' {ProgressForm},
  mAbout in 'mAbout.pas' {AboutForm};

{$R *.res}


var
  Mutex, Handle: THandle;

const
  MutexName = 'flacbird.haijin-boys.com';

begin
  // ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'FlacBird';
  Handle := FindWindow('TFlacBirdForm', nil);
  if Handle <> 0 then
  begin
    if not DebuggerPresent then
      SetForegroundWindow(Handle);
    Exit;
  end;
  Mutex := CreateMutex(nil, False, PChar(MutexName));
  Application.CreateForm(TFlacBirdForm, FlacBirdForm);
  Application.Run;
  if Mutex <> 0 then
    ReleaseMutex(Mutex);
  if Mutex <> 0 then
    CloseHandle(Mutex);

end.

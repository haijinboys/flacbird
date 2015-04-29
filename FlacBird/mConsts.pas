unit mConsts;

interface

const
  SName = 'FlacBird';
  SAddr = 'https://cXXXXXXX.web.cddbp.net/webapi/xml/1.0/';
  SClientID = 'XXXXXXX-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  SApple = 'https://itunes.apple.com/search?term=%s+%s&country=JP&entity=album&limit=1';
  SLastfm = 'http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=%s&artist=%s&album=%s&autocorrect=1';
  SLastfmKey = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

resourcestring
  SCannotBeUndone = '���̏����͌��ɖ߂��܂���B'#13#10'���s���܂���?';
  SAddFolder = '�t�H���_��ǉ�';
  SSave = '��������';
  SSaveError = '�������ݒ��ɃG���[���������܂����B'#13#10'%s';
  SForceGetTrackNames = '���ׂẴg���b�N�����擾���Ă���낵���ł���?';
  SGetTrackNames = '�g���b�N�����擾';
  SForceGetArtwork = '���ׂẴA���o���A�[�g���[�N����肵�Ă���낵���ł���?';
  SGetArtwork = '�A���o���A�[�g���[�N��������';
  SForceClearDownloadedArtwork = '���ׂẴ_�E�����[�h���ꂽ�A�[�g���[�N���������Ă���낵���ł���?';
  SOrganizeFolder = '�t�H���_�𐮗�';
  SOutputFolder = '�t�H���_�̏ꏊ(&L):';
  SProgress = '�������ł�';
  SAppleLink = 'iTunes �������';
  SLastfmLink = 'Last.fm ���J��';
  STagNotFound = '�Ȃ�';
  STagFetch = '���S��v';
  STagBest = '������v';
  SArtworkNotFound = '�Ȃ�';
  SArtworkApple = 'iTunes Music';
  SArtworkLastfm = 'Last.fm';
  SUnknown = 'Unknown';

implementation

end.

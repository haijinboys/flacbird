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
  SCannotBeUndone = 'この処理は元に戻せません。'#13#10'続行しますか?';
  SAddFolder = 'フォルダを追加';
  SSave = '書き込み';
  SSaveError = '書き込み中にエラーが発生しました。'#13#10'%s';
  SForceGetTrackNames = 'すべてのトラック名を取得してもよろしいですか?';
  SGetTrackNames = 'トラック名を取得';
  SForceGetArtwork = 'すべてのアルバムアートワークを入手してもよろしいですか?';
  SGetArtwork = 'アルバムアートワークを処理中';
  SForceClearDownloadedArtwork = 'すべてのダウンロードされたアートワークを消去してもよろしいですか?';
  SOrganizeFolder = 'フォルダを整理';
  SOutputFolder = 'フォルダの場所(&L):';
  SProgress = '処理中です';
  SAppleLink = 'iTunes から入手';
  SLastfmLink = 'Last.fm を開く';
  STagNotFound = 'なし';
  STagFetch = '完全一致';
  STagBest = '複数一致';
  SArtworkNotFound = 'なし';
  SArtworkApple = 'iTunes Music';
  SArtworkLastfm = 'Last.fm';
  SUnknown = 'Unknown';

implementation

end.

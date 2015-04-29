FlacBird
================================

概要
----
FlacBird は音楽ファイルのタグを自動で取得するソフトです。

対応形式
--------
* Advanced Audio Coding (aac)  
* Monkey's Audio (ape)  
* Free Lossless Audio Codec (flac)  
* MPEG-4 (m4a, mp4)  
* MPEG Audio Layer-3 (mp3)  
* Ogg Vorbis (ogg)  
* Windows Media Audio (wma)  
* RIFF waveform Audio Format (wav)  
* Musepack (mpc)  
* WavPack (wv)  
* Cue sheet (cue)  

注意事項
------
* Delphi XE Professional で作成しています
* Gracenote Web API を使用するには API キーを取得する必要があります  
    FlacBird ソースコードの mConsts.pas に含まれる SClient 定数を取得した API キーに変更してください
* ソースコードをコンパイルするには一部、サードパーティ製のライブラリが必要になります
* ソースコードで使用している MeryCtrl ユニットは現在のところ同梱していませんが ToolBarEx と CoolBarEx を通常の ToolBar と CoolBar に変更すればコンパイルできると思います  
    (ToolBarEx と CoolBarEx は Delphi の潜在的な不具合を独自に修正しているものですが、ご要望があれば MeryCtrl ユニットのソースコードも公開いたします)

著作権
------
Gracenote Web API  
https://developer.gracenote.com/web-api  
  
iTunes Store Web Service Search API  
https://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html  
  
Last.fm Web Services  
http://www.lastfm.jp/api/intro  
  
MediaInfoLib  
Copyright (c) MediaArea.net SARL. All rights reserved.  
http://mediaarea.net/ja/MediaInfo  
  
Tags Library, CUE Sheet Library  
Copyright (c) 2013 3delite. All rights reserved.  
http://www.3delite.hu/  
  
GraphicEx  
Copyright (c) 1999, 2002 Mike Lischke.  
http://www.soft-gems.net/  
  
Icons  
Copyright (c) Artcore Illustrations  
http://www.artcoreillustrations.com/  
Copyright (c) 2015 FatCow Web Hosting. All rights reserved.  
http://www.fatcow.com/free-icons  

ライセンス
----------
GNU LESSER GENERAL PUBLIC LICENSE Version 2.1

サードパーティのライブラリ等を使用する場合にはサードパーティのライセンス条件に従ってください。
unit Lastfm;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ 前方宣言 }

  IXMLLfmType = interface;
  IXMLAlbumType = interface;
  IXMLImageType = interface;
  IXMLImageTypeList = interface;
  IXMLTracksType = interface;
  IXMLTrackType = interface;
  IXMLStreamableType = interface;
  IXMLArtistType = interface;
  IXMLToptagsType = interface;
  IXMLTagType = interface;

{ IXMLLfmType }

  IXMLLfmType = interface(IXMLNode)
    ['{E1A046C7-08DE-4E06-A3C6-AAB86A71C735}']
    { プロパティ参照関数 }
    function Get_Status: UnicodeString;
    function Get_Album: IXMLAlbumType;
    procedure Set_Status(Value: UnicodeString);
    { メソッドとプロパティ }
    property Status: UnicodeString read Get_Status write Set_Status;
    property Album: IXMLAlbumType read Get_Album;
  end;

{ IXMLAlbumType }

  IXMLAlbumType = interface(IXMLNode)
    ['{535780BF-FC5A-42A4-9048-A5039FEE7757}']
    { プロパティ参照関数 }
    function Get_Name: UnicodeString;
    function Get_Artist: UnicodeString;
    function Get_Id: Integer;
    function Get_Mbid: UnicodeString;
    function Get_Url: UnicodeString;
    function Get_Releasedate: UnicodeString;
    function Get_Image: IXMLImageTypeList;
    function Get_Listeners: Integer;
    function Get_Playcount: Integer;
    function Get_Tracks: IXMLTracksType;
    function Get_Toptags: IXMLToptagsType;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Artist(Value: UnicodeString);
    procedure Set_Id(Value: Integer);
    procedure Set_Mbid(Value: UnicodeString);
    procedure Set_Url(Value: UnicodeString);
    procedure Set_Releasedate(Value: UnicodeString);
    procedure Set_Listeners(Value: Integer);
    procedure Set_Playcount(Value: Integer);
    { メソッドとプロパティ }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Artist: UnicodeString read Get_Artist write Set_Artist;
    property Id: Integer read Get_Id write Set_Id;
    property Mbid: UnicodeString read Get_Mbid write Set_Mbid;
    property Url: UnicodeString read Get_Url write Set_Url;
    property Releasedate: UnicodeString read Get_Releasedate write Set_Releasedate;
    property Image: IXMLImageTypeList read Get_Image;
    property Listeners: Integer read Get_Listeners write Set_Listeners;
    property Playcount: Integer read Get_Playcount write Set_Playcount;
    property Tracks: IXMLTracksType read Get_Tracks;
    property Toptags: IXMLToptagsType read Get_Toptags;
  end;

{ IXMLImageType }

  IXMLImageType = interface(IXMLNode)
    ['{A2A02163-CFE3-4733-AF3A-EA9348D52AB4}']
    { プロパティ参照関数 }
    function Get_Size: UnicodeString;
    procedure Set_Size(Value: UnicodeString);
    { メソッドとプロパティ }
    property Size: UnicodeString read Get_Size write Set_Size;
  end;

{ IXMLImageTypeList }

  IXMLImageTypeList = interface(IXMLNodeCollection)
    ['{D3BCF804-AC11-451F-83DC-66B06DFEE99E}']
    { メソッドとプロパティ }
    function Add: IXMLImageType;
    function Insert(const Index: Integer): IXMLImageType;

    function Get_Item(Index: Integer): IXMLImageType;
    property Items[Index: Integer]: IXMLImageType read Get_Item; default;
  end;

{ IXMLTracksType }

  IXMLTracksType = interface(IXMLNodeCollection)
    ['{33D9814C-11F6-4712-8B1D-254E69010981}']
    { プロパティ参照関数 }
    function Get_Track(Index: Integer): IXMLTrackType;
    { メソッドとプロパティ }
    function Add: IXMLTrackType;
    function Insert(const Index: Integer): IXMLTrackType;
    property Track[Index: Integer]: IXMLTrackType read Get_Track; default;
  end;

{ IXMLTrackType }

  IXMLTrackType = interface(IXMLNode)
    ['{6720CCC9-427F-44CE-A0FE-253375B48A52}']
    { プロパティ参照関数 }
    function Get_Rank: Integer;
    function Get_Name: UnicodeString;
    function Get_Duration: UnicodeString;
    function Get_Mbid: UnicodeString;
    function Get_Url: UnicodeString;
    function Get_Streamable: IXMLStreamableType;
    function Get_Artist: IXMLArtistType;
    procedure Set_Rank(Value: Integer);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Duration(Value: UnicodeString);
    procedure Set_Mbid(Value: UnicodeString);
    procedure Set_Url(Value: UnicodeString);
    { メソッドとプロパティ }
    property Rank: Integer read Get_Rank write Set_Rank;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Duration: UnicodeString read Get_Duration write Set_Duration;
    property Mbid: UnicodeString read Get_Mbid write Set_Mbid;
    property Url: UnicodeString read Get_Url write Set_Url;
    property Streamable: IXMLStreamableType read Get_Streamable;
    property Artist: IXMLArtistType read Get_Artist;
  end;

{ IXMLStreamableType }

  IXMLStreamableType = interface(IXMLNode)
    ['{29CE7596-5A9B-44F1-8861-6461DFBB154C}']
    { プロパティ参照関数 }
    function Get_Fulltrack: Integer;
    procedure Set_Fulltrack(Value: Integer);
    { メソッドとプロパティ }
    property Fulltrack: Integer read Get_Fulltrack write Set_Fulltrack;
  end;

{ IXMLArtistType }

  IXMLArtistType = interface(IXMLNode)
    ['{6D51BEFC-3B30-4845-B798-CBD92A7C1FB4}']
    { プロパティ参照関数 }
    function Get_Name: UnicodeString;
    function Get_Mbid: UnicodeString;
    function Get_Url: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Mbid(Value: UnicodeString);
    procedure Set_Url(Value: UnicodeString);
    { メソッドとプロパティ }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Mbid: UnicodeString read Get_Mbid write Set_Mbid;
    property Url: UnicodeString read Get_Url write Set_Url;
  end;

{ IXMLToptagsType }

  IXMLToptagsType = interface(IXMLNodeCollection)
    ['{50B0377E-166E-4853-ADB6-D6DB2D47A1CC}']
    { プロパティ参照関数 }
    function Get_Tag(Index: Integer): IXMLTagType;
    { メソッドとプロパティ }
    function Add: IXMLTagType;
    function Insert(const Index: Integer): IXMLTagType;
    property Tag[Index: Integer]: IXMLTagType read Get_Tag; default;
  end;

{ IXMLTagType }

  IXMLTagType = interface(IXMLNode)
    ['{0443EE0E-11FD-4F86-A631-F614A6887738}']
    { プロパティ参照関数 }
    function Get_Name: UnicodeString;
    function Get_Url: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Url(Value: UnicodeString);
    { メソッドとプロパティ }
    property Name: UnicodeString read Get_Name write Set_Name;
    property Url: UnicodeString read Get_Url write Set_Url;
  end;

{ 前方宣言 }

  TXMLLfmType = class;
  TXMLAlbumType = class;
  TXMLImageType = class;
  TXMLImageTypeList = class;
  TXMLTracksType = class;
  TXMLTrackType = class;
  TXMLStreamableType = class;
  TXMLArtistType = class;
  TXMLToptagsType = class;
  TXMLTagType = class;

{ TXMLLfmType }

  TXMLLfmType = class(TXMLNode, IXMLLfmType)
  protected
    { IXMLLfmType }
    function Get_Status: UnicodeString;
    function Get_Album: IXMLAlbumType;
    procedure Set_Status(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAlbumType }

  TXMLAlbumType = class(TXMLNode, IXMLAlbumType)
  private
    FImage: IXMLImageTypeList;
  protected
    { IXMLAlbumType }
    function Get_Name: UnicodeString;
    function Get_Artist: UnicodeString;
    function Get_Id: Integer;
    function Get_Mbid: UnicodeString;
    function Get_Url: UnicodeString;
    function Get_Releasedate: UnicodeString;
    function Get_Image: IXMLImageTypeList;
    function Get_Listeners: Integer;
    function Get_Playcount: Integer;
    function Get_Tracks: IXMLTracksType;
    function Get_Toptags: IXMLToptagsType;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Artist(Value: UnicodeString);
    procedure Set_Id(Value: Integer);
    procedure Set_Mbid(Value: UnicodeString);
    procedure Set_Url(Value: UnicodeString);
    procedure Set_Releasedate(Value: UnicodeString);
    procedure Set_Listeners(Value: Integer);
    procedure Set_Playcount(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLImageType }

  TXMLImageType = class(TXMLNode, IXMLImageType)
  protected
    { IXMLImageType }
    function Get_Size: UnicodeString;
    procedure Set_Size(Value: UnicodeString);
  end;

{ TXMLImageTypeList }

  TXMLImageTypeList = class(TXMLNodeCollection, IXMLImageTypeList)
  protected
    { IXMLImageTypeList }
    function Add: IXMLImageType;
    function Insert(const Index: Integer): IXMLImageType;

    function Get_Item(Index: Integer): IXMLImageType;
  end;

{ TXMLTracksType }

  TXMLTracksType = class(TXMLNodeCollection, IXMLTracksType)
  protected
    { IXMLTracksType }
    function Get_Track(Index: Integer): IXMLTrackType;
    function Add: IXMLTrackType;
    function Insert(const Index: Integer): IXMLTrackType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTrackType }

  TXMLTrackType = class(TXMLNode, IXMLTrackType)
  protected
    { IXMLTrackType }
    function Get_Rank: Integer;
    function Get_Name: UnicodeString;
    function Get_Duration: UnicodeString;
    function Get_Mbid: UnicodeString;
    function Get_Url: UnicodeString;
    function Get_Streamable: IXMLStreamableType;
    function Get_Artist: IXMLArtistType;
    procedure Set_Rank(Value: Integer);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Duration(Value: UnicodeString);
    procedure Set_Mbid(Value: UnicodeString);
    procedure Set_Url(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLStreamableType }

  TXMLStreamableType = class(TXMLNode, IXMLStreamableType)
  protected
    { IXMLStreamableType }
    function Get_Fulltrack: Integer;
    procedure Set_Fulltrack(Value: Integer);
  end;

{ TXMLArtistType }

  TXMLArtistType = class(TXMLNode, IXMLArtistType)
  protected
    { IXMLArtistType }
    function Get_Name: UnicodeString;
    function Get_Mbid: UnicodeString;
    function Get_Url: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Mbid(Value: UnicodeString);
    procedure Set_Url(Value: UnicodeString);
  end;

{ TXMLToptagsType }

  TXMLToptagsType = class(TXMLNodeCollection, IXMLToptagsType)
  protected
    { IXMLToptagsType }
    function Get_Tag(Index: Integer): IXMLTagType;
    function Add: IXMLTagType;
    function Insert(const Index: Integer): IXMLTagType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTagType }

  TXMLTagType = class(TXMLNode, IXMLTagType)
  protected
    { IXMLTagType }
    function Get_Name: UnicodeString;
    function Get_Url: UnicodeString;
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Url(Value: UnicodeString);
  end;

{ グローバル関数 }

function Getlfm(Doc: IXMLDocument): IXMLLfmType;
function Loadlfm(const FileName: string): IXMLLfmType;
function Newlfm: IXMLLfmType;

const
  TargetNamespace = '';

implementation

{ グローバル関数 }

function Getlfm(Doc: IXMLDocument): IXMLLfmType;
begin
  Result := Doc.GetDocBinding('lfm', TXMLLfmType, TargetNamespace) as IXMLLfmType;
end;

function Loadlfm(const FileName: string): IXMLLfmType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('lfm', TXMLLfmType, TargetNamespace) as IXMLLfmType;
end;

function Newlfm: IXMLLfmType;
begin
  Result := NewXMLDocument.GetDocBinding('lfm', TXMLLfmType, TargetNamespace) as IXMLLfmType;
end;

{ TXMLLfmType }

procedure TXMLLfmType.AfterConstruction;
begin
  RegisterChildNode('album', TXMLAlbumType);
  inherited;
end;

function TXMLLfmType.Get_Status: UnicodeString;
begin
  Result := AttributeNodes['status'].Text;
end;

procedure TXMLLfmType.Set_Status(Value: UnicodeString);
begin
  SetAttribute('status', Value);
end;

function TXMLLfmType.Get_Album: IXMLAlbumType;
begin
  Result := ChildNodes['album'] as IXMLAlbumType;
end;

{ TXMLAlbumType }

procedure TXMLAlbumType.AfterConstruction;
begin
  RegisterChildNode('image', TXMLImageType);
  RegisterChildNode('tracks', TXMLTracksType);
  RegisterChildNode('toptags', TXMLToptagsType);
  FImage := CreateCollection(TXMLImageTypeList, IXMLImageType, 'image') as IXMLImageTypeList;
  inherited;
end;

function TXMLAlbumType.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLAlbumType.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLAlbumType.Get_Artist: UnicodeString;
begin
  Result := ChildNodes['artist'].Text;
end;

procedure TXMLAlbumType.Set_Artist(Value: UnicodeString);
begin
  ChildNodes['artist'].NodeValue := Value;
end;

function TXMLAlbumType.Get_Id: Integer;
begin
  Result := ChildNodes['id'].NodeValue;
end;

procedure TXMLAlbumType.Set_Id(Value: Integer);
begin
  ChildNodes['id'].NodeValue := Value;
end;

function TXMLAlbumType.Get_Mbid: UnicodeString;
begin
  Result := ChildNodes['mbid'].Text;
end;

procedure TXMLAlbumType.Set_Mbid(Value: UnicodeString);
begin
  ChildNodes['mbid'].NodeValue := Value;
end;

function TXMLAlbumType.Get_Url: UnicodeString;
begin
  Result := ChildNodes['url'].Text;
end;

procedure TXMLAlbumType.Set_Url(Value: UnicodeString);
begin
  ChildNodes['url'].NodeValue := Value;
end;

function TXMLAlbumType.Get_Releasedate: UnicodeString;
begin
  Result := ChildNodes['releasedate'].Text;
end;

procedure TXMLAlbumType.Set_Releasedate(Value: UnicodeString);
begin
  ChildNodes['releasedate'].NodeValue := Value;
end;

function TXMLAlbumType.Get_Image: IXMLImageTypeList;
begin
  Result := FImage;
end;

function TXMLAlbumType.Get_Listeners: Integer;
begin
  Result := ChildNodes['listeners'].NodeValue;
end;

procedure TXMLAlbumType.Set_Listeners(Value: Integer);
begin
  ChildNodes['listeners'].NodeValue := Value;
end;

function TXMLAlbumType.Get_Playcount: Integer;
begin
  Result := ChildNodes['playcount'].NodeValue;
end;

procedure TXMLAlbumType.Set_Playcount(Value: Integer);
begin
  ChildNodes['playcount'].NodeValue := Value;
end;

function TXMLAlbumType.Get_Tracks: IXMLTracksType;
begin
  Result := ChildNodes['tracks'] as IXMLTracksType;
end;

function TXMLAlbumType.Get_Toptags: IXMLToptagsType;
begin
  Result := ChildNodes['toptags'] as IXMLToptagsType;
end;

{ TXMLImageType }

function TXMLImageType.Get_Size: UnicodeString;
begin
  Result := AttributeNodes['size'].Text;
end;

procedure TXMLImageType.Set_Size(Value: UnicodeString);
begin
  SetAttribute('size', Value);
end;

{ TXMLImageTypeList }

function TXMLImageTypeList.Add: IXMLImageType;
begin
  Result := AddItem(-1) as IXMLImageType;
end;

function TXMLImageTypeList.Insert(const Index: Integer): IXMLImageType;
begin
  Result := AddItem(Index) as IXMLImageType;
end;

function TXMLImageTypeList.Get_Item(Index: Integer): IXMLImageType;
begin
  Result := List[Index] as IXMLImageType;
end;

{ TXMLTracksType }

procedure TXMLTracksType.AfterConstruction;
begin
  RegisterChildNode('track', TXMLTrackType);
  ItemTag := 'track';
  ItemInterface := IXMLTrackType;
  inherited;
end;

function TXMLTracksType.Get_Track(Index: Integer): IXMLTrackType;
begin
  Result := List[Index] as IXMLTrackType;
end;

function TXMLTracksType.Add: IXMLTrackType;
begin
  Result := AddItem(-1) as IXMLTrackType;
end;

function TXMLTracksType.Insert(const Index: Integer): IXMLTrackType;
begin
  Result := AddItem(Index) as IXMLTrackType;
end;

{ TXMLTrackType }

procedure TXMLTrackType.AfterConstruction;
begin
  RegisterChildNode('streamable', TXMLStreamableType);
  RegisterChildNode('artist', TXMLArtistType);
  inherited;
end;

function TXMLTrackType.Get_Rank: Integer;
begin
  Result := AttributeNodes['rank'].NodeValue;
end;

procedure TXMLTrackType.Set_Rank(Value: Integer);
begin
  SetAttribute('rank', Value);
end;

function TXMLTrackType.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLTrackType.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLTrackType.Get_Duration: UnicodeString;
begin
  Result := ChildNodes['duration'].Text;
end;

procedure TXMLTrackType.Set_Duration(Value: UnicodeString);
begin
  ChildNodes['duration'].NodeValue := Value;
end;

function TXMLTrackType.Get_Mbid: UnicodeString;
begin
  Result := ChildNodes['mbid'].Text;
end;

procedure TXMLTrackType.Set_Mbid(Value: UnicodeString);
begin
  ChildNodes['mbid'].NodeValue := Value;
end;

function TXMLTrackType.Get_Url: UnicodeString;
begin
  Result := ChildNodes['url'].Text;
end;

procedure TXMLTrackType.Set_Url(Value: UnicodeString);
begin
  ChildNodes['url'].NodeValue := Value;
end;

function TXMLTrackType.Get_Streamable: IXMLStreamableType;
begin
  Result := ChildNodes['streamable'] as IXMLStreamableType;
end;

function TXMLTrackType.Get_Artist: IXMLArtistType;
begin
  Result := ChildNodes['artist'] as IXMLArtistType;
end;

{ TXMLStreamableType }

function TXMLStreamableType.Get_Fulltrack: Integer;
begin
  Result := AttributeNodes['fulltrack'].NodeValue;
end;

procedure TXMLStreamableType.Set_Fulltrack(Value: Integer);
begin
  SetAttribute('fulltrack', Value);
end;

{ TXMLArtistType }

function TXMLArtistType.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLArtistType.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLArtistType.Get_Mbid: UnicodeString;
begin
  Result := ChildNodes['mbid'].Text;
end;

procedure TXMLArtistType.Set_Mbid(Value: UnicodeString);
begin
  ChildNodes['mbid'].NodeValue := Value;
end;

function TXMLArtistType.Get_Url: UnicodeString;
begin
  Result := ChildNodes['url'].Text;
end;

procedure TXMLArtistType.Set_Url(Value: UnicodeString);
begin
  ChildNodes['url'].NodeValue := Value;
end;

{ TXMLToptagsType }

procedure TXMLToptagsType.AfterConstruction;
begin
  RegisterChildNode('tag', TXMLTagType);
  ItemTag := 'tag';
  ItemInterface := IXMLTagType;
  inherited;
end;

function TXMLToptagsType.Get_Tag(Index: Integer): IXMLTagType;
begin
  Result := List[Index] as IXMLTagType;
end;

function TXMLToptagsType.Add: IXMLTagType;
begin
  Result := AddItem(-1) as IXMLTagType;
end;

function TXMLToptagsType.Insert(const Index: Integer): IXMLTagType;
begin
  Result := AddItem(Index) as IXMLTagType;
end;

{ TXMLTagType }

function TXMLTagType.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLTagType.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLTagType.Get_Url: UnicodeString;
begin
  Result := ChildNodes['url'].Text;
end;

procedure TXMLTagType.Set_Url(Value: UnicodeString);
begin
  ChildNodes['url'].NodeValue := Value;
end;

end.
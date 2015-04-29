unit Gracenote;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ 前方宣言 }

  IXMLRESPONSESType = interface;
  IXMLRESPONSEType = interface;
  IXMLALBUMType = interface;
  IXMLALBUMTypeList = interface;
  IXMLGENREType = interface;
  IXMLGENRETypeList = interface;
  IXMLTRACKType = interface;
  IXMLTRACKTypeList = interface;

{ IXMLRESPONSESType }

  IXMLRESPONSESType = interface(IXMLNode)
    ['{DA926F66-5CCB-406E-9B31-0AFDFF0F434B}']
    { プロパティ参照関数 }
    function Get_RESPONSE: IXMLRESPONSEType;
    { メソッドとプロパティ }
    property RESPONSE: IXMLRESPONSEType read Get_RESPONSE;
  end;

{ IXMLRESPONSEType }

  IXMLRESPONSEType = interface(IXMLNode)
    ['{2C3EE541-1C7D-4C2F-AD25-5F7F5816407B}']
    { プロパティ参照関数 }
    function Get_STATUS: UnicodeString;
    function Get_USER: UnicodeString;
    function Get_ALBUM: IXMLALBUMTypeList;
    procedure Set_STATUS(Value: UnicodeString);
    procedure Set_USER(Value: UnicodeString);
    { メソッドとプロパティ }
    property STATUS: UnicodeString read Get_STATUS write Set_STATUS;
    property USER: UnicodeString read Get_USER write Set_USER;
    property ALBUM: IXMLALBUMTypeList read Get_ALBUM;
  end;

{ IXMLALBUMType }

  IXMLALBUMType = interface(IXMLNode)
    ['{1DC32DEF-DD74-4F85-9BCA-BD6C16D83F47}']
    { プロパティ参照関数 }
    function Get_ORD: Integer;
    function Get_GN_ID: UnicodeString;
    function Get_ARTIST: UnicodeString;
    function Get_TITLE: UnicodeString;
    function Get_PKG_LANG: UnicodeString;
    function Get_DATE: Integer;
    function Get_GENRE: IXMLGENRETypeList;
    function Get_TRACK_COUNT: Integer;
    function Get_TRACK: IXMLTRACKTypeList;
    procedure Set_ORD(Value: Integer);
    procedure Set_GN_ID(Value: UnicodeString);
    procedure Set_ARTIST(Value: UnicodeString);
    procedure Set_TITLE(Value: UnicodeString);
    procedure Set_PKG_LANG(Value: UnicodeString);
    procedure Set_DATE(Value: Integer);
    procedure Set_TRACK_COUNT(Value: Integer);
    { メソッドとプロパティ }
    property ORD: Integer read Get_ORD write Set_ORD;
    property GN_ID: UnicodeString read Get_GN_ID write Set_GN_ID;
    property ARTIST: UnicodeString read Get_ARTIST write Set_ARTIST;
    property TITLE: UnicodeString read Get_TITLE write Set_TITLE;
    property PKG_LANG: UnicodeString read Get_PKG_LANG write Set_PKG_LANG;
    property DATE: Integer read Get_DATE write Set_DATE;
    property GENRE: IXMLGENRETypeList read Get_GENRE;
    property TRACK_COUNT: Integer read Get_TRACK_COUNT write Set_TRACK_COUNT;
    property TRACK: IXMLTRACKTypeList read Get_TRACK;
  end;

{ IXMLALBUMTypeList }

  IXMLALBUMTypeList = interface(IXMLNodeCollection)
    ['{E7888E30-EE16-4770-AA9A-B916585C69BD}']
    { メソッドとプロパティ }
    function Add: IXMLALBUMType;
    function Insert(const Index: Integer): IXMLALBUMType;

    function Get_Item(Index: Integer): IXMLALBUMType;
    property Items[Index: Integer]: IXMLALBUMType read Get_Item; default;
  end;

{ IXMLGENREType }

  IXMLGENREType = interface(IXMLNode)
    ['{DD5B3093-67F0-4B46-B887-2594F5D6D1DD}']
    { プロパティ参照関数 }
    function Get_ORD: Integer;
    function Get_NUM: Integer;
    function Get_ID: Integer;
    procedure Set_ORD(Value: Integer);
    procedure Set_NUM(Value: Integer);
    procedure Set_ID(Value: Integer);
    { メソッドとプロパティ }
    property ORD: Integer read Get_ORD write Set_ORD;
    property NUM: Integer read Get_NUM write Set_NUM;
    property ID: Integer read Get_ID write Set_ID;
  end;

{ IXMLGENRETypeList }

  IXMLGENRETypeList = interface(IXMLNodeCollection)
    ['{67FB7AAB-A1FF-439D-BE7F-C4BB13984188}']
    { メソッドとプロパティ }
    function Add: IXMLGENREType;
    function Insert(const Index: Integer): IXMLGENREType;

    function Get_Item(Index: Integer): IXMLGENREType;
    property Items[Index: Integer]: IXMLGENREType read Get_Item; default;
  end;

{ IXMLTRACKType }

  IXMLTRACKType = interface(IXMLNode)
    ['{16D366B3-EBA7-4CEA-B73D-2659E76305E7}']
    { プロパティ参照関数 }
    function Get_TRACK_NUM: Integer;
    function Get_GN_ID: UnicodeString;
    function Get_ARTIST: UnicodeString;
    function Get_TITLE: UnicodeString;
    function Get_GENRE: IXMLGENRETypeList;
    procedure Set_TRACK_NUM(Value: Integer);
    procedure Set_GN_ID(Value: UnicodeString);
    procedure Set_ARTIST(Value: UnicodeString);
    procedure Set_TITLE(Value: UnicodeString);
    { メソッドとプロパティ }
    property TRACK_NUM: Integer read Get_TRACK_NUM write Set_TRACK_NUM;
    property GN_ID: UnicodeString read Get_GN_ID write Set_GN_ID;
    property ARTIST: UnicodeString read Get_ARTIST write Set_ARTIST;
    property TITLE: UnicodeString read Get_TITLE write Set_TITLE;
    property GENRE: IXMLGENRETypeList read Get_GENRE;
  end;

{ IXMLTRACKTypeList }

  IXMLTRACKTypeList = interface(IXMLNodeCollection)
    ['{3DA68563-AAD5-4AEA-8346-075855D1E0A1}']
    { メソッドとプロパティ }
    function Add: IXMLTRACKType;
    function Insert(const Index: Integer): IXMLTRACKType;

    function Get_Item(Index: Integer): IXMLTRACKType;
    property Items[Index: Integer]: IXMLTRACKType read Get_Item; default;
  end;

{ 前方宣言 }

  TXMLRESPONSESType = class;
  TXMLRESPONSEType = class;
  TXMLALBUMType = class;
  TXMLALBUMTypeList = class;
  TXMLGENREType = class;
  TXMLGENRETypeList = class;
  TXMLTRACKType = class;
  TXMLTRACKTypeList = class;

{ TXMLRESPONSESType }

  TXMLRESPONSESType = class(TXMLNode, IXMLRESPONSESType)
  protected
    { IXMLRESPONSESType }
    function Get_RESPONSE: IXMLRESPONSEType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRESPONSEType }

  TXMLRESPONSEType = class(TXMLNode, IXMLRESPONSEType)
  private
    FALBUM: IXMLALBUMTypeList;
  protected
    { IXMLRESPONSEType }
    function Get_STATUS: UnicodeString;
    function Get_USER: UnicodeString;
    function Get_ALBUM: IXMLALBUMTypeList;
    procedure Set_STATUS(Value: UnicodeString);
    procedure Set_USER(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLALBUMType }

  TXMLALBUMType = class(TXMLNode, IXMLALBUMType)
  private
    FGENRE: IXMLGENRETypeList;
    FTRACK: IXMLTRACKTypeList;
  protected
    { IXMLALBUMType }
    function Get_ORD: Integer;
    function Get_GN_ID: UnicodeString;
    function Get_ARTIST: UnicodeString;
    function Get_TITLE: UnicodeString;
    function Get_PKG_LANG: UnicodeString;
    function Get_DATE: Integer;
    function Get_GENRE: IXMLGENRETypeList;
    function Get_TRACK_COUNT: Integer;
    function Get_TRACK: IXMLTRACKTypeList;
    procedure Set_ORD(Value: Integer);
    procedure Set_GN_ID(Value: UnicodeString);
    procedure Set_ARTIST(Value: UnicodeString);
    procedure Set_TITLE(Value: UnicodeString);
    procedure Set_PKG_LANG(Value: UnicodeString);
    procedure Set_DATE(Value: Integer);
    procedure Set_TRACK_COUNT(Value: Integer);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLALBUMTypeList }

  TXMLALBUMTypeList = class(TXMLNodeCollection, IXMLALBUMTypeList)
  protected
    { IXMLALBUMTypeList }
    function Add: IXMLALBUMType;
    function Insert(const Index: Integer): IXMLALBUMType;

    function Get_Item(Index: Integer): IXMLALBUMType;
  end;

{ TXMLGENREType }

  TXMLGENREType = class(TXMLNode, IXMLGENREType)
  protected
    { IXMLGENREType }
    function Get_ORD: Integer;
    function Get_NUM: Integer;
    function Get_ID: Integer;
    procedure Set_ORD(Value: Integer);
    procedure Set_NUM(Value: Integer);
    procedure Set_ID(Value: Integer);
  end;

{ TXMLGENRETypeList }

  TXMLGENRETypeList = class(TXMLNodeCollection, IXMLGENRETypeList)
  protected
    { IXMLGENRETypeList }
    function Add: IXMLGENREType;
    function Insert(const Index: Integer): IXMLGENREType;

    function Get_Item(Index: Integer): IXMLGENREType;
  end;

{ TXMLTRACKType }

  TXMLTRACKType = class(TXMLNode, IXMLTRACKType)
  private
    FGENRE: IXMLGENRETypeList;
  protected
    { IXMLTRACKType }
    function Get_TRACK_NUM: Integer;
    function Get_GN_ID: UnicodeString;
    function Get_ARTIST: UnicodeString;
    function Get_TITLE: UnicodeString;
    function Get_GENRE: IXMLGENRETypeList;
    procedure Set_TRACK_NUM(Value: Integer);
    procedure Set_GN_ID(Value: UnicodeString);
    procedure Set_ARTIST(Value: UnicodeString);
    procedure Set_TITLE(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTRACKTypeList }

  TXMLTRACKTypeList = class(TXMLNodeCollection, IXMLTRACKTypeList)
  protected
    { IXMLTRACKTypeList }
    function Add: IXMLTRACKType;
    function Insert(const Index: Integer): IXMLTRACKType;

    function Get_Item(Index: Integer): IXMLTRACKType;
  end;

{ グローバル関数 }

function GetRESPONSES(Doc: IXMLDocument): IXMLRESPONSESType;
function LoadRESPONSES(const FileName: string): IXMLRESPONSESType;
function NewRESPONSES: IXMLRESPONSESType;

const
  TargetNamespace = '';

implementation

{ グローバル関数 }

function GetRESPONSES(Doc: IXMLDocument): IXMLRESPONSESType;
begin
  Result := Doc.GetDocBinding('RESPONSES', TXMLRESPONSESType, TargetNamespace) as IXMLRESPONSESType;
end;

function LoadRESPONSES(const FileName: string): IXMLRESPONSESType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('RESPONSES', TXMLRESPONSESType, TargetNamespace) as IXMLRESPONSESType;
end;

function NewRESPONSES: IXMLRESPONSESType;
begin
  Result := NewXMLDocument.GetDocBinding('RESPONSES', TXMLRESPONSESType, TargetNamespace) as IXMLRESPONSESType;
end;

{ TXMLRESPONSESType }

procedure TXMLRESPONSESType.AfterConstruction;
begin
  RegisterChildNode('RESPONSE', TXMLRESPONSEType);
  inherited;
end;

function TXMLRESPONSESType.Get_RESPONSE: IXMLRESPONSEType;
begin
  Result := ChildNodes['RESPONSE'] as IXMLRESPONSEType;
end;

{ TXMLRESPONSEType }

procedure TXMLRESPONSEType.AfterConstruction;
begin
  RegisterChildNode('ALBUM', TXMLALBUMType);
  FALBUM := CreateCollection(TXMLALBUMTypeList, IXMLALBUMType, 'ALBUM') as IXMLALBUMTypeList;
  inherited;
end;

function TXMLRESPONSEType.Get_STATUS: UnicodeString;
begin
  Result := AttributeNodes['STATUS'].Text;
end;

procedure TXMLRESPONSEType.Set_STATUS(Value: UnicodeString);
begin
  SetAttribute('STATUS', Value);
end;

function TXMLRESPONSEType.Get_USER: UnicodeString;
begin
  Result := ChildNodes['USER'].Text;
end;

procedure TXMLRESPONSEType.Set_USER(Value: UnicodeString);
begin
  ChildNodes['USER'].NodeValue := Value;
end;

function TXMLRESPONSEType.Get_ALBUM: IXMLALBUMTypeList;
begin
  Result := FALBUM;
end;

{ TXMLALBUMType }

procedure TXMLALBUMType.AfterConstruction;
begin
  RegisterChildNode('GENRE', TXMLGENREType);
  RegisterChildNode('TRACK', TXMLTRACKType);
  FGENRE := CreateCollection(TXMLGENRETypeList, IXMLGENREType, 'GENRE') as IXMLGENRETypeList;
  FTRACK := CreateCollection(TXMLTRACKTypeList, IXMLTRACKType, 'TRACK') as IXMLTRACKTypeList;
  inherited;
end;

function TXMLALBUMType.Get_ORD: Integer;
begin
  Result := AttributeNodes['ORD'].NodeValue;
end;

procedure TXMLALBUMType.Set_ORD(Value: Integer);
begin
  SetAttribute('ORD', Value);
end;

function TXMLALBUMType.Get_GN_ID: UnicodeString;
begin
  Result := ChildNodes['GN_ID'].Text;
end;

procedure TXMLALBUMType.Set_GN_ID(Value: UnicodeString);
begin
  ChildNodes['GN_ID'].NodeValue := Value;
end;

function TXMLALBUMType.Get_ARTIST: UnicodeString;
begin
  Result := ChildNodes['ARTIST'].Text;
end;

procedure TXMLALBUMType.Set_ARTIST(Value: UnicodeString);
begin
  ChildNodes['ARTIST'].NodeValue := Value;
end;

function TXMLALBUMType.Get_TITLE: UnicodeString;
begin
  Result := ChildNodes['TITLE'].Text;
end;

procedure TXMLALBUMType.Set_TITLE(Value: UnicodeString);
begin
  ChildNodes['TITLE'].NodeValue := Value;
end;

function TXMLALBUMType.Get_PKG_LANG: UnicodeString;
begin
  Result := ChildNodes['PKG_LANG'].Text;
end;

procedure TXMLALBUMType.Set_PKG_LANG(Value: UnicodeString);
begin
  ChildNodes['PKG_LANG'].NodeValue := Value;
end;

function TXMLALBUMType.Get_DATE: Integer;
begin
  Result := ChildNodes['DATE'].NodeValue;
end;

procedure TXMLALBUMType.Set_DATE(Value: Integer);
begin
  ChildNodes['DATE'].NodeValue := Value;
end;

function TXMLALBUMType.Get_GENRE: IXMLGENRETypeList;
begin
  Result := FGENRE;
end;

function TXMLALBUMType.Get_TRACK_COUNT: Integer;
begin
  Result := ChildNodes['TRACK_COUNT'].NodeValue;
end;

procedure TXMLALBUMType.Set_TRACK_COUNT(Value: Integer);
begin
  ChildNodes['TRACK_COUNT'].NodeValue := Value;
end;

function TXMLALBUMType.Get_TRACK: IXMLTRACKTypeList;
begin
  Result := FTRACK;
end;

{ TXMLALBUMTypeList }

function TXMLALBUMTypeList.Add: IXMLALBUMType;
begin
  Result := AddItem(-1) as IXMLALBUMType;
end;

function TXMLALBUMTypeList.Insert(const Index: Integer): IXMLALBUMType;
begin
  Result := AddItem(Index) as IXMLALBUMType;
end;

function TXMLALBUMTypeList.Get_Item(Index: Integer): IXMLALBUMType;
begin
  Result := List[Index] as IXMLALBUMType;
end;

{ TXMLGENREType }

function TXMLGENREType.Get_ORD: Integer;
begin
  Result := AttributeNodes['ORD'].NodeValue;
end;

procedure TXMLGENREType.Set_ORD(Value: Integer);
begin
  SetAttribute('ORD', Value);
end;

function TXMLGENREType.Get_NUM: Integer;
begin
  Result := AttributeNodes['NUM'].NodeValue;
end;

procedure TXMLGENREType.Set_NUM(Value: Integer);
begin
  SetAttribute('NUM', Value);
end;

function TXMLGENREType.Get_ID: Integer;
begin
  Result := AttributeNodes['ID'].NodeValue;
end;

procedure TXMLGENREType.Set_ID(Value: Integer);
begin
  SetAttribute('ID', Value);
end;

{ TXMLGENRETypeList }

function TXMLGENRETypeList.Add: IXMLGENREType;
begin
  Result := AddItem(-1) as IXMLGENREType;
end;

function TXMLGENRETypeList.Insert(const Index: Integer): IXMLGENREType;
begin
  Result := AddItem(Index) as IXMLGENREType;
end;

function TXMLGENRETypeList.Get_Item(Index: Integer): IXMLGENREType;
begin
  Result := List[Index] as IXMLGENREType;
end;

{ TXMLTRACKType }

procedure TXMLTRACKType.AfterConstruction;
begin
  RegisterChildNode('GENRE', TXMLGENREType);
  FGENRE := CreateCollection(TXMLGENRETypeList, IXMLGENREType, 'GENRE') as IXMLGENRETypeList;
  inherited;
end;

function TXMLTRACKType.Get_TRACK_NUM: Integer;
begin
  Result := ChildNodes['TRACK_NUM'].NodeValue;
end;

procedure TXMLTRACKType.Set_TRACK_NUM(Value: Integer);
begin
  ChildNodes['TRACK_NUM'].NodeValue := Value;
end;

function TXMLTRACKType.Get_GN_ID: UnicodeString;
begin
  Result := ChildNodes['GN_ID'].Text;
end;

procedure TXMLTRACKType.Set_GN_ID(Value: UnicodeString);
begin
  ChildNodes['GN_ID'].NodeValue := Value;
end;

function TXMLTRACKType.Get_ARTIST: UnicodeString;
begin
  Result := ChildNodes['ARTIST'].Text;
end;

procedure TXMLTRACKType.Set_ARTIST(Value: UnicodeString);
begin
  ChildNodes['ARTIST'].NodeValue := Value;
end;

function TXMLTRACKType.Get_TITLE: UnicodeString;
begin
  Result := ChildNodes['TITLE'].Text;
end;

procedure TXMLTRACKType.Set_TITLE(Value: UnicodeString);
begin
  ChildNodes['TITLE'].NodeValue := Value;
end;

function TXMLTRACKType.Get_GENRE: IXMLGENRETypeList;
begin
  Result := FGENRE;
end;

{ TXMLTRACKTypeList }

function TXMLTRACKTypeList.Add: IXMLTRACKType;
begin
  Result := AddItem(-1) as IXMLTRACKType;
end;

function TXMLTRACKTypeList.Insert(const Index: Integer): IXMLTRACKType;
begin
  Result := AddItem(Index) as IXMLTRACKType;
end;

function TXMLTRACKTypeList.Get_Item(Index: Integer): IXMLTRACKType;
begin
  Result := List[Index] as IXMLTRACKType;
end;

end.
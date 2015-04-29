unit mWICImageHelper;

interface

uses
  Windows, SysUtils, Classes, Graphics, ActiveX, Wincodec;

type
  TWICImageHelper = class helper for TWICImage
  public
    { Public êÈåæ }
    procedure SaveToFile(const Filename: string);
    procedure SaveToStream(Stream: TStream);
  end;

implementation

procedure TWICImageHelper.SaveToFile(const Filename: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(Filename, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TWICImageHelper.SaveToStream(Stream: TStream);
var
  Data: TMemoryStream;
  Encoder: IWICBitmapEncoder;
  Frame: IWICBitmapFrameEncode;
  Props: IPropertyBag2;
  LStreamAdapter: IStream;
  PixelFormat: TGUID;
  LStream: IWICStream;
  Palette: IWICPalette;
begin
  Data := TMemoryStream.Create;
  try
    LStreamAdapter := TStreamAdapter.Create(Data);

    ImagingFactory.CreateStream(LStream);
    LStream.InitializeFromIStream(LStreamAdapter);
    ImagingFactory.CreateEncoder(EncoderContainerFormat, guid_null, Encoder);

    Encoder.Initialize(LStream, WICBitmapEncoderNoCache);
    Encoder.CreateNewFrame(Frame, Props);

    Frame.Initialize(Props);
    Handle.GetPixelFormat(PixelFormat);
    Frame.SetPixelFormat(PixelFormat);

    Frame.SetSize(Width, Height);

    ImagingFactory.CreatePalette(Palette);
    Handle.CopyPalette(Palette);
    Frame.SetPalette(Palette);
    Frame.WriteSource(Handle, nil);
    Frame.Commit;
    Encoder.Commit;

    Data.Position := 0;
    Stream.CopyFrom(Data, Data.Size);
  finally
    Data.Free;
  end;
end;

end.

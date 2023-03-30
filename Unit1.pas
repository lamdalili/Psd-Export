unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StdCtrls, ExtCtrls, UPSD_Storage;

type
  TForm1 = class(TForm)
    GR: TImage;
    Image1: TImage;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
 Psd:TPsdBuilder;
 BmpLayer :TPsdBitmapLayer;
 Filename:string;
begin
  Psd:=TPsdBuilder.Create;
  Psd.PsdCompression := psComRLE;
  Psd.PsdLayerCompression := psComZip;

  // add first image
  BmpLayer := Psd.NewLayer();
  BmpLayer.Name := 'Layer 1';
  BmpLayer.Bitmap := GR.Picture.Bitmap;
  // add second image
  BmpLayer := Psd.NewLayer();
  BmpLayer.Left := 200;
  BmpLayer.Name := 'Layer 2';
  BmpLayer.Bitmap := Image1.Picture.Bitmap;

  //exportation
  Psd.SetSize(500,200);
  Psd.Build;
  if PromptForFilename(Filename,'PS files (*.psd)|*.psd','psd','','',True) then
    Psd.Stream.SaveToFile(Filename);

end;


end.

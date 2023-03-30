# Psd-Export
This code helper exports images to Photoshop "Psd" file format as single image or multiple layers It supports only one color mode RGBA , no other features are supported; channel color  data is provided by the `TPsdLayer` class via `GetChannelScanLine` method, it''s possible to create derived class and override this method to process another type of image.

## Background image
When exporting mutiple layers it's not impotant to use background image which should represente the entire layers since it will be generated automoticly by Photoshop once edited.

```pascal
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
  BmpLayer.Bitmap := GR.Picture.Bitmap; // bitmap 32bit with alpha chennel
  // add second image
  BmpLayer := Psd.NewLayer();
  BmpLayer.Left := 200;
  BmpLayer.Name := 'Layer 2';
  BmpLayer.Bitmap := Image1.Picture.Bitmap; // bitmap 32bit with alpha chennel

  //exportation
  Psd.SetSize(500,200);
  Psd.Build;
  if PromptForFilename(Filename,'PS files (*.psd)|*.psd','psd','','',True) then
    Psd.Stream.SaveToFile(Filename);
```

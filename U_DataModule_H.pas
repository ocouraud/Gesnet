unit U_DataModule_H;

interface

uses
  System.SysUtils, System.Classes;

type
  TDataModule1 = class(TDataModule)
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses U_DataModule;

{$R *.dfm}

end.

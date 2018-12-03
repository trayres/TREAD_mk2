unit state;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  { TState }

  TState = class(TObject)
  private
    fName: string;
    fX: cardinal;
    fY: cardinal;
    procedure SetName(AValue: string);
  public
    constructor Create;
    constructor CreateAt(X, Y: cardinal);
    destructor Destroy; override;
    property Name: string read fName write SetName;
    property X: cardinal read fX write fX;
    property Y: cardinal read fY write fY;
  end;

implementation

{ TState }

procedure TState.SetName(AValue: string);
begin
  if fName = AValue then
    Exit;
  fName := AValue;
end;

constructor TState.Create;
begin
  inherited Create;
  X := 0;
  Y := 0;
end;

constructor TState.CreateAt(X, Y: cardinal);
begin
  X := X;
  Y := Y;
end;

destructor TState.Destroy;
begin
  FreeAndNil(fName);
end;

end.


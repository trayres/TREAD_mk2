unit transition;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  state,
  BGRABitmap, BGRABitmapTypes, BGRACanvas2D, BCTypes;

type

  { TTransition }
  {The transition object - really some kind of aggregate of a graphical and nongraphical item...}
  TTransition = class(TObject)
  private
    fSrc: TState;
    fDst: TState;
    fPriority: cardinal;
    fCondition: string;  {The transition condition: "if en = '1' and ..."}
    fCtlPts: array [0..2] of TPoint;
    fPlacedIdx: cardinal;
    fSelected: boolean; {Is the whole transition object selected?}
    procedure SetCondition(AValue: string);
    procedure SetDest(AValue: TState);
    procedure SetPriority(AValue: cardinal);
    procedure SetSource(AValue: TState);
  public
    constructor Create;
    procedure Draw(ABGRABitmap: TBGRABitmap);
    function HitTest(X, Y: integer): integer; //See if we clicked on a control point; returns index if true, -1 if false
    function isPlacing: boolean;
    procedure PlacePoint(APoint: TPoint);
    {place a control point into fCtlPts, increments fPlacedIdx }
    property Source: TState read fSrc write SetSource;
    property Dest: TState read fDst write SetDest;
    property Priority: cardinal read fPriority write SetPriority;
    property Condition: string read fCondition write SetCondition;
    property Selected: boolean read fSelected write fSelected;
    property Placing: boolean read isPlacing;
  end;

{The basic transition object, with added items for graphical representation}

implementation


{ TTransition }

procedure TTransition.SetDest(AValue: TState);
begin
  if fDst = AValue then
    Exit;
  fDst := AValue;
end;

procedure TTransition.SetCondition(AValue: string);
begin
  if fCondition = AValue then
    Exit;
  fCondition := AValue;
end;

procedure TTransition.SetPriority(AValue: cardinal);
begin
  if fPriority = AValue then
    Exit;
  fPriority := AValue;
end;

procedure TTransition.SetSource(AValue: TState);
begin
  if fSrc = AValue then
    Exit;
  fSrc := AValue;
end;

constructor TTransition.Create;
var
  i: cardinal;
begin
  inherited Create;
  fPlacedIdx := 0;
end;

procedure TTransition.Draw(ABGRABitmap: TBGRABitmap);
begin

end;

function TTransition.HitTest(X, Y: integer): integer;
begin

end;

function TTransition.isPlacing: boolean;
begin
  if fPlacedIdx < 3 then
    Result := True
  else
    Result := False;
end;

procedure TTransition.PlacePoint(APoint: TPoint);
begin
  fCtlPts[fPlacedIdx] := APoint;
  fPlacedIdx := fPlacedIdx + 1;
end;


end.

unit observer;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  // forward declarations
  TObserver = class;


  TSubject = class(TObject)
  private
    FObserverList: TList;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    { Attach a new observer }
    procedure AttachObserver(AObserver: TObserver); virtual;
    { Detach a existing observer }
    procedure DetachObserver(AObserver: TObserver); virtual;
    { Notify all the attached observers about a change }
    procedure NotifyObservers; virtual;
  end;


  TObserver = class(TObject)
  protected
    FSubject: TSubject;
  public
    destructor Destroy; override;
    procedure Update(ASubject: TSubject); virtual; abstract;
    property Subject: TSubject read FSubject;
  end;

implementation

{ TSubject }

constructor TSubject.Create;
begin
  inherited Create;
  FObserverList := TList.Create;
end;

destructor TSubject.Destroy;
var
  obj: TObserver;
begin
  while FObserverList.Count > 0 do
  begin
    obj := TObserver(FObserverList.Last);
    FObserverList.Delete(FObserverList.Count-1);
    obj.Free;
  end;
  FObserverList.Free;
  inherited Destroy;
end;

procedure TSubject.AttachObserver(AObserver: TObserver);
begin
  { Only attach observer if it wasn't do so before. }
  if FObserverList.IndexOf(AObserver) = -1 then
    FObserverList.Add(AObserver);
end;

procedure TSubject.DetachObserver(AObserver: TObserver);
begin
  if not Assigned(FObserverList) then
    Exit; //==>
  FObserverList.Remove(AObserver);
end;

procedure TSubject.NotifyObservers;
var
  i: Integer;
  lObserver: TObserver;
begin
  if not Assigned(FObserverList) then
    Exit; //==>

  for i := 0 to FObserverList.Count-1 do
  begin
    lObserver := TObserver(FObserverList.Items[i]);
    if Assigned(lObserver) then
      lObserver.Update(self);
  end;
end;


{ TObserver }

destructor TObserver.Destroy;
begin
  if Assigned(FSubject) then
    FSubject.DetachObserver(self);
  inherited Destroy;
end;

end.


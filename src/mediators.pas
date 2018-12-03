unit mediators;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  observer;

type
  TBaseMediator = class(TObserver)
  protected
    { Subscribe to the Subject }
    procedure DoAttachment(ASubject: TSubject);
    { placeholder method where we update the
      Subject due to GUI changes }
    procedure DoGuiToObject; virtual;
    { placedolder method where we update the GUI
      due to Subject changes }
    procedure DoObjectToGui; virtual;
  public
    procedure Update(ASubject: TSubject); override;
  end;

implementation

{ TBaseMediator }

procedure TBaseMediator.DoAttachment(ASubject: TSubject);
begin
  if ASubject = nil then
    raise Exception.Create('You must specify a Subject' + ' to be observed.');
  { set internal subject reference for later use }
  FSubject := ASubject;
  { Register as an observer of Subject }
  FSubject.AttachObserver(self);
end;

procedure TBaseMediator.DoGuiToObject;
begin
  // Do nothing yet.
end;

procedure TBaseMediator.DoObjectToGui;
begin
  // Do nothing yet.
end;

procedure TBaseMediator.Update(ASubject: TSubject);
begin
  DoObjectToGui;
end;

end.



unit frmMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  BGRAVirtualScreen, BGRABitmap, BCTypes,
  transition;

type

  { TForm1 }

  TForm1 = class(TForm)
    BGRAVirtualScreen1: TBGRAVirtualScreen;
    MainMenu1: TMainMenu;
    mnuDebug_1: TMenuItem;
    mnuDebug: TMenuItem;
    mnuFile: TMenuItem;
    MenuItem2: TMenuItem;
    ScrollBox1: TScrollBox;
    procedure BGRAVirtualScreen1Click(Sender: TObject);
    procedure BGRAVirtualScreen1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure BGRAVirtualScreen1Redraw(Sender: TObject; Bitmap: TBGRABitmap);
    procedure FormCreate(Sender: TObject);
    procedure mnuDebug_1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  ATransition: TTransition;
  idx : Integer;
  xLoc, yLoc : Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.mnuDebug_1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    ATransition := TTransition.Create;
    idx := 0;
end;

procedure TForm1.BGRAVirtualScreen1Click(Sender: TObject);
begin

end;

procedure TForm1.BGRAVirtualScreen1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  xLoc := X;
  yLoc := Y;
end;

procedure TForm1.BGRAVirtualScreen1Redraw(Sender: TObject; Bitmap: TBGRABitmap);
begin
  {ATransition.Draw(Bitmap);}
end;

end.

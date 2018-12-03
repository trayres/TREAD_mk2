unit test_state;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fpcunit, testutils, testregistry,
  state;

type

  { TStateTester }

  TStateTester= class(TTestCase)
  protected
    AState : TState;
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestHookUp;
    procedure TestSetName;
  end;

implementation

procedure TStateTester.TestHookUp;
begin
  Fail('Write your own test');
end;

procedure TStateTester.TestSetName;
begin
  AState.Name := 'Test State Name';
  AssertEquals('Test State Name', AState.Name);
end;

procedure TStateTester.SetUp;
begin
   AState := TState.Create;
end;

procedure TStateTester.TearDown;
begin
   FreeAndNil(AState);
end;

initialization

  RegisterTest(TStateTester);
end.


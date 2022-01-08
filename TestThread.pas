unit TestThread;

interface

uses
  System.Classes;

type
    {"name":"yid","error":"FIELD_EMPTY"}
    TFieldError = record
      name: String;
      error: String;
    end;

    // {"errors":[{"name":"yid","error":"FIELD_EMPTY"},{"name":"password","error":"FIELD_EMPTY"},
    // {"name":"birthDate","error":"INVALID_BIRTHDATE"},{"name":"phone","error":"FIELD_EMPTY"}]}
    TValidatorErrorsResponse = record
      errors: TArray<TFieldError>;
    end;

    TTestThread = class(TThread)
    private
      function JSONParsePayLoad: String;
    protected
      procedure Execute; override;
    public
      Name: String;
      Res: String;
    end;

implementation

uses
    System.SysUtils,
    System.IOUtils,
    RandomJSON,
    XSuperObject;

{ TTestThread }

procedure TTestThread.Execute;
var
   i: Cardinal;
begin
     for i := 0 to 1000 do
     begin
          Res := JSONParsePayLoad;

          Sleep(Random(50));
     end;
end;

function TTestThread.JSONParsePayLoad: String;
var
   ValidatorErrorsResponse: TValidatorErrorsResponse;
   JSON: String;
begin
     JSON := GetRandomJSON;

     try
        ValidatorErrorsResponse := TJSON.Parse<TValidatorErrorsResponse>(JSON);
     except
           on e: Exception do
           begin
                TFile.AppendAllText(
                                    TPath.GetDirectoryName(ParamStr(0)) + '\' + Name + '_Exception.log',
                                    String.Join(
                                                ':',
                                                [
                                                 e.ClassName,
                                                 e.StackTrace,
                                                 JSON,
                                                 #13#10
                                                 ]
                                                )
                                    );

                Exit;
           end;
     end;

     if Length(ValidatorErrorsResponse.errors) = 0 then Exit;

     Res := ValidatorErrorsResponse.errors[0].name;
end;

end.

unit RandomJSON;

interface

type
    TUtils = class
    public
        class function GetRandomValueFromArray<T>(Arr: TArray<T>): T;
    end;

function GetRandomJSON: String;

const
     RandomJSONArr: TArray<String> = [
                                      '{"errors":[{"name":"yid","error":"FIELD_EMPTY"},' +
                                      '{"name":"password","error":"FIELD_EMPTY"},' +
                                      '{"name":"birthDate","error":"INVALID_BIRTHDATE"},' +
                                      '{"name":"phone","error":"FIELD_EMPTY"}]}',
                                      '{"errors":[{"name":"birthDate","error":"INVALID_BIRTHDATE"},' +
                                      '{"name":"phone","error":"FIELD_EMPTY"}]}' +
                                      '{"errors":[{"name":"password","error":"WEAK_PASSWORD"},' +
                                      '{"name":"birthDate","error":"INVALID_BIRTHDATE"}]}',
                                      '{"errors":[{"name":"password","error":"FIELD_EMPTY"},' +
                                      '{"name":"phone","error":"FIELD_EMPTY"},'+
                                      '{"name":"birthDate","error":"INVALID_BIRTHDATE"}]}'
                                      ];

implementation

function GetRandomJSON: String;
begin
     Result := TUtils.GetRandomValueFromArray<String>(RandomJSONArr);
end;

{ TRandomArr }

class function TUtils.GetRandomValueFromArray<T>(Arr: TArray<T>): T;
begin
     Result := Arr[Random(Length(Arr))];
end;

initialization
    Randomize;
end.

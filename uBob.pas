unit uBob;

interface

  type
    TBob = class
      class function Response(AQuestion : string) : string;
    end;

implementation

  uses
    SysUtils;

  class function TBob.Response(AQuestion : string) : string;
    var
      i : integer;
      LowerFound, UpperFound : boolean;
    begin
      AQuestion := Trim(AQuestion);
      if Length(AQuestion) = 0 then
        begin
          Result := 'Fine. Be that way!';
          exit;
        end;
      LowerFound := FALSE;
      UpperFound := FALSE;
      for i := Low(AQuestion) to High(AQuestion) do
        begin
          if (AQuestion[i] >= 'a') AND (AQuestion[i] <= 'z') then
            begin
              LowerFound := TRUE;
              break;
            end;
          if (AQuestion[i] >= 'A') AND (AQuestion[i] <= 'Z') then
              UpperFound := TRUE;
        end;
      if AQuestion[High(AQuestion)] = '?' then
        begin
          if LowerFound OR not UpperFound then
            Result := 'Sure.'
          else
            Result := 'Calm down, I know what I''m doing!';
        end
      else
        begin
          if LowerFound OR not UpperFound then
            Result := 'Whatever.'
          else
            Result := 'Whoa, chill out!';
        end;
    end;

end.

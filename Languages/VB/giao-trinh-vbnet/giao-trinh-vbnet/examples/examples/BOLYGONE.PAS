PROGRAM Bolygone;

USES Crt,Dohoa;

VAR  Ordre, Pas   : Integer;
     ADeg,ARad    : Real;
     F1,F2,F3,F4  : Real;
     C1,C2,C3,C4  : Integer;

PROCEDURE NhapSoLieu;
BEGIN
     ClrScr;
     Write ('Cho so nguyen chi bac (2,3,5 ...): go 0 de ket thuc');
     Readln (Ordre);
     Writeln;
     IF Ordre <> 0 THEN
        BEGIN
             Write ('Cho gia so goc (3,5,7,11 ... ): ');
             ReadLn (Pas);{
             Write ('Cho toa do cua so (F1,F2,F3,F4): ');
             ReadLn (F1,F2,F3,F4);
             Write ('Cho toa do tam nhin (C1,C2,C3,C4): ');
             ReadLn (C1,C2,C3,C4);}
             F1:=-1;F2:=1; F3:=-1;F4:=1;
             C1:=100;C2:=540;C3:=20;C4:=460;

        END

END;

PROCEDURE VeBolygone (Ordre,Pas : Integer);
BEGIN
     ADeg := 0;
     REPEAT
           ARad := Pi*ADeg/180;
           Diem (Cos(ARad),Sin(ARad));
           VeDen (Cos(Ordre*ARad),Sin(Ordre*ARad));
           ADeg := ADeg+Pas;
     UNTIL ADeg > 360;  { doi thanh 3600 voi gia so goc =13 se rat dep }
END;

BEGIN
     NhapSoLieu;
     WHILE Ordre <> 0 DO
           BEGIN
                MhDohoa;
                CuaSo (F1,F2,F3,F4);
                TamNhin (C1,C2,C3,C4);
                VeVien;
                VeBolygone (Ordre,Pas);
                Cho;
                MhVanBan;
                NhapSoLieu
           END
END.



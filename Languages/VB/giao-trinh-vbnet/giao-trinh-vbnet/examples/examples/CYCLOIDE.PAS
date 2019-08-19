PROGRAM Cycloide;

USES    Crt,Graph,DoHoa;

VAR     aux1,aux2,aux3  : Real;
        R1,R2,L         : Real;
        rmax            : Real;
        Chuky           : Real;
        Sinh            : Char;

FUNCTION Fx (T : Real) : Real;
BEGIN
     FX := aux1*Cos(t) - aux3*Cos(aux2*t)
END;

FUNCTION Fy (T : Real) : Real;
BEGIN
     FY := aux1*Sin(t) - aux3*Sin(aux2*t)
END;

PROCEDURE Timtudongchuky;
VAR       Xdau,Ydau      : Real;
          Xhien,Yhien    : Real;
          deltaX,deltaY  : Real;
BEGIN
     chuky := 0;
     Xdau := Fx(0);
     Ydau := Fy(0);
     REPEAT
           chuky := chuky + 2*Pi;
           Xhien := Fx(chuky);
           Yhien := Fy(chuky);
           deltaX := Abs(Xhien-Xdau);
           deltaY := Abs(Yhien-Ydau);
     UNTIL ((deltaX<1E-6) and (deltaY<1E-6)) or (chuky>200*Pi)
END;

PROCEDURE Nhapdulieu;
BEGIN
     Clrscr;
     Writeln ('CAC DUONG CYCLOIDE:'); Writeln ;
     Writeln ('  R1 = ban kinh duong tron co dinh');
     Writeln ('  R2 = ban kinh duong tron di dong');
     Writeln;
     Writeln ('    Neu R2 > 0 ta co EPICYCLOIDE');
     Writeln ('    Neu R2 < 0 ta co HYPOCYCLOIDE');
     Writeln;
     Writeln ('    Neu L > 1 ta co duong cong keo dan');
     Writeln ('    Neu L = 1 ta co duong cong binh thuong');
     Writeln ('    Neu 0 < L < 1 ta co duong cong thu lai');
     Writeln;
     Write ('Cho R1: '); Readln (R1);
     Write ('Cho R2: '); Readln (R2);
     REPEAT
           Write ('Cho L: ');
           Readln (L)
     UNTIL L >= 0;
     aux1 := R1 + R2;
     aux2 := (R1 + R2)/R2;
     aux3 := L*R2;
     Writeln;
     Write ('Co ve duong tron sinh khong? (C/K) ');
     Readln (Sinh)
END;

PROCEDURE Timcuaso;
BEGIN
     rmax := 0;
     IF L >= 1
       THEN rmax := R1 + R2 + Abs(L*R2)
       ELSE IF R2 > 0
              THEN rmax := R1 + 2*R2
              ELSE rmax := R1
END;

PROCEDURE Veduongcong;
VAR       a,giaso : Real;
BEGIN
     a := 0;
     giaso := Pi/48;
     Diem (Fx(0),Fy(0));
     REPEAT
           a := a+giaso;
           VeDen (Fx(a),Fy(a))
     UNTIL a >= chuky
END;

PROCEDURE Vongtronsinh;
BEGIN
     Troncham (0,0,R1);
     Troncham (R1+R2,0,R2)
END;

PROCEDURE Trinhbaythambien;
VAR       s1,s2,s3,s4,s5 : string;
BEGIN
     Str (R1:5:2,s1);
     Str (R2:5:2,s2);
     Str (L:5:2,s3);
     Str (chuky:8:5,s4);
     Str (rmax:8:5,s5);
     Tamnhin (0,maxX,0,11);
     OutTextXY (10,0,'R1 ='+s1+' R2 ='+s2+' L ='+s3
                +' Chu ky ='+s4+' Rmax ='+s5)
END;

BEGIN
     Nhapdulieu;
     Timtudongchuky;
     Timcuaso;
     Mhdohoa;
     Cuaso (-rmax,rmax,-rmax,rmax);
     Tamnhin (0,maxX,0,maxY);
     Vevien;
     Tamnhin (140,580,15,345);
     IF upcase (sinh) = 'C' THEN Vongtronsinh;
     Veduongcong;
     Trinhbaythambien;
     Cho;
     MhVanban
END.





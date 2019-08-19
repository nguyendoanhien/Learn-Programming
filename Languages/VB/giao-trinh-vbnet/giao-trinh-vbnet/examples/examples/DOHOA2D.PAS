UNIT DOHOA;

INTERFACE

USES Crt, Dos, Printer, Graph;

CONST
     Dong = 1; Mo = 0;

VAR  GraphDriver, GraphMode        : Integer;
     XgFen, XdFen, YbFen, YhFen     : Real; {Cua so}
     XgClot, XdClot, YbClot, YhClot : Integer; {Tam nhin}
     XP1, YP1, XP2, YP2             : Real;
     XOrig, YOrig                   : Real;
     Xtl, Ytl                       : Real;
     MaxX, MaxY                     : Integer;
     SoMau                          : Byte;

TYPE
    Table = ARRAY [1..500] OF Real;

PROCEDURE Mhdohoa;
PROCEDURE MhVanban;
PROCEDURE XoaMhdh;
PROCEDURE CuaSo (F1,F2,F3,F4 : Real);
PROCEDURE TamNhin (C1,C2,C3,C4 : Integer);
PROCEDURE TamNhinDay;
PROCEDURE Mausac (Mau : Byte);
PROCEDURE Cat (X1,Y1,X2,Y2 : Real);
PROCEDURE VeDen (X,Y : Real);
PROCEDURE Diem (X,Y : Real);
PROCEDURE Vien (Mau : Byte);
PROCEDURE Vevien;
PROCEDURE Xoavien;
PROCEDURE Truc;
PROCEDURE ChinhTrucX (XOrig,XgFen,Unitx : Real; VAR CorrectX : Real);
PROCEDURE ChinhTrucY (YOrig,YbFen,UnitY : Real; VAR CorrectY : real);
PROCEDURE DoDo (UnitX,UnitY : Real); {Do do}
PROCEDURE Luoi (UnitX,UnitY : Real); {Luoi}
PROCEDURE Dagiac (X,Y : Table; Lim : Integer; Mode : Integer);
PROCEDURE VeDagiac (X,Y : Table; Lim : Integer; Mode : Integer);
PROCEDURE XoaDagiac (X,Y : Table; Lim : Integer; Mode : Integer);
PROCEDURE VeTron (XC,YC,R : Real; Cham : Boolean);
PROCEDURE Tron (XC,YC,R : Real);
PROCEDURE TronCham (XC,YC,R : Real);
PROCEDURE Cho;
PROCEDURE Beep;
FUNCTION Dau (N : Real) : Real;
FUNCTION Luythua (Base,Expo : Real) : Real;
FUNCTION Giaithua (X : Integer) : Real;

IMPLEMENTATION

PROCEDURE Mhdohoa;
VAR ErrorCode : Integer;
BEGIN
     GraphDriver := Detect;
     InitGraph (GraphDriver,GraphMode,'C:\tp\bgi');
     ErrorCode := GraphResult;
     IF ErrorCode<> grOK THEN
        BEGIN
           Writeln ('Loi do hoa: ',GraphErrorMsg(ErrorCode));
           Halt(1)
        END;
     MaxX := GetMaxX;
     MaxY := GetMaxY;
     Somau := GetMaxColor;
     SetColor (Red)
END;

PROCEDURE MhVanban;
BEGIN
     CloseGraph
END;

PROCEDURE XoaMhdh;
BEGIN
     ClearDevice
END;

PROCEDURE Cuaso (F1,F2,F3,F4 : Real);
BEGIN
     XgFen := F1; {Hoanh do trai}
     XdFen := F2; {Hoanh do phai}
     YbFen := F3; {Tung do duoi}
     YhFen := F4  {Tung do tren}
END;

PROCEDURE TamNhin (C1,C2,C3,C4 : Integer);
BEGIN {Co doi chieu truc Y}
      XgClot := C1; {Hoanh do trai}
      XdClot := C2; {Hoanh do phai}
      YbClot := C3; {Tung do duoi}
      YhClot := C4; {Tung do tren}
      Xtl := (XdClot - XgClot) / (XdFen - XgFen); {Ti le cua so}
      Ytl := (YhClot - YbClot) / (YhFen - YbFen); {Tam nhin}
      SetviewPort (XgClot,MaxY-YhClot,XdClot,MaxY-YbClot,ClipOn)
END;

PROCEDURE TamNhinDay;
BEGIN
     TamNhin (0,MaxX,0,MaxY) {Cua so la toan bo man hinh}
END;

PROCEDURE Mausac (Mau : Byte);
BEGIN
     SetColor (Mau)
END;

PROCEDURE Cat (X1,Y1,X2,Y2 : Real);
TYPE      Region = (Left,Right,Low,High);
          Code = SET OF Region;
VAR       C,C1,C2 : Code;
          X,Y : Real;
          XX1,YY1 : Integer;
          XX2,YY2 : Integer;

          PROCEDURE MaNhiPhan (X,Y : Real; VAR C : Code);
          BEGIN
               C := [];
               IF X < XgFen THEN C := [Left]
                            ELSE IF X > XdFen THEN C := [Right];
               IF Y < YbFen THEN C := C+[Low]
                            ELSE IF Y > YhFen THEN C := C+[High]
          END; {MaNhiPhan}

BEGIN
     MaNhiPhan (X1,Y1,C1); {Tao ma thuoc tinh}
     MaNhiPhan (X2,Y2,C2); {cua hai diem dau}
     WHILE (C1 <> []) OR (C2 <> []) DO
           BEGIN {Cat dan de tim doan hien thi}
                IF (C1*C2) <> [] THEN Exit; {Cat toan bo}
                IF C1 = [] THEN C := C2 ELSE C := C1;
                IF Left IN C
                   THEN
                      BEGIN
                           X := XgFen;
                           Y := Y1+(Y2-Y1)*(XgFen-X1)/(X2-X1)
                      END
                   ELSE IF Right IN C
                      THEN
                         BEGIN
                              X := XdFen;
                              Y := Y1+(Y2-Y1)*(XdFen-X1)/(X2-X1)
                         END
                      ELSE IF Low IN C
                         THEN
                            BEGIN
                                 Y := YbFen;
                                 X := X1+(X2-X1)*(YbFen-Y1)/(Y2-Y1)
                            END
                         ELSE IF High IN C THEN
                              BEGIN
                                   Y := YhFen;
                                   X := X1+(X2-X1)*(YhFen-Y1)/(Y2-Y1)
                              END;

                IF C = C1 {X1,Y1 nam ngoai cua so}
                   THEN BEGIN
                             X1 := X;
                             Y1 := Y;
                             MaNhiPhan (X,Y,C1)
                        END
                   ELSE BEGIN {X2,Y2 nam ngoai cua so}
                             X2 := X;
                             Y2 := Y;
                             MaNhiPhan (X,Y,C2)
                        END
           END; {While}
     XX1 := Round ((X1-XgFen)*Xtl);
     YY1 := Round ((YhFen-Y1)*Ytl);
     XX2 := Round ((X2-XgFen)*Xtl);
     YY2 := Round ((YhFen-Y2)*Ytl);
     MoveTo (XX1,YY1);
     LineTo (XX2,YY2)
END;

PROCEDURE VeDen (X,Y : Real);
BEGIN
     XP2 := X;
     YP2 := Y;
     Cat (XP1,YP1,XP2,YP2);
     XP1 := XP2;
     YP1 := YP2
END;

PROCEDURE Diem (X,Y : Real);
BEGIN
     XP1 := X;
     YP1 := Y;
     VeDen (X,Y)
END;

PROCEDURE Vien (Mau : Byte);
BEGIN
     SetColor (Mau);
     Diem (XgFen,YbFen);
     VeDen (XdFen,YbFen);
     VeDen (XdFen,YhFen);
     VeDen (XgFen,YhFen);
     VeDen (XgFen,YbFen)
END;

PROCEDURE VeVien;
BEGIN
     Vien (White)
END;

PROCEDURE XoaVien;
BEGIN
     Vien (Black)
END;

PROCEDURE Truc;
CONST     dX = 5;
          dY = 4;
PROCEDURE MuiTenTrenX;
     BEGIN {Ve mui ten tren truc X}
           MoveRel (-dX,dY);
           LineRel (dX,-dY);
           MoveRel (-dX,-dY);
           LineRel (dX,dY)
     END;
PROCEDURE MuiTenTrenY;
     BEGIN {Ve mui ten tren truc Y}
           MoveRel (-dY,dX);
           LineRel (dY,-dX);
           MoveRel (dY,dX);
           LineRel (-dY,-dX)
     END;

BEGIN
     IF (XgFen < 0) AND (XdFen > 0)
        THEN XOrig := 0
        ELSE XOrig := XgFen; {mep trai}
     IF (YbFen < 0) AND (YhFen > 0)
        THEN YOrig := 0
        ELSE YOrig := YbFen; {mep duoi}
     Diem (XgFen,YOrig);
     VeDen (XdFen,YOrig); {Ve truc X}
     MuiTenTrenX;
     Diem (XOrig,YbFen);
     VeDen (XOrig,YhFen); {Ve truc Y}
     MuiTenTrenY;
END;

PROCEDURE ChinhTrucX (XOrig,XgFen,UnitX : Real; VAR CorrectX : Real);
VAR       NbreTirets : Real; {So doan chia}
BEGIN
     IF XOrig = 0
        THEN BEGIN
                  NbreTirets := (XOrig-XgFen)/UnitX;
                  CorrectX := (NbreTirets-Int(NbreTirets))*UnitX
             END
        ELSE IF XOrig > 0 THEN CorrectX := Trunc(XOrig/UnitX+1)*UnitX-XOrig
                          ELSE CorrectX := Abs(XOrig)+Trunc(XOrig/UnitX)*UnitX
END;

PROCEDURE ChinhTrucY (YOrig,YbFen,UnitY : Real; VAR CorrectY : Real);
VAR       NbreTirets : Real; {So doan chia}
BEGIN
     IF YOrig = 0
        THEN BEGIN
                  NbreTirets := (YOrig-YbFen)/UnitY;
                  CorrectY := (NbreTirets-Int(NbreTirets))*UnitY
             END
        ELSE IF YOrig > 0 THEN CorrectY := Trunc(YOrig/UnitY+1)*UnitY-YOrig
                          ELSE CorrectY := Abs(YOrig)+Trunc(YOrig/UnitY)*UnitY
END;

PROCEDURE DoDo (UnitX,UnitY : Real);
VAR       CorrectX,CorrectY : Real;
          X,Y : Real;
          TiretX,TiretY : Byte;
BEGIN
     TiretX := 3;
     TiretY := 4;
     IF UnitX > 0 THEN
        BEGIN
             ChinhTrucX (XOrig,XgFen,UnitX,CorrectX);
             X := XgFen+CorrectX;
             REPEAT
                   Diem(X,YOrig);
                   VeDen(X,YOrig);
                   MoveRel(0,TiretX);
                   LineRel(0,-2*TiretX);
                   X := X+UnitX;
             UNTIL X > XdFen
        END;
     IF UnitY > 0 THEN
        BEGIN
             ChinhTrucY (YOrig,YbFen,UnitY,CorrectY);
             Y := YbFen+CorrectY;
             REPEAT
                   Diem(XOrig,Y);
                   VeDen(XOrig,Y);
                   MoveRel(TiretY,0);
                   LineRel(-2*TiretY,0);
                   Y := Y+UnitY;
             UNTIL Y > YhFen
        END
END;

PROCEDURE Luoi (UnitX,UnitY : Real);
VAR       CorrectX,CorrectY,I,J : Real;
BEGIN
     ChinhTrucX(XOrig,XgFen,UnitX,CorrectX);
     ChinhTrucY(XOrig,YbFen,UnitY,CorrectY);
     I := Trunc(XgFen+CorrectX);
     WHILE I <= Trunc(XdFen) DO
           BEGIN
                J := Trunc(YbFen+CorrectY);
                WHILE J <= Trunc(YhFen) DO
                      BEGIN
                           Diem (I,J);
                           VeDen (I,J);
                           J := J+UnitY
                      END;
                I := I+UnitX
           END
END;

PROCEDURE DaGiac (X,Y : Table; Lim : Integer; Mode : Integer);
VAR       I : Integer;
BEGIN
     Diem(X[1],Y[1]);
     FOR I := 2 TO Lim DO VeDen(X[I],Y[I]);
     IF Mode = Dong THEN VeDen(X[1],Y[1]) {Net cuoi}
END;

PROCEDURE VeDaGiac (X,Y : Table; Lim : Integer; Mode : Integer);
BEGIN
     SetColor(White);
     DaGiac(X,Y,Lim,Mode)
END;

PROCEDURE XoaDaGiac(X,Y : Table; Lim : Integer; Mode : Integer);
BEGIN
     SetColor(Black);
     DaGiac(X,Y,Lim,Mode)
END;

PROCEDURE VeTron (XC,YC,R : Real; Cham : Boolean);
VAR       S,C,X,Y,Aux : Real;
          N           : Integer;
BEGIN
     S := Sin(Pi/36);
     C := Cos(Pi/36);
     X := XC+R;
     Y := YC;
     Diem(X,Y);
     FOR N := 2 TO 73 DO
         BEGIN
              Aux := XC+(X-XC)*C-(Y-YC)*S;
              Y := YC+(X-XC)*S+(Y-YC)*C;
              X := Aux;
              IF Cham THEN Diem(X,Y);
              VeDen(X,Y)
         END
END;

PROCEDURE Tron (XC,YC,R : Real);
BEGIN
     VeTron(XC,YC,R,False)
END;

PROCEDURE TronCham (XC,YC,R : Real);
BEGIN
     VeTron(XC,YC,R,True)
END;

PROCEDURE Cho;
VAR       Ch : Char;
BEGIN
     Sound(400);
     Delay(100);
     NoSound;
     REPEAT UNTIL KeyPressed;
     Ch := ReadKey
END;

PROCEDURE Beep;
BEGIN
     Sound(2000);
     Delay(50);
     NoSound
END;

FUNCTION Dau (N :real) : Real;
BEGIN
     IF N >= 0 THEN Dau := 1 ELSE Dau := -1
END;

FUNCTION Luythua (Base,Expo : Real) : Real;
BEGIN
     IF Abs(Base) < 1E-6
        THEN IF Expo = 0.0
                THEN Luythua := 1.0
                ELSE Luythua := 0.0
        ELSE IF Base > 0
                THEN Luythua := Exp(Expo*Ln(Base))
                ELSE IF Odd(Round(Expo))
                        THEN Luythua := Dau(Base)*Exp(Expo*Ln(Abs(Base)))
                        ELSE Luythua := Dau(Base)*Exp(Expo*Ln(Abs(Base)))
END;

FUNCTION Giaithua (X : Integer) : Real;
VAR      I : Integer;
         F : Real;
BEGIN
     IF X < 2
        THEN Giaithua := 1
        ELSE
            BEGIN
                 F := 1;
                 FOR I := 2 TO X DO F := F*I;
                 Giaithua := F
            END
END;

END.

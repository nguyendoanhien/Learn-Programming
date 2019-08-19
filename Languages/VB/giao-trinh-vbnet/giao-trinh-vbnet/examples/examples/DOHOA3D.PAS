UNIT DOHOA3D;

INTERFACE

USES Crt, Printer, Dos, Graph;

CONST     Dong = 0;
          Mo = 1;
          Tyle = 1.35; {Tham so thay doi theo man hinh}

TYPE      PhepChieu = (PhoiCanh,SongSong);

VAR       Ro,Teta,Phi,De  : Real;
          Hs1,Hs2,Hs3,Hs4 : Real;
          Hs5,Hs6,Hs7,Hs8 : Real;
          Chieu           : PhepChieu;
          XOs,YOs,ZOs     : Real;
          Xc,Yc           : Real;
          Xh,Yh           : Integer;
          Gd,Gm           : Integer;
          MaxX,MaxY       : Integer;
          SoMau           : Byte;

PROCEDURE MhDohoa;
PROCEDURE MhVanban;
PROCEDURE XoaMhdh;
PROCEDURE DatMau (Mau : Byte);
PROCEDURE TamNhin (C1,C2,C3,C4 : Integer);
PROCEDURE KhoitaoChieu;
PROCEDURE ChieuDiem (X,Y,Z : Real);
PROCEDURE VeDen (X,Y,Z : Real);
PROCEDURE Diem (X,Y,Z : Real);
PROCEDURE Truc;
PROCEDURE TrucCham;
PROCEDURE Cho;
PROCEDURE Bip;

IMPLEMENTATION

PROCEDURE Mhdohoa;
VAR ErrorCode : Integer;
BEGIN
     GD := Detect;
     InitGraph (GD,GM,'C:\tp70\bgi');
     ErrorCode := GraphResult;
     IF ErrorCode<> grOK THEN
        BEGIN
           Writeln ('Loi do hoa: ',GraphErrorMsg(ErrorCode));
           Cho;
           Halt(1)
        END;
     MaxX := GetMaxX;
     MaxY := GetMaxY;
     Somau := GetMaxColor;
     SetColor (White)
END;

PROCEDURE MhVanban;
BEGIN
     CloseGraph
END;

PROCEDURE XoaMhdh;
BEGIN
     ClearDevice
END;

PROCEDURE DatMau (Mau : Byte);
BEGIN
     SetColor (Mau)
END;

PROCEDURE TamNhin (C1,C2,C3,C4 : Integer);
BEGIN
      SetviewPort (C1,MaxY-C4,C2,MaxY-C3,ClipOn)
END;

PROCEDURE KhoitaoChieu;
VAR       Th,Ph : Real;
BEGIN
     Th := Pi*Teta/180;
     Ph := Pi*Phi/180;
     Hs1 := Sin(Th);
     Hs2 := Sin(Ph);
     Hs3 := Cos(Th);
     Hs4 := Cos(Ph);
     Hs5 := Hs3*Hs2;
     Hs6 := Hs1*Hs2;
     Hs7 := Hs3*Hs4;
     Hs8 := Hs1*Hs4;
END;

PROCEDURE ChieuDiem (X,Y,Z : Real);
BEGIN
     XOs := -X*Hs1 + Y*Hs3;
     YOs := -X*Hs5 - Y*Hs6 + Z*Hs4;
     IF Chieu = PhoiCanh
        THEN
            BEGIN
                 ZOs := -X*Hs7 - Y*Hs8 - Z*Hs2 + Ro;
                 Xc := De*XOs/ZOs;
                 Yc :=De*YOs/ZOs
            END
        ELSE
            BEGIN
                 Xc := De*XOs;
                 Yc := DE*YOs
            END;
END;

PROCEDURE VeDen (X,Y,Z : Real);
BEGIN
     ChieuDiem (X,Y,Z);

     Xh := Round (Xc*Tyle + MaxX div 2);
     Yh := Round (MaxY div 2 - Yc);
     LineTo (Xh,Yh)
END;

PROCEDURE Diem (X,Y,Z : Real);
BEGIN
     ChieuDiem (X,Y,Z);
     Xh := Round (Xc*Tyle + MaxX div 2);
     Yh := Round (MaxY div 2 - Yc);
     MoveTo (Xh,Yh)
END;

PROCEDURE Truc;
BEGIN
     Diem (0,0,0); VeDen (10,0,0);
     Diem (0,0,0); VeDen (0,10,0);
     Diem (0,0,0); VeDen (0,0,10)
END;

PROCEDURE TrucCham;
BEGIN
     SetLineStyle (1,0,1);
     Diem (0,0,0); VeDen (3,0,0);
     MoveRel (5,5); OutText ('X');
     Diem (0,0,0); VeDen (0,3,0);
     MoveRel (5,5); OutText ('Y');
     Diem (0,0,0); VeDen (0,0,3);
     MoveRel (5,5); OutText ('Z');
     SetLineStyle (0,0,1)
END;

PROCEDURE Cho;
VAR       Ch : Char;
BEGIN
     Sound(400);
     Delay(200);
     NoSound;
     REPEAT UNTIL KeyPressed;
     Ch := ReadKey
END;

PROCEDURE Bip;
BEGIN
     Sound(2000);
     Delay(50);
     NoSound

END;

END.
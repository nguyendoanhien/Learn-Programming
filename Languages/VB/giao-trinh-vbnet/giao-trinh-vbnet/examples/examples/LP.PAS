PROGRAM LapPhuong;
USES    Crt,Graph,DoHoa3D;
CONST   IncAng = 5;
        IncRo  = 0.5;
        IncMh  = 20;
VAR     X,Y,Z,C : ARRAY [1..21] OF Real;
        Ch      : Char;

PROCEDURE DocLp;
BEGIN
     X[1] := 1;     Y[1] := 1;    Z[1] := 1;    C[1] := 0;
     X[2] := 1;     Y[2] := -1;   Z[2] := 1;    C[2] := 1;
     X[3] := -1;    Y[3] := -1;   Z[3] := 1;    C[3] := 1;
     X[4] := -1;    Y[4] := 1;    Z[4] := 1;    C[4] := 1;
     X[5] := 1;     Y[5] := 1;    Z[5] := 1;    C[5] := 1;
     X[6] := 1;     Y[6] := 1;    Z[6] := -1;   C[6] := 1;
     X[7] := 1;     Y[7] := -1;   Z[7] := -1;   C[7] := 1;
     X[8] := -1;    Y[8] := -1;   Z[8] := -1;   C[8] := 1;
     X[9] := -1;    Y[9] := 1;    Z[9] := -1;   C[9] := 1;
     X[10] := 1;    Y[10] := 1;   Z[10] := -1;  C[10] := 1;
     X[11] := 1;    Y[11] := -1;  Z[11] := -1;  C[11] := 0;
     X[12] := 1;    Y[12] := -1;  Z[12] := 1;   C[12] := 1;
     X[13] := -1;   Y[13] := -1;  Z[13] := 1;   C[13] := 0;
     X[14] := -1;   Y[14] := -1;  Z[14] := -1;  C[14] := 1;
     X[15] := -1;   Y[15] := 1;   Z[15] := 1;   C[15] := 0;
     X[16] := -1;   Y[16] := 1;   Z[16] := -1;  C[16] := 1;
     X[17] := 0.5;  Y[17] := 1;   Z[17] := -1;  C[17] := 0;
     X[18] := 0.5;  Y[18] := 1;   Z[18] := 0.5; C[18] := 1;
     X[19] := -0.5; Y[19] := 1;   Z[19] := 0.5; C[19] := 1;
     X[20] := -0.5; Y[20] := 1;   Z[20] := -1;  C[20] := 1;
     X[21] := 0;    Y[21] := 0;   Z[21] := 0;   C[21] := -1
END;

PROCEDURE VeLp;
VAR       I : Byte;
BEGIN
     I := 1;
     WHILE C[I] <> -1 DO
           BEGIN
                IF C[I] = 0 THEN Diem (X[I],Y[I],Z[I])
                            ELSE VeDen (X[I],Y[I],Z[I]);
                I := I+1
           END
END;

PROCEDURE KhoiTao;
BEGIN
     Chieu := PhoiCanh;
     Ro := 5;
     Teta := 0;
     Phi := 0;
     De := 200
END;

PROCEDURE Ve;
BEGIN
     KhoiTaoChieu;
     VeLp;
     Bip
END;

PROCEDURE ThongBao;
VAR       S1,S2,S3,S4 : String;
BEGIN
     TamNhin (0,MaxX,0,15);
     ClearViewPort;
     SetTextStyle (SmallFont,HorizDir,5);
     Str (Teta:3:1,S2);
     Str (Phi:3:1,S3);
     Str (De:4:1,S4);
     IF Chieu = PhoiCanh
        THEN
            BEGIN
                 Str (Ro:3:1,S1);
                 OutTextXY (90,1,'Chieu Phoi canh: Ro = '+S1+
                            'Teta = '+S2+' Phi = '+S3+
                            ' Do phong anh De = '+S4)
            END
        ELSE
                 OutTextXY (90,1,'Chieu Song song: Ro = '+S1+
                            'Teta = '+S2+' Phi = '+S3+
                            ' Do phong anh De = '+S4);
     TamNhin (0,MaxX,0,MaxY)
END;

PROCEDURE Lenh;
CONST RoPara = 1E20;
VAR   Ros,Des,DePara : Real;
      Ch             : Char;
BEGIN
     KhoiTao;
     DePara := 50;
     REPEAT
           Ve;
           ThongBao;
           Ch := ReadKey;
           IF Ch = #0 THEN Ch := ReadKey;
           ClearDevice;
           CASE Ord (UpCase(Ch)) OF
                72 : Phi := Phi + IncAng;
                80 : Phi := Phi - IncAng;
                75 : Teta := Teta - IncAng;
                77 : Teta := Teta + IncAng;
                69 : Ro := Ro + IncRo;
                65 : Ro := Ro - IncRo;
                43 : De := De + IncMh;
                45 : De := De - IncMh;
                67 : IF Chieu = PhoiCanh
                        THEN
                            BEGIN
                                 Ros := Ro;
                                 Des := De;
                                 Chieu := SongSong;
                                 Ro := RoPara;
                                 De := DePara
                            END
                        ELSE
                            BEGIN
                                 DePara := De;
                                 Chieu := PhoiCanh;
                                 Ro := Ros;
                                 De := Des
                            END
           END;
     UNTIL Ch = #27;
     MhVanban
END;

BEGIN
     MhDohoa;
     TamNhin (0,MaxX,0,MaxY);
     SetColor (White);
     DocLp;
     KhoiTao;
     Lenh
END.


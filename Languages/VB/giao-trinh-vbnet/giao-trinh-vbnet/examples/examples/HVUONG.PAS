uses crt,graph;
var
  gd,gm,canh:integer;
Procedure Ve_Hinh_vuong(canh:integer);
Var
  x1,y1:integer;
 Begin
      x1:=GetMaxX div 2 -canh; y1:=GetMaxY div 2 -canh;
      Rectangle(x1,y1,x1+2*canh,y1+2*canh);
      delay(20);
      Rectangle(x1,y1,x1+2*canh,y1+2*canh);
 End;
Begin
  gd:=detect; initgraph(gd,gm,'');
  SetWriteMode(XorPut);
  Repeat;
    for canh:=5 to GetMaxY div 2 do Ve_Hinh_vuong(canh);
    for canh:= GetMaxY div 2 downto 5 do Ve_Hinh_vuong(canh);
  Until Keypressed;
End.
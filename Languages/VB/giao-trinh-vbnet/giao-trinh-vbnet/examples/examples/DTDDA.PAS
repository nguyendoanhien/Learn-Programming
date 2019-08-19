{ ve d/t DDA trong trhop 0<m<1, dx >0}
uses crt,graph;
var
 gd,gm:integer;
 i,x1,y1,x2,y2,x:integer;
 y,m:real;
Begin
  gd:=detect; initgraph(gd,gm,'');
  Randomize;
 Repeat
  x1:=random(GetMaxX);
  x2:=x1+random(GetMaxX-x1);
  y1:=random(GetMaxY);
  y2:=y1+random(x2-x1);

  x:=x1; y:=y1;
  m:=(y2-y1)/(x2-x1);
  putpixel(x,round(y),white);
  for i:=x1 to x2 do
    begin
     x:=x+1;
     y:=y+m;
     putpixel(x,round(y),white);
    end;
   delay(1000);
 Until Keypressed;
  closegraph;
End.

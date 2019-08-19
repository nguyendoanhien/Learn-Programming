{ ve d/t Bresenham trong trhop 0<m<1, dx >0}
uses crt,graph;
var
 gd,gm:integer;
 i,x1,y1,x2,y2,dx,dy,p,c1,c2,x,y:integer;
Begin
  gd:=detect; initgraph(gd,gm,'');
  Randomize;
 Repeat
  x1:=random(GetMaxX);
  x2:=x1+random(GetMaxX-x1);
  y1:=random(GetMaxY);
  y2:=y1+random(x2-x1);

  dx:=x2-x1;
  dy:=y2-y1;
  p:=2*dy - dx;
  c1:=2*dy;
  c2:=2*(dy-dx);
  x:=x1;
  y:=y1;
  putpixel(x,y,white);
  for i:=x1 to x2 do
    begin
     if p<0 then p:=p+c1 else
      begin
       p:=p+c2; y:=y+1;
      end;
     x:=x+1;
     putpixel(x,y,white);
    end;
   delay(1000);
 Until Keypressed;
  closegraph;
End.

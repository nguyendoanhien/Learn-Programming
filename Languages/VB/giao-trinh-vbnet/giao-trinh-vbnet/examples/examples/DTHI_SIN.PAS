{ ve do thi ham so: y=sin(x) }
uses crt,graph;
var
 tx,ty,gd,gm,i,j:integer;
 d,x,y:real;
begin
  gd:=detect; initgraph(gd,gm,'c:\tp\bgi');
{  line(0,getmaxY div 2, getmaxX, getmaxY div 2);
  line(getmaxX div 2,0, getmaxX div 2, getmaxY);}
  setviewport(getmaxX div 2,getmaxY div 2,getmaxX,getmaxY,clipoff);
  d:=0.001;x:=0; tx:=20; ty:=40;
  while x<4*pi do
   begin
     putpixel(round(tx*x),-round(ty*sin(x)),yellow);
     x:=x+d;
   end;
  readln;
  closegraph;
end.

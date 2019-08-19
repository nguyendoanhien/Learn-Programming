uses crt,graph;
var
 gd,gm:integer;
  x,y,a,b,r:integer;
  g,d:real;
begin
  gd:=detect; initgraph(gd,gm,'c:\tp\bgi');
  a:=GetMaxX div 2; b:=GetmaxY div 2;
  Setcolor(Yellow);
  r:=150;
  Circle(a,b,r);
  x:=a; y:=b-r; line(a,b,x,y);
  g:=pi/2; d:=pi/60;
  repeat
   setWriteMode(Xorput);
   line(a,b,x,y);
   g:=g-d;
   x:=round(a+r*cos(g)); y:=round(b-r*sin(g));
   line(a,b,x,y);
   delay(1000);
  until KeyPressed;
  closegraph;
end.

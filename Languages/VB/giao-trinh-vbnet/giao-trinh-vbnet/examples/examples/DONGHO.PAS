uses crt,graph;
var
  gd,gm:integer;
  x,y,a,b,r:integer;
  c,i,x1,x2,y1,y2:integer;
  g,d:real;
begin
  gd:=detect; initgraph(gd,gm,'c:\tp\bgi');
  a:=GetMaxX div 2; b:=GetmaxY div 2;
  Setcolor(Yellow);
  SetWriteMode(Xorput);
  r:=150;
  Circle(a,b,r);
  {Ve cac vach chia do}
  c:=5;
  d:=pi/6; g:=0;
  while g< 2*pi do
   begin
     g:=g+d;
     x1:=a+round((r-c)*cos(g));
     x2:=a+round((r+c)*cos(g));
     y1:=b-round((r-c)*sin(g));
     y2:=b-round((r+c)*sin(g));
     line(x1,y1,x2,y2);
   end;
  {ve kim giay chuyen dong}
  x:=a; y:=b-r; line(a,b,x,y);
  g:=pi/2; d:=pi/30;
  repeat
   line(a,b,x,y);
   g:=g-d;
   x:=round(a+r*cos(g)); y:=round(b-r*sin(g));
   line(a,b,x,y);
   delay(1000);
  until KeyPressed;
  closegraph;
end.

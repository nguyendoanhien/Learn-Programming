{hinh chu nhat ngau nhien}
uses crt,graph;
var
 gd,gm:integer;
 dc,h,c,x0,y0,x1,y1,x2,y2,x3,y3,x4,y4:longint;
 goc:real; {radian}
Begin
 gd:=detect;
 initgraph(gd,gm,'');
 randomize;
repeat
  setcolor(random(getmaxcolor));
  x1:=random(getmaxX div 2);
  y1:=random(getmaxY div 2);  { dinh thu nhat }
  c:=random(getmaxX div 2+10);
  h:=random(getmaxY div 2+10); { 2 canh hinh chu nhat }

  dc:=round(sqrt(c*c+h*h)/2); {1/2 duong cheo}

  goc:=random(180)*pi/180; { do -> radian }
  x0:=x1+c div 2;
  y0:=y1+h div 2; {tam hinh chu nhat}
  x2:=x0+round(dc*cos(goc));
  y2:=y0+round(dc*sin(goc));
  x3:=x1+c;
  y3:=y1+h;
  x4:=x0+round(dc*cos(goc-pi));
  y4:=y0+round(dc*sin(goc-pi));

  line(x1,y1,x2,y2); line(x2,y2,x3,y3);
  line(x3,y3,x4,y4); line(x4,y4,x1,y1);
  delay(500);
until keypressed;

end.
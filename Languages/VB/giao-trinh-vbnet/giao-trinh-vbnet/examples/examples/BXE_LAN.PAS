uses crt,graph;
var
 gd,gm:integer;
 r,x,y,direct,buoc:integer; gia_so_goc,goc:real;

procedure ve_banh_xe;
  var x1,y1,x2,y2,x3,y3:integer;
  begin
    x1:=x+round(r*cos(goc));y1:=y-round(r*sin(goc));
    x2:=x+round(r*cos(goc+2*pi/3));y2:=y-round(r*sin(goc+2*pi/3));
    x3:=x+round(r*cos(goc-2*pi/3));y3:=y-round(r*sin(goc-2*pi/3));
    Circle(x,y,r);  line(x,y,x1,y1);line(x,y,x2,y2);line(x,y,x3,y3);
    delay(30); setcolor(0);
    Circle(x,y,r);  line(x,y,x1,y1);line(x,y,x2,y2);line(x,y,x3,y3); {xoa}
    delay(30);
    goc:=goc-gia_so_goc*direct; setcolor(yellow);
  end;

begin
  direct:=1; buoc:=3;
  gd:=detect; initgraph(gd,gm,'c:\tp\bgi');
  x:=100; goc:=0;r:=60; y:=200;
  gia_so_goc:=buoc/r; setcolor(yellow);
  repeat
   ve_banh_xe;
   if (r> x+direct*buoc) or (x+direct*buoc > getmaxX-r) then direct:=-direct;
   x:=(x+direct*buoc);
  until Keypressed;

  closegraph;
end.

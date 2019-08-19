uses crt,graph;
var
  gd,gm,i,j,x,y,c:integer;
Begin
  gd:=detect;
  initgraph(gd,gm,'');
  randomize;
  Repeat
     x:=random(getmaxx); y:=random(getmaxy); c:=random(getmaxcolor);
     if getpixel(x,y)<>0 then putpixel(x,y,0)
     else PutPixel(x,y,c);
       delay(2);
  Until KeyPressed;
  readkey;
End.
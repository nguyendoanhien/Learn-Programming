uses crt,graph;
var
 gd,gm,x,y,R,p,mau:integer;
Procedure PutPixel8(x,y,c:integer);
  begin
    putPixel(x,y,c);
    putPixel(y,x,c);
    putPixel(y,-x,c);
    putPixel(x,-y,c);
    putPixel(-x,-y,c);
    putPixel(-y,-x,c);
    putPixel(-y,x,c);
    putPixel(-x,y,c);
  end;
begin
  gd:=detect; initgraph(gd,gm,'');
  SetViewPort(GetMaxX div 2, GetMaxY div 2, GetMaxX,GetMaxY,false);
  Randomize;
  R :=100 + random(200);
  mau:=random(GetMaxColor);
  x:=0; y:=R;
  PutPixel8(x,y,mau);
  p:=1-R;
  while (x<y) do
  begin
    if p<0 then p:=p+2*x+3
    else
     begin
      p:=p+2*(x-y)+5;
      y:=y-1;
     end;
    x:=x+1;
    PutPixel8(x,y,mau);
  end;
  readkey;
end.







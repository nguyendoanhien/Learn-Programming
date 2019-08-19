uses crt,graph;
const stop=50;
var
 gd,gm:integer;
 i,x,y,dx,dy,canh:integer;
 p:pointer;
 size:word;
begin
  gd:=detect; initgraph(gd,gm,'');
  randomize;
  dx:= GetMaxX div 2; dy:= GetMaxY div 2;
  SetViewPort(0,0,dx,dy,true);
  for i:=1 to 40 do
    begin
    x:=random(dx);    y:=random(dy);
    SetColor(random(GetMaxColor));
    circle(x,y,random(dy));
    end;

  SetViewPort(0,0,GetMaxX,GetMaxY,false);
  SetColor(White);
  x:=50; y:=50; canh:=100;
  Rectangle(x,y,x+canh,y+canh);
  Size:=ImageSize(x,y,x+canh,y+canh);
  GetMem(p,size);
  GetImage(x,y,x+canh,y+canh,p^);
  PutImage(x+dx,y,p^,XorPut);
  readkey;
  closegraph;
end.

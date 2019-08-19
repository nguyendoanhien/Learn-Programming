uses crt,graph;
var
 gd,gm,i,j:integer;
 x,y:integer;
begin
  gd:=detect; initgraph(gd,gm,'');
  randomize;
  repeat
        x:=random(100); y:=random(100);
        if GetPixel(x,y) <>0 then
           Putpixel(x,y,0)
        else PutPixel(x,y,random(getmaxColor));
        delay(2);
  Until Keypressed;
  closegraph;
end.

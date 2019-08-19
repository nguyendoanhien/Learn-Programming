uses crt,graph;
const stop=50;
var
 gd,gm:integer;
 a:ArcCoordsType;
 x,y,g1,g2,r: integer;
Begin
  gd:=detect; initgraph(gd,gm,'');
  x:=GetMaxX div 2; y:=GetMaxY div 2;
  g1:=30; g2:=330;
  r:=100;
  arc(x,y,30,330,100);
  GetArcCoords(a);
   line(x,y,a.xStart,a.yStart);
   line(x,y,a.xEnd,a.yEnd);
  readkey;
  closegraph;
end.

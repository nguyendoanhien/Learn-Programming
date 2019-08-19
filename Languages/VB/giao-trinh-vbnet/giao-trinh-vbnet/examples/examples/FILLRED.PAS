uses crt,graph;
var
 h,gd,gm,i,j,mau:integer;
begin
  gd:=detect; initgraph(gd,gm,'');
  for i:=0 to GetMaxx do
  for j:=0 to GetMaxy do
     PutPixel(i,j,red);
  readkey;
  closegraph;
end.

uses crt,graph;
var
 tx,ty,gd,gm,i,j:integer;
 a,b,c,d,e:integer;
begin
  gd:=detect; initgraph(gd,gm,'');
  SetFillStyle(1,blue);
  Bar(100,100,200,200);
  readkey;
  setcolor(11);
  setwritemode(xorput);
  for i:=100 to 200 do
   line(100,i,200,i);

  setfillstyle(1,lightGreen);
  bar(250,250,350,350);

  readkey;
  closegraph;
end.

uses crt,graph;
var
 tx,ty,gd,gm,i,j:integer;
 a,b,c,d,e:integer;
begin
  gd:=detect; initgraph(gd,gm,'');
  Setcolor(Blue);
  e:=50;a:=100;c:=500;b:=50;d:=100;
  for i:=0 to (c-a) do
   begin
     line(a+i,b,e+i,d);
     delay(30);
   end;
  readkey;
  closegraph;
end.

uses crt,graph;
const stop=50;
var
 gd,gm,i,j,canh,a,mau:integer;

begin
  canh:=40;
  a:= 100;
  gd:=detect; initgraph(gd,gm,'');
  mau:=white;
  setlinestyle(1,1,3); {duong cham cham }
  rectangle(a,a,a+8*canh,a+8*canh);
  for i:=0 to 7 do
  for j:=0 to 7 do
    begin
     setfillstyle(1,mau);
     bar(a+i*canh,a+j*canh,a+(i+1)*canh,a+(j+1)*canh);
     if j<>7 then
        if mau=white then mau:= black else mau:=white;
    end;
  readkey;
  closegraph;
end.

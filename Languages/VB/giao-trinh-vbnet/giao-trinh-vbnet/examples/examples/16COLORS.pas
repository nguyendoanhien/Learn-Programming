uses crt,graph;
var
 h,gd,gm,i,j,mau:integer;

begin
  gd:=detect; initgraph(gd,gm,'');
  h:=GetMaxY div GetMaxColor;
  for i:=0 to GetMaxColor do
    begin
      setfillstyle(1,i);
      bar(0,i*h,getmaxx,(i+1)*h);
    end;
  readkey;
  closegraph;
end.

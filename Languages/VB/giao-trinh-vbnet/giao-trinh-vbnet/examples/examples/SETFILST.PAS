{Show 12 patterns of SetFillStyle}
uses crt,graph;
var
 h,gd,gm,i,j,mau:integer;

begin
  gd:=detect; initgraph(gd,gm,'');
  h:=GetMaxY div 12;
  for i:=0 to 11 do
    begin
      setfillstyle(i,blue);
      bar(0,i*h,getmaxx,(i+1)*h);
    end;
  readkey;
  closegraph;
end.

uses crt,graph;
var
  gd,gm,i:integer;
  s:string;
begin
  writeln('Go xau ky tu:');
  readln(s);
  gd:=detect; initgraph(gd,gm,'');
  setTextStyle(GothicFont,0,10);
  Setcolor(8);
  for i:=1 to 10 do outTextxy(100+i,100-i,s);
  SetColor(7);
  outTextxy(100,100,s);

  readln;
  closegraph;
end.

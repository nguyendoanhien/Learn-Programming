{hinh chu nhat ngau nhien}
uses crt,graph;
var
 gd,gm:integer;
 i,h,c,x1,x2,y1,y2:integer;
Begin
 gd:=detect;
 initgraph(gd,gm,'');
 randomize;
 readln;
 for i:= 1 to 20 do
 begin
  setcolor(random(getmaxcolor));
  x1:=random(getmaxX div 2);
  y1:=random(getmaxY div 2);
  c:=random(getmaxX div 2);
  h:=random(getmaxY div 2);
  rectangle(x1,y1,x1+c,y1+h);
  delay(100);
 end;
 readln;
end.
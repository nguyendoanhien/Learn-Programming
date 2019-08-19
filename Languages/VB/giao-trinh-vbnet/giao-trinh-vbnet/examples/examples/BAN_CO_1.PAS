uses crt,graph;
var
 gd,gm,i,j,mau:integer;
 s:string;

begin
  gd:=detect; initgraph(gd,gm,'');
  setfillstyle(1,green);
  bar(0,0,getmaxx,getmaxy);
  setviewport(160,80,600,400,false);
  for i:=0 to 7 do
  for j:=0 to 7 do
    begin
     if (i+j) mod 2 =0 then mau:=white
     else mau:= black;
     setfillstyle(1,mau);
     bar(i*40,j*40,(i+1)*40,(j+1)*40);
    end;
  settextstyle(3,0,2);
  s:='12345678';
  settextjustify(1,1);
  setcolor(4);
  for i:=1 to 8 do
    outtextxy(i*40-20,340,s[i]);
  s:='ABCDEFGH';
  for i:= 1 to 8 do
    outtextxy(-20,i*40-20,s[i]);

  readkey;
  closegraph;
end.

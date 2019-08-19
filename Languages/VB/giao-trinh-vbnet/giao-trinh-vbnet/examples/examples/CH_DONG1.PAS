uses crt,graph;
var
 gd,gm:integer;
 canh,buoc,direct,x,y,d:integer;
 ch:char;
procedure hop(x,y:integer);
 begin
  rectangle(x-canh,y-canh,x+canh,y+canh);delay(d);
  rectangle(x-canh,y-canh,x+canh,y+canh);
 end;
begin
  gd:=detect; initgraph(gd,gm,'c:\tp\bgi');
  x:=100;y:=100; setwritemode(xorput);
  d:=50; canh:=10;
 Repeat
  repeat
   hop(x,y);
  until Keypressed;
   ch:=readkey;
    if ch=#0 then
     begin
       ch:=readkey;
       case ch of
        #72: y:=y-10;
        #80: y:=y+10;
        #75: x:=x-10;
        #77: x:=x+10;
       end;
     end;
 Until ch=#27;

  closegraph;
end.

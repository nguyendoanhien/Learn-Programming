Uses crt,graph;
Var
 gd,gm,x,y:integer;
Begin
 gd:=detect;
 initgraph(gd,gm,'');
 randomize;
 Repeat
   x:=100+random(200);
   y:=100+random(200);
   if GetPixel(x,y)<>0 then Putpixel(x,y,0)
   else putpixel(x,y,random(GetMaxColor));
   delay(2);
  Until Keypressed;
end.
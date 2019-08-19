{ Hinh vuong bat di bat lai.
Neu bam phim mui ten cung chieu: tang toc
Neu bam phim mui ten nguoc chieu: giam toc do.
Neu bam phim mui ten len: nhich len tren
Neu bam phim mui ten xuong: tut xuong duoi
var
  direct: huong chuyen dong ngang
  canh: canh hinh vuong
  buoc: buoc nhay moi lan di chuyen
}
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
  d:=50; direct:=1; buoc:=2; canh:=10;
 Repeat
  repeat
   hop(x,y);
   if (0<x+direct*buoc) and (x+direct*buoc<GetmaxX) then
      x:=x+direct*buoc
   else  direct:=direct*(-1);
  until Keypressed;
   ch:=readkey;
    if ch=#0 then
     begin
       ch:=readkey;
       case ch of
        #72: if y>10 then y:=y-10;
        #80: if y<getmaxY-10 then y:=y+10;
        #75: if direct=1 then
                begin if buoc>1 then dec(buoc); { ham phanh }
                end
             else { direct=-1} inc(buoc); { tang toc }
        #77: if direct=-1 then
                begin if buoc>1 then dec(buoc); { ham phanh }
                end
             else inc(buoc); { tang toc }
       end;
     end;
 Until ch=#27;

  closegraph;
end.

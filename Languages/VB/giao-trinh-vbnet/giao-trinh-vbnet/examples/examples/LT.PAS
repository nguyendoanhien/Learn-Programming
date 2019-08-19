USES crt,graph;
VAR i,d,gm,gd,a,b,x,y:integer; cur2:pointer;kt:char;

PROCEDURE taodia (var trai,tren:integer; mau:byte); forward;

PROCEDURE hinh(var a,b,mau1:integer);
BEGIN
  d:=(d+1) mod 2;
  setactivepage(d);{a:=50;b:=i;}
{  taodia(a,b,0);
  i:=i+10;
  a:=50;b:=10+i;}
  taodia(a,b,mau1);
  setvisualpage(d);
END;

PROCEDURE dathinh(var x,y:integer);
CONST
   buoc=10;
VAR
   ch:char; xx,yy:string;
BEGIN
    taodia(x,y,red);
    repeat
      ch:=readkey;
      if ch=#0 then
        begin
          ch:=readkey;
                    CASE ch OF
                       #72:begin  d:=(d+1) mod 2;
                                  taodia(x,y,0);
                                  setactivepage(d);
                                  y:=y-buoc; taodia(x,y,4);
                                  setvisualpage(d);
                                        end;
                       #75:begin d:=(d+1) mod 2;
                                  taodia(x,y,0);
                                  setactivepage(d);
                                  x:=x-buoc; taodia(x,y,4);
                                  setvisualpage(d);
                                        end;
                       #77:begin d:=(d+1) mod 2;
                                  taodia(x,y,0);
                                  setactivepage(d);
                                  x:=x+buoc; taodia(x,y,4);
                                  setvisualpage(d);
                                        end;
                       #80:begin d:=(d+1) mod 2;
                                  taodia (x,y,0);
                                  setactivepage (d);
                                  y := y+buoc; taodia(x,y,4);
                                  setvisualpage (d);
                                        end;
                     end;
                     {str (x,xx); str (y,yy);
                     outtextxy (x-50,y-50,xx+' '+yy);
      moveto(x,y);} end;
      until ch=#13;
END;
  
PROCEDURE taodia (var trai,tren:integer;mau:byte);
VAR size1:byte;
BEGIN
  setcolor(mau);
  circle (trai+20,tren+20,20);
  setfillstyle(1,mau); floodfill(trai+20,tren+20,mau);
END;

BEGIN
   gm:=VGA; {gd := 1;}
   initgraph (gm,gd,'c:\tp70\bgi');
   setbkcolor(blue);
   d:=0;
   bar(200,200,300,300);
 {  setactivepage(1);hinh(1);
  setactivepage(0); hinh(20);}
    { repeat
       setvisualpage (1); delay (300);
       setvisualpage (0); delay (300);
       hinh;
       kt:=readkey;
     until upcase(kt)='N';}
     x:=100;y:=100;dathinh(x,y);
END.

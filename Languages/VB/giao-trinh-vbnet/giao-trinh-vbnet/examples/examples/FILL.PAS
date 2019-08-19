uses crt,graph;
var gd, gm, i, goc, r : integer;
    p : array[1..5,1..2] of integer;
BEGIN
     gd := 0; initgraph(gd,gm,'');

     goc := 18; r := 100;
     for i := 1 to 5 do begin
         p[i,1] := round(r*cos(goc*pi/180));
         p[i,2] := -round(r*sin(goc*pi/180));
         goc := goc + 2*72;
     end;

     SetFillStyle(1,red);
     Bar(100,100,540,380);

     SetViewPort(320,240,600,400,false);
     SetColor(yellow);
     SetFillStyle(1,yellow);
{     FillPoly(5,p); readln;}
     FloodFill(0,0,yellow);
     readkey;
END.

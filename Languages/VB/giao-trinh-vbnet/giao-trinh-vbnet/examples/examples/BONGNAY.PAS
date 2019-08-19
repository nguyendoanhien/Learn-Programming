uses crt,graph;
var
    gd,gm,x,y,dx,dy,r : integer;
    a,b:integer;
BEGIN
    gd := 0; initgraph(gd,gm,'');
    x := 120; y := 180; dx := 2; dy := 1; r := 20;
    a:=100; b:=400;
    rectangle(a-3,a-3,b+3,b+3);
    repeat
        setcolor(yellow);
        circle(x,y,r);
        delay(20);
        setcolor(0);
        circle(x,y,r);

        if (x>=b-r) or (x<a+r) then dx:=-dx;
        if (y>=b-r) or (y<a+r) then dy:=-dy;
        x := x + dx; y := y + dy;
    until keypressed;
END.

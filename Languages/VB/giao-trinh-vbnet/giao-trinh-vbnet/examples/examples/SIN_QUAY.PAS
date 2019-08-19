uses crt,graph;
var gd, gm, xo, yo, w, h : integer;
     x1,y1,x2,y2, xtl, ytl : real;

procedure khoitao_cuaso;
begin
    xo := 20; yo := 40; w := 600; h := 400;
    xtl := 30; ytl := 30;
    x2 := w/xtl/2; x1 := -x2;
    y2 := h/ytl/2; y1 := -y2;
end;
function tox(x : real): integer;
begin
    tox := xo + round((x-x1)*xtl);
end;
function toy(y : real): integer;
begin
    toy := yo + round((y2-y)*ytl);
end;
procedure Line2D(x1,y1,x2,y2: real);
begin
    Line(tox(x1),toy(y1),tox(x2),toy(y2));
end;
procedure vetruc;
var i : integer;
     x : string;
begin
    SetColor(14);
    Line2D(x1,0,x2,0);
    Line2D(x2-0.2,+0.1,x2,0);
    Line2D(x2-0.2,-0.1,x2,0);
    Line2D(0,y1,0,y2);
    Line2D(+0.1,y2-0.2,0,y2);
    Line2D(-0.1,y2-0.2,0,y2);
    SetColor(lightgreen);
    SetTextJustify(1,1);
    for i := round(x1) + 1 to round(x2) - 1 do
        if i <> 0 then begin
            str(i,x);
            outtextxy(tox(i),toy(-0.4),x);
            Line2D(i,-0.1,i,0.1);
        end;
    for i := round(y1) + 1 to round(y2) - 1 do
        if i <> 0 then begin
            str(i,x);
            outtextxy(tox(-0.4),toy(i),x);
            Line2D(-0.1,i,0.1,i);
        end;
end;

procedure quay(x,y,a:real; var tx,ty : real);
begin
    tx := x * cos(a) - y * sin(a);
    ty := x * sin(a) + y * cos(a);
end;
procedure duongsin(goc : real);
var x,y,a,b,dx,tx,ty : real;
    i,n : integer;
begin
    setcolor(15);
    a := -2*pi; b := 2*pi; n := 50; dx := (b-a)/n;
    x := a; y := sin(x); quay(x,y,goc,tx,ty);
    moveto(tox(tx),toy(ty));
    for i := 1 to n do begin
        x := x + dx; y := sin(x); quay(x,y,goc,tx,ty);
        lineto(tox(tx),toy(ty));
    end;
end;
BEGIN
    gd := 0; initgraph(gd,gm,'C:\TP\BGI');
    khoitao_cuaso;
    vetruc;
    duongsin(0);
    duongsin(pi/4);
    duongsin(pi/2);
    duongsin(3*pi/4);
    readkey;
END.

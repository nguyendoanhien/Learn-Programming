uses crt,graph;
var gd, gm, xo, yo, w, h, n : integer;
     x1,y1,x2,y2, xtl, ytl : real;
     x,y : array[1..4] of real;

procedure khoitao_cuaso;
begin
    gd := 0; initgraph(gd,gm,'C:\TP\BGI');
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

procedure khoitao_hcn;
begin
    n := 4;
    x[1] := 1; y[1] := 1;
    x[2] := 1; y[2] := 3;
    x[3] := 5; y[3] := 3;
    x[4] := 5; y[4] := 1;
end;

procedure VeHCN(c : integer);
begin
    SetColor(c);
    MoveTo(tox(x[1]), toy(y[1]));
    LineTo(tox(x[2]), toy(y[2]));
    LineTo(tox(x[3]), toy(y[3]));
    LineTo(tox(x[4]), toy(y[4]));
    LineTo(tox(x[1]), toy(y[1]));
end;

procedure tinhtien(a,b : real);
var i : integer;
begin
    for i := 1 to n do begin
        x[i] := x[i] + a;
        y[i] := y[i] + b;
    end;
end;

procedure codan(Sx,Sy : real);
var i : integer;
begin
    for i := 1 to n do begin
        x[i] := Sx*x[i];
        y[i] := Sy*y[i];
    end;
end;

procedure Quay(a : real);
var i : integer;
     cosa,sina,tx,ty : real;
begin
    cosa := cos(a); sina := sin(a);
    for i := 1 to n do begin
        tx := x[i] * cosa - y[i] * sina;
        ty := x[i] * sina + y[i] * cosa;
        x[i] := tx; y[i] := ty;
    end;
end;
BEGIN
    khoitao_cuaso;
    khoitao_hcn;
    vetruc;
    VeHCN(14);
    readkey;
    tinhtien(-3,-2);     
    VeHCN(13);
    readkey;
    codan(1.2,2.4);   
    VeHCN(12);
    readkey;
    quay(pi/4);        
    VeHCN(11);
    readkey;
END.

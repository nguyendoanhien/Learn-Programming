uses crt,graph;
var gd, gm, xo, yo, w, h : integer;
     x1,y1,x2,y2, xtl, ytl : real;

procedure khoitao_cuaso;
begin
    xo := 20; yo := 40; w := 600; h := 400;
    xtl := 50; ytl := 50;        
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

procedure duongsin;
var x,y,a,b,dx : real;
    i,n : integer;
begin
    setcolor(yellow);
    a := x1; b := x2; n := 100; dx := (b-a)/n;
    x := a; y := sin(x);
    moveto(tox(x),toy(y)); 
    for i := 1 to n do begin
        x := x + dx; y := sin(x);
        lineto(tox(x),toy(y));
    end;
end;

procedure thamso;
var t,x,y,a,b,dt : real;
    i,n : integer;
begin
    setcolor(lightred);
    a := 0; b := 2*pi; n := 100; dt := (b-a)/n;
    t := a; x := cos(3*t) ; y := sin(5*t);
    moveto(tox(x),toy(y));
    for i := 1 to n do begin
        t := t + dt; x := cos(3*t) ; y := sin(5*t);
        lineto(tox(x),toy(y));
    end;
end;

procedure tdcuc;
var r,p,x,y,a,b,dp : real;
    i,n : integer;
begin
    setcolor(13);
    a := 0; b := 2*pi; n := 100; dp := (b-a)/n;
    p := a; r := 3*cos(3*p); 
    x := r*cos(p) ; y := r*sin(p); 
    moveto(tox(x),toy(y));
    for i := 1 to n do begin
        p := p + dp; r := 3*cos(3*p); x := r*cos(p) ; y := r*sin(p);
        lineto(tox(x),toy(y));
    end;
end;

BEGIN
    gd := 0; initgraph(gd,gm,'C:\TP\BGI');
    khoitao_cuaso;
    vetruc;
    duongsin;
    thamso;
    tdcuc;
    readkey;
END.

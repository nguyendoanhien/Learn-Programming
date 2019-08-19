uses crt,graph;
var gd,gm,x,y,dx,da,r,a : integer;

procedure banhxe(x,y,r,c,n,a : integer);        
var goc,dx,dy,i : integer;                
begin
    SetColor(c); goc := a;
    circle(x,y,r);
    for i := 1 to n do begin
        dx := round(r* cos(goc * pi/180)); 
        dy :=-round(r* sin(goc * pi/180));   
        Line(x,y,x+dx,y+dy);          
        goc := goc + 360 div n; 
    end;
end;
BEGIN
    gd := 0; initgraph(gd,gm,'C:\TP\BGI');
    x := 30; y := 200; dx := 3; a := 30; r := 30; 
    da:=round(dx/r*180/pi);
    repeat
        banhxe(x,y,r,yellow,12,a);     
        delay(40);
        banhxe(x,y,r,black,12,a);   

        if (x>=640-r) then x := r;
        x := x + dx;
        if a < 0 then a := a + 360;
        a := a - da;            
    until keypressed;

END.

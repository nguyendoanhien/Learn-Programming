uses crt,graph;
var gd,gm,x,y,x1,y1,da,da1,r,r1,goc,goc1 : integer;

procedure hinhtron(x,y,r,c : integer); 
var goc,dx,dy,i : integer;
begin
    SetColor(c);
    circle(x,y,r);
    SetFillStyle(1,c);
    FloodFill(x,y,c);
end;

BEGIN
    gd := 0; initgraph(gd,gm,'C:\TP\BGI');
    SetViewPort(320,240,600,400,false);        
    goc := 0; goc1 := 0; 
    da :=360 div 360;da1 := 360 div 30; 
    hinhtron(0,0,50,lightred);    
    repeat
        x := round(240*cos(goc*pi/180)); 
        y :=-round(200*sin(goc*pi/180)); 
        hinhtron(x,y,20,lightblue);        
        x1 := round(60*cos(goc1*pi/180));
        y1 :=-round(50*sin(goc1*pi/180));
        hinhtron(x+x1,y+y1,8,yellow);        
        delay(60);

        hinhtron(x,y,20,0);        
        hinhtron(x+x1,y+y1,8,0);

        if goc < 0 then goc := goc + 360;    
        goc := goc - da;
        if goc1 < 0 then goc1 := goc1 + 360;
        goc1 := goc1 - da1;
    until keypressed;
END.

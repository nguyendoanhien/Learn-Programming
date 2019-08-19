Uses crt,graph;
Type
    PointType = Record
                x,y:integer;
                End;

Var
 gd,gm:integer;
 i:integer;
 dagiac: array[1..6] of PointType;
Begin
     gd:=detect;
     InitGraph(gd,gm,'');
     Randomize;
  Repeat
     SetColor(random(GetMaxColor));
     for i:=1 to 5 do
       begin
              dagiac[i].x:=random(getMaxX);
              dagiac[i].y:=random(getMaxy);
       end;
     dagiac[6]:=dagiac[1];
     DrawPoly(6,dagiac);
     Delay(1000);
  Until KeyPressed;
  CloseGraph;
End.
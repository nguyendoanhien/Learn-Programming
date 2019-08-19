USES crt,graph;
VAR i,gm,gd,x,y : integer;

PROCEDURE taodia (VAR TamX,TamY : Integer; Mau : Byte);
BEGIN
   SetColor (Mau);
   Circle (TamX,TamY,10);
   SetFillStyle (1,Mau);
   FloodFill (TamX,TamY,Mau);
END;

BEGIN
   Gd:=VGA; Gm := 1;
   InitGraph (Gd,Gm,'C:\TP60\BGI');
   SetWriteMode (XORPut);
   X := 120; Y := 120;
   SetActivePage (0);
   TaoDia (X,Y,Blue);
   SetVisualPage (0);
   SetBkColor(White);
   For i := 0 To 200 Do
     Begin
       TaoDia (X,Y,White);
       SetActivePage (I MOD 2);
       X := X+2; Y := Y+1;
       TaoDia (X,Y,Blue);
       SetVisualPage (I MOD 2);
       MoveTo (X,Y);
       Delay (700);
     End;
     ReadLn;
     CloseGraph
END.


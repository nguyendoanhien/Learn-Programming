USES crt,graph;
VAR i,gm,gd,x,y : integer;
    tro : Pointer;

PROCEDURE TaoNem (VAR TamX,TamY : Integer;StA,EndA : Integer; Mau,Mau1 : Byte);
BEGIN
   SetColor (Mau);
   SetFillStyle (1,Mau1);
   PieSlice (TamX,TamY,StA,EndA,15);
END;

BEGIN
   Gd:=detect;
   InitGraph (Gd,Gm,'');
   SetWriteMode (CopyPut); SetBkColor(White);
   X := 120; Y := 120;
{   SetActivePage (0);}
   TaoNem (X,Y,0,60,Blue,Red);
   TaoNem (X,Y,60,120,Blue,White);
   TaoNem (X,Y,120,180,Blue,Red);
   TaoNem (X,Y,180,240,Blue,White);
   TaoNem (X,Y,240,300,Blue,Red);
   TaoNem (X,Y,300,360,Blue,White);
   Ellipse (X,Y,0,180,25,14);
   Line (X-50,Y,X-25,Y);
   SetLineStyle (3,0,3);
   Line (5,135,639,135);
   SetLineStyle (0,0,3);
   SetColor (2);
   Line (638,135,638,70);
   GetMem (Tro,ImageSize(637,70,639,135));
   GetImage (637,70,639,135,Tro^);
   SetWriteMode (XorPut);
   Line (638,135,638,70);
   SetWriteMode (CopyPut);
   SetColor (Blue);
   SetLineStyle (0,0,1);
   SetVisualPage (0);
{   SetActivePage (1);}
   TaoNem (X,Y,0,60,Blue,White);
   TaoNem (X,Y,60,120,Blue,Red);
   TaoNem (X,Y,120,180,Blue,White);
   TaoNem (X,Y,180,240,Blue,Red);
   TaoNem (X,Y,240,300,Blue,White);
   TaoNem (X,Y,300,360,Blue,Red);
   Ellipse (X,Y,0,180,25,14);
   Line (X-50,Y,X-25,Y);
   SetLineStyle (3,0,3);
   Line (0,135,639,135);
   SetLineStyle (0,0,3);
   SetColor (Blue);
   SetLineStyle (0,0,1);
   X := X+100;
{   SetActivePage (0);  }
   TaoNem (X,Y,0,60,Blue,Red);
   TaoNem (X,Y,60,120,Blue,White);
   TaoNem (X,Y,120,180,Blue,Red);
   TaoNem (X,Y,180,240,Blue,White);
   TaoNem (X,Y,240,300,Blue,Red);
   TaoNem (X,Y,300,360,Blue,White);
   Line (X-25,Y,X-75,Y);
   Ellipse (X-50,Y,0,180,100,30);
   Ellipse (X,Y,0,180,25,14);
   Line (X+50,Y,X+25,Y);
   SetFillStyle (1,Blue);
   FloodFill (135,105,Blue);
 {  SetVisualPage (0);
   SetActivePage (1);}
   TaoNem (X,Y,0,60,Blue,White);
   TaoNem (X,Y,60,120,Blue,Red);
   TaoNem (X,Y,120,180,Blue,White);
   TaoNem (X,Y,180,240,Blue,Red);
   TaoNem (X,Y,240,300,Blue,White);
   TaoNem (X,Y,300,360,Blue,Red);
   Line (X-25,Y,X-75,Y);
   Ellipse (X-50,Y,0,180,100,30);
   Ellipse (X,Y,0,180,25,14);
   Line (X+50,Y,X+25,Y);
   SetFillStyle (1,Blue);
   FloodFill (135,105,Blue);
   i := 0;
   Repeat
{       SetVisualPage (0);
       SetActivePage (0);}
       PutImage (637-i,70,Tro^,XORPut);
       PutImage (437-i,70,Tro^,XORPut);
       PutImage (237-i,70,Tro^,XORPut);
       Sound (50);
       Delay (30);
       PutImage (637-i,70,Tro^,XORPut);
       PutImage (437-i,70,Tro^,XORPut);
       PutImage (237-i,70,Tro^,XORPut);
       NoSound;
       i := i+5;
{       SetVisualPage (1);
       SetActivePage (1);}
       PutImage (637-i,70,Tro^,XORPut);
       PutImage (437-i,70,Tro^,XORPut);
       PutImage (237-i,70,Tro^,XORPut);
       Sound (50);
       Delay (30);
       PutImage (637-i,70,Tro^,XORPut);
       PutImage (437-i,70,Tro^,XORPut);
       PutImage (237-i,70,Tro^,XORPut);
       i := i+5;
       NoSound;
       If i = 200 Then i := 0;
   Until KeyPressed;
     ReadLn;
     CloseGraph
END.


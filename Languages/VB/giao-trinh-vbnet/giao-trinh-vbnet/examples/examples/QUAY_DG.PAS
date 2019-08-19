Program quay_da_giac;
Uses crt,dohoa;
VAR
  OrdrePoly, Divcote,NbrePoly,i:byte;
  X,Y:table;

Procedure Nhapsolieu;
Begin
 clrscr;
 Writeln(' Da giac quay vong');
 Write(' Cho so bac cua da giac: ');
 Readln(OrdrePoly);
 Write(' Cho so khoang chia tren canh: ');
 Readln(Divcote);
 Write(' Cho so da giac can ve: ');
 Readln(NbrePoly);
End;

Procedure TaoMangToaDo;
Var
 Angle,Pas: real;
Begin
 Angle:=0;
 Pas:=2*pi/OrdrePoly;
 for i:=1 to OrdrePoly do
  begin
   x[i]:=cos(Angle); y[i]:=sin(Angle);
   Angle:=Angle+Pas;
  end;
  i:=i+1;
  x[i]:=x[1];
  y[i]:=y[1];
End;

Procedure TinhDaGiacketiep;
Var
 i:byte;
Begin
 for i:=1 to OrdrePoly do
  begin
   x[i]:=x[i]+ (x[i+1]-x[i]) / Divcote;
   y[i]:=y[i]+ (y[i+1]-y[i]) / Divcote;
  end;
  i:=i+1;
  x[i]:=x[1];
  y[i]:=y[1];
End;

BEGIN
  Nhapsolieu;
  Mhdohoa;
  cuaso(-1,1,-1,1);
  tamnhin(100,540,20,460);
  Taomangtoado;
  for i:=1 to NbrePoly do
  begin
   vedagiac(x,y,OrdrePoly,dong);
   TinhDagiacketiep;
  end;
  cho;
  mhvanban;
END.



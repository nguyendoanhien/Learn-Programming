{ Ve da giac ngau nhien }
Program Da_giac_ngau_nhien;
Uses crt,dohoa;
VAR
  NbreSom,NbrePoly,Diviseur:byte;
  X,Y:table;

Procedure Nhapsolieu;
Begin
 clrscr;
 Writeln(' Quay Da giac ngau nhien');
 Write(' Cho so dinh cua da giac: ');
 Readln(NbreSom);
 Write(' Cho so da giac can ve: ');
 Readln(NbrePoly);
 Write(' Cho so khoang chia  canh: ');
 Readln(Diviseur);
End;

Procedure Khoitao;
Var
 i:byte;
Begin
 Randomize;
 for i:=1 to NbreSom do
  begin
   x[i]:=Int(random(MaxX));
   y[i]:=Int(Random(MaxY));
  end;
  x[NbreSom+1]:=x[1];
  y[NbreSom+1]:=y[1];
End;

Procedure Ve;
Var
 i:byte;

 Procedure TinhDaGiacketiep;
 Var
  i:byte;
 Begin
  for i:=1 to NbreSom do
   begin
    x[i]:=x[i]+ (x[i+1]-x[i]) / Diviseur;
    y[i]:=y[i]+ (y[i+1]-y[i]) / diviseur;
   end;
   x[NbreSom+1]:=x[1];
   y[NbreSom+1]:=y[1];
 End;

Begin
 For i:=1 to NbrePoly do
  begin
    Vedagiac(x,y,NbreSom+1,dong);
    delay(200);
    Tinhdagiacketiep;
  end;
End;

BEGIN
  Nhapsolieu;
  Mhdohoa;
  cuaso(0,MaxX,0,MaxY);
  tamnhin(0,MaxX,0,MaxY);
  KhoiTao;
  Ve;
  cho;
  mhvanban;
END.



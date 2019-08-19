{ Ve do thi: tong hop 2 giao dong dieu hoa}
uses crt,Graph,dohoa;
const pas=0.02;
var f1,f2,a1,a2,D,B,P,X:real;
    cy:integer; { be rong cua_so 1,2 }

PROCEDURE NhapSolieu;
Begin
 clrscr;
 Writeln ('------------ TONG HOP 2 GIAO DONG ------------');
 GotoXY(1,10); Write('Giao dong 1: bien do, tan so');
 readln(F1,A1); { hay thu voi: 5,1}
 GotoXY(1,14); Write('Giao dong 2: bien do, tan so, do lech pha');
 readln(F2,A2,D); { hay thu voi: 3, 1, 3.14}
 { thu voi f1=f2, d=0: -> do lech pha =0}
End;

FUNCTION Func1(X:real) : real;
 Begin
  Func1:=A1*sin(F1*x);
 End;

FUNCTION Func2(X:real) : real;
 Begin
  Func2:=A2*sin(F2*x+D);
 End;
FUNCTION FuncSum(X:real) : real;
 Begin
  FuncSum:=Func1(x)+Func2(x);
 End;

PROCEDURE VeHam1;
 Begin
  Cuaso(0,2*pi,-A1,A1);
  TamNhin(10,getmaxX-10,3*cy,4*cy);
  Truc; DoDo(1,0);
  x:=0;mausac(white);
  Diem(x,Func1(x));
  Repeat
   x:=x+Pas;
   Veden(x,func1(x));
  Until x>=2*pi;
 End;

PROCEDURE VeHam2;
 Begin
  Cuaso(0,2*pi,-A2,A2);
  TamNhin(10,getmaxX-10,2*cy,3*cy);
  Truc; DoDo(1,0);
  x:=0;mausac(Green);
  Diem(x,Func2(x));
  Repeat
   x:=x+Pas;
   Veden(x,func2(x));
  Until x>=2*pi;
 End;

PROCEDURE VeHamTong;
 Begin
  Cuaso(0,2*pi,-A1-A2,A1+A2);
  TamNhin(10,getmaxX-10,0,2*cy);
  Truc; DoDo(1,0);
  x:=0;mausac(Magenta);
  Diem(x,FuncSum(x));
  Repeat
   x:=x+Pas;
   Veden(x,FuncSum(x));
  Until x>=2*pi;
 End;

BEGIN

 NhapSolieu; Mhdohoa;
 cy:=getmaxY div 4;
 Veham1; Cho;
 Veham2; Cho;
 VehamTong;Cho;
{ TamnhinDay;
 Cho;           }
 Mhvanban;
END.

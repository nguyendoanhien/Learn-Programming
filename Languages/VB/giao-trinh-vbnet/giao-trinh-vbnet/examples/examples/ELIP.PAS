PROGRAM elip;
USES crt,graph,dohoa3d;
CONST incang=12;
      incro=1.5;
      incmh=30;
VAR u,ud,uf,du:real;
    v,vd,vf,dv:real;
    c,k:byte;
FUNCTION f1x(u,v:real):real;
BEGIN
     f1x:=5*cos(u)*cos(V)
END;
FUNCTION f1y(u,v:real):real;
BEGIN
     f1y:=3*cos(u)*sin(v);
END;
FUNCTION f1z(u,v:real):real;
BEGIN
     f1z:=2*sin(u);
END;
PROCEDURE khoitao;
BEGIN
     ud:=-1.5;uf:=1.5;du:=0.15;
     vd:=-3.14;vf:=3.14;dv:=0.15;
     chieu:=phoicanh;
     ro:=10;
     teta:=0;
     phi:=0;
     de:=400;
END;
PROCEDURE hoduongcongu1;
VAR x,y,z:real;
BEGIN
    setcolor(WHITE);
    u:= ud;WHILE u<=uf DO
       BEGIN
          v:=vd;
          x:=f1x(u,v);
          y:=f1y(u,v);
          z:=f1z(u,v);
          diem(x,y,z);
          WHILE v<=vf DO
           BEGIN
               x:=f1x(u,v);
               y:=f1y(u,v);
               z:=f1z(u,v);
               veden(x,y,z);
               v:=v+dv;
           END;
           u:=u+du;
       END;
END;
PROCEDURE hoduongcongv1;
VAR  x,y,z:real;
BEGIN
     v:=vd;setcolor(9);
     WHILE v<=vf DO
       BEGIN
               u:=ud;
               x:=f1x(u,v);
               y:=f1y(u,v);
               z:=f1z(u,v);
               diem(x,y,z);
               WHILE u<=uf DO
                 BEGIN
                    x:=f1x(u,v);
                    y:=f1y(u,v);
                    z:=f1z(u,v);
                    veden(x,y,z);
                    u:=u+du;
                 END;
                v:=v+dv;
        END;
END;
PROCEDURE thongbao;
VAR s1,s2,s3,s4,s5,s6,s7,s8,s9,s10:STRING;
BEGIN
      SETCOLOR(4);
      IF chieu=songsong THEN s1:='Vo cung'
                           ELSE str(ro:3:1,s1);
      str(teta:4:1,s2);str(phi:4:1,s3);str(de:4:1,s4);
      str(ud:4:2,s5);str(uf:4:2,s6);str(du:4:2,s7);
      str(vd:4:2,s8);str(vf:4:2,s9);str(dv:4:2,s10);
      settextstyle(smallfont,horizdir,5);
      outtextxy(10,450,'RO=  '+s1+'  TETA ='+s2+'  PHI='+s3+'   DO PHONG ='+s4+'  U=['+s5+','+s6+'] V=['+
                         s8+','+s9+']')
END;
PROCEDURE danhbong(x,y:integer;st:string);
VAR m:integer;
BEGIN
   FOR m:=1 TO 7 DO
     BEGIN
       setcolor(2);
       settextstyle(0,0,3);
       outtextxy(x+m,y-m,st);
     END;
      setcolor(4);
      settextstyle(0,0,3);
      outtextxy(x,y,st);
END;
PROCEDURE tomau(var tx,ty:integer; mau:byte);
BEGIN
   setwritemode(2);
   setcolor(mau);
   setfillstyle(1,mau);
   floodfill(tx,ty,mau);
END;
PROCEDURE lenh;
const ropara=1e20;
VAR ros,des,depara:real;
    ch:char;
BEGIN
     khoitao;
     khoitaochieu;
     depara:=50;
     setcolor(5);
     hoduongcongu1;
     hoduongcongv1;
     thongbao;
     REPEAT
          ch:=readkey;
          IF ch=#0 THEN ch:=readkey;
          cleardevice;
          CASE ord(upcase(ch)) OF
               72:phi:=phi+incang;
               80:phi:=phi-incang;
               75:teta:=teta-incang;
               77:teta:=teta+incang;
               69:ro:=ro+incro;
               65:ro:=ro-incro;
               43:de:=de+incmh;
               45:de:=de-incmh;
               67:IF chieu=phoicanh
                   THEN
                     BEGIN
                       ros:=ro;
                       des:=de;
                       chieu:=songsong;
                       ro:=ropara;
                       de:=depara;
                     END
                   ELSE
                     BEGIN
                        depara:=de;
                        chieu:=phoicanh;
                        ro:=ros;
                        de:=des;
                     END;
          END;
         khoitaochieu;
         hoduongcongu1;
         hoduongcongv1;
         thongbao;
     UNTIL ch=#27;
      mhvanban
   END;
 BEGIN
    mhdohoa;
    setbkcolor(10);
    tamnhin(0,maxx,0,maxy);
    khoitao;
    lenh;
END.


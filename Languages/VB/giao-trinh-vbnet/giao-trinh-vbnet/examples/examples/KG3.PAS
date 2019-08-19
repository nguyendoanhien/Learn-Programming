PROGRAM lapphuong;
USES crt,graph,dohoa3d;
CONST incang=6;
      incro=0.5;
      incmh=20;
      sm=6;
      sd=4;
VAR   d:array [1..8,1..3] of real;
      q:array[1..8,1..8] of boolean;
      ch:char;
      m:array [1..sm,0..sd] of integer;
      O1,O2,O3:REAL;
      po:boolean;
      x3,y3,z3,x1,y1,z1,x2,y2,z2,a,b,c:real;
PROCEDURE danhbong(x,y,m:integer;st:string);
VAR k:integer;
BEGIN
   FOR k:=1 TO 5 DO
     BEGIN
       setcolor(14);
       outtextxy(x+k,y-k,st);
     END;
      setcolor(m);
      outtextxy(x,y,st);

END;
PROCEDURE khoitao;
BEGIN
     chieu:=phoicanh;
     ro:=5;
     teta:=0;
     phi:=0;
     de:=400;po:=true;
END;
PROCEDURE tdqs;
BEGIN
     khoitaochieu;
     o1:=ro*hs7;o2:=ro*hs8;o3:=ro*hs2;
END;
PROCEDURE doclp;
BEGIN
      d[1,1]:=1;d[1,2]:=1;d[1,3]:=1;
      d[2,1]:=1;d[2,2]:=-1;d[2,3]:=1;
      d[3,1]:=1;d[3,2]:=-1;d[3,3]:=-1;
      d[4,1]:=1;d[4,2]:=1;d[4,3]:=-1;
      d[5,1]:=-1;d[5,2]:=1;d[5,3]:=-1;
      d[6,1]:=-1;d[6,2]:=-1;d[6,3]:=-1;
      d[7,1]:=-1;d[7,2]:=-1;d[7,3]:=1;
      d[8,1]:=-1;d[8,2]:=1;d[8,3]:=1;
END;
PROCEDURE nhapmat;
BEGIN
     m[1,0]:=4;m[1,1]:=1;m[1,2]:=2;m[1,3]:=3;m[1,4]:=4;
     m[2,0]:=4;m[2,1]:=1;m[2,2]:=4;m[2,3]:=5;m[2,4]:=8;
     m[3,0]:=4;m[3,1]:=1;m[3,2]:=8;m[3,3]:=7;m[3,4]:=2;
     m[4,0]:=4;m[4,1]:=2;m[4,2]:=7;m[4,3]:=6;m[4,4]:=3;
     m[5,0]:=4;m[5,1]:=3;m[5,2]:=6;m[5,3]:=5;m[5,4]:=4;
     m[6,0]:=4;m[6,1]:=5;m[6,2]:=6;m[6,3]:=7;m[6,4]:=8;
END;
PROCEDURE tomau(var tx,ty:integer; mau:byte);
BEGIN
   setcolor(mau);
   setfillstyle(1,mau);
   floodfill(tx,ty,mau);
END;
PROCEDURE vtnhin(s1,s2,s3:integer;var v1,v2,v3:real);
BEGIN
     v1:=o1-d[s1,1];v2:=o2-d[s1,2];v3:=o3-d[s1,3];
END;
PROCEDURE vtchuan(s1,s2,s3:integer;var n1,n2,n3:real);
VAR p1,p2,p3,q1,q2,q3:real;
BEGIN
    p1:=d[s2,1]-d[s1,1];
    p2:=d[s2,2]-d[s1,2];
    p3:=d[s2,3]-d[s1,3];
    q1:=d[s3,1]-d[s1,1];
    q2:=d[s3,2]-d[s1,2];
    q3:=d[s3,3]-d[s1,3];
    n1:=p2*q3-q2*p3;
    n2:=p3*q1-q3*p1;
    n3:=p1*q2-q1*p2;
END;
FUNCTION tvhuong(v1,v2,v3,n1,n2,n3:real):real;
BEGIN
     tvhuong:=v1*n1+v2*n2+v3*n3;
END;
PROCEDURE  velp;
VAR i,j,s1,s2,s3,ns,n:integer;
    v1,v2,v3,n1,n2,n3:real;
    x,y,z,xo,yo,zo,xc,yc,xos,yos,zos:real;
    xh,yh:integer;
    PROCEDURE ve;
    VAR s:integer;
    BEGIN
         ns:=m[i,0];
         FOR s:=1 TO ns DO
         BEGIN
           n:=m[i,s];
           x:=d[n,1];
           y:=d[n,2];
           z:=d[n,3];
           IF s=1 THEN   BEGIN
                           diem(x,y,z);
                           xo:=x;yo:=y;zo:=z;
                          END
                  ELSE  veden(x,y,z)   ;
         END;
         veden(xo,yo,zo);
    END;
BEGIN
     FOR i:=1 TO 6 DO
     BEGIN
      s1:=m[i,1];s2:=m[i,2];s3:=m[i,3];
      vtnhin(s1,s2,s3,V1,v2,v3);
      vtchuan(s1,s2,s3,n1,n2,n3);
      IF tvhuong(v1,v2,v3,n1,n2,n3)>0  THEN
          BEGIN
             setlinestyle(0,0,1);
             CASE i OF
               1:setcolor(14);
               2:setcolor(10);
               3:setcolor(9);
               4:setcolor(5);
               5:setcolor(12);
               6:setcolor(7);
            END;
             ve;
             x3:=d[s1,1];y3:=d[s1,2];z3:=d[s1,3];
             x1:=d[s2,1];y1:=d[s2,2];z1:=d[s2,3];
             x2:=d[s3,1];y2:=d[s3,2];z2:=d[s3,3];
             a:=(x3+x1+x2)/3;b:=(y3+y1+y2)/3;c:=(z3+z1+z2)/3;
             khoitaochieu;
             xos:=-a*hs1+b*hs3;
             yos:=-a*hs5-b*hs6+c*hs4;
             zos:=-a*hs7-b*hs8-c*hs2+ro;
             IF chieu=phoicanh THEN
                BEGIN
                 xc:=de*xos/zos;
                 yc:=de*yos/zos;
                END
              ELSE
                BEGIN
                 xc:=de*xos;
                 yc:=de*yos;
                END;
             xh:=round(xc*tyle+maxx div 2);
             yh:=round((maxy div 2) - yc);
             CASE i OF
               1:tomau(xh,yh,14);
               2:tomau(xh,yh,10);
               3:tomau(xh,yh,9);
               4:tomau(xh,yh,5);
               5:tomau(xh,yh,12);
               6:tomau(xh,yh,7);

             END;
          END
       ELSE IF po THEN
               BEGIN
                  setlinestyle(1,0,1);
                  setcolor(9);
                  ve;
               END;
     END;
END;
PROCEDURE  thongbao;
VAR k1,k2,k3,k4:string;
BEGIN
   tamnhin(0,maxx,0,15);
   setcolor(14);
   clearviewport;
   settextstyle(smallfont,horizdir,5);
   str(teta:3:1,k2);
   str(phi:3:1,k3);
   str(de:4:1,k4);
   IF chieu=phoicanh
     THEN
       BEGIN
         str(ro:3:1,k1);
         outtextxy(90,1,'CHIEU PHOI CANH RO= '+k1+'  TETA= '+k2+'  PHI= '+k3+'  DO PHONG ANH= '+k4);
       END
         ELSE
            outtextxy(90,1,'CHIEU PHOI CANH:RO= '+k1+' TETA= '+k2+' PHI= '+k3+'  DO PHONG ANH= '+k4);
      tamnhin(0,maxx,0,maxy)
END;
PROCEDURE  lenh;
CONST ropara=1e20;
VAR ros,des,depara:real;
    ch:char;
BEGIN
     khoitao;
     khoitaochieu;
     depara:=50;
     tdqs;
     velp;
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
         tdqs;
         velp;
         thongbao;
     UNTIL upcase(ch)='F';
      mhvanban
   END;
PROCEDURE  trinhbay;
VAR i:integer;
BEGIN
   setcolor(10);
   settextstyle(0,0,2);
   outtextxy(45,10,'        TRUONG DAI HOC QUOC GIA');
   setcolor(10);
   outtextxy(45,30,'    TRUONG DAI HOC SU PHAM HA NOI I');
   outtextxy(45,50,'          KHOA:TOAN-TIN         ');
   settextstyle(1,0,2);
   setcolor(4);
   OUTTEXTXY(70,240,'     DE TAI: DO HOA TRONG KHONG GIAN THUC');
   line(120,253,125,253);
   outtextxy(133,233,'^');
   line(138,236,141,240);
   line(171,239,173,243);
   line(200,253,205,253);
   settextstyle(4,0,1);
   outtextxy(212,234,'^');
   line(218,239,223,243);
   outtextxy(252,245,'.');   outtextxy(212,234,'^');
   outtextxy(383,234,'^');
   outtextxy(525,225,',');
   outtextxy(518,245,'.');
   setcolor(12);
   outtextxy(20,330,'          Nguoi viet                 Giao vien huong dan');
   setcolor(9);
   outtextxy(20,350,'         Ngo Tuan Anh             Nguyen Vu Quoc Hung');
   FOR i:=1 TO 10 DO
   BEGIN
     settextstyle(0,0,4);
     danhbong(70,130,lightred,'    LUAN VAN');
     settextstyle(0,0,6);
     danhbong(0,180,9,'  TOT NGHIEP');
   END;
END;
BEGIN
    mhdohoa;
    setbkcolor(white);
    tamnhin(0,maxx,0,maxy);
    trinhbay;{delay(5000)};cleardevice;
    setbkcolor(0);{white);}
    doclp;
    nhapmat;
    khoitao;
    lenh
END.


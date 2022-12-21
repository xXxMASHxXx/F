GS 
t=0:0.001:3;
s1=sqrt(2).*(t>=0 & t<=2);
subplot(2,2,1);
plot(t,s1);
xlabel('t');
ylabel('s1(t)');
title("s1(t)(ECE20XXX)");
grid;
s2=1.*(t>=0 & t<=1)+(-1.*(t>1&t<=2));
subplot(2,2,2);
plot(t,s2);
xlabel('t');
ylabel('s2(t)');
title("s2(t)(ECE20XXX)");
grid;
e1=@(t)(sqrt(2))^2.*(t>=0 & t<=2);
E1=integral(e1,0,2);
b1=s1/sqrt(E1);
subplot(2,2,3);
plot(t,b1);
grid;
xlabel('t');
ylabel('b1(t)');
title("First basis psi-1 function(ECE20109)");
grid;
e2=@(t)((1)^2).*(t>=0 & t<=1) + ((-1)^2).*(t>=1 & t<=2);
E2=integral(e2,0,2);
grid;
s2e1 =@(t)((1).*(t<=1)+(-1.*(t>1&t<=2))).*(sqrt(2)/2);
c21=round(integral(s2e1,0,2));
d2 = s2-(c21.*b1);
b2=d2/sqrt(E2);
subplot(2,2,4);
plot(t,b2);
grid;
xlabel('t');
ylabel('b2(t)');
title("Second basis psi-2 function(ECE20XXX)");
s1b1=@(t)(sqrt(2).*(t>=0 & t<=2)).*(sqrt(2)/2);
C11 = round(integral(s1b1,0,2))
s1b2=@(t)(sqrt(2).*(t>=0 & t<=2)).*((sqrt(2)/2).*(t>=0&t<=1)+((-sqrt(2)/2).*(t>1&t<=2)));
C12 = round(integral(s1b2,0,2))
s2b1=@(t)((1).*(t<=1)+(-1.*(t>1&t<=2))).*(sqrt(2)/2);
C21=round(integral(s2b1,0,2))
s2b2=@(t)((1).*(t<=1)).*(sqrt(2)/2)+((-1).*(t>1&t<=2)).*(((-sqrt(2)/2).*(t>1&t<=2)));
C22=integral(s2b2,0,2)
figure;
plot(C11,C12,'o');
grid;
xlabel('w1');
ylabel('w2');
title("Vector Representation of s1(t)(ECE20XXX)");
figure;
plot(C21,C22,'o');
grid;
xlabel('w1');
ylabel('w2');
title("Vector Representation of s2(t)(ECE20XXX)");
 
 
 
EYE PATTERN
clc;
clear;
close;
data=randi([0 3],1000,1);
modSig=pskmod(data,4,pi/4);
sps=4;
txfilter=comm.RaisedCosineTransmitFilter('OutputSamplesPerSymbol',sps);
txsig=txfilter(modSig);
eyediagram(txsig,2*sps);

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
title("First basis psi-1 function(ECE20XXX)");
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
C11 = round(integral(s1b1,0,2));
s1b2=@(t)(sqrt(2).*(t>=0 & t<=2)).*((sqrt(2)/2).*(t>=0&t<=1)+((-sqrt(2)/2).*(t>1&t<=2)));
C12 = round(integral(s1b2,0,2));
s2b1=@(t)((1).*(t<=1)+(-1.*(t>1&t<=2))).*(sqrt(2)/2);
C21=round(integral(s2b1,0,2));
s2b2=@(t)((1).*(t<=1)).*(sqrt(2)/2)+((-1).*(t>1&t<=2)).*(((-sqrt(2)/2).*(t>1&t<=2)));
C22=integral(s2b2,0,2);
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

 
 
 
 PCM 
 
clc;
clear all;
b=input('Enter Quantization Interval:: ');
t = 0:0.0005:10;

% Representation of the Message Signal
x = sin(t);
subplot(3,1,1);
plot(t,x,'black');
title('Message Signal');
xlabel('Time(s) ---->')
ylabel('Amplitude(V) ---->')
legend('Message Signal ---->');
grid on

% Representation of the Quantized Signal
partition = -1:0.1:b;
codebook = -1:0.1:(b+0.1);
[index,quants] = quantiz(x,partition,codebook);
subplot(3,1,2);
plot(t,quants);
title('Quantized Signal');
xlabel('Samples ---->')
ylabel('Amplitude(V) ---->')
legend('Quantized Signal ---->');
grid on

% Representation of the PCM Signal
y = uencode(quants,3);
subplot(3,1,3);
plot(t,y,'red');
title('PCM Signal');
xlabel('Samples ---->');
ylabel('Amplitude(V) ---->')
legend('PCM Signal ---->');
grid on

% Add title to the Overall Plot
ha = axes ('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
text (0.5, 1,'\bf Pulse Code Modulation ','HorizontalAlignment','center','VerticalAlignment', 'top')


BER
clc;
clear;
close;
sig_length=200000;
Eb=1;
EtoN_dB=linspace(0,20,100);
EtoN=10.^(EtoN_dB/10);

BER_BASK_te=((0.5)*erfc(sqrt(EtoN/4)));
BER_BPSK_te=((0.5)*erfc(sqrt(EtoN)));

semilogy(EtoN_dB,BER_BASK_te,'red')
hold on
semilogy(EtoN_dB,BER_BPSK_te,'blue')
legend('BASK','BPSK')
axis([min(EtoN_dB) max(EtoN_dB) 10^(-6) 1])
xlabel('Eb/No (dB)')
ylabel('BER')
title('Plot for BASK and BPSK')
 
 
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

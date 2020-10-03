clc;
clear;
am=4;
fc = 20;






fm =2;
fs = 1000;
t=1;



n = [0:1/fs:t];
n = n(1:end-1);
dutycycle = 50;
s = square(2*pi*fc*n,dutycycle);
s(find(s<0))=0; 
m = am   *   sin(2*pi*fm*n);

period_sam = length(n)/fc; 
ind = 1:period_sam:length(n); 
on_samp = ceil(period_sam * dutycycle/100); 



pam = zeros(1,length(n));
for i =1:length(ind)
    pam(ind(i):ind(i)+on_samp) = m(ind(i));
end
pam(find(pam<=0))=0;
subplot(3,1,1);
plot(n,s);

ylim([-0.2 1.2]);
subplot(3,1,2);
plot(n,m,'r');


ylim([-4.2 2*am+1]);
subplot(3,1,3);
plot(n,pam,'g');
ylim([-4.2 2*am+1]);
hold on;
plot(n,m,'m');
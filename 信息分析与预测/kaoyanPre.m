clc;clear;

[data,TEXT,RAW]=xlsread('C:\Users\����ͬѧ\Desktop\ky1.xlsx');%��������
Y1=data(:,2)'
year=1995:2020; %δ������
b1=sum(((year(1:23)-1995)-mean(year(1:23)-1995)).*(Y1-mean(Y1)))/sum(((year(1:23)-1995)-mean((year(1:23)-1995))).^2)
a1=mean(Y1)-b1*mean((year(1:23)-1995))
YY1=a1+b1.*([year-1995]) %Ԥ�ⱨ������
Y2=data(1:end,4)'
b2=sum(((year(1:23)-1995)-mean(year(1:23)-1995)).*(Y2-mean(Y2)))/sum(((year(1:23)-1995)-mean((year(1:23)-1995))).^2)
a2=mean(Y2)-b2*mean(year(1:23)-1995)
YY2=a2+b2.*([year-1995]) %Ԥ��¼ȡ����

MSE=sum((Y1-YY1(1:23)).^2)/23%ʣ�෽��
MSE=sum((Y2-YY2(1:23)).^2)/23

S1=sum((Y1(20:23)-YY1(20:23)).^2)/4%ʣ�෽��
S2=sum((Y2(20:23)-YY2(20:23)).^2)/4%ʣ�෽��

R=corrcoef(Y1(20:23),YY1(20:23))
R2=corrcoef(Y2(20:23),YY2(20:23))
plot(year,YY1,'r-s')
hold on 
plot(year(1:23),data(:,2),'g-d')%ʵ������
plot(year(1,1:23),Y2,'m-p')
plot(year,YY2,'b-h')
xlabel('���')
ylabel('����(��)')
legend('Ԥ�ⱨ������','ʵ�ʱ�������','ʵ��¼ȡ����','Ԥ��¼ȡ����')
set(gca,'XTick',[1995:1:2020])
grid on
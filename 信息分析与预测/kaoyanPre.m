clc;clear;

[data,TEXT,RAW]=xlsread('C:\Users\万琴同学\Desktop\ky1.xlsx');%导入数据
Y1=data(:,2)'
year=1995:2020; %未来三年
b1=sum(((year(1:23)-1995)-mean(year(1:23)-1995)).*(Y1-mean(Y1)))/sum(((year(1:23)-1995)-mean((year(1:23)-1995))).^2)
a1=mean(Y1)-b1*mean((year(1:23)-1995))
YY1=a1+b1.*([year-1995]) %预测报考人数
Y2=data(1:end,4)'
b2=sum(((year(1:23)-1995)-mean(year(1:23)-1995)).*(Y2-mean(Y2)))/sum(((year(1:23)-1995)-mean((year(1:23)-1995))).^2)
a2=mean(Y2)-b2*mean(year(1:23)-1995)
YY2=a2+b2.*([year-1995]) %预测录取人数

MSE=sum((Y1-YY1(1:23)).^2)/23%剩余方差
MSE=sum((Y2-YY2(1:23)).^2)/23

S1=sum((Y1(20:23)-YY1(20:23)).^2)/4%剩余方差
S2=sum((Y2(20:23)-YY2(20:23)).^2)/4%剩余方差

R=corrcoef(Y1(20:23),YY1(20:23))
R2=corrcoef(Y2(20:23),YY2(20:23))
plot(year,YY1,'r-s')
hold on 
plot(year(1:23),data(:,2),'g-d')%实际人数
plot(year(1,1:23),Y2,'m-p')
plot(year,YY2,'b-h')
xlabel('年份')
ylabel('人数(万)')
legend('预测报考人数','实际报考人数','实际录取人数','预测录取人数')
set(gca,'XTick',[1995:1:2020])
grid on
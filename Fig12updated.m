clc
clear
x={'one-failure','two-failure','three-failure','four-failure','five-failure','six-failure'};
sensor1=xlsread('fig10','link 2');
sensor2=xlsread('fig10','7l');
sensor3=xlsread('fig10','link 8');
sensor4=xlsread('fig10','link 11');
sensor5=xlsread('fig10','link 12');
sensor6=xlsread('fig10','link 18');
figure

plot(sensor1);
hold on

plot(sensor2);
hold on
plot(sensor3);
hold on
plot(sensor4);
hold on
plot(sensor5);
hold on
plot(sensor6);
set(gca,'XTick',1:6,'XTickLabel',x)

x={'2','7','8','11','12','18'};
sensor1=xlsread('fig10','sheet2');
sensor2=xlsread('fig10','sheet3');
sensor3=xlsread('fig10','sheet4');
sensor4=xlsread('fig10','sheet5');
sensor5=xlsread('fig10','sheet6');
sensor6=xlsread('fig10','sheet7');
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

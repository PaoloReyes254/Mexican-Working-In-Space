clear
clc
close all

%Independent variables
Agencies = true;
NumberOfAgencies = 2;
Average = 2;
AEM = true;

%Dependent variable
MexicansWorking = 0;

%Program variables
ts = 0.1;
tf = 10;
t = 0:ts:tf;
Q = length(t);
points = zeros(1,Q);
Setpoint = 0;
error = 0;
sumError = 0;
Ki = Average*(NumberOfAgencies+1)*0.03;

disp("Beggining Calculations");

if AEM == true && Agencies == false
    Setpoint = round(Average*50*1.5);
elseif Agencies == true && AEM == false
    Setpoint = round(Average*50*(NumberOfAgencies+1));
elseif AEM == true && Agencies == true
    Setpoint = round(Average*50*(NumberOfAgencies+1)*(1+(0.5/(NumberOfAgencies/2))));
else 
    Setpoint = Average*50;
end

for i = 1:Q
    points(i) = sumError;
    error = Setpoint-points(i);
    sumError = sumError + (error*ts*Ki);
end

disp("Calculations Finished");
plot(t, points, 'r-', 'LineWidth',2);
grid on;
xlabel("Years");
ylabel("Mexicans");
title("Mexicans working on Space Exploration through time");
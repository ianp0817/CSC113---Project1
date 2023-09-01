% Name(s): Ian Patrick & Jessica Bivens
% Email(s): impatric@ncsu.edu & jmbivens@ncsu.edu
% Date: 9/4/23
% Lab Section: 204
% Project 1: Healthy Poverty Analysis, Fall 2023
clc ; clear ; close('all');


%% Importing Files

% imports files
MS = readmatrix("MS_Health_2023.xlsx");
NC = readmatrix("NC_Health_2023.xlsx");
WA = readmatrix("WA_Health_2023.xlsx");

%% Switch Case
% hard-coded for now, will fix later
state = MS;

%% 2.3: Analyzing the Data and Printing
% A: Calculate the Poor Health/Unemployment/HS Graduation rate
% for the selected state:

% average, min, and max for poor health
avgPoorHealth = mean(state(:,3));
minPoorHealth = min(state(:,3));
maxPoorHealth = max(state(:,3));

% average, min, and max for Unemployment
avgUnemployment = mean(state(:,10));
minUnemployment = min(state(:,10));
maxUnemployment = max(state(:,10));

% average, min, and max for Graduation
avgGraduation = mean(state(:,8));
minGraduation = min(state(:,8));
maxGraduation = max(state(:,8));

% calculating correlation coefficients between reported rates
PH_CP = corrcoef(state(:,3), state(:,11));PH_CP = PH_CP(1,2);
SC_CP = corrcoef(state(:,10), state(:,11));SC_CP = SC_CP(1,2);
UI_CP = corrcoef(state(:,7), state(:,11));UI_CP = UI_CP(1,2);

%% Display module


disp("        Statistics:")
disp("  Poor Health Rate:   "+avgPoorHealth+",  " + minPoorHealth)
disp(" Unemployment Rate:   ")
disp("HS Graduation Rate:   ")

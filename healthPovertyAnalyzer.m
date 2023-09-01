% Name(s): Ian Patrick & Jessica Bivens
% Email(s): impatric@ncsu.edu & jmbivens@ncsu.edu
% Date: 9/4/23
% Lab Section: 204
% Project 1: Healthy Poverty Analysis, Fall 2023
clc ; clear ; close('all');


%% Switch Case

% Prints user options
disp("Pick a State to Analyze:")
disp("(1) Mississippi"+newline+"(2) North Carolina"+newline+"(3) Washington"+newline)

% Grab user input and sets it as the state
uin = input("Selection: ");

% clears screen
clc;

%% 2.2: Load the input data
% imports files using if statements to check user input

    % if the user types 1 code will run with state set as Misssissippi
if uin == 1
    state = readmatrix("MS_Health_2023.xlsx");
    stateName = "Mississippi";

    % if the user types 2 code will run with state set as North Carolina
elseif uin == 2
    state = readmatrix("NC_Health_2023.xlsx");
    stateName = "North Carolina";

    % if the user types 3 code will run with state set as Washington
elseif uin ==3 
    state = readmatrix("WA_Health_2023.xlsx");
    stateName = "Washington";

    % catches if the user inputs an invalid number
else 
    error("You have entered an invalid input. Please try again, but follow instructions this time.")
end

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

% B: calculating correlation coefficients between reported rates
PH_CP = corrcoef(state(:,3), state(:,11));PH_CP = PH_CP(1,2);
SC_CP = corrcoef(state(:,9), state(:,11));SC_CP = SC_CP(1,2);
UI_CP = corrcoef(state(:,7), state(:,11));UI_CP = UI_CP(1,2);
AS_CP = corrcoef(state(:,4), state(:,11));AS_CP = AS_CP(1,2);

% Display module

    % displays header for section
disp(newline+"Analyzing data for " + stateName + "....."+newline)
disp("        Statistics:    Avg,    Min,  Max   ")
disp("******************************************************")

    % Displays poor health rate, unemployment rate, and HS graduation rate
% statistics
disp("  Poor Health Rate:   "+avgPoorHealth+",  " +minPoorHealth+",  " +maxPoorHealth)
disp(" Unemployment Rate:   "+avgUnemployment+",  " +minUnemployment+",  " +maxUnemployment)
disp("HS Graduation Rate:   "+avgGraduation+",  " +minGraduation+",  " +maxGraduation)
disp("******************************************************")

    % Displays calculated correlations between poor health, some college,
% uninsured, and children poverty
disp("Calculated Correlations:")
disp(" Poor Health and Children Poverty (PH-CP):   "+PH_CP)
disp("Some College and Children Poverty (SC-CP):   "+SC_CP)
disp("   Uninsured and Children Poverty (UI-CP):   "+UI_CP)
disp("******************************************************")

%% 2.4: Plotting
% A: Figure #1- shows various measures in terms of Children in Poverty

    % Subplot #1- shows adult smokers rate vs. children in poverty rate as
    % data points
nexttile
plot(state(:,4),state(:,11),"blue *")
xlabel("Adult Smokers Rate")
ylabel("Children in Poverty Rate")

    % Subplot #2- Plots some college rate vs. children in poverty rate as
    % data points
nexttile
plot(state(:,9),state(:,11),"red diamond")
xlabel("Some College Rate")
ylabel("Children in Poverty Rate")

    % Subplot #3- Plots some uninsured rate vs. children in poverty rate as
    % data points
nexttile
plot(state(:,7),state(:,11),"magenta o")
xlabel("Uninsured Rate")
ylabel("Children in Poverty Rate")

    % Plots some college vs. children in poverty vs. uninsured correlation
    % as a bar graph
nexttile
hold on

    % Set colors for bars
bar(1,AS_CP, "blue"); bar(2,SC_CP, "red"); bar(3,UI_CP, "magenta")

    % Set title and legend for bar graph
title("Correlations")
legend("Adult Smoker", "Some College", "Uninsured")

% Figure 2- shows a count of uninsured rates

    % creating array of uninsured values
ui = state(:,7);

    % Binning the array into separate arrays and calculating their lengths
ui10 = ui(ui < 10);ui10 = length(ui10);
ui20 = ui((ui > 10) & (ui < 20));ui20 = length(ui20);
ui30 = ui((ui > 20) & (ui < 30));ui30 = length(ui30);
ui30p = ui(ui>30);ui30p = length(ui30p);

    % assigns the values into an array that can be put into a bar graph
uiarray = [ui10 ui20 ui30 ui30p];

    % creates uninsured rates data bar graph
figure
bar(uiarray)
grid on

    % label axis
title(sprintf("Uninsured rates in %s", stateName))
ylabel("# of Counties")
xticklabels({'less 10%', '10% - 20%', '20% - 30%', 'more 30%'})




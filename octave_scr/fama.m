function fama

clear all; % clear data from Octave
close all; % close all open plot windows
 
% Load Fama-French Data
ff_data = load('25_Portfolios_5x5_monthly.txt');
 
% Starting point changed to January 1932 to avoid missing data
ff_data = ff_data(67:end,:); % start after NAs end
 
% Remove date column
r = ff_data(:,2:end);
 
% Prompt for User Input to get plotting range
startyear = input('Enter Starting Year between 1932 and 2010: ')
startmonth = input('Enter Starting Month 1-12: ')
endyear = input('Enter Ending Year between 1932 and 2009: ')
endmonth = input('Enter Ending Month 1-12: ')
plottitle = input('Enter Title for Plot: ','s')
 
% Calculate starting and ending row
start = 12*(startyear - 1932) + startmonth;
endpoint = 12*(endyear-1932) + endmonth;
 
% Extract Desired Data
r = r(start:endpoint,:);
 
% Calculate Arithmetic Mean for each of 25 portfolios over range
arithmeans = mean(r);
 
% Calculate Geometric Mean for each of 25 portfolios over selected range
georeturns = r./100 + 1;
geomeans = 100*(exp(mean(log(georeturns)))-1);
 
% Select if Geometric or Arithmetic mean is used by adjusting comments
%meanreturns = arithmeans; % uncomment to use arithmetic means
meanreturns = geomeans; % uncomment to use geometric means
 
% Expand 5x5 data to 10x10 for use in surface plot function
returns = [meanreturns ; meanreturns];
returns = reshape(returns,10,5);
returns = [returns;returns]
returns = reshape(returns,10,10);
 
% Define x and y values
x = [0 0.999 1 1.999 2 2.999 3 3.999 4 5];
y = [0 0.999 1 1.999 2 2.999 3 3.999 4 5];
 
% Create x-y mesh for surface plot
[xx,yy] = meshgrid(x,y);
 
% Generate Plot
surf(xx,yy,returns)
xlabel('Size','fontsize',20)
ylabel('Value','fontsize',20)
%zlabel('Arithmetic Average Monthly Return (%)','rotation',90,'fontsize',20)
zlabel('Geometric Average Monthly Return (%)','rotation',90,'fontsize',20)
title(plottitle,'fontsize',36)
axis([0 5 0 5 min(0,min(meanreturns)-.1) max(2,max(meanreturns)+0.01)])
text(4.5,0.5,meanreturns(21),'LG','horizontalalignment','center','fontsize',18)
text(4.5,4.5,meanreturns(25),'LV','horizontalalignment','center','fontsize',18)
text(0.5,4.5,meanreturns(5),'SV','horizontalalignment','center','fontsize',18)
text(0.5,0.5,meanreturns(1),'SG','horizontalalignment','center','fontsize',18)
 
% Color range set from 0 to 1.6 rather than allowing autoscale.
% This is done for easier comparison between plots, but colors will
% max out for values above 1.6 or below 0.
% For arithmetic averages, I think a range of 0 to 2 works better
caxis([0 1.6]);
view(50, 25);
replot

endfunction

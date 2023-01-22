% Laconic ECG Analysis
%   Austin H. Dial
%   10/12/2018
%
%  Makes use of the difference equations instead of the transfer functions
%   and works the data iteratively.
%
close all;
clear all;
clc;

% See randomness for figures
rng(0,'twister');

fs = 360; % sampling rate 360 Hz according to the data source

%% Load Data Sets
%

% Call load data script
LoadData;

% Define a time axis
dt = 1/fs;                  % Sample interval
len_sig = length(sig_112);  % All datasets have the same signal length
t=0:dt:(len_sig-1)*dt;      % Time axis


%% Pan-Tompkins Algorithm
%

% Define moving average window
MovWind = 30;

% Send signals through processor
Out102 = IterativePT(sig_102, MovWind);
Out112 = IterativePT(sig_112, MovWind);
Out202 = IterativePT(sig_202, MovWind);
Out212 = IterativePT(sig_212, MovWind);
Out222 = IterativePT(sig_222, MovWind);


%% Plot output
%

% Set observation window for plotting
ObWind10 = 1:3600;      % First ten seconds
ObWind20 = 1:7200;      % First twenty seconds
ObWind30 = 1:10800;     % First thirty seconds
ObWind40 = 1:14400;     % First forty seconds
ObWind50 = 1:18000;     % First fifty seconds
ObWind60 = 1:21600;     % First sixty seconds


%% Plot Signal 102
plotRange(t, Out102, ObWind10, '102');
plotRange(t, Out102, ObWind20, '102');
plotRange(t, Out102, ObWind30, '102');
plotRange(t, Out102, ObWind40, '102');
plotRange(t, Out102, ObWind50, '102');

%% Plot Signal 112
plotRange(t, Out112, ObWind10, '112');
plotRange(t, Out112, ObWind20, '112');
plotRange(t, Out112, ObWind30, '112');
plotRange(t, Out112, ObWind40, '112');
plotRange(t, Out112, ObWind50, '112');

%% Plot Signal 202
plotRange(t, Out202, ObWind10, '202');
plotRange(t, Out202, ObWind20, '202');
plotRange(t, Out202, ObWind30, '202');
plotRange(t, Out202, ObWind40, '202');
plotRange(t, Out202, ObWind50, '202');

%% Plot Signal 212
plotRange(t, Out212, ObWind10, '212');
plotRange(t, Out212, ObWind20, '212');
plotRange(t, Out212, ObWind30, '212');
plotRange(t, Out212, ObWind40, '212');
plotRange(t, Out212, ObWind50, '212');

%% Plot Signal 222
plotRange(t, Out222, ObWind10, '222');
plotRange(t, Out222, ObWind20, '222');
plotRange(t, Out222, ObWind30, '222');
plotRange(t, Out222, ObWind40, '222');
plotRange(t, Out222, ObWind50, '222');











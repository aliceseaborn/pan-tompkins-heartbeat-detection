% Yufeng Lu, Bradley University
% 9/26/2016
% updated: 9/11/2018
% ECE301 Project #1 
% Data source: http://www.physionet.org/cgi-bin/atm/ATM
% Records: MIT-BIH Arrhythmia database (mitdb)
% Description: to provide a quick start on the ECG datasets for ECE301
%   Project #1

fs = 360; % sampling rate 360 Hz according to the data source

%% Load Data Sets
%  In most records, the upper signal, which is val(1,:), is a modified 
%   limb lead II (MLII), obtained by placing the electrodes on the chest. 
%   Normal QRS complexes are usually prominent in the upper signal.
%

load 'C:\Users\adial\Documents\SCHOOL\8 FA18\ECE 301\Projects\Project 1\Code\Verbose\Data\102m';  sig_102 = val(1,:); clear val;
% 8:50 - 9:50 (1 min), raw ADC; V5 signal  (for your reference)

load 'C:\Users\adial\Documents\SCHOOL\8 FA18\ECE 301\Projects\Project 1\Code\Verbose\Data\112m';  sig_112 = val(1,:); clear val;
% 0:10 - 1:10 (1min), raw ADC, baseline wandering towards the end of 1-min 

load 'C:\Users\adial\Documents\SCHOOL\8 FA18\ECE 301\Projects\Project 1\Code\Verbose\Data\202m';  sig_202 = val(1,:); clear val;
% 0:10 - 1:10 ( 1 min), raw ADC, PVC around #17

load 'C:\Users\adial\Documents\SCHOOL\8 FA18\ECE 301\Projects\Project 1\Code\Verbose\Data\212m';  sig_212 = val(1,:); clear val;
% 0:10 - 1:10 ( 1 min), raw ADC

load 'C:\Users\adial\Documents\SCHOOL\8 FA18\ECE 301\Projects\Project 1\Code\Verbose\Data\222m';  sig_222 = val(1,:); clear val;


dt = 1/fs;                  % Sample interval
len_sig = length(sig_112);  % All datasets have the same signal length
t=0:dt:(len_sig-1)*dt;      % Time axis

%% Basic plot here
% Note: you have to generate plots with proper captions and axis info for
%   your report
% figure;plot(t,sig_102);grid on; title('record 102');
% figure;plot(t,sig_112);grid on; title('record 112');
% figure;plot(t,sig_202);grid on; title('record 202');
% figure;plot(t,sig_212);grid on; title('record 212');
% figure;plot(t,sig_222);grid on; title('record 222');

% check the .info txt files for related information
% You may remove the base (DC-offset) and divide the gain from the data
% Or you may normalize the data to [-1 1]
% Remember that only the location of QRS complex matters, not
% the scaling factor or base-offset. 


%% Low-pass Filter via Symbolic
%  We use the definition of the Z-transform used in the fourth reference:
%
%   H(z) = ((1-z^(-6))^2)/((1-z^(-1))^2)
%
%  Then we implement the system using the symbolic elements in MATLAB and
%   send the input signals through the transfer function using lsim to
%   obtain the desired output.
%

% Send signals through filter
S1_102 = specLPF(sig_102);
S1_112 = specLPF(sig_112);
S1_202 = specLPF(sig_202);
S1_212 = specLPF(sig_212);
S1_222 = specLPF(sig_222);

% Plot output if you really feel like it...
% plot(t, S1_102);


%% High-pass Filter via Symbolic
%  We implement the same logic for the low-pass filter but we use a
%   high-pass filter transfer function, I built a new function for it.
%

% Send signals through filter
S2_102 = specHPF(S1_102);
S2_112 = specHPF(S1_112);
S2_202 = specHPF(S1_202);
S2_212 = specHPF(S1_212);
S2_222 = specHPF(S1_222);

% Plot output if you really feel like it...
% plot(t, S2_102);


%% Differentiator via Symbolic
%  We implement the same logic for the low-pass filter but we use a
%   differentiator transfer function, I built a new function for it.
%

% Send signals through differentiator
S3_102 = specDiff(S2_102);
S3_112 = specDiff(S2_112);
S3_202 = specDiff(S2_202);
S3_212 = specDiff(S2_212);
S3_222 = specDiff(S2_222);

% Plot output if you really feel like it...
% plot(t, S3_102);


%% Squaring function
%  We square each value of the signal such that magntiudes are dramatized
%   and all remaining values are positive (above axis).
%

% Square signals
S4_102 = S3_102.^2;
S4_112 = S3_112.^2;
S4_202 = S3_202.^2;
S4_212 = S3_212.^2;
S4_222 = S3_222.^2;

% Plot output if you really feel like it...
% plot(t, S4_102);


%% MATLAB Moving Average
%  This function is neither convolution nor is it the filter function so I
%   think that it is allowed, but we average the remaining signal using a
%   moving average with a set window width.
%

% Set moving average window
win = 5;

% Send signals through differentiator
S5_102 = movmean(S4_102, win);
S5_112 = movmean(S4_112, win);
S5_202 = movmean(S4_202, win);
S5_212 = movmean(S4_212, win);
S5_222 = movmean(S4_222, win);


% Plot output
figure; plot(t,S5_102); grid on; title('DSP Output Record 102');
figure; plot(t,S5_112); grid on; title('DSP Output Record 112');
figure; plot(t,S5_202); grid on; title('DSP Output Record 202');
figure; plot(t,S5_212); grid on; title('DSP Output Record 212');
figure; plot(t,S5_222); grid on; title('DSP Output Record 222');





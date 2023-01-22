% Import Data Script
%   Yufeng, Lu
%   
%  I, Austin Dial, excised this section of the code because it's kind of
%   bulky and doesn't need to be regularly edited, it's ripe for modular
%   code practice.
%

%  In most records, the upper signal, which is val(1,:), is a modified 
%   limb lead II (MLII), obtained by placing the electrodes on the chest. 
%   Normal QRS complexes are usually prominent in the upper signal.
%

% Import data
load 'C:\Users\adial\Documents\SCHOOL\8 FA18\ECE 301\Projects\Project 1\Code\Verbose\Data\102m';  sig_102 = val(1,:); clear val;
% 8:50 - 9:50 (1 min), raw ADC; V5 signal  (for your reference)

load 'C:\Users\adial\Documents\SCHOOL\8 FA18\ECE 301\Projects\Project 1\Code\Verbose\Data\112m';  sig_112 = val(1,:); clear val;
% 0:10 - 1:10 (1min), raw ADC, baseline wandering towards the end of 1-min 

load 'C:\Users\adial\Documents\SCHOOL\8 FA18\ECE 301\Projects\Project 1\Code\Verbose\Data\202m';  sig_202 = val(1,:); clear val;
% 0:10 - 1:10 ( 1 min), raw ADC, PVC around #17

load 'C:\Users\adial\Documents\SCHOOL\8 FA18\ECE 301\Projects\Project 1\Code\Verbose\Data\212m';  sig_212 = val(1,:); clear val;
% 0:10 - 1:10 ( 1 min), raw ADC

load 'C:\Users\adial\Documents\SCHOOL\8 FA18\ECE 301\Projects\Project 1\Code\Verbose\Data\222m';  sig_222 = val(1,:); clear val;
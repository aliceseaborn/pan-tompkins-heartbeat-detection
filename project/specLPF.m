% specLPF Function
%   Austin H. Dial
%   10/01/2018
%
%  Takes a signal as input and uses the low-pass filter design for ECG
%   feature detection to return the filter output without using colvolution
%   nor the MATLAB filter function but through symbolic functions.
%

% ECG LOW PASS FILTER
function output = specLPF (signal)

    % Define Transfer function symbolically
    z = tf('z');                        % Define z-variable
    H = ((1-z^(-6))^2)/((1-z^(-1))^2);  % Define transfer function

    % Send signal through filter
    output = lsim(H, signal);           % Append directly to output
    
end
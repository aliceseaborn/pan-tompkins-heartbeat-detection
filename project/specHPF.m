% specHPF Function
%   Austin H. Dial
%   10/01/2018
%
%  Takes a signal as input and uses the high-pass filter design for ECG
%   feature detection to return the filter output without using colvolution
%   nor the MATLAB filter function but through symbolic functions.
%

% ECG HIGH PASS FILTER
function output = specHPF (signal)

    % Define Transfer function symbolically
    z = tf('z');                                % Define z-variable
    H = (1 + 32*z^(-16) + z^(-32))/(1-z^(-1));  % Define transfer function

    % Send signal through filter
    output = lsim(H, signal);           % Append directly to output
    
end
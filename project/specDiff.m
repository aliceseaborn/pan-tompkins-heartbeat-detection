% specDiff Function
%   Austin H. Dial
%   10/01/2018
%
%  Uses symbolic variables to send a signal through a specific
%   differentiator function and returns the output.
%

% ECG DIFFERENTIATOR
function output = specDiff (signal)

    % Define Transfer function symbolically
    z = tf('z');                                % Define z-variable
    H = 0.1*(2 + z^(-1) - z^(-3) -2*z^(-4));    % Define transfer function

    % Send signal through filter
    output = lsim(H, signal);           % Append directly to output
    
end
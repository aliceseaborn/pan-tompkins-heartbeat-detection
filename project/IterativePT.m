% PanTompkins Algorithm Function
%   Austin H. Dial
%   10/12/2018
%
%  Uses for loops to apply the Pan-Thompkins algorithm.
%
% REF: https://tinyurl.com/y8kvs8wc
%

% PAN-TOMPKINS ALGORITHM
function output = IterativePT (signal, MovWind)

    % Noise cancelation
    x = signal - mean(signal);

    % Preallocate y variable
    y = zeros(1, length(signal));
    
    % Run LPF iteratively
    for n = 13:length(signal)
        y(n) = 2*y(n) - y(n-2) + x(n) - 2*x(n-6) + x(n-12);
    end
    
    x = y;  % Pass LPF output into HPF input
    
    % Run HPF iteratively
    for n = 33:length(signal)
        y(n) = y(n) + x(n) - x(n-32);
    end
    
    x = y;  % Pass HPF output into derivative input
    
    % Run derivative iteratively
    for n = 5:length(signal)
        y(n) = (2*x(n) + x(n) - x(n-3) - 2*x(n-4))/8;
    end
    
    x = y;  % Pass derivative output into squaring input
    
    % Run squaring iteratively
    for n = 1:length(signal)
        y(n) = (x(n))^2;
    end
    
    x = y;  % Pass squaring output into moving average input
    
    % Run moving average
    output = movmean(x, MovWind);
    
    figure; plot(t, signal); title('Unprocessed Signal 112'); ylabel('Amplitude'); xlabel('Time(s)');
    
end
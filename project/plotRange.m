% plotRange Function
%   Austin H. Dial
%   10/02/2018
%
%  Takes a specific range of obervation as an argument and returns a plot
%   that focuses only on that range for the function.
%

% plotRange function
function plotRange (indVar, depVar, Range, plotName)

    % Orient the depVar
    [x, y] = size(depVar);
    if (y > x)
        depVar = depVar';
    end

    % Plotting
    figure;
    plot(indVar(:, Range), depVar(Range, :));
    grid on;
    title(['DSP Output Record ', plotName]);
    xlabel('Time (s)');
    ylabel('Amplitude');
    
    % Format save file and automatically save the figure
    sampleMax = max(size(Range));
    name = strcat('Fig-', plotName, sprintf(' From 1 to %d', sampleMax));
    savefig(name);
end
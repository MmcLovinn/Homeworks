function plot_data(ground_truth, fw_solution, system_solution)
    hold all;
    stem(ground_truth);
    stem(fw_solution);
    if nargin == 3
        stem(system_solution);
        legend('ground truth', 'FW', 'A\\b', ...
            'location', 'northoutside', 'Orientation', 'horizontal');
    else
        legend('ground truth', 'FW', ...
            'location', 'northoutside', 'Orientation', 'horizontal');
    end
end
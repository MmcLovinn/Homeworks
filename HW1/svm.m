function [f, g] = svm(train, theta, lambda)
% Input:
%
%   train: The training data set (see Moodle)
%          This is a structure with fields train.X and train.y
%          containing, respectively, the examples (the images) and the
%          labels to be used for training.
% 
%   theta: A tentative parameter vector (column)
%
% Output:
%
%   f: value of the cost function
%   g: gradient if the cost function at theta, as a column vector

    X = train.X;
    y = train.y;
    
    % ... your code here to compute f and g ...
    % ... try to do it without loops if you can, as ...
	% ... loops are slow in Matlab. ...
    


    if any(isnan(f), 'all') || any(isnan(g), 'all')
        warning(['The function svm returned expressions containing NaNs.' ...
            'Read the section numerical considerations at the end of the homework and debug your code.']);
    end
end

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
    
    %calculating the needed values for phi and phi' :
    [u,v]= phi(((theta')*X)');
    [u_minus, v_minus]=phi(-((theta')*X)');
    
    %calculating f :
    f=dot(y,u_minus)+ dot(1-y,u);
    f=f+lambda/2*dot(theta, theta);
    
    %calculating gradient of f :
    g=sum(X.*(-y.*v_minus+(1-y).*v)',2);
    g= g+ lambda*theta;

    
    
    if any(isnan(f), 'all') || any(isnan(g), 'all')
        warning(['The function svm returned expressions containing NaNs.' ...
            'Read the section numerical considerations at the end of the homework and debug your code.']);
    end
end

clear;
close all;
clc;

% Load the data (both train and test sets, and value of n = 785)
load mnist_train_test.mat;

%%  Define the cost function f (question 7)

lambda = 5e-3;
% The following is special about MATLAB syntax: fhandle is a handle for a
% function that takes one input (theta) and is equivalent to calling
% svm(train, theta, lambda). In this way the input 'train' is fixed once
% and for all.
fhandle = @(theta) svm(train, theta, lambda);

%% Check the gradient (question 8)

% Generate a random point and a random direction
theta = randn(d, 1);
v = randn(d, 1);
v = v/norm(v);

% Check the Taylor expansion for that point and that direction
checkgradient(fhandle, theta, v);

%% Lipschitz constant (question 9)

% The value we search for is svds(train.X,1)^2

% Set the Lipschitz constant

L = svds(train.X,1)^2+lambda;


%% Gradient descent with constant step sizes (question 10)

% Examples of parameters that your algorithm can take.
params.maxiters = 7000;
params.maxtime = 60*3;
% Tolerance on the gradient norm. Stop the algorithm if the gradient norm
% has decreased by a factor of tolgradnorm (compared to the initial
% gradient norm).
params.tolgradnorm = 1e-3;
params.verbose = true; % Whether or not the algorithm should print information when it is running

% Step size
alpha = 1/L;

% Initial point
theta0 = randn(d,1);

[final_cstgd, norms_cstgd, times_cstgd] =cstgradientdescent(fhandle, theta0, alpha, params); 

%% Plot results (question 11)
figure('Name','Gradient Norms vs iterations fixed step','NumberTitle','off');
semilogy(norms_cstgd );

%% Gradient descent with backtracking linesearch (question 13)

% Parameters for the main loop
params.maxiters = 600;
params.maxtime = 3*60;
params.tolgradnorm = 1e-6;
params.verbose = true;

% Examples of parameters for the linesearch
lsparams.alphabar = 2;
lsparams.c = 1e-4;
lsparams.rho = 0.6;
lsparams.alphamin = 1e-7;

theta0=randn(d,1);

% Run gradient descent with linesearch
[final_lsgd, norms_lsgd, times_lsgd] = lsgradientdescent(fhandle, theta0, params, lsparams);

% Plot results
figure('Name','Gradient Norms vs iterations line search','NumberTitle','off')
semilogy(norms_lsgd);

%% Gradient norm versus time (question 14)

figure('Name','Gradient norms vs time (fixed step vs line search)','NumberTitle','off')
semilogy(times_lsgd,norms_lsgd,'b',times_cstgd, norms_cstgd,'r' );
legend('Line Search ', 'Constant step');

%% Show image in a grayscale figure (question 15)

figure('Name','Filter fixed step','NumberTitle','off')
showMNISTImage(final_cstgd)
title('filter fixed step')
colorbar
figure('Name','filter line search','NumberTitle','off')
showMNISTImage(final_lsgd)
title('filter line search')
colorbar

%% Assess quality of the model (question 16)

% Evaluate quality of classifier vector theta
[accuracy_train, mistakes_train] = binary_classifier_accuracy(train, final_lsgd);
[accuracy_test, mistakes_test] = binary_classifier_accuracy(test, final_lsgd);

fprintf('Accuracy line search gradient descent \n  Train: %.6g\n  Test:  %.6g\n', accuracy_train, accuracy_test);

% Show images that caused trouble
if ~isempty(mistakes_train)
    showMNISTImages_many(train.X(:, mistakes_train));
    title('Failed train images line search');
end
if ~isempty(mistakes_test)
    showMNISTImages_many(test.X(:, mistakes_test));
    title('Failed test images line search');
end

[accuracy_train, mistakes_train] = binary_classifier_accuracy(train, final_cstgd);
[accuracy_test, mistakes_test] = binary_classifier_accuracy(test, final_cstgd);

fprintf('Accuracy fixed-step gradient descent \n  Train: %.6g\n  Test:  %.6g\n', accuracy_train, accuracy_test);

% Show images that caused trouble
if ~isempty(mistakes_train)
    showMNISTImages_many(train.X(:, mistakes_train));
    title('Failed train images fixed step');
end
if ~isempty(mistakes_test)
    showMNISTImages_many(test.X(:, mistakes_test));
    title('Failed test images fixed step');
end

clear;
close all;
clc;

% Load the data (both train and test sets, and value of n = 785)
load mnist_train_test.mat;

%%  Define the cost function f (question 7)

lambda = ...;
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
% checkgradient(fhandle, theta, v);

%% Lipschitz constant (question 9)

% Set the Lipschitz constant
L = ...;

%% Gradient descent with constant step sizes (question 10)

% Examples of parameters that your algorithm can take.
params.maxiters = ...;
params.maxtime = ...;
% Tolerance on the gradient norm. Stop the algorithm if the gradient norm
% has decreased by a factor of tolgradnorm (compared to the initial
% gradient norm).
params.tolgradnorm = ...;
params.verbose = ...; % Whether or not the algorithm should print information when it is running

% Step size
alpha = 1/L;

% Initial point
% theta0 = ...

% ... cstgradientdescent(fhandle, theta0, alpha, params); ...

%% Plot results (question 11)

% semilogy(...);

%% Gradient descent with backtracking linesearch (question 13)

% Parameters for the main loop
params.maxiters = ...;
params.maxtime = ...;
params.tolgradnorm = ...;
params.verbose = ...;

% Examples of parameters for the linesearch
lsparams.alphabar = ...;
lsparams.c = ...;
lsparams.rho = ...;
lsparams.alphamin = ...;

% Initial point
% theta0 = ...

% Run gradient descent with linesearch
% ... lsgradientdescent(fhandle, theta0, params, lsparams); ...

% Plot results
% semilogy(...);

%% Gradient norm versus time (question 14)

% semilogy(...);

%% Show image in a grayscale figure (question 15)

% theta = ...;
showMNISTImage(theta)

%% Assess quality of the model (question 16)

% theta = ...;

% Evaluate quality of classifier vector theta
[accuracy_train, mistakes_train] = binary_classifier_accuracy(train, theta);
[accuracy_test, mistakes_test] = binary_classifier_accuracy(test, theta);

fprintf('Accuracy\n  Train: %.6g\n  Test:  %.6g\n', accuracy_train, accuracy_test);

% Show images that caused trouble
if ~isempty(mistakes_train)
    showMNISTImages_many(train.X(:, mistakes_train));
    title('Failed train images');
end
if ~isempty(mistakes_test)
    showMNISTImages_many(test.X(:, mistakes_test));
    title('Failed test images');
end

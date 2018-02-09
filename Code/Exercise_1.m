% This Code was created Under the Guidance of Prof. Yannick Benezeth

%%%%%%%%%%% SSDN %%%%%%%%%%%%%
%%%%%% Mohit Kumar Ahuja %%%%%
%%%%%%%%%% MSCV 1 %%%%%%%%%%%%


clear all; close all; clc;

%% Part 1 - Complete the implementation of Horn and Schunck

a = imread('garden_1.png');
b = imread('garden_2.png');

lambda = 2*ones(size(a));           % Regularization Parameter
ite = 5;                            % Number of Iterations for Optimisation
[u,v] = HS(a,b,lambda,ite);

%% Part 2 - Complete the implementation of Lucas and Kanade

windowSize = 2;                     % Initialising Window Size
[u2, v2] = LK(a, b, windowSize);    

%% Part 3 - Improve the Lucas Kanade's method with a multiresolution scheme.

WindowSize = 2;                     % Initialising Window Size
numLevels = 2;                      % Number of levels of Pyramid
[u3,v3] = hierarchical_LK(a, b, numLevels, WindowSize);



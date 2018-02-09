% This Code was created Under the Guidance of Prof. Yannick Benezeth

%%%%%%%%%%% SSDN %%%%%%%%%%%%%
%%%%%% Mohit Kumar Ahuja %%%%%
%%%%%%%%%% MSCV 1 %%%%%%%%%%%%


clear all; close all; clc;

%% Part 1 - show that the solution (u; v) of the OFCE : Ix.u + Iy.v + It = 0 
%                               is also solution of :     M * Theta = P

a = imread('\garden\garden_1.png');
b = imread('\garden\garden_2.png');

      %%% OR %%%
  % Use this Imread %
% a = imread(uigetfile);
% b = imread(uigetfile);

[theta , xm , ym] = Affine_Motion(a,b); % To compute Value of Theta

[ u , v ] = Compute_u_v( xm,ym,theta ); % To compute U and V

New_Image = Create_New_Image( u,v,a,b ); % Creating New Image

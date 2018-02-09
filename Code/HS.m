function [u, v] = HS(im1, im2, lambda, ite)
% This Function was created by Mohit Kumar Ahuja
% Under the Guidance of Prof. Yannick Benezeth
% 
% The main idea to build this function was to Compute U and V using the
% Horn And Shunck Method.

if size(size(im1),2)==3
    im1=rgb2gray(im1);
end
if size(size(im2),2)==3
    im2=rgb2gray(im2);
end

im1 = double(im1);            % Changing the type of Image from Unit8 to double
im2 = double(im2);            % Changing the type of Image from Unit8 to double

im1 = imgaussfilt(im1,2);     % Applying Gaussian Filter to First Image
im2 = imgaussfilt(im2,2);     % Applying Gaussian Filter to Second Image

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Begin of "Write your code here" section %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Laplacian Kernal
conv_kernel = [1/12 1/6 1/12; 1/6 -1 1/6; 1/12 1/6 1/12];

Ix1 = [-1 1 ; -1 1];    % X Derivative Mask for First Image
Iy1 = [-1 -1; 1 1];     % Y Derivative Mask for First Image
It1 = [-1 -1; -1 -1];   % T Derivative Mask for First Image
Ix2 = [-1 1 ; -1 1];    % X Derivative Mask for Second Image
Iy2 = [-1 -1; 1 1];     % Y Derivative Mask for Second Image
It2 = [1 1; 1 1];       % T Derivative Mask for Second Image

% Computing Ix by convoluting it with both the images
Ix = (imfilter(im1,Ix1)+imfilter(im2,Ix2))/2;

% Computing Iy by convoluting it with both the images
Iy = (imfilter(im1,Iy1)+imfilter(im2,Iy2))/2;

% Computing It by convoluting it with both the images
It = imfilter(im1,It1)+imfilter(im2,It2);

u = zeros(size(im1));        % Initialising U with an empty matrix
v  = zeros(size(im2));       % Initialising V with an empty matrix

for i=1:ite     % Number of Iterations 
    
    u_average = imfilter(u,conv_kernel);
    v_average = imfilter(v,conv_kernel);
    
    % Optimisation Process of Horn And Shunck Method
    u = u_average - ( Ix .* ( ( Ix .* u_average ) + ( Iy .* u_average ) + It ) ) ./ ( lambda.^2 + Ix.^2 + Iy.^2);
    v = v_average - ( Iy .* ( ( Ix .* v_average ) + ( Iy .* v_average ) + It ) ) ./ ( lambda.^2 + Ix.^2 + Iy.^2);
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of "Write your code here" section %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

u(isnan(u))=0;
v(isnan(v))=0;
plotOF_arrows(u,v);
title('Horn And Shunck');

end

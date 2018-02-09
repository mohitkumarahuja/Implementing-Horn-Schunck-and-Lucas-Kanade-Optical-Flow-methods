function [u,v] = hierarchical_LK(im1, im2, numLevels, WindowSize)
% This Function was created by Mohit Kumar Ahuja
% Under the Guidance of Prof. Yannick Benezeth
% 
% The main idea to build this function was to Compute U and V using the
% Lucas and Kanade Method with a multiresolution scheme.

% graylevel image
if (size(im1,3) ~= 1) || (size(im2, 3) ~= 1)
    im1 = rgb2gray(im1);
    im2 = rgb2gray(im2);
end;

im1 = double(im1);          % Changing the type of Image from Unit8 to double
im2 = double(im2);          % Changing the type of Image from Unit8 to double

im1 = imgaussfilt(im1,2);   % Applying Gaussian Filter to First Image
im2 = imgaussfilt(im2,2);   % Applying Gaussian Filter to Second Image

% Build the pyramids
im1Pyr = {};
im2Pyr = {};
im1Pyr{1} = im1;
im2Pyr{1} = im2;

for i=2:numLevels
    im1Pyr{i} = imresize(im1Pyr{i-1},1/2);
    im2Pyr{i} = imresize(im2Pyr{i-1},1/2);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Begin of "Write your code here" section %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ix1 = [-1 1 ; -1 1];    % X Derivative Mask for First Image
Iy1 = [-1 -1; 1 1];     % Y Derivative Mask for First Image
It1 = [-1 -1; -1 -1];   % T Derivative Mask for First Image
Ix2 = [-1 1 ; -1 1];    % X Derivative Mask for Second Image
Iy2 = [-1 -1; 1 1];     % Y Derivative Mask for Second Image
It2 = [1 1; 1 1];       % T Derivative Mask for Second Image

% Computing Ix by convoluting it with both the images
Ix_New = (imfilter(im1,Ix1)+imfilter(im2,Ix2))/2;

% Computing Iy by convoluting it with both the images
Iy_New = (imfilter(im1,Iy1)+imfilter(im2,Iy2))/2;

% Computing It by convoluting it with both the images
It_New = imfilter(im1,It1)+imfilter(im2,It2);

u = zeros(size(im1));        % Initialising U with an empty matrix
v  = zeros(size(im2));       % Initialising V with an empty matrix

for i = WindowSize+1:size(Ix_New,1)-WindowSize
    for j = WindowSize+1:size(Ix_New,2)-WindowSize
        
        % Computing Final Ix by Lucas and Kanade Method
        Ix = Ix_New(i-WindowSize:i+WindowSize, j-WindowSize:j+WindowSize);
        
        % Computing Final Iy by Lucas and Kanade Method
        Iy = Iy_New(i-WindowSize:i+WindowSize, j-WindowSize:j+WindowSize);
        
        % Computing Final It by Lucas and Kanade Method
        It = It_New(i-WindowSize:i+WindowSize, j-WindowSize:j+WindowSize);
        
        Ix = Ix(:);       % Vectorising Ix
        Iy = Iy(:);       % Vectorising Iy
        b = -It(:);        % Substituting vectorised It in b
        A = [Ix Iy];      % Concatinating Ix and Iy
        nu = pinv(A)*b;   % Calculating velocity
        u(i,j)=nu(1);     % Substituting value for U
        v(i,j)=nu(2);     % Substituting value for V
    end;
end;

u_deci = u(1:10:end, 1:10:end);  % Downsize u 
v_deci = v(1:10:end, 1:10:end);  % Downsize v
plotOF_arrows(u_deci, v_deci);   % Plotting Downsized U and V
title('Lucas and Kanade Method with a multiresolution scheme');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End of "Write your code here" section %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
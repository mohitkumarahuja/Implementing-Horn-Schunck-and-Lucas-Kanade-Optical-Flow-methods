function [ New_Image ] = Create_New_Image( u,v,a,b )
% This Function was created by Mohit Kumar Ahuja
% Under the Guidance of Prof. Yannick Benezeth
% 
% The main idea to build this function was to Create a New Image using the
% displacement between first two images. By adding the displacement, we get
% a new translated Image.

[xm_new , ym_new] = meshgrid(1 : size(b,2) , 1 : size(b,1)); % Taking all values
xm_new = xm_new + u;         % x values are updated by adding with u
ym_new = ym_new + v;         % y values are updated by adding with v
New_Image = zeros(size(b));  % New Image of all Zeros is being created
xm_new = floor(xm_new);      % Rounding the values of new X
ym_new = floor(ym_new);      % Rounding the values of new Y

for i = 1 : size(b,1)
    for j = 1 : size(b,2)       
        if xm_new(i,j) > 0 && ym_new(i,j) > 0 && xm_new(i,j) < size(b,2) && ym_new(i,j) < size(b,1)
            
            % Values are being overwritten in New Image by adding the
            % original pixel value and the displacement. 
            New_Image(i,j) = a( ym_new(i,j) , xm_new(i,j)); 
            
        end
    end
end

figure; 
imshow(a); % First Image
figure; 
imshow(b); % Second Image 
figure; 
imshow(New_Image,[]); % New Generated Image

end


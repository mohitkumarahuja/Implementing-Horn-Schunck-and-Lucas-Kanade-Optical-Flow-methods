function [ u,v ] = Compute_u_v( xm,ym,theta )
 % This Function was created by Mohit Kumar Ahuja
% Under the Guidance of Prof. Yannick Benezeth
% 
% The main idea to build this function was to Compute the U and V from the 
% equations;
% u = ax + by + c
% v = dx + ey + f
% Where we got the Parameters {a,b,c,d,e,f} from Theta And we get x and y 
% from xm and ym which we computed in Affine_Motion function

u = theta(1)*xm + theta(2)*ym + theta(3); % From u = ax + by + c
v = theta(4)*xm + theta(5)*ym + theta(6); % From v = dx + ey + f

u(isnan(u))=0;
v(isnan(v))=0;
plotOF_arrows(u,v); % Plotting u and v
title('Direction of Displacement');
end


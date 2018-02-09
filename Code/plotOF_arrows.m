function plotOF_arrows(u, v)

% Resize u and v so we can actually see something in the quiver plot
s = 50/size(u,2);
u_ = s*imresize(u,s,'bilinear');
v_ = s*imresize(v,s,'bilinear');
figure; quiver(u_(end:-1:1,:),-v_(end:-1:1,:),2);
axis('tight');
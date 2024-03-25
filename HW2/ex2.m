cylinder(3,5,'Volume versus depth for horizontal cylindrical tank');

function cylinder(r, L, plot_title)
% volume of horizontal cylinder
% inputs:
% r = radius
% L = length
% plot_title = string holding plot  title
h= 0:0.2:max(2*r,L);  %depth from 0 to 2r (橫著放的圓直徑=最深度)
V = (r^2 .* acos((r-h).*r^-1) -((r-h).*sqrt(2.*r.*h-h.^2))).*L;
%draw 
plot(V,h,'o-g');
title(plot_title);
xlabel('Values of Volume');
ylabel('Values of depth');
grid;
end
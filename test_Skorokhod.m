close all; clear; clc;

L = 20; U = 25; Delta = 0.5*(U-L);
T = 6; dt = 0.01; t = 0:dt:T;

%% Generate some trajectory x(t) that goes outside [L,U]
% ======================================================
nCorners = 5; % number of corners in (0,T)
offset = 2;

t_coarse = 0 + (T - 0).*rand(nCorners,1); t_coarse = [0;t_coarse;T];

% generate corner points in [L-offset, U+offset] 
corners = (L-offset) + (U-L+2*offset).*rand(nCorners+1,1); 
% x0 = L + (U-L)*rand;
x0 = 0.5*(L+U);
corners = [x0;corners];
x = interp1(t_coarse, corners, t); % 1-D interp, by default 'linear'

% ===========================================================
% Example 2.3 (L=0,U=1) in Kruk, Lehoczky, Ramanan, Shreve
% "Double Skorokhod Map and Reneging Real-Time Queues" (2008)
% ===========================================================
% for k = 1:length(t) 
%     if t(k) <= 4 
%         x(k) = -2 + t(k);
%     else
%         x(k) = 6 - t(k);
%     end
% end

[yy,zz] = DoubleSkorohod(x,L,U);
% [yy_lower, zz_lower] = DoubleSkorohod(x - Delta*ones(size(x)),L,U);
% [yy_upper, zz_upper] = DoubleSkorohod(x + Delta*ones(size(x)),L,U);

% Ut_old = min([U*ones(size(x)); x+Delta*ones(size(x))]);
% Lt_old = max([L*ones(size(x)); x-Delta*ones(size(x))]);

%% Plot
%=========================================================================
figure(1)
% subplot(2,1,1)
plot(t_coarse,corners,'o','MarkerEdgeColor','k',...
    'MarkerFaceColor',[.49 1 .63],'MarkerSize',10); hold on;
line([0 T],[U U],'Color','k','Linestyle','-','LineWidth',6); hold on;
line([0 T],[L L],'Color','k','Linestyle','-','LineWidth',6); hold on;
plot(t,zz,'-r','LineWidth',2); hold on;
plot(t,x,'--b','LineWidth',2); hold on;
% plot(t,Lt_old,'--g','LineWidth',2); hold on;
% plot(t,Ut_old,'--r','LineWidth',2)

% set(gca, ...
%   'Box'         , 'off'     , ...
%   'TickDir'     , 'out'     , ...
%   'TickLength'  , [.02 .02] , ...
%   'XMinorTick'  , 'on'      , ...
%   'YMinorTick'  , 'on'      , ...
%   'YGrid'       , 'on'      , ...
%   'XColor'      , [.3 .3 .3], ...
%   'YColor'      , [.3 .3 .3], ...
%   'LineWidth'   , 1         );
% 
% % subplot(3,1,2)
% % plot(t,yy,'-b','LineWidth',2); hold on;
% % line([0 T],[U U],'Color','k','Linestyle','-','LineWidth',4); hold on;
% % line([0 T],[L L],'Color','k','Linestyle','-','LineWidth',4)
% 
% subplot(2,1,2)
% line([0 T],[U U],'Color','k','Linestyle','-','LineWidth',6); hold on;
% line([0 T],[L L],'Color','k','Linestyle','-','LineWidth',6); hold on;
% plot(t,zz,'-b','LineWidth',2); hold on;
% % plot(t,zz_lower,'-g','LineWidth',2); hold on;
% % plot(t,zz_upper,'-r','LineWidth',2); hold on;
axis tight

set(gca, ...
  'Box'         , 'off'     , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3], ...
  'LineWidth'   , 1         );


% set(gcf, 'PaperPositionMode', 'auto');
% print -dpdf SingleHomeSetPoint.pdf


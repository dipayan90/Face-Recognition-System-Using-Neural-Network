
function NET = trainnet(net,ProjectedImages,target)

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% net.trainFcn = 'trainscg';
% net.trainParam.lr = 0.4;
% net.trainParam.epochs = 1000;
% net.trainParam.show = 10;
 net.trainParam.goal = 0;
% %~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% q(1:length(ProjectedImages))=1
% save dipayan.mat target
% [net,tr] = train(net,ProjectedImages,target);
% plotperf(tr);
% plottrainstate(tr);
% save net net
net = newpr(ProjectedImages,target,20);
%net.trainFcn = 'trainscg';
net=train(net,ProjectedImages,target);
NET = net;
function [NET] = finalClassifier(inputData, trueLabels)

for i=1:size(inputData,1)
    DataY(i,trueLabels(i,1)+1) = 1;
end

x = inputData';
t = DataY';

NET = cell(10,1);
TR = cell(10,1);

for k=1:10
        lambda = 0.1;
        trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

         % Create a Pattern Recognition Network
         hiddenLayerSize = 250;
         net = patternnet(hiddenLayerSize, trainFcn);
         
         net.layers{1}.transferFcn = 'tansig';
         [trainInd,valInd,testInd] = dividerand(x,1,0,0);
         net.divideParam.trainRatio= 1;
        N = size(trainInd,2); %Size of training set
        ind = round((N-1)*rand(N,1) +1);%Apply bootstrap to get the random indices on training set
        trainInd= trainInd(:,ind);%Select those indices
        net.performParam.regularization =lambda;
        
        % Train the Network
        [net,tr] = train(net,x,t);
        NET{k} =net;
        TR{k}=tr;
       
        
        save('NET.mat');
end


end


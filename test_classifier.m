%This code is for using the classifier

%Input argument is a sample image - the 128/129 features of the sample
%Output is a matrix of 
function [accuracy,Output_Labels] = test_classifier(input,labels)

%Loading the classifier
load('NET.mat');
s=0;
%Performance of the bagged classifier on the sample data
for k=1:10
    net = NET{k};
    s= s+ round(net(input'));
end

Output_Labels = vec2ind(s/10) - 1;
alphabets ='abcdefghijklmnopqrstuvwxyz';
result = alphabets(Output_Labels+1);
k=1;
Sentence ='';
for i=1:size(input,1) %for each letter
    if (input(i,1) == 1) %Is the letter at the end of the word?
        Sentence = [Sentence,result(k:i),' '];
        k= i+1;
    end   
end
disp(Sentence);
outputs = labels';
accuracy = sum(outputs == Output_Labels)/ numel(outputs);
end


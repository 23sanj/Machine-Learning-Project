NAME: Sanjana Sandeep
SID: 861245086
DATE: 12/07/2016
COURSE: CS 229


To run the code on new data:
The function 'test_classifier.m' accepts unseen data and tests it on the final trained classifier, to give out the corresponing labels (0-25) and prints the sentence corresponding to the sample.

INPUT: the data of the sample, in the form of a matrix, where each row corresponds to the 129 features of the single letter (image).
OUTPUT: The accuracy of the classifier on the unseen samples
	the sequence of labels of each letter in the sample. The labels range from(0-25). 
        A string containing the sentence/word generated by the classifier from the inputsample.

Example:

D= importdata('handwriting.data');
labels= D(:,1);
input= D(:,2:end);

[accuracy,Output_Labels]=test_classifier(input,labels)

Output:

accuracy = 0.9868

Output_Labels =

  Columns 1 through 16

    14    12    12     0    13     3     8    13     6    14    12    12     0    13     3    11

  Columns 17 through 32

    13     6    14    12    12     0    13     3     8    13     6    14    12    12     0    13

  Columns 33 through 40

     3     8    13     6    14    12    12     0


In addition, I've also included the code for the training of the initial and final classifier:

Within the folder 'Initial Classifier', the  sub-folder -'tuning free parameters', contains the experiments to find the most optimal free parameters( lambda and number of hidden units).
the sub-folder -'Single best NN' contains the training of the most optimal single NN.

The function 'finalClassifier.m' trains the classifier on the whole data-set.

INPUT: The inputData- all the features of the samples, trueLabels- the actual class labels of the data. 
OUTPUT: A cell array of trained neural networks

Example:

D= importdata('handwriting.data');
trueLabels= D(:,1);
inputData= D(:,2:end);

[NET] = finalClassifier(inputData, trueLabels)

The object NET.mat  contain information about the final trained NN and are used in the test_classifier.  


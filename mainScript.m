
clear all
close all


trainingData = '/Users/pijuskumar/Documents/MATLAB/recg/trainingData/';
resizedShape = [30 30];%downsample the images to resizedShape size
Weight = trainSOM(trainingData,resizedShape);


testData = '/Users/pijuskumar/Documents/MATLAB/recg/testData/';
testSOM(testData,resizedShape,Weight);

%% Using MATLAB's SOM toolbox
clear all
close all


trainingData = '/Users/pijuskumar/Documents/MATLAB/recg/trainingData/';
resizedShape = [30 30];%downsample the images to resizedShape size
Weight = trainSOMMATLAB(trainingData,resizedShape);


testData = '/Users/pijuskumar/Documents/MATLAB/recg/trainingData/';
testSOM(testData,resizedShape,Weight);


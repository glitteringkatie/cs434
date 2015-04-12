%(1)
%Load training data
housing_data;
X = fileMatrix(:,1:(end-1));
Y = fileMatrix(:,end);

%(2)
%Number of rows
numDataPoints = size(X,1); % = size(Y,1)
%Introduce the dummy variable
noDummyX = X;
X = [ones(numDataPoints,1) X];
transX = transpose(X);
weight = pinv(transX*X)*transX*Y

%(3)
%Load test data
housing_test;
testX = testMatrix(:, 1:(end-1));
testY = testMatrix(:,end);

numTestPoints = size(testX,1); % = size(testY,1)
%Introduce the dummy variable to test set
noDummyTestX = testX;
testX = [ones(numTestPoints,1) testX];

%(4)
%Find SSE
errorVector = (testY - testX*weight);
sse = transpose(errorVector)*errorVector

%SSE without ones
noDummyTransX = transpose(noDummyX);
weightNoDummy = pinv(noDummyTransX*noDummyX)*noDummyTransX*Y

noDummyErrorVector = (testY - noDummyTestX*weightNoDummy);
sseNoDummy = transpose(noDummyErrorVector)*noDummyErrorVector

%(5)
%Now we recompute the weight
regValues = [.001, .01, .025, .05, .1, .25, .5, 1, 2.5, 5, 7.5, 10];
sseVector = [];
for lambda=regValues
	weightWithReg = pinv(transX*X + lambda*eye(size(X,2)))*transX*Y;
	errorVectorWithReg = (testY - testX*weightWithReg);
	sseVector = [sseVector transpose(errorVectorWithReg)*errorVectorWithReg];
end
sseVector
figure;
plot(regValues, sseVector);
print('regPlot', '-dpdf');
quit

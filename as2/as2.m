%(1)
%Load training data
train;
X = fileMatrix(:,1:(end-1));
%Add dummy
X = [ones(size(X,1),1) X];
%Get results
Y = fileMatrix(:,end);

%Load test data
test;
testX = testMatrix(:,1:(end-1));
%Add dummy
testX = [ones(size(testX,1),1) testX];
%Get results
testY = testMatrix(:,end);

%Number of training data entries (e.g. 1400)
numDataEntries = size(X,1);

%Number of test data entries (e.g. 800)
numTestEntries = size(testX, 1);

%Initial weight guess of [.5 .5 ... .5]


%Sigmoid function
sigmoid = @(w,x) (1./(1+exp(-dot(w,x))));
sigmoidMat = @(w,X) arrayfun(@(i) sigmoid(w, X(i,:)), 1:size(X,1));

%We decided on a stop threshold of 10000, arbitrarily
stopThreshold = 10000;
testSSE = [];
trainSSE = [];
%Iterate over learning rate
for learnRate = logspace(0,10,10)
    w = zeros(1, size(X,2)) + .5;
    while 1 %Until convergence
        yHat = sigmoidMat(w,X); %Get predictions
        error = Y.' - yHat; %Get error vector
        d = error*X; %Calculate gradient
        w = w + learnRate .* d; %Take a step
        if norm(d) < stopThreshold %If the step was small, stop
            break;
        end;
    end;
    % Make predictions
    testError = testY.' - sigmoidMat(w,testX);
    trainError = Y.' - sigmoidMat(w,X);
    % Calculate sum of square error
    testSSE = [testSSE sum(testError.^2)];
    trainSSE = [trainSSE sum(trainError.^2)];
end;

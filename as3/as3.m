clf
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


% (1) Iterate over learning rate
learnRates = 10 .^ (linspace(-6, 2, 20));
trainSSEs = zeros(size(learnRates));
testSSEs = zeros(size(learnRates));
for i = 1:length(learnRates)
    learnRate = learnRates(i);
    [trainSSE, testSSE] = learn(X, Y, testX, testY, learnRate, 0);
    trainSSEs(i) = trainSSE(end);
    testSSEs(i) = testSSE(end);
end;
learnRate = 10 ^ -5;

% (2)
[iterationTrainSSE, iterationTestSSE] = learn(X, Y, testX, testY, learnRate, 0);

% (4)
lambdas = 10 .^ (linspace(-1, 4, 50));
lambdasTrainSSEs = zeros(size(lambdas));
lambdasTestSSEs = zeros(size(lambdas));
for i = 1:length(lambdas)
    lambda = lambdas(i);
    [trainSSE, testSSE] = learn(X, Y, testX, testY, learnRate, lambda);
    lambdasTrainSSEs(i) = trainSSE(end);
    lambdasTestSSEs(i) = testSSE(end);
end;

%%%%%%%%%%%%%% Plotting %%%%%%%%%%%%%%%%
% Plot SSE vs. Learning Rate
hold on
plot(log10(learnRates), trainSSEs, 'b')
plot(log10(learnRates), testSSEs, 'r')

xlabel('10 \^ learning rate')
ylabel('SSE')
legend('Training SSE', 'Testing SSE')
title('SSE vs. learning rate')

% Plot SSE vs. Iteration
figure
hold on
plot(log10(iterationTrainSSE), 'b')
plot(log10(iterationTestSSE), 'r')

xlabel('iteration')
ylabel('10 \^ SSE')
legend('Training SSE', 'Testing SSE')
title('SSE vs. iteration')

% Plot SSE vs. Regularization Value
figure
hold on
plot(log10(lambdas), lambdasTrainSSEs, 'b')
plot(log10(lambdas), lambdasTestSSEs, 'r')

xlabel('10 \^ lambda')
ylabel('SSE')
legend('Training SSE', 'Testing SSE')
title('SSE vs. Regularization Value (lambda)')



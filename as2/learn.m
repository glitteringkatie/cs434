function [trainSSE, testSSE] = learn(X, Y, testX, testY, learnRate, lamda)
    %Sigmoid function
    sigmoid = @(w,x) (1./(1.0+exp(-dot(w,x))));
    sigmoidMat = @(w,X) arrayfun(@(i) sigmoid(w, X(i,:)), 1:size(X,1));
    
    numIterations = 50;
    
    testSSE = zeros(1, numIterations);
    trainSSE = zeros(1, numIterations);
    
    w = zeros(1, size(X,2)) + .5;
    for i = 1:numIterations %Until convergence
        yHat = sigmoidMat(w,X); %Get predictions
        error = Y.' - yHat; %Get error vector
        d = error*X + (lamda.*w); %Calculate gradient
        w = w + learnRate .* d; %Take a step
        % Calculate sum of square error
        testError = testY.' - sigmoidMat(w,testX);
        trainError = Y.' - sigmoidMat(w,X);
        testSSE(i) = sum(testError.^2);
        trainSSE(i) = sum(trainError.^2);
    end;
end
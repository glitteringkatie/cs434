function main = knn()

    %Pull in all the data files
    knnTrain;
    knnTest;

    %Set up X and Y matrices for training data
    X = knnTrainMatrix(:,2:end);
    Y = knnTrainMatrix(:,1);

    %Set up X and Y matrices for testing data
    testX = knnTestMatrix(:,2:end);
    testY = knnTestMatrix(:,1);
%     size(testY)
    errorTest = [];
    errorXValidate = [];
    errorTrain = [];
    ks = 1:2:15;
    for k = ks
        errorTrain =  [errorTrain findAvgError(X, Y, X, Y, k)];
        errorTest = [errorTest findAvgError(X, Y, testX, testY, k) ];
        errorXValidate = [errorXValidate xValidate(X, Y, k)];
    end
    
    [minTestError, I] = min(errorTest);
    testK = ks(I);
    [minXValidateError, I] = min(errorXValidate);
    xValidateK = ks(I);
    
    fprintf('Best k for Test: %d \t Error = %f\n', testK, minTestError);
    fprintf('Best k for Cross Validation: %d \t Error = %f\n', xValidateK, minXValidateError);
    
    main = makePlot(errorTrain, errorTest, errorXValidate, ks);
end

%Gives distances as a matrix of size (length(X), length(testX)
%The (i,j) position will be the norm difference between:
%the ith test row in testX and the jth row in X.
% e.g. sum(distances(i,:))/n is the average distance between test example i
% and all of the examples in X
function distances = distance(X, testX)
    distances = zeros(size(testX, 1), size(X, 1));
    for i = 1:size(testX,1)
        for j = 1:size(X,1)
            distances(i,j) = norm(testX(i,:) - X(j,:));
        end
    end
end

function predicts = predictKNN(X, testX, Y, k)
    distances = distance(X, testX);
    %We don't need the sorted distances anymore. Only the indices matter
    [sortedDistances, indices] = sort(distances,2);
    knn = indices(:, 1:k);
    %Predict based on which 
    predicts = sign(sum(Y(knn),2));
    
end

function avgError = findAvgError(X, Y, testX, testY, k)
    predicts = predictKNN(X, testX, Y, k);
    errors = ((testY - predicts)./2).^2;
%     fprintf('X: %d \t Y: %d testX: %d \t testY: %d\n', size(X, 1), size(Y, 1), size(testX, 1), size(testY, 1));
    avgError = mean(errors);
end

function error = xValidate(X, Y, k)
    errorSum = 0;
    for i = 1:size(X,1)
        validX = X(i,:);
        validY = Y(i);
        trainX = X;
        trainX(i,:) = [];
        trainY = Y;
        trainY(i,:) = [];
%         size(trainX)
        errorSum = errorSum + findAvgError(trainX, trainY, validX, validY, k);
    end
    error = errorSum / size(X,1);
end

function ret = makePlot(errorTrain, errorTest, errorXValidate, ks)
    hold on
    plot(ks, errorTrain)
    plot(ks, errorTest)
    plot(ks, errorXValidate)
    
    title('Average Error vs. k')
    xlabel('k')
    ylabel('Average Error')
    legend('Training Error', 'Testing Error', 'Cross Validation Error')
%     legend('Training Error', 'Testing Error')
    
    ret = 0;
end

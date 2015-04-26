function main = knn()

    %Pull in all the data files
    knnTrain;
    knnTest;

    %Set up X and Y matrices for training data
    X = [ones(size(knnTrainMatrix,1), 1) knnTrainMatrix(:,2:end)];
    Y = knnTrainMatrix(:,1);

    %Set up X and Y matrices for testing data
    testX = [ones(size(knnTestMatrix,1), 1) knnTestMatrix(:,2:end)];
    testY = knnTestMatrix(:,1);
    size(testY)
    predictsTest = [];
    predictsXValidate = [];
    predictsTrain = [];
    for k = 1:2:15
        predictsTest = [predictsTest predictKNN(X,testX,Y,k)];
        %predictsTrain =  [predictsTrain ...];
        predictsXValidate = [predictsXValidate xValidate(X, Y, k)];
    end
    predictsXValidate
    
end

%Gives distances as a matrix of size (length(X), length(testX)
%The (i,j) position will be the norm difference between:
%the ith test row in testX and the jth row in X.
% e.g. sum(distances(i,:))/n is the average distance between test example i
% and all of the examples in X
function distances = distance(X, testX)
    distances = zeros(length(testX), length(X));
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
    avgError = ((testY - predicts)./2).^2;
    avgError = sum(((testY - predicts)/2).^2)/(size(testY,1));
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
        size(validX)
        %errorSum = errorSum + findAvgError(trainX, trainY, validX, validY, k);
    end
    error = errorSum / size(X,1);
end
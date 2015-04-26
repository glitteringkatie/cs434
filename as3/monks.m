function main = monks(  )
%MONKS main function
    monksTrain;
    monksTest;
    
    X = monksTrainMatrix;
    Y = X(:,6) & (X(:,1) ~= X(:, 2) );
    
    testX = monksTestMatrix;
    testY = testX(:,6) & (testX(:,1) ~= testX(:, 2) );
    
    testX
    testY

    main = 0;
end


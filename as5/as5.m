function main = as5()
    
%     clf;
    clc;
    %Load training data
    train;
    X = fileMatrix(:,1:(end-1));
    %Get results
    Y = fileMatrix(:,end);
    
    Xp = PCA(X, 0.8);
    
    %Number of training data entries (e.g. 1400)
    numDataEntries = size(X,1);
    for k = [2 4 6 8]
        [C, p] = evaluate(X, Y, k);
        fprintf('Original Data Confusion Matrix for k = %d (purity = %f)\n', k, p);
        disp(C);
        [C, p] = evaluate(Xp, Y, k);
        fprintf('Reduced Dimensional Data Confusion Matrix for k = %d (purity = %f)\n', k, p);
        disp(C);
        fprintf('----------------------------------------------\n\n');
    end
    main = 0;
end

function Xp = PCA(X, variance)
    sigma = cov(X);
    [vectors, values] = eig(sigma);
    values = sum(values, 2);
    [values, inds] = sort(values, 'descend');
    vectors = vectors(inds, :);
    
    dp = 1;
    for i = 1:size(values, 1)
        if (sum(values(1:i)) / sum(values) > variance)
            break
        end
        dp = i;
    end
    W = vectors(1:dp, :);
    Xp = X * transpose(W);
end

function [C, p] = evaluate(X, Y, k)
    [best_centers, best_labels] = kmeans(X, k);
    best_sse = getSSE(X, best_centers, best_labels);
    for i = 1:(10 - 1)
        [centers, labels] = kmeans(X, k);
        sse = getSSE(X, best_centers, best_labels);
        if (sse < best_sse)
            best_sse = sse;
            best_centers = centers;
            best_labels = labels;
        end
    end
    C = confusion(Y, best_labels, k);
    p = purity(C, Y, labels);
end

function p = purity(C, Y, labels)
    [dummy, majorities] = max(C, [], 2);
    majorities = majorities - 1;
    Yp = zeros(size(Y));
    for i = 1:size(labels, 1)
        Yp(i) = majorities(labels(i));
    end
    p = sum(Yp == Y) / size(Y, 1);
end

function C = confusion(Y, labels, k)
    C = zeros(k, 2);
    
    for i = 1:size(Y, 1)
        C(labels(i), Y(i) + 1) = C(labels(i), Y(i) + 1) + 1;    
    end
end

function sse = getSSE(X, centers, labels)
    sse = 0;
    for i = 1:size(X, 1)
        d = distance(X(i, :), centers(labels(i), :));
        sse = sse + (d ^ 2);
    end
end

function [centers, labels] = kmeans(X, k)
    n = size(X,1);
    d = size(X, 2);
    centers = X(randperm(n, k), :);
    labels = zeros(n, 1);
    
    past_centers = centers - 1;
    while (norm(past_centers - centers) > 0.0001)
        past_centers = centers;
        for i = 1:n
           labels(i) = min_distance(centers, X(i, :));
        end
        sums = zeros(k, d);
        ns = zeros(k, 1);
        for i = 1:n
           sums(labels(i),:) = sums(labels(i),:) + X(i,:);
           ns(labels(i)) = ns(labels(i)) + 1; 
        end
        for i = 1:k
            centers(i,:) = sums(i,:) / ns(i);
        end
        
    end
    
end

function d = distance(mu, x)
    d = norm(mu - x);
end

function label = min_distance(centers, x)
    distances = zeros(size(centers, 1), 1);
    
    for i = 1:size(centers, 1)
       distances(i) = distance(centers(i, :), x);
    end
    
    [dummy, label] = min(distances); 
end





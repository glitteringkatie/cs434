function main = as5()
    
%     clf;
    clc;
    %Load training data
    train;
    X = fileMatrix(:,1:(end-1));
    %Get results
    Y = fileMatrix(:,end);

    %Number of training data entries (e.g. 1400)
    numDataEntries = size(X,1);
    for k = [2 4 6 8]
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
        best_labels
        best_centers
        best_sse
    end
    main = 0;
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





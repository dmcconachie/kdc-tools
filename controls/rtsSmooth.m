function [X, P] = rtsSmooth(X, P, B, u, A, Q_process)
    
    for k = size(X,2)-1:-1:1
        % predict what things ought to be like
        X_pred = A * X(:,k) + B*u;
        P_pred = A * P(:,:,k) * A' + Q_process;
        
        % Smoother gain, similar to Kalman gain
        C = P(:,:,k) * A' / P_pred;
        
        % Given the predicted next state and the kalman next state,
        % estimate where we actually are
        X(:,k)   = X(:,k) + C * (X(:,k+1) - X_pred);
        P(:,:,k) = P(:,:,k) + C * (P(:,:,k+1) - P_pred) * C';
    end

end


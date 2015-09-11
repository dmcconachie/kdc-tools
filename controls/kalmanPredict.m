function [ X_pred, P_pred ] = kalmanPredict( X, P, u, A, B, Q_process )
% TODO: error check this input

    X_pred = A*X + B*u;
    P_pred = A*P*A' + Q_process;

end


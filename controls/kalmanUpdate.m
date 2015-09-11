function [ X, P ] = kalmanUpdate( X_pred, P_pred, y_meas, C, Q_measure )

    residual = y_meas - C*X_pred;
    % project the state covariance into the measurement space, then add
    % measurement noise
    S = C*P_pred*C' + Q_measure;
    
    % Kalamn gain, projects P_pred into measurement space, adds noise
    % there, then moves back into state space.  This is the result of
    % conditioning on part of a multi-variate gaussian.
    K = P_pred * C'/ S;
    
    % move towards the measured y
    X = X_pred + K*residual;
    P = (eye(6) - K*C)*P_pred;
end


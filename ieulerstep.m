function [unew]  = ieulerstep( A, uold, h )
    [m, ~] = size(A);
    unew = (eye(m) - h * A) \ uold;
end
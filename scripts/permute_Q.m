function Qp = permute_Q(Q)

    % function that returns array of permuted Q values (assuming cubic
    % symmetry, given an input Q. the input Q is returned as element 1
    
    H = Q(1); K = Q(2); L = Q(3);
    
    Qp = zeros(6,3);
   
    Qp(1,:) = [ H K L ];
    Qp(2,:) = [ H L K ];
    Qp(3,:) = [ L H K ];
    Qp(4,:) = [ L K H ];
    Qp(5,:) = [ K L H ];
    Qp(6,:) = [ K H L ];
    
    
    
    
    
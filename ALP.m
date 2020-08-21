function g = ALP(v, l, m) % ALP = associated legendre polynomial 
    % both l amd m should be integers
    % the following condition will check for the above constraint 
    if ( ~isnumeric(l) || ~isnumeric(m)) || ( ceil(abs(m)) ~= abs(m) || ceil(abs(l)) ~= abs(l) )
        ME = MException('MyComponent:variabletypeError', 'l should be positive integer and m should be an integer');
        throw(ME);
    else 
        if abs(m) <= l 
            % if m is in between -l and l then  find
            % legendre polynomial 
            lp = legendreP(l,v);
            % Associated legendre polynomial
            f(v) = ((1-v^2)^(abs(m)/2))*diff(lp, abs(m));
            % return the calculated Associated Lengendre polynomial 
            g = f;
        else 
            g = 0;
        end
    end
end 
% ALUP - associated Laguerre Polynomial 
function L = ALUP(r, n, l)
    % both l amd n should be integers
    % the following condition will check for the above constraint  
    if ~isnumeric(n) || ~isnumeric(l) 
        throw(MException('MyComponent:InvalidDataType', 'n and l should be numbers'));
    elseif n < 0 || ceil(abs(n)) ~= abs(n) || l < 0 || ceil(abs(l)) ~= abs(l) 
        throw(MException('MyComponent:InvalidDataType', 'n and l should be positive integers'));
    elseif ~(l <= n-1)
        throw(MException('MyComponent:InvalidDataType', 'l should be less than n'));
    end 
    % define some constants 
    a = 0.529*10^(-10); % in meters 
    p = 2*l+1;
    q = n+l;
    % get the coefficients of the Laguerre polynomial in order 
    f = fliplr(coeffs(laguerreL(q, r), r));
    % return the polynomial after calculating it 
    L = ((-1)^p)*diff(laguerreL(q, r)/abs(f(1)), p) ;%(2*r/(n*a))
end
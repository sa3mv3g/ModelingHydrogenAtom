% NAWF = normalized angular wave function
function Y = NAWF(th, phi, l, m)
    % l should be positive integer and m should be an integer
    % the following condition will check for the above constraint 
    if ( ~isnumeric(l) || ~isnumeric(m)) || ( ceil(abs(m)) ~= abs(m) || ceil(abs(l)) ~= abs(l) )
        ME = MException('MyComponent:variabletypeError', 'l should be positive integer and m should be an integer');
        throw(ME);
    end 
    eps = 0; % this is a constant which will be used later in this function file
    % its value will is calculated below
    if m <= 0 
        eps = 1;
    else 
        eps = (-1)^m;
    end
    if abs(m) <= l
        % if the absolute of magnetic number is less than or equal to
        % azimuthal quantum number then 
        % get the associated legendre polynomial 
        % define a symbol for the working 
        syms x;
        % get the Associated Legendre function 
        P(x) = ALP(x, l, m);
        % change all the aoourance of x by cos
        P(x) = P(cos(th));
        % calculate some other function 
        Q(phi) = exp(m*phi*1i); 
        c = sqrt(((2*l+1)/(4*pi))* (factorial(l-abs(m))) /(factorial(l+abs(m))) );
        % get the final expression of normalized angular wave function
        Y = eps*c*P(x)*Q(phi);
    else 
        % if absolute of magnetic number is less than azimuthal quantum
        % number then normalized angular wave function is 0
        Y =0;
    end
end
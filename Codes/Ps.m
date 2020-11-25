function [ Ps ] = Ps( a,e )
%this function will be calculating perimeter (circumference) of the ellipse
%this represents the "complete" flux path based on its air-gap region. the
%real arc section multiplier (1/2, 1/4) should be used in length
%calculation 

%%%both a and e should be calculated in the reluctance calc loop

b = a*sqrt(1-e);

pi = 3.14159;

Ps = pi * (3*(a+b) - sqrt((3*a+b)*(a+3*b)));

end


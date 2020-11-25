%Update Mur vector based on new BH values

%be sure to update info only for core regions! 10-59!

for ii = 10:59
    if murall(ii) == 0
        ;
    else 


    if Ball(ii) < 1    
        
        b1 = 4;
                
    else
        b1 = 1;
    end
    
    b2 = b1 + 1;

murtemp(ii) = murall(ii);

murall(ii) = Patrick_Js(abs(Hall(ii)));

% 
    murall(ii) = Patrick_Js(abs(Hall(ii))) * (Patrick_Js(abs(Hall(ii)))/murtemp(ii)); %speeds up convergence for large difference between mur and mur-1
% 
murall(ii) = (murall(ii)+b1*murtemp(ii))/b2;
   
    end
        
end

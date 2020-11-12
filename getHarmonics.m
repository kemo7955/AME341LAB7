function [harmonics,power] = getHarmonics(dataSet,n,threshold)

index = find( islocalmax(dataSet(:,2)) );
harm = dataSet(index,1);
p = dataSet(index,2);

if nargin < 2
    if length(index) > 5
        harmonics = harm(1:5);
        power = p(1:5);
    else
        harmonics = harm(1:length(index));
        power = p(1:length(index));
    end
    
else
    j=1;
    for i=1:n
       if p(i) > threshold
           harmonics(j) = harm(i);
           power(j) = p(i);
           j = j+1;
           if j > 5
               break
           end
       end
    end
end

end
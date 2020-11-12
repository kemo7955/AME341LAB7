function [freq,power] = getFundamental(dataSet)

index = find(max(dataSet(:,2)) == dataSet(:,2));
freq = dataSet(index,1);
power = dataSet(index,2);

end

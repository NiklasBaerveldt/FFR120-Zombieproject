function [closestHuman] = FindClosestHuman(zombie,humans)
nrOfHumans = size(humans(:,1));
shortestDistance = Inf;
closestHuman = 0;
for i = 1 : nrOfHumans
    distance = DistanceBetweenPoints(zombie,humans(i,:));
    if  distance < shortestDistance
        shortestDistance = distance;
        closestHuman = humans(i,:);
    end
end
end


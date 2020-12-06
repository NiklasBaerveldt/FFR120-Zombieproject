function [closestZombie] = FindClosestZombie(human,zombies,obstacles,sightRange)
nrOfHumans = size(zombies(:,1));
shortestDistance = Inf;
closestZombie = 0;
for i = 1 : nrOfHumans
    distance = DistanceBetweenPoints(human,zombies(i,:));
    if  distance < shortestDistance
        shortestDistance = distance;
        closestZombie = zombies(i,:);
    end
end
end

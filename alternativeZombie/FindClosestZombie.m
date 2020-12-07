function [closestZombie] = FindClosestZombie(human,zombies,sightRange)
nrOfZombies = size(zombies(:,1));
shortestDistance = Inf;
closestZombie = 0;
for i = 1 : nrOfZombies
    distance = DistanceBetweenPoints(human,zombies(i,:));
    if  distance < shortestDistance
        shortestDistance = distance;
        closestZombie = zombies(i,:);
    end
end
end

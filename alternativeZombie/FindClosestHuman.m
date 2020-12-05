function [closestHumans] = FindClosestHuman(zombie,humans,sightRadius)

  nrOfHumans = size(humans(:,1));
  shortestDistance = sightRadius;
  closestHumans = [];
  for i = 1 : nrOfHumans
    distance = DistanceBetweenPoints(zombie,humans(i,:));
    if  distance < sightRadius
      closestHumans(i,:) = humans(i,:);
    end
  end
  closestHumans = sortByDistance(zombie,closestHumans);
  %closest = closestHumans(1,:)
end


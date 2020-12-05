function [target] = ChooseTarget(zombie,humans,obstacle,sightRadius)

  closestHumans = FindClosestHuman(zombie,humans,sightRadius);
  %{
  closestHumansInSight = [0 0];
  for k = 1:size(closestHumans,1)
    distance = DistanceBetweenPoints(zombie,closestHumans(k,:));
    if distance<100%zombieSight
      closestHumansInSight(k,:) = closestHumans(k,:);
    end
  end
  if closestHumansInSight == 0
    target = [randi([0 50],1) randi([0 50],1)];
  else
    for i = 1:size(closestHumansInSight,1)
      for j = 1:size(obstacle,1)
  %}
  if(size(closestHumans,1) > 0)
  for i = 1:size(closestHumans,1)
    for j = 1:size(obstacle,1)
      if DistanceBetweenPoints(closestHumans(i,:),zombie)<=sightRadius   
      if closestHumans(i,1)>=zombie(1) && (obstacle(j,1)<=zombie(1) || ...
      obstacle(j,1)>=closestHumans(i,1) || obstacle(j,2)~=closestHumans(i,2))
        target = closestHumans(i,:);
      elseif closestHumans(i,1)<=zombie(1) && (obstacle(j,1)>=zombie(1) || ...
      obstacle(j,1)<=closestHumans(i,1) || obstacle(j,2)~=closestHumans(i,2))
        target = closestHumans(i,:);
      elseif closestHumans(i,2)>=zombie(2) && (obstacle(j,1)<=zombie(2) || ...
      obstacle(j,2)>=closestHumans(i,2) || obstacle(j,1)~=closestHumans(i,1))
        target = closestHumans(i,:);
      elseif closestHumans(i,2)<=zombie(2) && (obstacle(j,2)>=zombie(2) || ...
      obstacle(j,2)<=closestHumans(i,2) || obstacle(j,1)~=closestHumans(i,1))
        target = closestHumans(i,:);
      else
        target = [randi([0 50],1) randi([0 50],1)];
      end
      else
        target = [randi([0 50],1) randi([0 50],1)];
      end
    end
  end
  target = closestHumans(1,:);
  else
  target = [randi([0 50],1) randi([0 50],1)];
  end
  
end


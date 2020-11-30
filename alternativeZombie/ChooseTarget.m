function [target] = ChooseTarget(zombie,humans,obstacle)
  closestHumans = FindClosestHuman(zombie,humans);
  for i = 1:size(closestHumans,1)
    for j = 1:size(obstacle,1)
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
        target = [Inf Inf];
      end
    end
  end
end


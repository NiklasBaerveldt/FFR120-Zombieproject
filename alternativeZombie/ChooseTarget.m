function [target] = ChooseTarget(zombie,humans,obstacle,sightRadius)
  closestHumans = FindClosestHuman(zombie,humans,sightRadius);
  for i = 1:size(closestHumans,1)
      [bLineX,bLineY] = Bresenham(zombie(1),zombie(2),closestHumans(i,1),...
      closestHumans(i,2));
    for j = 1:size(obstacle,1)
      for k = 1:size(bLineX)
        if obstacle(j,:) ~= [bLineX(k),bLineY(k)]
          target = closestHumans(i,:);
        end
      end
    end
  end
  
end


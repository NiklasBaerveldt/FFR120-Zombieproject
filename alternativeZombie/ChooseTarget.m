function [target] = ChooseTarget(zombie,humans,obstaclegrid,sightRadius)
%   closestHumans = FindClosestHuman(zombie,humans,sightRadius);
%   for i = 1:size(closestHumans,1)
%       [bLineX,bLineY] = Bresenham(zombie(1),zombie(2),closestHumans(i,1),...
%       closestHumans(i,2));
%     for j = 1:size(obstacle,1)
%       for k = 1:size(bLineX)
%         if obstacle(j,:) ~= [bLineX(k),bLineY(k)]
%           target = closestHumans(i,:);
%         end
%       end
%     end
%   end
closestHumans = FindClosestHuman(zombie,humans,sightRadius);
hasFoundTarget = 0;
numberOfHumansInSight = size(closestHumans,1);
i = 1;
target = [randi([0 50],1),randi([0 50],1)];
 while(hasFoundTarget == 0 && i <= numberOfHumansInSight)
      [bLineX,bLineY] = Bresenham(zombie(1),zombie(2),closestHumans(i,1),...
      closestHumans(i,2));
  
      if sum(sum(obstaclegrid(bLineX,bLineY)))==0
          target=closestHumans(i,:);
          hasFoundTarget = 1;
      end
      
      i = i + 1;
  
  end
end


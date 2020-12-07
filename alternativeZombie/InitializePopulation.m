function [humans,zombies,obstacles] = InitializePopulation(gridSize,nrOfHumans,nrOfZombies,nrOfObstacles)

  humans = zeros(gridSize); 
  zombies = zeros(gridSize);
  obstacles = zeros(gridSize);
  areaGrid = zeros(gridSize);
  obstacleSize = 10;
  [humanXCoordinates,humanYCoordinates,areaGrid] = GenerateGridCoordinates(gridSize,nrOfHumans,areaGrid);
  [zombieXCoordinates,zombieYCoordinates,areaGrid] = GenerateGridCoordinates(gridSize,nrOfZombies,areaGrid);
  [obstacleXCoordinates,obstacleYCoordinates,areaGrid] = GenerateGridCoordinates(gridSize,nrOfObstacles,areaGrid);

  for i = 1 : nrOfHumans
    humans(humanXCoordinates(i),humanYCoordinates(i)) = 1;
  end
      
  for i = 1:nrOfZombies
    zombies(zombieXCoordinates(i),zombieYCoordinates(i)) = 1;
  end
  
  for i = 1:nrOfObstacles
    obstacles(obstacleXCoordinates(i),obstacleYCoordinates(i)) = 1;
    %r = randi([0 1],1);
    %x = randi([-1 1],1);%*(1-r);
    %y = randi([-1 1],1);%*r;
    for j = 1:obstacleSize
      x = randi([-1 1],1);%*(1-r);
      y = randi([-1 1],1);%*r;
      if obstacleXCoordinates(i)+x<gridSize+1 && obstacleXCoordinates(i)+x>0 ...
      && obstacleYCoordinates(i)+y<gridSize+1 && obstacleYCoordinates(i)+y>0 ...
      && areaGrid(obstacleXCoordinates(i)+x,obstacleYCoordinates(i)+y)~=1
        obstacles(obstacleXCoordinates(i)+x,obstacleYCoordinates(i)+y)=1;
      end
    end
  end
 
end
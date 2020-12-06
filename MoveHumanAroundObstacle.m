function [newHumanGrid] = MoveHumanAroundObstacle(human,humans,obstacles,zombies)
newHumanGrid = humans;
gridSize = size(humans,1);
possibleNewPositions = GetNeighbourTiles(human,gridSize);
nrOfPossiblePositions = size(possibleNewPositions,1);
for i = 1 : nrOfPossiblePositions
    x = possibleNewPositions(i,1);
    y = possibleNewPositions(i,2);
    if (humans(x,y) ~= 1 && obstacles(x,y) ~= 1 && zombies(x,y) ~= 1) && HumanIsAtObstacle([x,y],obstacles)
        newHumanGrid(human(1),human(2)) = 0;
        newHumanGrid(x,y) = 1;
        break; 
    end
end
end


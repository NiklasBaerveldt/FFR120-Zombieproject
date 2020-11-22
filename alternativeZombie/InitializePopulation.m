function [humans,zombies] = InitializePopulation(gridSize,nrOfHumans,nrOfZombies)
humans = zeros(gridSize); 
zombies = zeros(gridSize);
[humanXCoordinates,humanYCoordinates] = GenerateGridCoordinates(gridSize,nrOfHumans);
[zombieXCoordinates,zombieYCoordinates] = GenerateGridCoordinates(gridSize,nrOfZombies); % Maybe not random?

for i = 1 : nrOfHumans
    humans(humanXCoordinates(i),humanYCoordinates(i)) = 1;
end

for i = 1:nrOfZombies
    zombies(zombieXCoordinates(i),zombieYCoordinates(i)) = 1;
end

end


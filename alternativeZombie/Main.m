clc; clear;
gridSize = 20;
nrOfHumans = 5;
nrOfZombies = 1;
nrOfObstacles = 4;
zombieStepLength = 1;
%humanStepLength = 2;
sightRange = 2;
[humans,zombies,obstacles] = InitializePopulation(gridSize,nrOfHumans,nrOfZombies,nrOfObstacles);
timePeriod = 1 : 500;

while sum(sum(humans==1)) > 0
    zombies = MoveZombies(humans,zombies,obstacles,1,sightRange);
    [humans,zombies] = InfectHumans(humans,zombies);
    humans = MoveHumans(humans,obstacles,zombies,sightRange);
    VisualizePopulation(humans,zombies,obstacles)
end


%%
zombies
sum(sum(zombies == 1))
disp(['Number of humans converted to zombies: ',num2str(nrOfHumans - sum(sum(humans == 1)))]);
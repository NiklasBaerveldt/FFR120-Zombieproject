clc; clear;
gridSize = 50;
nrOfHumans = 50;
nrOfZombies = 1;
nrOfObstacles = 30;
zombieStepLength = 2;
humanStepLength = 1;
sightRange = 10;
[humans,zombies,obstacles] = InitializePopulation(gridSize,nrOfHumans,nrOfZombies,nrOfObstacles);



while sum(sum(humans==1)) > 0
    for t = 1 : zombieStepLength
    zombies = MoveZombies(humans,zombies,obstacles,1,sightRange);
    end
    [humans,zombies] = InfectHumans(humans,zombies);
    for t = 1 : humanStepLength
    humans = MoveHumans(humans,obstacles,zombies,sightRange);
    end
    VisualizePopulation(humans,zombies,obstacles)
    sum(sum(humans==1))
end


%%
zombies
sum(sum(zombies == 1))
disp(['Number of humans converted to zombies: ',num2str(nrOfHumans - sum(sum(humans == 1)))]);
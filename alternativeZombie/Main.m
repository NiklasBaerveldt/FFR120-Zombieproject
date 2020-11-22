clc; clear;
gridSize = 50;
nrOfHumans = 500;
nrOfZombies = 1;
zombieStepLength = 1;
%humanStepLength = 2;

[humans,zombies] = InitializePopulation(gridSize,nrOfHumans,nrOfZombies);

timePeriod = 1 : 500;

while sum(sum(humans==1)) > 0
    zombies = MoveZombies(humans,zombies,zombieStepLength);
    [humans,zombies] = InfectHumans(humans,zombies);
    %humans = MoveHumans(humans,zombies,humanStepLength); 
    VisualizePopulation(humans,zombies)
end


%%
zombies
sum(sum(zombies == 1))
disp(['Number of humans converted to zombies: ',num2str(nrOfHumans - sum(sum(humans == 1)))]);
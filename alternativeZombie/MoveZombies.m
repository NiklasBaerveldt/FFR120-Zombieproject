function [newZombieGrid] = MoveZombies(humanGrid,zombieGrid,stepLength)
newZombieGrid = zombieGrid;
[humanX, humanY] = find(humanGrid == 1);
humans = [humanX, humanY];
[zombieX, zombieY] = find(zombieGrid == 1);
for i = 1 : length(zombieX)
    zombie = [zombieX(i),zombieY(i)];
    target = ChooseTarget(zombie,humans);
    newZombieGrid = MoveZombie(newZombieGrid,zombie,target,stepLength);
end
end


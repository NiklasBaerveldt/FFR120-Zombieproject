function [newZombieGrid] = MoveZombie(zombieGrid,zombie,target,stepLength)
newZombieGrid = zombieGrid;
if target ~= 0 % No human targets available.

distanceX = abs(zombie(1) - target(1));
distanceY = abs(zombie(2) - target(2));
zombieX = zombie(1);
zombieY = zombie(2);
if distanceX > 0
    if stepLength >= distanceX
        zombieX = target(1);
    else
        zombieX = zombieX + sign(target(1)- zombieX)*stepLength;   
    end
end

if distanceY > 0 
    if stepLength >= distanceY
        zombieY = target(2);
    else
        zombieY = zombieY + sign(target(2) - zombieY)*stepLength;
    end
end
if zombieGrid(zombieX,zombieY) == 1 
else
    newZombieGrid(zombie(1),zombie(2)) = 0;
    newZombieGrid(zombieX,zombieY) = 1;
end   
end
end


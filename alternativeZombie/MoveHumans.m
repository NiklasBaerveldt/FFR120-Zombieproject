function [newHumanGrid] = MoveHumans(humans,obstacles,zombies,sightRange)
newHumanGrid = humans;
[humanX, humanY] = find(humans == 1)
for i = 1 : length(humanX)
    human = [humanX(i),humanY(i)];
    newHumanGrid = MoveHuman(newHumanGrid,obstacles,zombies,human,sightRange);
end
end


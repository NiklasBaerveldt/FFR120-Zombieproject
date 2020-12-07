function [zombiesInSight] = FindZombiesInSightRadius(human,zombies,sightRange)
nrOfZombies = size(zombies,1);
zombiesInSightX = [];
zombiesInSightY = [];
z = 1
for i = 1 : nrOfZombies
    for j = 1 : nrOfZombies
        if zombies(i,j) == 1;
            zombiesInSightX = [zombiesInSightX i];
            zombiesInSightY = [zombiesInSightY j];
            z = z + 1;
        end
    end
end
zombiesInSight = [zombiesInSightX,zombiesInSightY];
end


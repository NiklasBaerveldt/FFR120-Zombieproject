function [] = VisualizePopulation(humans,zombies)
humans = humans .* 2;
creatures = humans + zombies;

if sum(creatures(:) == 2) > 0 
    map = [0, 0, 0.0
        0, 1, 0
        1, 0, 0];
elseif sum(creatures(:) == 1) > 0 
    map = [0, 0, 0.0
        0, 1, 0];
else
    map = [0, 0, 0.0];
end
imagesc(creatures);
colormap(map);
pause(0.5);
end


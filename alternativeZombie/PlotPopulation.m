function [] = PlotPopulation(humans,zombies)
  
  [humansX, humansY] = find(humans == 1);
  [zombiesX, zombiesY] = find(zombies == 1);
  plot(humansX,humansY,'x','Color','red');
  hold on
  plot(zombiesX,zombiesY,'x','Color','green');
  drawnow

end


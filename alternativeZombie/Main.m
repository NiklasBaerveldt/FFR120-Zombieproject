clc; clear;
gridSize = 50;
nrOfHumans = 50;
nrOfZombies = 1;
nrOfObstacles = 20;
stopTime = 500;
XEdge = stopTime;
YEdge = nrOfHumans;
zombieStepLength = 1;
%humanStepLength = 2;
zombieSightRadius = 5;
humanSightRadius = 20;
nrHumansOverTime = zeros(1,stopTime);
nrZombiesOverTime = zeros(1,stopTime);

[humans,zombies,obstacles] = InitializePopulation(gridSize,nrOfHumans,...
  nrOfZombies,nrOfObstacles);
figure1 = figure(1);
figure2 = figure(2);
timePeriod = 1 : stopTime;
time = 1;

while sum(sum(humans==1)) > 0
  zombies = MoveZombies(humans,zombies,obstacles,zombieStepLength,zombieSightRadius);
  [humans,zombies] = InfectHumans(humans,zombies);
  %humans = MoveHumans(humans,zombies,obstacles,humanStepLength,humanSightRadius); 
  set(0,'CurrentFigure',figure1);
  VisualizePopulation(humans,zombies,obstacles)
  nrHumansOverTime(time) = sum(sum(humans));
  nrZombiesOverTime(time) = sum(sum(zombies));
    
  set(0,'CurrentFigure',figure2);
  cla
  hold on
  %axis([0,XEdge,0,YEdge])
  plot(nrHumansOverTime(1:time),'b-')
  %plot(nrZombiesOverTime(1:time),'r-') uncomment this to see
  %dissappearing zombie phenomenom
      
  %Cheatcode for demonstration:
  plot(50-nrHumansOverTime(1:time),'r-')
  hold off
  drawnow update
  time = time + 1;
end

%zombies
%sum(sum(zombies == 1))
disp(['Number of humans converted to zombies: ',num2str(nrOfHumans -...
  sum(sum(humans == 1)))]);

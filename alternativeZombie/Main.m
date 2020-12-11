clc; clear;

numberOfHumans = [10 15 20 25 30 35 40];
timeArray = zeros(1,size(numberOfHumans,2));
iterations = 5;
averageTimeArray = zeros(iterations,size(numberOfHumans,2));
k=1;

for nrOfHumans = numberOfHumans
for it = 1:iterations
gridSize = 30;
%nrOfHumans = 50;
nrOfZombies = 1;
nrOfObstacles = 30;
stopTime = 500;
XEdge = stopTime;
YEdge = nrOfHumans;
zombieStepLength = 1;
humanStepLength = 1;
sightRange = 30;
nrHumansOverTime = zeros(1,stopTime);
nrZombiesOverTime = zeros(1,stopTime);

[humans,zombies,obstacles,nrOfObstacles] = InitializePopulation(gridSize,nrOfHumans,nrOfZombies,nrOfObstacles);
figure1 = figure(1);
%figure2 = figure(2);
timePeriod = 1 : stopTime;
time = 1;

while sum(sum(humans==1)) > 0
    for t = 1 : zombieStepLength
    zombies = MoveZombies(humans,zombies,obstacles,1,sightRange);
    end
    [humans,zombies] = InfectHumans(humans,zombies);
    set(0,'CurrentFigure',figure1);
    for t = 1 : humanStepLength
    humans = MoveHumans(humans,obstacles,zombies,sightRange);
    end
    nrHumansOverTime(time) = sum(sum(humans));
    nrZombiesOverTime(time) = sum(sum(zombies));
    
    VisualizePopulation(humans,zombies,obstacles)
    sum(sum(humans==1))
     %{
     set(0,'CurrentFigure',figure2);
     cla
     hold on
     %axis([0,XEdge,0,YEdge])
     plot(nrHumansOverTime(1:time),'b-')
     plot(nrZombiesOverTime(1:time),'r-') %uncomment this to see
     %dissappearing zombie phenomenom
     
     %Cheatcode for demonstration:
     %plot(50-nrHumansOverTime(1:time),'r-')
     hold off
     drawnow update
      %}
     time = time + 1;
end
averageTimeArray(k,it) = time;
end
%%
zombies;
sum(sum(zombies == 1));
disp(['Nr of humans: ',num2str(nrOfHumans)]);
disp(['Nr of zombies: ',num2str(nrOfZombies)]);
disp(['Nr of obstacles: ',num2str(sum(sum(obstacles)))]);
disp(['Sight range: ',num2str(sightRange)]);
disp(['Time: ',num2str(time)])
%disp(['Number of humans converted to zombies: ',num2str(nrOfHumans - sum(sum(humans == 1)))]);
timeArray(1,k)=sum(averageTimeArray(k,:))/iterations;
k=k+1;
end


plot(timeArray,numberOfHumans)
axis([timeArray(size(timeArray,2))-20 timeArray(1)+20 0 numberOfHumans(size(numberOfHumans,2))+20])
xlabel("Time")
ylabel("Number of Humans")
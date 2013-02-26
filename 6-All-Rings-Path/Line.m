%(c) 2013 The Polywell Guy - http://thepolywellblog.blogspot.com/

function Solution = Line(RingStructure)


disp('Starting Point');
Start = [0,0,0];
Start(1)  = input('X? :');
Start(2)  = input('Y? :');
Start(3)  = input('Z? :');

disp(' ');
disp('Finishing Point');
Finish = [0,0,0];
Finish(1)  = input('X? :');
Finish(2)  = input('Y? :');
Finish(3)  = input('Z? :');


Steps = input('Steps? :');

coordinates = zeros(Steps,3);
Solution = zeros(Steps,4);

coordinates = Fill(Start, Finish, coordinates, 1);
coordinates = Fill(Start, Finish, coordinates, 2);
coordinates = Fill(Start, Finish, coordinates, 3);

for n = 1:Steps
   
    Point = [0,0,0];
    Point(1) = coordinates(n,1);
    Point(2) = coordinates(n,2);
    Point(3) = coordinates(n,3);
    
Solution(n,1) = sqrt(abs(Start(1)-Point(1))^2+abs(Start(2)-Point(2))^2+abs(Start(3)-Point(3))^2);


    All = CartesianEnter(Point, RingStructure);
    
    Solution(n,2) = All.Vector(1);
    Solution(n,3) = All.Vector(2);
    Solution(n,4) = All.Vector(3);
end


end


function coordinates = Fill(Start, Finish, coordinates, Index)

steps = size(coordinates,1);
distance = Start(Index) - Finish(Index);

if (Start(Index) > Finish(Index))
    Neg = 1;
else
    Neg = 0;   
end

if (Start(Index) == Finish(Index))
    Increments = 0;
else
    Increments = abs(distance/(steps-1));
end

coordinates(1,Index) = Start(Index);
coordinates(steps,Index) = Finish(Index);

for n =2:steps
    if Neg
        coordinates(n,Index) = Start(Index) - (n-1)*Increments;   
    else
        coordinates(n,Index) = Start(Index) + (n-1)*Increments;   
    end     
end

end
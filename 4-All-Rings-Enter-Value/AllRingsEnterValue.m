
%(c) 2013 The Polywell Guy - http://thepolywellblog.blogspot.com/

Parameters = struct('a',0,'s',0,'Mu',0,'Current',0,'RingXSecRadius',0,'Turns',0,'CageToRings',0,'CageVoltage',0,'epsilon',0);
Parameters.a = 0.127;
Parameters.s = 0.1963;
Parameters.Mu = 0.00000125663706;
Parameters.Current = 100;
Parameters.Turns = 200;
Parameters.CageToRings = 0.3622;
Parameters.CageVoltage = 12500;
Parameters.RingXSecRadius = 0.05715;
Parameters.epsilon = 0.0000000000088541878;


ampTurns = Parameters.Current*Parameters.Turns;
Ring = struct('RingPoint1',[0,0,0],'RingPoint2',[0,0,0],'Direct',[0,0,0],'Ampturns',ampTurns,'Mu',0.00000125663706,'a',Parameters.a,'s', Parameters.s);
RingStructure = struct('One',Ring,'Two',Ring,'Three',Ring,'Four',Ring,'Five',Ring,'Six',Ring,'s', Parameters.s, 'Zinc', 0, 'TurnOn',0);

% Turning off Zinc will remove rings 5 and 6
RingStructure.Zinc = 1;

% You can setup this code to only turn on a ring (1-6) or 0 for all on. 
RingStructure.TurnOn = 0;



% Setting up the ring structure
RingStructure.One.RingPoint1 = [-Parameters.s,Parameters.a,0];
RingStructure.One.RingPoint2 = [-Parameters.s,-Parameters.a,0];
RingStructure.Two.RingPoint1 = [Parameters.a,Parameters.s,0];
RingStructure.Two.RingPoint2 = [-Parameters.a,Parameters.s,0];
RingStructure.Three.RingPoint1 = [Parameters.s,-Parameters.a,0];
RingStructure.Three.RingPoint2 = [Parameters.s,Parameters.a,0];
RingStructure.Four.RingPoint1 = [-Parameters.a,-Parameters.s,0];
RingStructure.Four.RingPoint2 = [Parameters.a,-Parameters.s,0];
RingStructure.Five.RingPoint1 = [Parameters.a,0,-Parameters.s];
RingStructure.Five.RingPoint2 = [-Parameters.a,0,-Parameters.s];
RingStructure.Six.RingPoint1 = [Parameters.a,0,Parameters.s];
RingStructure.Six.RingPoint2 = [-Parameters.a,0,Parameters.s];



disp(' ');
disp('Hello!');
disp(' ');
disp('This code finds the magnetic field strength (in gauss) at a given point inside WB6.');
disp('The center of the ring structure is the point (0, 0, 0).  The rings are numbered 1-6. ');
disp('You enter the coordinates in meters and the program lists the X, Y and Z fields from a given ring');  
disp('and then from all rings combined.');
disp(' ');


Point = [0,0,0];
Point(1)  = input('X? :');
Point(2)  = input('Y? :');
Point(3)  = input('Z? :');

SolvedField = CartesianEnter(Point, RingStructure);



Sol = Report(SolvedField, 1);
Sol = Report(SolvedField, 2);
Sol = Report(SolvedField, 3);

clear('ampTurns', 'Index', 'Sol', 'Ring');
disp(SolvedField.Vector);





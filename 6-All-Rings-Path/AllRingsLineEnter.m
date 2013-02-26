
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


disp(' ');
disp('Hello!');
disp(' ');
disp('This code plots the magnetic field strength as you move from a starting');
disp('to a finishing point inside WB6.  You can pick the number of steps taken ');
disp('between these points.  The point (0,0,0) is the center of the ring structure.');
disp('In the plot Blue is X, Green is Y and Red is Z');
disp(' ');



T1 = 'The rings have a radius of :';
T2 = num2str(Parameters.a);
T3 = ' (Meters)';
disp(strcat(T1,T2,T3));

T1 = 'The rings are located :';
T2 = num2str(Parameters.s);
T3 = ' (Meters) from the center';
disp(strcat(T1,T2,T3));

T1 = 'The rings have :';
T2 = num2str(Parameters.Current*Parameters.Turns);
T3 = ' (AmpTurns)';
disp(strcat(T1,T2,T3));

disp(' ');


% This setting incorperates the Z-Direction
RingStructure.Zinc = 1;

% This setting allows you to only turn on 1 ring (0 for all)
RingStructure.TurnOn = 0;

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

Solution = Line(RingStructure);


Distance = Solution(:,1);
X = Solution(:,2);
Y = Solution(:,3);
Z = Solution(:,4);


plot(Distance,X,Distance,Y,Distance,Z);
T1 = 'Magnetic Field Along Path :';
T2 = num2str(Parameters.Current*Parameters.Turns);
T3 = ' (AmpTurns)';
title(strcat(T1,T2,T3))
xlabel('Distance Along Path (Meters)')
ylabel('Magnetic Field Strength (Gauss)')


clear('T1','T2','T3','ampTurns','X','Y','Z','Ring','Distance');
disp(' ');







%(c) 2013 The Polywell Guy - http://thepolywellblog.blogspot.com/

Parameters = struct('a',0,'s',0,'Mu',0,'Current',0,'RingXSecRadius',0,'Turns',0,'CageToRings',0,'CageVoltage',0,'epsilon',0,'turnOn',0,'Zinc',0);
Parameters.a = 0.069;
Parameters.s = 0.108;
Parameters.Mu = 0.00000125663706;
Parameters.Current = 256;
Parameters.Turns = 160;
%Parameters.CageToRings = 0.129;
%Parameters.CageVoltage = 12500;
Parameters.RingXSecRadius = 0.013;
Parameters.epsilon = 0.0000000000088541878;



disp(' ');
disp('Greetings!');
disp(' ');
disp('	This code generates an energy density map inside WB6.  This is shown in the XY plane');
disp(', a quarter of a meter around the ring structure centered at the dead center.');
disp('The point (0,0,0) is the center of the rings.  The energy density is entirely driven ');
disp('by the magnetic field.  Unfortunately, you need allot of contours (~1,000) ');
disp('to get a detailed map, and this takes multiple minutes to run.');
disp(' ');
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
disp(' ');

Hieght = 0.4;
Width = 0.4;

Cells = input('Number of Cells? :');

% This setting turns off rings (1-6), zero for all the rings on.
Parameters.turnOn = 0;


% This setting turns off rings 5&6, will you incorperate the Z-direction?
Parameters.Zinc = 1;


%Bounds of Modeling (In Meters)
Bounds = struct('XNeg',-(Width/2),'XPos',(Width/2),'YNeg',-(Hieght/2),'YPos',(Hieght/2));


Coordinates = MakeMatrix(Bounds, Cells);

SolMats = CalcField(Parameters, Coordinates, Cells);

 
LineNumber = input('Number of Countours? :');
TextNumber = input('Text #? (higher --> less text:');
X = Coordinates.XCor(:,:);
Y = Coordinates.YCor(:,:); 
Field = SolMats.MagDen(:,:);
[C,h] = contour(X,Y,Field, LineNumber);
set(h,'ShowText','on','TextStep',get(h,'LevelStep')*TextNumber)
colormap cool
clear('X','Y','Field','LineNumber','TextNumber');

    
clear('Hieght', 'Width','Cells', 'Selector', 'C','h','T1','T2','T3');


%(c) 2013 The Polywell Guy - http://thepolywellblog.blogspot.com/

Parameters = struct('a',0,'s',0,'Mu',0,'Current',0,'RingXSecRadius',0,'Turns',0,'CageToRings',0,'CageVoltage',0,'epsilon',0,'turnOn',0,'Zinc',0);
Parameters.a = 0.127;
Parameters.s = 0.1963;
Parameters.Mu = 0.00000125663706;
Parameters.Current = 100;
Parameters.Turns = 200;
Parameters.CageToRings = 0.3622;
Parameters.CageVoltage = 12500;
Parameters.RingXSecRadius = 0.0265;
Parameters.epsilon = 0.0000000000088541878;



Hieght = 0.5;
Width = 0.5;



disp(' ');
disp('Hello!');
disp(' ');
disp('This code generates a vector plot of the B field made in WB-6.');
disp('The plot is only in the XY plane half a meter around ring center. ');
disp('Ring center is the point (0,0).  Raising the number of cells increases the resolution.');
disp(' ');




Cells = input('Number of Cells? (suggest 40):');
TurnON = input('Select Rings To Turn On? (1-6, 0 for all)');
Parameters.turnOn = TurnON;

% This turns on rings 5 and 6. 
Parameters.Zinc = 1;

% This scale changes how the big the vectors are
Scale = 7;

%Bounds of Modeling (In Meters)
Bounds = struct('XNeg',-(Width/2),'XPos',(Width/2),'YNeg',-(Hieght/2),'YPos',(Hieght/2));


Coordinates = MakeMatrix(Bounds, Cells);


VectorField = CalcField(Parameters, Coordinates, Cells);


   X = Coordinates.XCor(:,:);
   Y = Coordinates.YCor(:,:); 
   U = VectorField.Xdir(:,:);
   V = VectorField.Ydir(:,:);  
   quiver(X,Y,U,V,Scale);
   clear('X','Y','U','V');
   

clear('Hieght', 'Width','Cells', 'Selector', 'Scale','TurnON');




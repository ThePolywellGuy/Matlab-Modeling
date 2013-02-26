
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


disp(' ');
disp('Hello!');
disp(' ');
disp('This code calculates and plots a ZY plane inside WB6.  This is done by find points inside');
disp('a 3 dimensional cube, 0.5 a meter to a side, around the point (0,0,0) in ring center.');
disp('This code can take some time to work.  You will enter the number of cells and the code generates ');
disp(' a 3D matrix from this.  You then select the plane of interest by entering an cell# along the X axis.');
disp(' ');



% The volume modeled here is a 3D cube, 0.5 meters a side around (0,0,0)
Hieght = 0.5;
Cells = input('Number of Cells?');


% This setting allows you to only turn on specfic rings (0 for all)
Parameters.turnOn = 0;

% This setting allows you to turn off the Z direction
Parameters.Zinc = 1;

%Bounds of Modeling (In Meters)
Bounds = struct('XNeg',-(Hieght/2),'XPos',(Hieght/2),'YNeg',-(Hieght/2),'YPos',(Hieght/2),'ZNeg',-(Hieght/2),'ZPos',(Hieght/2));

Coordinates = MakeMatrix(Bounds, Cells);


SolMats = CalcField(Parameters, Coordinates, Cells);



Sel = input('Cell # on X axis, to plot?');

Y = Coordinates.YCor(Sel,:,:);
Y = reshape(Y,Cells,Cells);
Z = Coordinates.ZCor(Sel,:,:);
Z = reshape(Z,Cells,Cells);

YDir = SolMats.Ydir(Sel,:,:);
YDir = reshape(YDir,Cells,Cells);
ZDir = SolMats.Zdir(Sel,:,:);
ZDir = reshape(ZDir,Cells,Cells);

quiver(Z,Y,ZDir,YDir,1);


clear('Hieght', 'Width','Cells', 'Selector');





%(c) 2013 The Polywell Guy - http://thepolywellblog.blogspot.com/

Parmeters = struct('a', 0, 's', 0, 'Mu', 0, 'Current', 0, 'RingXSecRadius',0, 'Turns', 0);
Parmeters.a = 0.127;
Parmeters.s = 0.196342;
Parmeters.Mu = 0.00000125663706;
Parmeters.Current = 100;
Parmeters.Turns = 200;

disp(' ');
disp('Hello!');
disp(' ');
disp('This program finds the Linear and Radial magnetic field coming from a single ring.');
disp('It works by you entering the distance from the center of the ring (Z)');
disp('and the distance away from the centerline (Rho).');
disp('If you enter zero you will get a N/A.');
disp(' ');

T1 = 'The ring has a radius of :';
T2 = num2str(Parmeters.a);
T3 = ' (Meters)';
disp(strcat(T1,T2,T3));

disp('The ring is placed along the Y axis');

T1 = 'The ring has :';
T2 = num2str(Parmeters.Current*Parmeters.Turns);
T3 = ' (AmpTurns)';
disp(strcat(T1,T2,T3));

disp(' ');
	    




Xinput = input('Z Distance? (Meters)');
Yinput = input('Rho Distance? (Meters)');

Point = [Xinput,Yinput];
clear('Xinput','Yinput');

Vector = SingleRingEnter(Point, Parmeters);

disp(' ');
disp('Radial Magnetic Field (Gauss):');
disp(Vector.Brad);
disp('Linear Magnetic Field (Gauss):');
disp(Vector.Bline);

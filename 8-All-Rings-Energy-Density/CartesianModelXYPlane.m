
%(c) 2013 The Polywell Guy - http://thepolywellblog.blogspot.com/

function All = CartesianModelXYPlane(Point, RingStruct)
% This Function calculates the Cartesian magnetic field from Khachan work



Xstruct = struct('Bline',[1,3],'Brad',[2,4,5,6],'BlineDir',[1,-1]);
Ystruct = struct('Bline',[2,4],'Brad',[1,3,5,6],'BlineDir',[-1,1]);
Zstruct = struct('Bline',[5,6],'Brad',[1,2,3,4],'BlineDir',[1,-1]);

RingField = struct('Bline',0,'Brad',0, 'r', 0, 'z',0,'BradExtra',0); 
Field = struct('One',RingField,'Two',RingField,'Three',RingField,'Four',RingField,'Five',RingField,'Six',RingField);
All = struct('XField',Field,'YField',Field,'ZField',Field,'Vector',[0,0,0]);


All = FindAllFields(Point, RingStruct, All);

s = RingStruct.One.s;
Zinc = RingStruct.Zinc;

All.XField = FindRadDir(All.XField, Point, s);
All.YField = FindRadDir(All.YField, Point, s);
All.ZField = FindRadDir(All.ZField, Point, s);

if ~Zinc
    All = TurnOffRings(All, 5);
    All = TurnOffRings(All, 6);
end
  

Xdirection = FindDirection(Xstruct, All, 1);
Ydirection = FindDirection(Ystruct, All, 2);
Zdirection = FindDirection(Zstruct, All, 3);

All.Vector = [Xdirection, Ydirection, Zdirection];
end


function All = TurnOffRings(All, Ring)

ring = struct('Bline',0,'Brad',0, 'r', 0, 'z',0,'BradExtra',0); 

    switch Ring
        case 1
            All.XField.One = ring;
            All.YField.One = ring;
            All.ZField.One = ring;
        case 2
            All.XField.Two = ring;
            All.YField.Two = ring;
            All.ZField.Two = ring;
        case 3
            All.XField.Three = ring;
            All.YField.Three = ring;
            All.ZField.Three = ring;
        case 4
            All.XField.Four = ring;
            All.YField.Four = ring;
            All.ZField.Four = ring;
        case 5
            All.XField.Five = ring;
            All.YField.Five = ring;
            All.ZField.Five = ring;
        case 6 
            All.XField.Six = ring;
            All.YField.Six = ring;
            All.ZField.Six = ring;
    end
end




function Field = FindRadDir(Field, Point, s)

Field.Two.Bline = -Field.Two.Bline; 
Field.Three.Bline = -Field.Three.Bline;  
Field.Six.Bline = -Field.Six.Bline;  

ABwt = Between(Point, s, 2);
 
if ABwt 
    Field.Two.Brad = -Field.Two.Brad;
    Field.Four.Brad = -Field.Four.Brad;
end


ABwt = Between(Point, s, 1);
   
if ABwt 
    Field.Three.Brad = -Field.Three.Brad;
    Field.One.Brad = -Field.One.Brad;
end

ABwt = Between(Point, s, 3);
if ABwt 
    Field.Five.Brad = -Field.Five.Brad;
    Field.Six.Brad = -Field.Six.Brad;
end

end

function Bwt = Between(point, a, index)
if (abs(point(index)) <= a)
    Bwt = 1;
else
    Bwt = 0;
end
end


function All = FindAllFields(Point, RingStruct, All)

RingField = struct('Bline',0,'Brad',0); 
Field = struct('One',RingField,'Two',RingField,'Three',RingField,'Four',RingField,'Five',RingField,'Six',RingField);

 for n = 1:3
    for m =1:6
        switch m
            case 1
                RingInput = RingStruct.One;
            case 2
                RingInput = RingStruct.Two;
            case 3
                RingInput = RingStruct.Three;
            case 4    
                RingInput = RingStruct.Four;
            case 5
                RingInput = RingStruct.Five;
            case 6 
                RingInput = RingStruct.Six;
        end

       PolarCoord = FindPolar(Point, RingInput, m);
       Rad = Brad(PolarCoord, RingInput);
       Line = Bline(PolarCoord, RingInput);
       
       if isnan(Rad)
           Rad = 0;
       end
       
       if isnan(Line)
           Line = 0;
       end
       Extra = Point(n)/PolarCoord.r;
       if isnan(Extra)
           Extra = 0;
       end       
       
        switch m
            case 1
                Field.One.Brad = Rad;
                Field.One.Bline = Line;
                Field.One.r = PolarCoord.r;
                Field.One.z = PolarCoord.z;  
                Field.One.BradExtra = Extra;  
            case 2
                Field.Two.Brad = Rad;
                Field.Two.Bline = Line;
                Field.Two.r = PolarCoord.r;
                Field.Two.z = PolarCoord.z;   
                Field.Two.BradExtra = Extra;                  
            case 3
                Field.Three.Brad = Rad;
                Field.Three.Bline = Line;
                Field.Three.r = PolarCoord.r;
                Field.Three.z = PolarCoord.z;   
                Field.Three.BradExtra = Extra; 
            case 4    
                Field.Four.Brad = Rad;
                Field.Four.Bline = Line;
                Field.Four.r = PolarCoord.r;
                Field.Four.z = PolarCoord.z;  
                Field.Four.BradExtra = Extra; 
            case 5
                Field.Five.Brad = Rad;
                Field.Five.Bline = Line;
                Field.Five.r = PolarCoord.r;
                Field.Five.z = PolarCoord.z; 
                Field.Five.BradExtra = Extra; 
            case 6 
                Field.Six.Brad = Rad;
                Field.Six.Bline = Line;
                Field.Six.r = PolarCoord.r;
                Field.Six.z = PolarCoord.z;    
                Field.Six.BradExtra = Extra; 
        end
    end
       switch n
         case 1
            All.XField = Field; 
         case 2
            All.YField = Field;       
         case 3
            All.ZField = Field; 
       end
    end
end




function PolarCoord = FindPolar(Point, Ring, Index)
% This function assumes S is going to be greater than A

PolarCoord = struct('r', 0, 'z', 0, 'i',0);

% Find the cloest Ring Point 
Distance1 = Length(Point,Ring.RingPoint1);
Distance2 = Length(Point,Ring.RingPoint2);

if (Distance1 < Distance2)
    RingPoint = Ring.RingPoint1;
else
    RingPoint = Ring.RingPoint2;
end

% Find the S Value
[~, Index2] = max(abs(RingPoint));

% Find the Rho Values
switch Index
    % From Ring One, the Coordinates are (X+S) rho(yz)
    case 1
        vec = [Point(2),Point(3)];
        Index = 1;      
    % From Ring Two, the Coordinates are (Y-S) rho(yx)
    case 2
        vec = [Point(1),Point(3)]; 
        Index = 2;   
    % From Ring Three, the Coordinates are (X-S) rho(yz)
    case 3
        vec = [Point(2),Point(3)];      
        Index = 1; 
    % From Ring Four, the Coordinates are (Y+S) rho(xz)
    case 4
        vec = [Point(1),Point(3)];
        Index = 2;  
    % From Ring Five, the Coordinates are (Z+S) rho(xy)        
    case 5
        vec = [Point(1),Point(2)];     
        Index = 3; 
    % From Ring One, the Coordinates are (Z-S) rho(xy)  
    case 6
        vec = [Point(1),Point(2)];
        Index = 3;  
end

PolarCoord.z = Point(Index)-RingPoint(Index2);
PolarCoord.r = Rho(vec);
PolarCoord.i = Index;
end





function val = Length(Point1,Point2)
% returns the length between two points
XVal = abs(Point1(1) - Point2(1));
YVal = abs(Point1(2) - Point2(2));
ZVal = abs(Point1(3) - Point2(3));
val = sqrt(XVal*XVal+YVal*YVal+ZVal*ZVal);
end




function RhoV = Rho(Vec)
A = Vec(1);
B = Vec(2);
RhoV = (A*A+B*B)^(1/2);
end



function Line = Bline(PolarCoord, Ring)
% This calculates the linear magnetic field for WB-6, RETURNS IN GUASS

z = abs(PolarCoord.z);
r = abs(PolarCoord.r);
a = Ring.a;
Mu = Ring.Mu;
I = Ring.Ampturns;


m = (4*a*r)/(z*z+(a+r)^2);
P1 = ((Mu*I)/(2*pi));
[K,E] = ellipke(m);
Part2 = (m/(4*a*r*r*r))^(1/2);
P3 = ((a*m-(r*(2-m)))/(2-2*m))*E;
P3 = r*K+P3;
Line = P1*Part2*P3*10000;
end



function Rad = Brad(PolarCoord, Ring)
% This calculates the Radial magnetic field for WB-6, RETURNS IN GUASS

z = abs(PolarCoord.z);
r = abs(PolarCoord.r);
a = Ring.a;
Mu = Ring.Mu;
I = Ring.Ampturns;


m = (4*a*r)/(z*z+(a+r)^2);
[K,E] = ellipke(m);
Part1 = ((2-m)/(2-2*m))*(E-K);
Part2 = (m/(4*a*r*r*r))^(1/2);
Part3 = (Mu*I*z)/(2*pi);
Rad = Part1*Part2*Part3*10000;
end




function Test = FindDirection(Structs, All, Xval)

switch Xval
    case 1
        Holder = All.XField;
    case 2
        Holder = All.YField;
    case 3
        Holder = All.ZField;
end

% Linear Fields:
Linear = 0;
for n = 1:2
    index = Structs.Bline(n);
    switch index
           case 1
           Linear = (Holder.One.Bline) + Linear;
           case 2 
           Linear = (Holder.Two.Bline) + Linear;
           case 3    
           Linear = (Holder.Three.Bline) + Linear;
           case 4
           Linear = (Holder.Four.Bline) + Linear;
           case 5     
           Linear = (Holder.Five.Bline) + Linear;
           case 6  
           Linear = (Holder.Six.Bline) + Linear;
    end
end

% radial Fields
Rad = 0;
for n = 1:4
    index = Structs.Brad(n);

    switch index
           case 1
              Rad = (Holder.One.Brad*Holder.One.BradExtra) + Rad; 
           case 2 
              Rad = (Holder.Two.Brad*Holder.Two.BradExtra) + Rad;
           case 3    
              Rad = (Holder.Three.Brad*Holder.Three.BradExtra) + Rad;
           case 4
              Rad = (Holder.Four.Brad*Holder.Four.BradExtra) + Rad;
           case 5     
              Rad = (Holder.Five.Brad*Holder.Five.BradExtra) + Rad;
           case 6  
              Rad = (Holder.Six.Brad*Holder.Six.BradExtra) + Rad;
    end 
   
end
Test = Rad+Linear;
end

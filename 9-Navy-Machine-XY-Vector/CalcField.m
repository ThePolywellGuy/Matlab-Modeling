
%(c) 2013 The Polywell Guy - http://thepolywellblog.blogspot.com/

function SolMats = CalcField(Parameters, Coordinates, Cells)
%CALCFIELD Summary 

ampTurns = Parameters.Current*Parameters.Turns;
Ring = struct('RingPoint1',[0,0,0],'RingPoint2',[0,0,0],'Ampturns',ampTurns,'Mu',0.00000125663706,'a',Parameters.a,'s',Parameters.s);
RingStructure = struct('One',Ring,'Two',Ring,'Three',Ring,'Four',Ring,'Five',Ring,'Six',Ring, 'TurnOn', Parameters.turnOn,'Zinc',Parameters.Zinc);
RingStructure = FillRingStructure(RingStructure, Parameters);

SolMats = struct('Xdir',zeros(Cells, Cells),'Ydir',zeros(Cells, Cells),'Zdir',zeros(Cells, Cells));

    for yloop = 1:Cells   
    	for xloop = 1:Cells  
        
           Point = [Coordinates.XCor(xloop,yloop),Coordinates.YCor(xloop,yloop), 0]; 
           
           All = CartesianModelXYPlane(Point, RingStructure);          
           
           SolMats.Xdir(xloop,yloop) = All.Vector(1);
           SolMats.Ydir(xloop,yloop) = All.Vector(2);
           SolMats.Zdir(xloop,yloop) = All.Vector(3); 
         end 
    end
end








function RingStructure = FillRingStructure(RingStructure, Parameters)
% This builds a Ring Structure Ring 1 is on the Left, 2 above, 3 Ect..

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

end

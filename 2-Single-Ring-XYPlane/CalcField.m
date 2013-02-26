
%(c) 2013 The Polywell Guy - http://thepolywellblog.blogspot.com/

function SolMats = CalcField(Coordinates, Parameters, Cells)
%CALCFIELD Summary of this function goes here
%   Detailed explanation goes here

SolMats = struct('XDirection',zeros(Cells, Cells),'YDirection',zeros(Cells, Cells),'BRadial',zeros(Cells, Cells),'BLinear',zeros(Cells, Cells),'XAverage',zeros(Cells, Cells),'YAverage',zeros(Cells, Cells));


    for yloop = 1:Cells   
    	for xloop = 1:Cells  
         

        Point = [Coordinates.XCor(xloop,yloop),Coordinates.YCor(xloop,yloop)];        
        Vector = SingleRing(Point, Parameters);
        
        SolMats.XDirection(xloop, yloop) = Vector.X;
        SolMats.YDirection(xloop, yloop) = Vector.Y;
        SolMats.BRadial(xloop, yloop) = Vector.Brad;
        SolMats.BLinear(xloop, yloop)= Vector.Bline;
        SolMats.XAverage(xloop, yloop) = Vector.X*abs((Vector.Brad  +Vector.Bline )/2);
        SolMats.YAverage(xloop, yloop) = Vector.Y*abs((Vector.Brad  +Vector.Bline )/2);
        
        end  
    end

end


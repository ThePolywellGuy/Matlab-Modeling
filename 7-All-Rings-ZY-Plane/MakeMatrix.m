
%(c) 2013 The Polywell Guy - http://thepolywellblog.blogspot.com/

function CordMats = MakeMatrix(Bounds, Cells)
%This function deals with the three Dimensional matrices


% Make the X, Y Coordinates
XCor = fillX(zeros(Cells, Cells, Cells), Bounds, Cells);
YCor = fillY(zeros(Cells, Cells, Cells), Bounds, Cells);
ZCor = fillZ(zeros(Cells, Cells, Cells), Bounds, Cells);

CordMats = struct('XCor',XCor,'YCor',YCor,'ZCor',ZCor);

end



function mat = fillX(mat, Bounds, Cells)

int = abs(Bounds.XPos - Bounds.XNeg)/(Cells-1);
xStart = Bounds.XPos;

for loopz = 1:Cells
    for loopx = 1:Cells
        for loopy = 1:Cells
            mat(loopx, loopy, loopz) = xStart;
        end
        xStart = xStart - int;
    end
    xStart = Bounds.XPos;
end
end



function mat = fillY(mat, Bounds, Cells)

int = abs(Bounds.YPos - Bounds.YNeg)/(Cells-1);
yStart = Bounds.YNeg;

for loopz = 1:Cells
    for loopy = 1:Cells
        for loopx = 1:Cells
            mat(loopx, loopy, loopz) = yStart;
        end
        yStart = yStart + int;
    end
    yStart = Bounds.YNeg;
end
end



function mat = fillZ(mat, Bounds, Cells)

int = abs(Bounds.ZPos - Bounds.ZNeg)/(Cells-1);
zStart = Bounds.ZPos;

for loopy = 1:Cells
    for loopz = 1:Cells
        for loopx = 1:Cells
            mat(loopx, loopy, loopz) = zStart;
        end
        zStart = zStart - int;
    end
    zStart = Bounds.ZPos;
end
end

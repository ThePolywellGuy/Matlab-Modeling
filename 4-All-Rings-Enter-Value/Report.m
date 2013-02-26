
%(c) 2013 The Polywell Guy - http://thepolywellblog.blogspot.com/

function Sol = Report(All, Index)
disp(' ');
switch Index
    case 1
        title = 'X-Direction';
        Holder = All.XField;
    case 2
        title = 'Y-Direction'; 
        Holder = All.XField;
    case 3
        title = 'Z-Direction';
        Holder = All.XField;
end

disp(' ');
disp(title);
disp('=======');

for m = 1:6
       switch m
           case 1
                T1 = 'Ring One,   BRad:   ';
                T2 = num2str(Holder.One.Brad);
                T3 = ', BLinear:   ';
                T4 = num2str(Holder.One.Bline);
                disp(strcat(T1,T2,T3,T4));    
           case 2 
                T1 = 'Ring Two,   BRad:   ';
                T2 = num2str(Holder.Two.Brad);
                T3 = ',   BLinear:   ';
                T4 = num2str(Holder.Two.Bline);
                disp(strcat(T1,T2,T3,T4));          
           case 3    
                T1 = 'Ring Three, BRad:   ';
                T2 = num2str(Holder.Three.Brad);
                T3 = ',   BLinear:   ';
                T4 = num2str(Holder.Three.Bline);
                disp(strcat(T1,T2,T3,T4));        
           case 4
                T1 = 'Ring Four,  BRad:   ';
                T2 = num2str(Holder.Four.Brad);
                T3 = ', BLinear:   ';
                T4 = num2str(Holder.Four.Bline);
                disp(strcat(T1,T2,T3,T4));          
           case 5     
                T1 = 'Ring Five,  BRad:   ';
                T2 = num2str(Holder.Five.Brad);
                T3 = ', BLinear:   ';
                T4 = num2str(Holder.Five.Bline);
                disp(strcat(T1,T2,T3,T4));            
           case 6  
                T1 = 'Ring Six,   BRad:   ';
                T2 = num2str(Holder.Six.Brad);
                T3 = ',   BLinear:   ';
                T4 = num2str(Holder.Six.Bline);
                disp(strcat(T1,T2,T3,T4));     
       end
end
disp(' ');

Sol = 1;
end


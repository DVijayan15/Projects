 clear all
close all
clc

a=arduino
ab=[];


    
y = load('abtest1.mat');
z = load('abtest2.mat');
q = load('abtest3.mat');
l = load('abtest4.mat');
m = load('abtest5.mat');
n = load('abtest6.mat');
o = load('abtest7.mat');
vrs = fieldnames(y);
if ~isequal(vrs,fieldnames(y))
    error('Different variables in these MAT-files')
end
for k = 1:length(vrs)
        x.(vrs{k}) = [y.(vrs{k});z.(vrs{k});q.(vrs{k});l.(vrs{k});m.(vrs{k});n.(vrs{k})];
        ab=[ab;x];
end

save('Data.mat','-struct','x')
    

newDataset = load('-mat', 'Data');

vars = fieldnames(newDataset);
for i = 1:length(vars)
    assignin('base', vars{i}, newDataset.(vars{i}));
end
   
ac=[];

 for i=1:5000
    a0=readVoltage(a,'A0');
    a1=readVoltage(a,'A1');
    a2=readVoltage(a,'A2');
    
    aa=[a0 a1 a2];
    ac=[ac;aa];
 
 end
 
 
 R=[];
 V=[];
 for i=5000
    [ida,idb] = ismember(ac,ab(:,1:3),'rows');
    ac(:,4) = NaN;
    ac(ida,4) = ab(idb(ida),4)
    if ac(:,4)==1
    str = sprintf('\tHi')
    V=cellstr(str)
    end
    if ac(:,4)==2
    str = sprintf('\tHow you doin?')
    V=cellstr(str)
    end
    if ac(:,4)==3
    str = sprintf('\tStop')
    V=cellstr(str)
    end
    if ac(:,4)==4
    str = sprintf('\tPeace')
    V=cellstr(str)
    end
    if ac(:,4)==5
    str = sprintf('\tMedicine Please')
    V=cellstr(str)
    end
    if ac(:,4)==6
    str = sprintf('\tWater')
    V=cellstr(str)
    end
    if ac(:,4)==7
    str = sprintf('\tFood')
    V=cellstr(str)
    end               
    R=[R;V];   
 
 end
 

 
 
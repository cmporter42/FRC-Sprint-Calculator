%Sprint time calculator for FRC 
%units are empirial 

posistion = 0;
timeStep = .01; 
cims = 4;
weight = 150; %pounds
mass = weight/32; %convert to slugs 
distance = 20; %feet 
wheelDiameter = 4.00; %in
gearRatio = 1;
coef = 1.1;
traction = coef*weight;

while gearRatio < 14
    v = 0; %feet per second
    t = 0; %seconds 
    a = 0; %ft/s^2
    posistion = 0;

 while posistion < distance
     posistion = posistion + v*timeStep;
     rpm = 60*v*gearRatio/(wheelDiameter*3.14/12);
     torque = cims * (28.58-.00539*rpm)/16;
     force=.80*torque*gearRatio/(wheelDiameter/2);
     force=min(force,traction);
     a = force/mass;
     v = v+(a*timeStep);
     t = t+timeStep;
 end
 plot(gearRatio,t,'*')
 hold on
 gearRatio=gearRatio+1;
 title(['Gear Ratio v.s. Time For a ' num2str(distance) ' Foot Sprint'])
end

 
     
 
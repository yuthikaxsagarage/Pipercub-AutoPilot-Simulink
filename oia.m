A= [-0.1245 0.0350 0.0414 -0.9962 0; -15.2138 -2.0587 0.0032 0.6458 0;  0 1.0000 0 0.0357 0; 1.6447 -0.0447 -0.0022 -0.1416 0; 0 0 0 9.8/15 0];
B =[-0.0049 0.0237 ;-4.0379 0.9613; 0   0  ; -0.0568 -1.2168; 0 0];
C = [1          0          0          0 0;  0          1       0          0 0 ; 0       0          1          0 0; 0  0    0        1 0; 0 0 0 0 1];
D = [0 0 ;0 0 ; 0 0 ;0   0;0 0];

states = {'beta' 'roll_rate' 'yaw_rate' 'roll_angle' 'heading angle'};
inputs = {'aileron' 'rudder'};
outputs = {'beta' 'roll_rate' 'yaw_rate' 'roll_angle' ' heading angle'};

system = ss(A,B,C,D, 'statename',states,...'inputname',inputs,...
'outputname',outputs);
system

tf(system)
impulse(system)
step(system, 150)

X = obsv(A,C)
OX =rank(X)

CT = ctrb(A,B)
CR = rank(CT)

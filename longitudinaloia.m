%Piper J-3 Cub at v = 25

A= [-0.0804 0.1665 0 -9.8100 0;
    -0.7840/25 -7.9608/25 25.0116/25 0 0;
    0.2749 -7.1682 -24.6793 0 0; 
    0 0 1.0000 0 0; 
    0 -1.000 0 25.0116 0];

B =[0 32.1224 ;
    -13.4512 0;
    -202.3972 0; 
    0 0; 
    0 0];


C = [1          0          0          0 0;  0          1       0          0 0 ; 0       0          1          0 0; 0  0    0        1 0; 0 0 0 0 1];
D = [0 0 ;0 0 ; 0 0 ;0   0;0 0];

states = {'u' 'alpha'  'pitch_rate' 'pitch angle' 'altitude'};
inputs = {'elevator' 'throttle'};
outputs = {'u' 'alpha' 'pitch_rate' 'pitch angle' 'altitude'};

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
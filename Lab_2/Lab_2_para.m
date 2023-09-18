clc;
clear;close all;
M=1;
m=0.1;
g=9.8;
l=0.6;


A=[
    0 1  0                0;
    0 0  (-m*g/(M-m))     0;
    0 0  0                1;
    0 0  (g*M)/(l*(M-m))  0
    ];

B=[
    0;
    1/(M-m);
    0;
    -1/(l*(M-m))
    ];



C=eye(4,4);
C=[1 0 0 0;
   0 0 0 0;
   0 0 0 0
   0 0 0 0;
    ]

D=0;
C1=[1 0 0 0];
C2=[0 0 1 0];
C3=[0 1 0 0];

 x0=[0;0;7*pi/180;0];


sys=ss(A,B,C,D);
Sc=ctrb(sys);
So=obsv(sys);


des_pole=[-7;-7;-7;-7];
K=acker(A,B,des_pole);



L1=3;
L2=2;
Q=[
    1 0 0 0;
    0 1 0 0;
    0 0 L2 0;
    0 0 0 0;
];

R=L2;

 [Klqr,S,P]=lqr(A,B,Q,R);


 function FinalFitting
clear all;
clc;
close all;
%clearvars -global
global tdata xdata IC tdataA xdataA ICA
%%%%%%GROWTH-------3 replicates, mean values
tdata(1) = 1; xdata(1) = 6.1827;
tdata(2) = 2; xdata(2) = 7.1350;
tdata(3) = 3; xdata(3) = 7.6913;
tdata(4) = 4; xdata(4) = 7.8703; 
tdata(5) = 5; xdata(5) = 8.5537; 
tdata(6) = 6; xdata(6) = 8.8527; 

%-------------------------------------------------------
%%%%%%Decay-------3 replicates, mean values
tdataA(1) = 0; xdataA(1) = 8.3053;
tdataA(2) = .5; xdataA(2) = 7.5867;
tdataA(3) = 1.5; xdataA(3) = 6.0140 ;
tdataA(4) = 3; xdataA(4) = 4.9203; 
        B_s0=0;
        B_t0=4;
        B_p0=2.0006;
        S0=.1;
        IC=[B_s0;B_t0;B_p0;S0];
%  Parameters Initial Values        
        p(1) =0.1967; %m
        p(2) = .0094; %k_st: S to T,
        p(3)= .0653; %k_pt: P to T,
        p(4) = 500.679; %k_ts: T to S,
        p(5) = 1.002; %k_tp: T to P,
        p(6) = .1; %Y
        p(7) = 4.235; %k_sp: S to P,
        p(8) = .0304; %k_ps: P to S,
        p(9) = .1533; %ka
       p(10) = 3.0;  %kd: death,
     p(11)=.11; %Nutrient.
   [bmin, Smin] = fminsearchbnd(@Fit,p,[0 0 0 0 0 0 0 0 0 0 0],[ 100 100 100 1000 100 100 100 100 100 100 100]);
vpa(bmin, 10)
%% 2.272191755, 20.18101854, 88.86104806, 645.4943851, 0.0001032307354, 1.227760147, 0.000008640952687, 0.0330361913, 27.62980609, 4.581764827, 0.2828188528
 end
%last time I ran I got these values: by running them longer 
%[ 3.277343952, 2.165213153, 0.02519893918, 530.3456153, 0.00009135677543, 6.708296619, 0.00001161553992, 0.08155474723, 9.020717545, 4.66037897, 0.1374335692]
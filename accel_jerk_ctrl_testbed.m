close all
clear all

k = 1
b = 1
m = 1

A = [0 1 0 0 0 0; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 -k/m -b/m 0 0; 0 0 0 0 0 1; 0 0 0 0 0 0]
B = [0 0 0 k/m 0 1]'

Q_pd = diag([0 0 0 0 0 0])
rho_pd = 0;


K = lqr(A,B,Q_pd,rho_pd);

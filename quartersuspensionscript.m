close all

A = [ 0 1 0 0; [-K_f -B_f K_f B_f]/m_s ; 0 0 0 1; [K_f B_f -K_f-K_tf -B_f]/m_uf];
B = [ 0 0; 0 1e3/m_s; 0 0;[K_tf -1000]/m_uf];
C = [1 0 0 0; 1 0 -1 0];
D = [0 0; 0 0];


Q_pd = diag([10000 10000 10000 10000 1000]);
rho_pd = 1;
R = [1 0;0 2];


sys = ss(A,B,C,D);
QXU = blkdiag(0.1*eye(4),R);
QWV = blkdiag(Q_pd,rho_pd);
KLQG = lqg(sys,QXU,eye(6));





%K = lqr(A,B,Q_pd,rho_pd);


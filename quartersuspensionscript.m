A = [ 0 1 0 0; [-k_spring -b_damper k_spring b_damper]/m_car ; 0 0 0 1; [k_spring b_damper -k_spring-k_wheel -b_damper]/m_wheel];
B = [ 0; 0; 0; k_wheel/m_wheel];
%C = [1 0 0 0; 1 0 -1 0; A(2,:)];
%D = [0 0; 0 0; B(2,:)];

Q_pd = diag([1 1 1 1]);
rho_pd = 1;


K = lqr(A,B,Q_pd,rho_pd);
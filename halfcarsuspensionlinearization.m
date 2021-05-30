
syms x1 x2 x3 x4 x5 x6 x7 x8 zrr zrf fr ff

x1_dot = x2;

x2_dot = 1/m_s*(-(B_f+B_r)*x2+(a*B_f-b*B_r)*x4*cos(x3)-K_f*x5+B_f*x6-K_r*x7+B_r*x8+(ff+fr)+K_tf*zrf+K_tr*zrr);

x3_dot = x4;

x4_dot = 1/J_y*((a*B_f-b*B_r)*x2*cos(x3)-(a^2*B_f+b^2*B_r)*x4*cos(x3)^2+a*K_f*x5*cos(x3)-a*B_f*x6*cos(x3)-b*K_r*x7*cos(x3)+b*B_r*x8*cos(x3)+(a*ff+b*fr)*cos(x3)+K_tf*zrf+K_tr*zrr);

x5_dot = x2-a*x4*cos(x3)-x6;

x6_dot = 1/m_uf*(-K_tf*x1+B_f*x2+a*K_tf*sin(x3)-a*B_f*x4*cos(x3)+(K_f+K_tf)*x5-B_f*x6+K_tf*zrf-ff);

x7_dot = x2+b*x4*cos(x3)-x8;

x8_dot = 1/m_ur*(-K_tr*x1+B_r*x2-b*K_tr*sin(x3)-b*B_r*x4*cos(x3)+(K_r+K_tr)*x7-B_r*x8+K_tr*zrr-fr);

J_a = jacobian([x1_dot, x2_dot, x3_dot, x4_dot, x5_dot, x6_dot, x7_dot, x8_dot],[x1, x2, x3, x4, x5, x6, x7, x8]); %finds partial derivatives for matrix A
J_b = jacobian([x1_dot, x2_dot, x3_dot, x4_dot, x5_dot, x6_dot, x7_dot, x8_dot],[ff, fr, zrf, zrr]); %finds partial derivatives for matrix B

A = double(subs(J_a, {x1 x2 x3 x4 x5 x6 x7 x8 zrr zrf fr ff},[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]));
B = double(subs(J_b, {x1 x2 x3 x4 x5 x6 x7 x8 zrr zrf fr ff},[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]));





function [phi, tempo] = precessao(t,I,m_,L)
% calcula a velocidade e o tempo de precessao
% velocidade angular (rad/s) inicial
for i=1:length(t) 
    w(:,i) = [2*pi/t(i) 0 0]'; 
end
w;
% momento angular (m^4/s) inicial
H = I*w;

% torque aplicado
%m_ = 0.010; %(kg)
g = -9.81; %(m/s²)
%L = 0.275; % braço (m)
P = [0 0 m_*g]; % pesso da massa de adicional de 10g (N)
R = [L 0 0]; % braço de aplicação (m)
T = cross(R, P); % (Nm);
% assumindo que o torque aplicado seja ortogonal e que o momento angular
% sempre esteja apontando na direção x, o vetor de precessao fica
for i=1:length(H)
    phi(:,i) = [0 0 T(2)/H(1,i)]';
    tempo(i) = abs((pi/2)/phi(3,i));
end
end
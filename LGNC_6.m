clc; clear all; close all;
%% LGNC - problema 2
% densidade volumetrica do disco (g/    m^3)
rho = 0.9e3;
% dimensoes do disco (m)
t = 0.028;
r = 0.122;
% massa do disco
disp('massa do disco em kg')
m = rho*t*pi*r^2
% momento angular do sistema sem torques externos
Ix = m*r^2/2;
Iy = m*r^2/4;
Iz = Iy;
%distancias do centro de massa ao centro de giro do sistema
%
%tensor de inercia da roda (m^4)
%disp('tensor de inercia do disco')
I = diag([Ix Iy Iz]);
% periodo de rotacao (s) inicial
disp('vetor com os periodos de rotação iniciais s')
t = [0.205 0.136 0.160]
disp('vetor com os períodos de rotação finais s')
tf = [0.303 0.198 0.238]

% calcula a velocidade e tempo de precessao 
% t = periodo de rotacao do disco
% I = tensor de inercia
% m_ = massa adicional que produzira o torque
% L = braço do peso aplicado
m_ = 0.010; %(kg)
L = -0.275; %(kg)

%% para as mendicoes inicias
disp('---------------------------------')
disp('para medicoes de velocidade no instante inicial')
[phi,Ti] = precessao(t,I,m_,L);
disp('velocidade de precessão phi em rad/s')
phi

disp('tempo de precessão tempo em s');
Ti

%% para as mendicoes inicias
disp('---------------------------------')
disp('para medicoes de velocidade no instante final')
[phi,Tf] = precessao(tf,I,m_,L);
disp('velocidade de precessão phi em rad/s')
phi

disp('tempo de precessão tempo em s');
Tf

%% para as mendicoes inicias
disp('---------------------------------')
disp('para uma velocidade media adotada')
[phi,Tif] = precessao((t+tf)/2,I,m_,L);
disp('velocidade de precessão phi em rad/s')
phi

disp('tempo de precessão tempo em s');
Tif

% periodos medidos
T = [22.97 27.12 23.31];
experimentos = [ 1 2 3];

%%
figure();
hold on; grid minor;
ylabel('tempo de precessao T_{\phi} [s]');
xlabel('periodo de rotacao do disco T [s]');
plot(sort(t),sort(T,'descend'), 'DisplayName', 'medidos');
plot(sort(t),sort(Ti,'descend'), 'DisplayName', 'estimados');
legend('show');
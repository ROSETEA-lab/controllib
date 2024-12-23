clear all;

% Create the system matrices
n = max(round(25*rand(1)),1);
m = max(round(5*rand(1)),1);
p = max(round(5*rand(1)),1);

A = diag(1.9*(rand(1,n)-0.5));
T = rand(n,n);

A = T*A*inv(T);
B = rand(n,m);
C = rand(p,n);
D = rand(p,m);

% Create the input signal
t = (0:0.001:50)';

in = zeros(length(t),m);
for k=1:m
    in(:,k) = chirp(t,0,t(end),500)';
end
t = (0:1:size(in,1)-1)';

% Simulate system
initial_state = rand(n,1);

output = lsim(ss(A,B,C,D,-1),in,t,initial_state);
state  = lsim(ss(A,B,eye(n,n),zeros(n,m),-1),in,t,initial_state);

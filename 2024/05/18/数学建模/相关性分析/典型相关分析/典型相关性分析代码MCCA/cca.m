function [A,B,C] = mcca(X,Y,Z,m)
x = 0.01;
Z=double(Z);
X=double(X);
Y=double(Y);
switch m
    case 3
        [A,rx,rx1] = svd(inv(X*X'+x*eye(size(X,1)))*X*Y'*inv(Y*Y'+x*eye(size(Y,1)))*Y*Z'*inv(Z*Z'+x*eye(size(Z,1)))*Z*X');
        [B,ry,ry1] = svd(inv(Y*Y'+x*eye(size(Y,1)))*Y*Z'*inv(Z*Z'+x*eye(size(Z,1)))*Z*X'*inv(X*X'+x*eye(size(X,1)))*X*Y');
        [C,rz,rz1] = svd(inv(Z*Z'+x*eye(size(Z,1)))*Z*X'*inv(X*X'+x*eye(size(X,1)))*X*Y'*inv(Y*Y'+x*eye(size(Y,1)))*Y*Z');
    case 12
        [A,rx,rx1] = svd(inv(X*X'+x*eye(size(X,1)))*X*Y'*inv(Y*Y'+x*eye(size(Y,1)))*Y*X');
        [B,ry,ry1] = svd(inv(Y*Y'+x*eye(size(Y,1)))*Y*X'*inv(X*X'+x*eye(size(X,1)))*X*Y');
        C = 0;
    case 13
        [A,rx,rx1] = svd(inv(X*X'+x*eye(size(X,1)))*X*Z'*inv(Z*Z'+x*eye(size(Z,1)))*Z*X');
        [C,rz,rz1] = svd(inv(Z*Z'+x*eye(size(Z,1)))*Z*X'*inv(X*X'+x*eye(size(X,1)))*X*Z');
        B = 0;
    case 23
        A = 0;
        [B,ry,ry1] = svd(inv(Y*Y'+x*eye(size(Y,1)))*Y*Z'*inv(Z*Z'+x*eye(size(Z,1)))*Z*Y');
        [C,rz,rz1] = svd(inv(Z*Z'+x*eye(size(Z,1)))*Z*Y'*inv(Y*Y'+x*eye(size(Y,1)))*Y*Z');
end
end
%CCAZ = phi_z'*Z;
%sp_fea = [CCA_X;CCA_Y;CCA_Z];
%sp_fea = [CCA_X;CCA_Y];
function gp = init_test()
% GP_params
sigma1 = [0.1;0.03];
noise1 = 0.01;
ncent = 200; 
tol = 1e-4;

gp = onlineGP(sigma1,noise1,ncent,tol);
gp.process([1;0],3)
gp.update([2;1],4)
gp.update([-2;-3],-4)
end
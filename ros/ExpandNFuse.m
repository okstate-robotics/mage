function gp_main = ExpandNFuse(gp_main,states,BV,obs)%,K,Q,C,current_size,sigma,noise,jitter,reg_type,alpha)
    % GP_params
sigma1 = [0.1;0.1];
noise1 = 0.01;
ncent = 200; 
tol = 1e-4;

ngp = onlineGP(sigma1,noise1,ncent,tol);
ngp.process(BV(:,1),obs(1))
%BV
%obs
for ii = 2:size(BV,2)
    ngp.update(BV(:,ii),obs(ii))
end
%     ngp.set('BV',BV);
%     ngp.set('obs',obs);
%     ngp.set('K',K);
%     ngp.set('Q',Q);
%     ngp.set('C',C);
%     ngp.set('current_size',current_size);
%     ngp.set('sigma',sigma);
%     ngp.set('noise',noise);
%     ngp.set('jitter',jitter);
%     ngp.set('reg_type',reg_type);
%     ngp.set('alpha',alpha);

    % GPFUSION
   [~,v1] = gp_main.predict(states);
   [m2,v2] = ngp.predict(states);
   
    %Ai = find(v1 > 0.9)
    %Aj = find(v2 < 0.2)
    %A_ind = intersect(Ai,Aj)
    indicies = find(v2 < 0.2 & v1 > 0.9);
    if ~isempty(indicies)
        X = states(:,indicies);
        Y = m2(indicies);
        for ii = 1:length(indicies)
            gp_main.update(X(:,ii),Y(ii));
        end 
    end

end

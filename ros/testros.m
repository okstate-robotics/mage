function [gp,post_var] = testros(gp,states,LLA,env)


    gp.update([LLA(1);LLA(2)],env);
    [~,post_var] = gp.predict(states);

end    

function loggp_data(gp,states,uav_callsign,time_stamp)


    SAVE_mean = strcat('./data/',uav_callsign,'_mean.csv');
    SAVE_var = strcat('./data/',uav_callsign,'_var.csv');
    
    [gp_mean,gp_var] = gp.predict(states);
    mean_data = horzcat(time_stamp,gp_mean');
    var_data = horzcat(time_stamp,gp_var);
   
    dlmwrite(SAVE_mean,mean_data,'delimiter',',','-append')
    dlmwrite(SAVE_var,var_data,'delimiter',',','-append')

end    

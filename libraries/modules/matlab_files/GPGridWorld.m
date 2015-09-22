%============================= GPGridWorld ================================
%  
%  This class implements a model of a grid world, with the understanding 
%  that the grid represents a continuous space (\R^2) being discretized. 
%  The reward function for the world is characterized by the mean function
%  of a Gaussian Process, which in this case is evaulated via the onlineGP
%  object. 
%
%  Unlike the older class GridWorld, this class is written to be as memory
%  efficient as possible. Therefore, for now, only the deterministic model
%  is supported. Instead of transition matrices of the form |S|x|S|x|A|, it
%  will have a transition of the form |S|x|A|. 
%
%  Actions:          {left,right,up,down}
%  Transition Model: Deterministic: 
%                      Probability of transition: 1
%                      Probability of staying: 0
%                      On boundaries: stay put if illegal action. 
% 
%  Inputs:
%    rows   	- 1 x 1 natural number
%    columns 	- 1 x 1 natural number
%    model_type - string {'deterministic','stochastic'}
%
%  Outputs:
%    gw        - instantiation of the GPGridWorld class. 
%
%============================= GPGridWorld ================================
%
%  Name:		GPGridWorld.m
%
%  Author: 	 	Hassan A. Kingravi
%  Modifier: 	Rakshit D. Allamraju
%
%  Created:		2013/06/13
%  Modified:	2015/06/30
%
%
%  Reference(s): 
%    Reinforcement Learning and Dynamic Programming Using 
%    Function Approximators
%
%============================== GPGridWorld =================================
classdef GPGridWorld < handle
  properties( Access=public)
     	states            = []; 
	actions           = []; 	
	state_size        = []; 
	action_size       = []; 
	reward            = [];
	transition_matrix = []; 
	type        = 'GPGridWorld';
    rows = 0;
    columns = 0;


  end
  methods
	function gw = GPGridWorld(rows,columns)
		%== Check arguments.
		if ~(rows>0) || ~(columns>0)
		  disp('GPGridWorld Error: rows and columns must be natural numbers.');
        end

        gw.rows = rows;
        gw.columns = columns;


		%== Process arguments.
		gw.state_size = gw.rows*gw.columns;
		gw.states = zeros(2,gw.state_size); % initialize

		% make grid
		counter = 1; 
		for i=1:gw.rows
		  for j=1:gw.columns
		    gw.states(1,counter) = i;
		    gw.states(2,counter) = j; 
		    counter = counter + 1; 
		  end
		end  

		% create actions 
		gw.actions =  [-1 -1 -1 0  0 1 1  1 0;
			     1  0 -1 1 -1 1 0 -1 0]; % 9 possible directions

		% create transition matrix as (SxA)
		gw.action_size = length(gw.actions);
		gw.transition_matrix = (zeros(gw.state_size,gw.action_size));

		% create transition model 
		for curr_act = 1:gw.action_size 
		  curr_acts = curr_act.*ones(1,gw.state_size);  
		  act_index = gw.take_action(1:gw.state_size,curr_acts); % take action
		  gw.transition_matrix(:,curr_act) = act_index; % store state
		end  

		% initialize reward matrix
		gw.reward = zeros(gw.state_size,gw.action_size);
    end
    
     %)
  %---------------------------- transition_prob ---------------------------
  %
  %  Deterministic transition function for GPGridWorld. The function is 
  %  called via the INDICES of the states and actions, not their values. 
  %
  %(
  
    function new_state = transition(gw,old_state,action)
    new_state = gw.transition_matrix(old_state,action);
    end    
    
   %
  %----------------------------- init_reward ------------------------------
  %
  %  Initialize reward function for GPGridWorld, using GP 
  %  model. The input from the GP model is an instantiation 
  %  of the onlineGP object. 
  %(  
  function init_reward(gw,reward_eval)
    % check to see if matrix has the proper dimensions
    [m,n] = size(reward_eval);
    
    if m == gw.state_size && n == 1
      % traverse matrix, taking actions and filling in reward   
        for jj=1:gw.action_size
          % for a given state, take each action and store the reward  
          act_index = gw.take_action(1:gw.state_size,jj);
          gw.reward(1:gw.state_size,jj) = reward_eval(act_index);          
        end
    else
      disp('Incorrect dimensions for reward vector: must be 1 x state_size')    
    end
  end
    
  %
  %--------------------------- take_action ----------------------------
  %
  %  Given current states, in index form, and given a corresponding set 
  %  of actions, return the indices in the states matrix corresponding 
  %  to transition. This function is completely vectorized, which may make
  %  it a little more difficult to read. 
  %(  
  function [act_index] = take_action(gw,curr_state_index,action)
    % get current states   
    curr_state = gw.get_state(curr_state_index);
    action_matrix = zeros(size(curr_state));
    
    % need to create action matrix 
    for ii=1:gw.action_size
      curr_action = gw.actions(:,ii);
      inds = action == ii; 
      act_size = sum(inds);
      
      acts = repmat(curr_action,1,act_size);      
      action_matrix(:,inds) = acts; 
    end    
    
    new_state = curr_state + action_matrix; % transition
    
    % now need to check legality of actions
    set1 = new_state(1,:) <= 0;
    set2 = new_state(1,:) > gw.rows;
    set3 = new_state(2,:) <= 0;
    set4 = new_state(2,:) > gw.columns;
    
    % take 'union' of sets 
    ill_inds = logical(set1 + set2 + set3 + set4);
    
    % roll back illegal actions     
    new_state(:,ill_inds) = curr_state(:,ill_inds);
    
    % get indices
    act_index = gw.get_index(new_state);
  end
  
 %
  %--------------------------- get_state ----------------------------
  %
  %  Helper function: given an index, return the associated state. 
  %(  
  function ret_state = get_state(gw,current_index) 
    ret_state = gw.states(:,current_index);
  end  
  
   %
  %--------------------------- get_index ----------------------------
  %
  %  Helper function: given a state, return the associated index. 
  %(  
  function ret_index = get_index(gw,current_states)
    nstates = size(current_states,2);
    ret_index = (current_states(1,:)-ones(1,nstates)).*gw.columns...
                  + current_states(2,:);
  end 
  %
  %--------------------------- get_index ----------------------------
  %
  %  Given a policy, and discretization, return a series of waypoints.
  %  
  %(  
  function [way_points, traj_vec] = set_points(gw,policy, start_index, steps)
    
    % first, execute policy to get discrete number of steps
    current_state_index = start_index;    
    last_states = zeros(2,2); 
    traj_vec = zeros(2,1);
    flag = 1; 
    ii = 1; 
    
    % you sometimes have an oscillating pair of states, i.e. where 
    % you keep flipping between states. This part of the code fixes 
    % that, in an extremely ugly way
    
    while flag ~= 0
      % plot last state  
      current_state = gw.get_state(current_state_index); % get state
      traj_vec(:,ii) = current_state;   
             
      % take action according to policy
      action_to_take = policy(current_state_index); 
      current_state_index = gw.take_action(current_state_index,action_to_take);
   
      if norm(last_states(:,1)-current_state) == 0 ...
               || norm(last_states(:,2)-current_state) == 0
        flag = 0;   
        traj_vec(:,ii) = [];              
      end    
  
      % buffering last states
      last_states(:,1) = last_states(:,2);
      last_states(:,2) = current_state;
      ii = ii + 1; 
    end  
    
    % now that you have the trajectory, you need to compute the waypoints
    path_steps = size(traj_vec,2);
    
    if steps >= path_steps
      % in this case, discretization is unnecessary   
      way_points = traj_vec; 
    else
      inds = ceil(linspace(1,path_steps,steps));      
      way_points = traj_vec(:,inds);
    end
  end  
  
  %
  %------------------------------ getVal ------------------------------
  %
  %  Get function. 
  %
  %( 
  function fval = get(gw,fname)
  switch (fname)
    case 'rows'
      fval = gw.rows;   
    case 'columns'        
      fval = gw.columns;     
    case {'model_type','type'}        
      fval = gw.type;       
    case 'states'
	  fval = gw.states;
    case 'actions'
	  fval = gw.actions;     
    case 'transition'
      fval = gw.transition_matrix;
    case 'reward'
      fval = gw.reward;     
    case 'state_size'
      fval = gw.state_size;   
    case 'action_size'
      fval = gw.action_size;         
    case 'gp'
      fval = gp;   
     
  end
  end
  
  
  
  end
end


%============================= GPGridWorld ================================

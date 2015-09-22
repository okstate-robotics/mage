%============================= PolicyIteration ============================
%  
%  This class implements the deterministic policy iteration algorithm given 
%  in the reference in Chapter 2 (Algorithm 2.4). 
%
%  The old version of the code was not optimized and simply a proof of
%  concept. The new version of the code uses ideas from the MDP toolbox
%  by INRA, although this class has its own structure completely, and 
%  nothing from the other toolbox is directly used. 
%
%  In the current structure of the class, most member functions don't have
%  interfaces so that objects outside the class's scope can use them. This 
%  may be changed in the future.
% 
%  Inputs:
%    - mc       - model class
%    - discount - discount factor
%
%  Outputs:
%    - polit    - instantiation of the PolicyIteration class. 
%
%============================= PolicyIteration ============================
%
%  Name:		PolicyIteration.m
%
%  Author: 	 	Hassan A. Kingravi
%  Modifier: 	
%
%  Created:		2013/06/14
%  Modified:	2013/06/14
%
%
%  Reference(s): 
%    Reinforcement Learning and Dynamic Programming Using 
%    Function Approximators
%
%============================= PolicyIteration ============================
function polit = PolicyIteration(mc,discount)

% get class type 
c_type = mc.get('type');

MAX_ITER = 70;

% get the model class's transition and reward matrices 
transition = mc.get('transition');
reward     = mc.get('reward');

% get state sizes to initialize Q matrix and policy vector 
state_size  = size(mc.get('states'),2);
action_size = size(mc.get('actions'),2); 

Q_vals = zeros(action_size,state_size);
policy = ones(state_size,1); 
V=zeros(state_size,1);

% initialize state reward matrix 
if strcmp(c_type,'deterministic') || strcmp(c_type,'GPGridWorld')
  state_reward = reward;   
else
  state_reward = zeros(state_size,action_size);  
  polit_state_reward(); 
end

%== Set up the interface member functions.
polit.process      = @polit_process;
polit.get          = @polit_get;

%
%============================ Member Functions ===========================
%

  %)
  %------------------------------ process ------------------------------
  %
  %  Run policy iteration algorithm. 
  %
  %(
  function polit_process()         
    stop_condition = 1; 
    iterations = 1; 
    
    % get first policy 
    [~, policy] = polit_bellman(zeros(state_size,1)); 
    
    while stop_condition ~= 0
      %disp(['Iteration: ' num2str(iterations)])         
      
      policy_old = policy; % store old policy      
      V = polit_policy_eval(policy); % get value function for current policy
      [~, policy] = polit_bellman(V); % improve policy using Bellman equations
      
      % if no change in policy, stop
      if all(policy == policy_old) || iterations > MAX_ITER
        stop_condition = 0;   
      end
      iterations = iterations + 1;       
    end    
    
    disp_string = ['Converged in ' num2str(iterations) ' iterations'];
    disp(disp_string)

  end    
    
  %)
  %----------------------------- state_reward -----------------------------
  %
  %  Helper function. Given the transition matrix and the reward matrix, 
  %  update the state reward matrix. 
  %  
  %  Changes:
  %    - state_reward  - |S|x|A|     state reward matrix 
  %(
  function polit_state_reward() 
    if strcmp(c_type,'stochastic')        
      % now you need to average the reward over all possible transitions    
      for i=1:action_size
        state_reward(:,i) = sum(transition(:,:,i).*reward(:,:,i),2);  
      end
    end  
  end

  %)
  %------------------------------ bellman ------------------------------
  %
  %  Helper function. Given the transition, reward and value function 
  %  matrices, compute a new value function and policy. 
  %
  %  From equation (2.3) from the reference, the Q value for a given
  %  policy h, with state x and action u, is  
  %    
  %    Q(x,u) = reward(x,u) + discount*R^h(transition(x,u))
  %           = reward(x,u) + discount*Q(transition(x,u),h(transition(x,u)))
  %  
  %  where the second line follows from (2.7). Finally, we have, from (2.9),
  %  
  %    Q(x,u) = reward(x,u) + discount*V(h(x)),  
  %
  %  giving us the Bellman equation. Using this equation with (2.10) and 
  %  (2.11) allows us to compute a new value function and policy. 
  %  
  %  Inputs:
  %    - V_old        - |S|x1       old value function
  %
  %  Outputs:
  %    - V_new        - |S|x1       new value function
  %    - policy_enw   - 1x|S|       new policy vector 
  %(
  function [V_new,policy_new] = polit_bellman(V_old) 
    Q_temp = zeros(state_size,action_size);  
    for i=1:action_size      
      % if GPGridWorld, transition matrix has different structure
      if strcmp(c_type,'GPGridWorld')
        Q_temp(:,i) = state_reward(:,i) + discount*V_old(transition(:,i));    
      else
        Q_temp(:,i) = state_reward(:,i) + discount*transition(:,:,i)*V_old;  
      end
              
    end  
    
    % compute new policy and value function
    [V_new, policy_new] = max(Q_temp,[],2);
  end

  %)
  %----------------------------- policy_eval ------------------------------
  %
  %  Evaluate a given policy, and return the value function associated with
  %  the given policy. 
  %
  %(
  function V_pol = polit_policy_eval(policy) 
    % first, compute the transition functions and reward matrices 
    % for a given policy 
    
    if strcmp(c_type,'GPGridWorld')
      % sparse computations
      % transition_pol = sparse(zeros(state_size,state_size));
      state_reward_pol = zeros(state_size,1);
      
      tran_pol_vec = 1:state_size;
      tran_next_vec = zeros(1,state_size);
      
      for i=1:action_size
        inds = find(policy == i); % find states taking current action                                
        
        if ~isempty(inds)        
          % find which states need to be transitioned to 
          next_states = transition(inds,i);                      
          tran_next_vec(inds) = next_states;
        end        
        state_reward_pol(inds,1) = state_reward(inds,i);
      end 
      
      % finally, create sparse matrix       
      transition_pol = sparse(tran_pol_vec,tran_next_vec,ones(1,state_size),state_size,state_size); 
    else 
      % don't use sparse computations here   
      transition_pol = zeros(state_size,state_size);
      state_reward_pol = zeros(state_size,1);
    
      for i=1:action_size
        inds = find(policy == i); % find states taking current action
        if ~isempty(inds)
          transition_pol(inds,:) = transition(inds,:,i);
        end
        state_reward_pol(inds,1) = state_reward(inds,i);
      end  
    end
   
    % now, solve system of linear equations for the value function 
    V_pol = (speye(state_size,state_size)...
             - discount.*transition_pol) \ state_reward_pol; 
  end    

  %
  %------------------------------ get ------------------------------
  %
  %  Get function. 
  %
  %( 
  function fval = polit_get(fname)
  switch (fname)
	case 'Q_vals'
	  fval = Q_vals;
    case 'policy'
	  fval = policy;
    case 'V'
       fval=V;
  end
  
  end

end
%======================== QIterationDeterministic ========================
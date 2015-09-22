%============================== onlineGP ==================================
%
%  This class implements the sparse online GP algorithm presented in the 
%  reference for basic GP regression with a Gaussian kernel. This version
%  of the online GP algorithm learns the parameters as well.
%
%  This code is currently designed strictly for squared exponential 
%  kernels.
%
%  Reference(s): 
%    Sparse Online Gaussian Processes -Csato and Opper, Tech Report
%    Csato's thesis
% 
%  Inputs:
%    sigma  	 - bandwidth for the Gaussian kernel; either
%                  1 x 1 scalar or
%                  1 x d vector
%    noise      -  parameter for noise in GP; assumed given by oracle
%    ncent      -  the size of your budget
%    tol        -  tolerance for projection residual
%
%  Outputs:
%    see functions
%
%============================== onlineGP ==================================
%
%  Name:        onlineGP.m
%
%  Author:      Hassan A. Kingravi
%
%  Created:  	2011/02/27
%  Modified: 	2013/08/15
%
%============================== onlineGP ==================================
classdef onlineGP < handle 
  % class properties   
  properties (Access = public)    
    % these values are asked by the user in the constructor 
    sigma     = 1;    % Bandwidth for SE kernel.
    noise     = 0.1;  % Noise parameter for SE kernel.
    ncent     = 0;    % Budget for basis vector set. 
    tol       = 1e-5; % Tolerance for kernel linear independence test.     
    
    BV           = [];       % Basis vector set.
    alpha        = [];       % Mean parameter.
    C            = [];       % Inverted covariance matrix.
	
    % these values are not asked from the user 
    A            = 1;                % Amplitude for SE kernel. 
    color_val    = [192,255,62]/255; % Default setting of fill for 1D variance.    
    line_width   = 2.0;              % Line width for 1D plot. 
    marker_size  = 7;                % Marker size for basis vectors in 1D plot. 
    sigma_bound  = 2;                % Sigma bounds for variance. 
    label_size   = 14;               % Font size of x and y labels.         
  end
    
  % hidden variables 
  properties (Access = protected)    
   % BV           = [];       % Basis vector set.
    K            = [];       % Kernel matrix.
   % alpha        = [];       % Mean parameter.
   % C            = [];       % Inverted covariance matrix.
    Q            = [];       % Inverted Gram matrix.
    current_size = [];       % Current size of BV set.
    obs          = [];       % Set of observations used for current estimate.
    jitter       = 1e-5;     % Regularization parameter for kernel matrix.            
    reg_type     = 'normal'; % Type of regularization.
    dim          = [];       % Dimensionality of data.  
    
    update_BV_toggle = 1;    % This parameter determines whether to update the BV set. 
  end
  
  % class methods 
  methods
    
    function obj = onlineGP(sigma,noise,ncent,tol)
      %  Constructor for onlineGP.
      %
      %  Inputs:
      %    sigma     - 1 x 1 positive scalar for bandwidth of SE kernel
      %    noise     - 1 x 1 positive scalar for noise of SE kernel
      %    ncent     - 1 x 1 positive scalar for number of centers (budget)
      %    tol       - 1 x 1 positive scalar for tolerance for kernel linear
      %                      independence test
      %
      %  Outputs:
      %    -none      
      try 
      % nesting structure to set new values 
      if nargin >=1
        
        if sigma <= 0
          exception = MException('VerifyOutput:OutOfBounds', ...
                       'Bandwidth must be strictly positive');
          throw(exception);
        end
        
        if ~isempty(sigma)
          obj.sigma = sigma;         
        end 
        
        if nargin >=2          
          if noise < 0
            exception = MException('VerifyOutput:OutOfBounds', ...
                         'Noise must be positive');
            throw(exception);
          end
          
          if ~isempty(noise)
            obj.noise = noise;
          end
        
          if nargin >=3
            if ncent < 0
              exception = MException('VerifyOutput:OutOfBounds', ...
                           'Number of centers must be positive');
              throw(exception);
            end            
            
            if ~isempty(ncent)
              obj.ncent = ncent;
            end
            
            if nargin >=4

              if tol < 0
                exception = MException('VerifyOutput:OutOfBounds', ...
                             'Tolerance must be positive');
                throw(exception);
              end                          
              
              if ~isempty(tol)
                obj.tol = tol;
              end
            end  
          end          
        end  
      end

      catch ME
        disp([ME.message '!'])  
        err = MException('VerifyOutput:OutOfBounds', ...
                'Exiting due to incorrect inputs.');
        throw(err);
      end
      
    end  
      
    function process(obj,train_data,y)
      %  Takes in a collection of data and generates an initial Gaussian
      %  process model with the associated kernel matrix, its inversion and
      %  the alpha vector. Currently, it's assumed that only a single point is
      %  passed in to initialize.
      %
      %  Inputs:
      %    data      - d x 1 data matrix passed in columnwise
      %    y         - 1 x 1 column vector of observations
      %
      %  Outputs:
      %    -none
      
      % create initial GP model
      obj.BV = train_data;
      obj.obs = y';
      obj.current_size = size(train_data,2);
      obj.dim = size(train_data,1);
      
      I = eye(obj.current_size);
      obj.K = kernel(train_data,train_data,obj.sigma,obj.A);
      obj.Q = (obj.K + obj.jitter.*eye(obj.current_size))\I; % inverted gram matrix
      obj.C = (obj.K + obj.noise*eye(obj.current_size))\I; % less numerically stable than cholesky
      obj.alpha = obj.C*y';
      
    end
    
    function [pred_mean,pred_var] = predict(obj,test_data,covar_type)
      %  Given a new datapoint, predict a new value based on current model
      %
      %  Inputs:
      %    data       - d x n data matrix passed in columnwise
      %    covar_type - string: 'full' means return full covariance
      %
      %  Outputs:
      %    pred_mean  - 1 x n vector representing predictive mean evaluated
      %                       on testing data
      %    pred_var   - 1 x n vector representing predictive variance
      %                       evaluated on testing data
      %               n x n matrix representing predictive covariance
      %                       evaluated on testing data if 'full' flag on
      k = kernel(test_data,obj.BV,obj.sigma,obj.A)';
      pred_mean = k'*obj.alpha;
      
      if nargout > 1                                
        if nargin == 2
          pred_var = kernel(test_data,test_data,obj.sigma,obj.A) + k'*obj.C*k;
          pred_var = transpose(diag(pred_var));
        elseif nargin == 3 && strcmp(covar_type,'full')
          pred_var = kernel(test_data,test_data,obj.sigma,obj.A) + k'*obj.C*k;
        end
      end
      
    end
    
    function update(obj,x,y)
      %  Given a new data pair, update the model.
      %
      %  Inputs:
      %    x  	   - d x 1 data matrix passed in columnwise
      %    y         - 1 x 1 column vector of observations
      %
      %  Outputs:
      %    -none
      %
      %  Note:
      %    reg_type  - optional string
      %                - 'regularize': use jitter factor in computations
      %                - 'normal': don't use regularization
      %                Default is no regularization
      
      % first compute simple update quantities
      %disp(x);
      %disp(y);
      k_t1 = kernel(x,obj.BV,obj.sigma,obj.A)';  % pg 9, eqs 30-31
      noise_x = obj.noise^2 + k_t1'*obj.C*k_t1 + obj.A;
      q_t1 = (y - k_t1'*obj.alpha)/(noise_x + obj.noise^2);
      r_t1 = -1/(noise_x + obj.noise^2);
      
      % compute residual projection update quantities
      e_t1 = obj.Q*k_t1; % residual vector pg 6, eq 16
      gamma_t1 = double(obj.A-k_t1'*e_t1); % novelty of new point w.r.t RKHS: pg 7, eq 23
      eta_t1 = 1/(1+gamma_t1*r_t1); % numerical stability parameter
      
      % checks to see if point is very close to last point
      %min_dist = min(sum(sqrt((obj.BV-repmat(x,1,size(obj.BV,2))).^2),1));
      
      if gamma_t1 < obj.tol
        % in this case, addition of point to basis doesn't help much, so
        % don't add it, and compute update quantities in terms of old vectors
        % note that data, obs and gram matrix inverse not updated
        s_t1 = obj.C*k_t1 + e_t1;                  %pg 5, eqs 9, but modified
        obj.alpha = obj.alpha + q_t1*eta_t1*s_t1;
        obj.C = obj.C + r_t1*eta_t1*(s_t1*s_t1');
        
      else
        % in this case, you need to add the points
        obj.current_size = obj.current_size + 1;
        
        %in this case, you can simply add the points
        s_t1 = [obj.C*k_t1; obj.A];
        obj.alpha = [obj.alpha; 0] + q_t1*s_t1;
        obj.C = [obj.C zeros(obj.current_size-1,1); zeros(1,obj.current_size)] + r_t1*(s_t1*s_t1');
        
        % update basis vectors and observations
        obj.BV = [obj.BV x];
        obj.obs = [obj.obs; y];
        
        % update Gram matrix and inverse
        obj.K = [obj.K k_t1; k_t1' obj.A]; %GIRISHS CODE
        %K = kernel(BV,BV,sigma); %EDIT BY ROB TO MAKE POS DEF
        
        % EDIT: ROB 2-12, when new points are added with new sigma, no
        % longer PD                
        
        if strcmp(obj.reg_type,'normal')
          obj.Q = obj.K\eye(size(obj.K,1));
          det(obj.Q)
        else
          obj.Q = (obj.K + obj.jitter.*eye(obj.current_size))\eye(size(obj.K,1));
        end
        
        if obj.current_size <= obj.ncent
          %do nothing
        else
          % now you must delete one of the basis vectors; follow figure 3.3
          % first, compute which vector is least informative (1), pg 8, eq 27
          scores = zeros(1,obj.current_size);
          for i=1:obj.current_size
            scores(i) = abs(obj.alpha(i))/obj.Q(i,i);
          end
          
          %find index of minimum vector
          if obj.update_BV_toggle == 1
            [~, index] = min(scores);
          else
            index = length(scores); % in this case, just delete the last point added
          end
          
          %now begin update given in (1), pg 8, eq 25
          
          %first compute scalar parameters
          a_s = obj.alpha(index);
          c_s = obj.C(index,index);
          q_s = obj.Q(index,index);
          
          %compute vector parameters
          C_s = obj.C(:,index);
          C_s(index) = [];
          Q_s = obj.Q(:,index);
          Q_s(index) = [];
          
          %shrink matrices
          obj.alpha(index) = [];
          obj.C(:,index)   = [];
          obj.C(index,:)   = [];
          obj.Q(:,index)   = [];
          obj.Q(index,:)   = [];
          obj.K(:,index)   = [];
          obj.K(index,:)   = [];
          
          %finally, compute updates
          obj.alpha = obj.alpha - (a_s/q_s)*(Q_s);
          obj.C = obj.C + (c_s/(q_s^2))*(Q_s*Q_s') - (1/q_s)*(Q_s*C_s' + C_s*Q_s');
          obj.Q = obj.Q - (1/q_s)*(Q_s*Q_s');
          
          obj.current_size = obj.current_size - 1;
          obj.BV(:,index) = [];
          obj.obs(index) = [];
        end
        
      end
    end
  end
  
end

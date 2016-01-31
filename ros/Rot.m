function R = Rot(theta,n)
    R = (1-cos(theta))*n*n' + cos(theta)*eye(3) +sin(theta)*[0 -n(3) n(2);n(3) 0 -n(1); -n(2) n(1) 0];


end
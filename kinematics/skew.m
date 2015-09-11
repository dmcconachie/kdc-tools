function R = skew(w)

  if size(w,1) ~= [3, 1]
    error('skew: vector must be 3x1')
  end
  
  R = [ 0    -w(3)  w(2) ;
        w(3)  0    -w(1) ;
       -w(2)  w(1)  0 ];
end
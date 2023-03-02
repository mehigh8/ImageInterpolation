function x = BackwardSubstitution (U, b)
  n = length(b);
  x = zeros(n, 1);
  for i = n:-1:1,
    s = 0;
    for j = i+1:n,
      s += U(i,j) * x(j);
    endfor
    x(i) = (b(i) - s) / U(i, i);
  endfor
endfunction

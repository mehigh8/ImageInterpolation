function [Q, R] = Householder (A)
  [m, n] = size(A);
  Q = eye(m);
  for p = 1 : min([m - 1, n]),
    z = A(p : m, p);
    sigma = sign(A(p, p)) * norm(z);
    v = [zeros(p-1, 1); sigma + A(p, p); z(2:end)];
    H = eye(m) - 2 * v * v' / (v' * v);
    A = H * A;
    Q = Q * H';
  endfor
  R = A;
endfunction
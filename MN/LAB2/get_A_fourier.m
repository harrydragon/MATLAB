function A = get_A_fourier(n ,m)
tmp = randperm(n);
phi = inv(fft(eye(n)));
A = phi(tmp(1:m/2),:);
A = [real(A);imag(A)];
end
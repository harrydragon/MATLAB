function T = lap1ddset(N, h)
	T = spdiags( repmat([-1 2 -1]./(h^2), N, 1), [-1,0,1], N, N);
end
X = 2; % fizyczne rozmiary obszaru
k = 2.45; % sta³a dyfuzji

Nx = 20;
hx = X/(Nx+1);
px = hx*[0:Nx+1]'; 	% prawdziwe wspó³rzêdne wêz³ów dyskretyzacji
			% potrzebne m.in. do definicji prawej strony;
			% okreœlone ³¹cznie z brzegiem obszaru
Tx = lap1ddset(Nx,hx)	% macierz laplasjanu

% wyznaczamy funkcjê prawej strony
m = 1; % punkt graniczny
pxl = px(px<m); pxr = px(px>=m); % wêz³y na lewo i prawo od "m"
Fx = [1./(2-pxl); 1./(pxr.^5)] / k;
plot(px,Fx); % sprawdzamy wizualnie poprawnoœæ Fx
Fx = Fx(2:end-1); % wybieramy tylko wartoœci w wewnêtrznych wêz³ach

Ux = Tx \ Fx;
plot(px, [0; Ux; 0]); legend('U_{N_x}(x)'); grid on;





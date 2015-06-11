function [vect, time]=sec_vect_sh(x)
tic
n=length(x);% d³ugoœæ wektora x
Ls=n/4;%liczba sekcji
Lps = 2 * Ls; %Liczba podsekcji
E = log2(n)-1; %number of etapów
vect=zeros(1,n); % help vector
DLs = 4; %d³ugoœæ sekcji
DLps = 2; %d³ugoœæ podsekcji
for i=1:E %pêtla po etapach
    for j=1:Ls%pêtla po sekcjach
       for k=1+(j-1)*DLs:DLs+(j-1)*DLs % obliczanie indeksu tablicy pomocniczej,
                                       % do którego nale¿y wstawiæ
                                       % konkretn¹ liczbê
             if (k==1+(j-1)*DLs) ||  (k==DLs+(j-1)*DLs)
                 vect(k)= x(k);
                 ip=k;inp=ip;
                 continue;                
             end
             if mod(k,2)==0
                  vect(k)=x(ip+DLps);                 
                  ip=ip+1;
             end
             if mod(k,2)==1;                  
                  vect(k)=x(inp+1);
                  inp=inp+1;                  
             end       
       end
    end
    x=vect;% podmiana wektora pomocniczego z oryginalnym
    vect=zeros(1,n);   % wyzerowanie wektora pomocniczego 
    Ls=Ls/2; % obliczenie nowej liczby sekcji
    Lps = Ls*2; % obliczenie nowej liczby podsekcji
    DLs = DLs*2;%obliczenie iloœci elementów w sekcji
    DLps = DLps*2;% obliczenie iloœci elementów w podsekcji     
end
vect = x;% ostatnia podmiana wektora

time = toc;
end


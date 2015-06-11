
%
% Proste_alg_gen.m
%
% Skrypt implementuje Prosty Algorytm Genetyczny (Simple Genetic Algorithm)
% Wykorzystuje biblioteke narzedziowa opracowana przez Hartmuta Pohlheima,
% Department of Automatic Control and Systems Engineering
% University of Sheffield
%
%

% -------- Wybor parametrow algorytmu

% NIND - Liczba osobnikow w populacji
% MAXGEN - Maksymalna liczba generacji
% GGAP - Czesc populacji, tworzona w wyniku rekombinacji osobnikow
%        rodzicielskich
% PRECI - Precyzja reprezentacji binarnej (dlugosc ciagu binarnego)

% warning('off','MATLAB:dispatcher:InexactMatch');
warning('off','MATLAB:dispatcher:InexactCaseMatch');
% clear all
close all

NIND_DEF = 40;       % Domyslna liczba osobnikow w populacji
NIND = input(['Podaj liczbe osobnikow w populacji (dom. = ', ...
    int2str(NIND_DEF), ') > ']);
if (isempty(NIND))
  NIND = NIND_DEF;
end
NIND = fix(NIND);
NIND = max(1, NIND);

MAXGEN_DEF = 500;    % Domyslna maksymalna liczba generacji
MAXGEN = input(['Podaj liczbe generacji populacji (dom. = ', ...
    int2str(MAXGEN_DEF), ') > ']);
if (isempty(MAXGEN))
  MAXGEN = MAXGEN_DEF;
end
MAXGEN = fix(MAXGEN);
MAXGEN = max(1, MAXGEN);

GGAP_DEF = .9;       % Domyslna liczba nowych osobnikow (ulamek liczebnosci
                     % populacji), tworzona w wyniku rekombinacji
GGAP = input(['Podaj wzgledna liczbe nowych osobnikow w populacji (dom. = ', ...
    num2str(GGAP_DEF), ') > ']);
if (isempty(GGAP))
  GGAP = GGAP_DEF;
end
GGAP = 0.01*fix(100*GGAP);
GGAP = max(0.01, GGAP);

PRECI_DEF = 20;      % Domyslna precyzja reprezentacji binarnej
PRECI = input(['Podaj dlugosc reprezentacji binarnej liczby (dom. = ', ...
    int2str(PRECI_DEF), ') > ']);
if (isempty(PRECI))
  PRECI = PRECI_DEF;
end
PRECI = fix(PRECI);
PRECI = max(1, PRECI);


% -------- Wybor funkcji testowej

src = 0;

while 1
  while (src < 1) | (src > 11),
    src = menu('Wybierz funkcje testowa', ...
                'Kwadratowa (de Jonga)', ...
                'Hiperelipsoida', ...
                'Obrocona hiperelipsoida', ...
                'Dolina Rosenbrocka', ...
                'Funkcja Rastrigina', ...
                'Funkcja Schwefela', ...
                'Funkcja Griewangka', ...
                'Suma poteg', ...
                'Uklad podwojnie calkujacy', ...
                'System liniowo-kwadratowy', ...
                'Zakoncz i wroc do MATLABa');
  end

  % Wyjscie ze skryptu - powrot do MATLABa
  if (src == 11)
    src = 0;
    break;
  end

  % Funkcja kwadratowa f = x^2
  if (src == 1)
    fun_name = 'objfun1';
    NVAR = 20;            % Liczba zmiennych
  end

  % Hiperelipsoida (osie rownolegle do osi wspolrzednych)
  if (src == 2)
    fun_name = 'objfun1a';
    NVAR = 10;            % Liczba zmiennych
  end

  % Obrocona hiperelipsoida (osie obrocone wzgledem osi wspolrzednych)
  if (src == 3)
    fun_name = 'objfun1b';
    NVAR = 10;            % Liczba zmiennych
  end

  % Dolina Rosenbrocka (dolina bananowa)
  if (src == 4)
    fun_name = 'objfun2';
    NVAR = 2;            % Liczba zmiennych
  end

  % Funkcja Rastrigina
  if (src == 5)
    fun_name = 'objfun6';
    NVAR = 20;            % Liczba zmiennych
  end

  % Funkcja Schwefela
  if (src == 6)
    fun_name = 'objfun7';
    NVAR = 20;            % Liczba zmiennych
  end

  % Funkcja Griewangka
  if (src == 7)
    fun_name = 'objfun8';
    NVAR = 10;            % Liczba zmiennych
  end

  % Suma roznych poteg
  if (src == 8)
    fun_name = 'objfun9';
    NVAR = 10;            % Liczba zmiennych
  end

  % Uklad podwojnie calkujacy
  if (src == 9)
    fun_name = 'objdopi';
    NVAR = 20;            % Liczba zmiennych
  end

    % System liniowo-kwadratowy
  if (src == 10)
    fun_name = 'objlinq';
    NVAR = 45;            % Liczba zmiennych
  end

% Build field descriptor
  FieldD = [rep([PRECI],[1, NVAR]); rep([-512;512],[1, NVAR]);...
              rep([1; 0; 1 ;1], [1, NVAR])];

% Inicjalizacja populacji
   Chrom = crtbp(NIND, NVAR*PRECI);

% Zerowanie licznikow
   Best = NaN*ones(MAXGEN,1);	% Najlepszy chromosom w biezacej populacji
   gen = 0;			            % Licznik generacji

% Ocena osobnikow w biezacej populacji
   eval(['ObjV = ', fun_name, '(bs2rv(Chrom,FieldD));']);

% Sledzenie najlepszego osobnika i wizualizacja zbieznosci algorytmu
   Best(gen+1) = min(ObjV);
   plot(log10(Best),'ro');xlabel('generation'); ylabel('log10(f(x))');
   text(0.5,0.95,['Best = ', num2str(Best(gen+1))],'Units','normalized');   
   drawnow;        

   src1 = 0;
   src1 = menu('Metoda selekcji osobnikow', ...
               'Kolo ruletki', ...
               'Ranking liniowy');

   if (src1 == 1)
     select_fun = 'rws';
   else
     select_fun = 'sus';
   end
   src1 = 0;
   
   src2 = 0;
   src2 = menu('Metoda krzyzowania', ...
               'Jednopunktowa', ...
               'Dwupunktowa');

   if (src2 == 1)
     cross_fun = 'xovsp';
   else
     cross_fun = 'xovdp';
   end
   src2 = 0;

   % Petla generacji kolejnej populacji
   while gen < MAXGEN,

    % Okreslenie fukcji dopasowania osobnikow w biezacej populacji
       FitnV = ranking(ObjV);

    % Okreslenie osobnikow do rozmnazania (rekombinacji)
       eval(['SelCh = select(''', select_fun, ''', Chrom, FitnV, GGAP);']);

    % Rekombinacja wybranych osobnikow (crossover)
       eval(['SelCh = recombin(''', cross_fun, ''', SelCh, 0.7);']);

    % Mutacja osobnikow potomnych
       SelCh = mut(SelCh);

    % Ocena osobnikow potomnych, wywolanie funkcji celu
       eval(['ObjVSel = ', fun_name, '(bs2rv(SelCh,FieldD));']);

    % Reinsert offspring into current population
       [Chrom ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);

    % Zwiekszenie licznika numeru generacji
       gen = gen+1;

    % Aktoalizacja wykresu zbieznosci, wydruk dopasowania najlepszego
    % osobnika
       Best(gen+1) = min(ObjV);
       plot(log10(Best),'ro'); xlabel('Generacja'); ylabel('log10(f(x))');
       text(0.5,0.95,['Najlepszy = ', num2str(Best(gen+1))],'Units','normalized');
       drawnow;
   end
   
   src = 0;
end
   
% Koniec skryptu 'Proste_alg_gen'
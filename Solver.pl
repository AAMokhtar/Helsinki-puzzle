
%find rows and columns

row([H|_],1,H):-!.
row([_|T],I,X) :-
    I1 is I-1,
    row(T,I1,X).

column([],_,[]).
column([H|T], I, [R|X]):-
   row(H, I, R), 
column(T,I,X).

%~~~~~~~~~~~~~~~~~~~~~~~~
%make a list out of indices

make_list([],_,[]).
make_list([CI|I],L,[H|R]):-
	nth1(CI,L,H),
	make_list(I,L,R).

%------------------------------------
%Grid Build

grid_build(N,M):-
	length(M1,N),
	grid_build1(M1,N,M).

grid_build1([],_,[]).
grid_build1([_|T],N,[L|M]):-
	length(L,N),
	grid_build1(T,N,M).
	
%------------------------------------
%Grid Gen

grid_gen(N,M):-
	grid_build(N,M1),
	
	num_gen(1,N,I),
	acceptable_permutation(I,I1),
	make_list(I1,M1,MT),
	trans(M1,MT),
	grid_gen1(N,M1,M),
	distinct_rows(M1),
	check_num_grid(M).

grid_gen1(_,[],[]).
grid_gen1(N,[H|T],[H|M]):-
	maplist(between(1,N),H),
	grid_gen1(N,T,M).
%------------------------------------
%Num Gen

num_gen(L,L,[L]).
num_gen(F,L,R):-
	F<L,
	F1 is F+1,
	num_gen(F1,L,R1),
	R = [F|R1].

%------------------------------------
%Check Num Grid

check_num_grid([]).
check_num_grid(G):-
	flatten(G,R),
	sort(R,L1),
	last(L1,Max),
	length(G,L),
	Max =< L,
	num_gen(1,Max,L1).

%------------------------------------
%Acceptable Distribution

acceptable_distribution(G):-
	length(G,L),
	acceptable_distribution1(0,L,G).
acceptable_distribution1(N,N,_).
acceptable_distribution1(C,N,G):-
	C1 is C+1,
	column(G,C1,COLUMN),
	row(G,C1,ROW),
	COLUMN \= ROW,
	acceptable_distribution1(C1,N,G).

%------------------------------------
%Acceptable Permutation

acceptable_permutation(L,R):-
	acceptable_permutation1(L,[],L,R).

acceptable_permutation1([],_,_,[]).
acceptable_permutation1([H|T],Acc,L,[C|R]):-
	member(C,L),
	C \= H,
	\+ member(C,Acc),
	acceptable_permutation1(T,[C|Acc],L,R).


%------------------------------------
%row_col_match

row_col_match(G):-
	trans(G,GT),
	acceptable_permutation(GT,G).

%------------------------------------
%Trans

trans([],[]).
trans([H|T],M1):-
	trans1(H,[H|T],M1).
trans1([],_,[]).
trans1([_|T1],M,[H|T2]):-
	firsts(M,H,M1),
	trans1(T1,M1,T2).

firsts([],[],[]).
firsts([[HI|TI]|T1],[HI|T2],[TI|T3]):-
	firsts(T1,T2,T3).

%------------------------------------
%Distinct Rows

distinct_rows([]).
distinct_rows([H|T]):-
	\+ my_member(H,T),
	distinct_rows(T).

my_member(X,[H|T]):-
	X == H;
	my_member(X,T).

%------------------------------------
%Distinct Columns

distinct_columns(M):-
	trans(M,M1),
	distinct_rows(M1).

%------------------------------------>
%----------------------------->
%-------------------->
%-------------->
%helsinki maximum: 7X7

helsinki(N,G):-
	grid_gen(N,G).

%-------------->
%-------------------->
%----------------------------->
%------------------------------------>




	





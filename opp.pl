:-op(800,xfx,--->). % declara��o de operadores
:-op(600,fx,~).

% execu��o do meta-interpretador via: ?- demo.
% executa os m�dulos OPP at� encontrar stop
demo:- Condicao ---> Accao,
      testa(Condicao),
      executa(Accao).

testa([]).
testa([~Primeira|Resto]):- % negacao de condicao
!,nao(Primeira),testa(Resto).
testa([Primeira|Resto]):-
!,call(Primeira),testa(Resto).

nao(Condicao):-call(Condicao),!,fail.
nao(_).

executa([stop]):-!. % p�ra se stop
executa([]):- demo. % continua com pr�ximo OPP
executa([Primeira|Resto])
:-call(Primeira), executa(Resto).

% predicados de manipulacao da BD
substitui(A,B):- retract(A),!,asserta(B).

insere(A):- asserta(A).

retira(A):- retract(A).



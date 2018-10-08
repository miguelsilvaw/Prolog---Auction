:-op(800,xfx,--->). % declaração de operadores
:-op(600,fx,~).

% execução do meta-interpretador via: ?- demo.
% executa os módulos OPP até encontrar stop
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

executa([stop]):-!. % pára se stop
executa([]):- demo. % continua com próximo OPP
executa([Primeira|Resto])
:-call(Primeira), executa(Resto).

% predicados de manipulacao da BD
substitui(A,B):- retract(A),!,asserta(B).

insere(A):- asserta(A).

retira(A):- retract(A).



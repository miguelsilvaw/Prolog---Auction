:-[opp].
:-[basedados].
:-dynamic(interesse/3).
:-dynamic(comprado/5).
:-dynamic(atual/3).

%interface

menu:-

write('----------------------------------------------------------------------------------------------------'),nl,
write('----------------------| Bem-Vindo ao LeilaoUM !! |--------------------------------------------------'),nl,
write('----------------------------------------------------------------------------------------------------'),nl,nl,
write('Por favor selecione a sua opcao:\n 1.Iniciar Leilao \n 2.Listar Produtos \n 3.Listar Compradores \n 4.Sair \n'),
write('------------------------------------------------------------------------------------'),nl,
read(X),do(X).

do(2):-
nl,write('Segue-se a lista de produtos disponiveis:'), nl,listing(produto),nl,
menu.

do(3):-
nl,write('Segue-se a lista de participantes:'), nl,listing(comprador),nl,
menu.

do(4):- nl,
write('Obrigado por ter participado no Leilao UM! Até a próxima.'),halt.

%Padroes
%colocar o produto a venda e retira-lo do stock.
do(1):-
demo.

[produto(IdProduto,NomeProduto,PrecoBase,Descricao,Aumento),
    findall(X,comprado(X,_,_,_,_),L),
	L=[]]

  ---> [

write('----------------------------------------------------------------------------------------------------'),nl,
write(''),nl,
write(''),nl,
write('O proximo artigo a ser licitado contem as seguintes informacoes:   '),nl,
write('----------------------------------------------------------------------------------------------------'),nl,
write('Nome: '), write(NomeProduto),nl,
write('ID: '), write(IdProduto),nl,
write('Preco Base: '), write(PrecoBase),nl,
write('Aumento por licitacao: '), write(Aumento),nl,
write('É '), write(Descricao),
nl,
assert(comprado(IdProduto, NomeProduto, PrecoBase, Descricao, Aumento)),
retract(produto(IdProduto, NomeProduto, PrecoBase, Descricao, Aumento)),
write('----------------------------------------------------------------------------------------------------'),nl,
write('Os interessados no produto -> '),write(NomeProduto), write(' <- sao: '),nl,
write('----------------------------------------------------------------------------------------------------'),nl
        ].

% listagem dos compradores interessados
		[comprado(IdProduto,_,PrecoBase,_,_),
		comprador(Nome,_),
		interessadoEm(IdProduto,Nome,ValorMaximoADar),
		ValorMaximoADar > PrecoBase
		]
		--->
			[
			Base is PrecoBase,
			assert(interesse(Nome,ValorMaximoADar,Base)),
			write(' O licitador '),
			write(Nome),    write(' '),						
			write('que esta disposto a oferecer um maximo de :'),
			write(ValorMaximoADar),
			write(' euros pelo produto em licitacao.'),nl,
			retract(interessadoEm(IdProduto, Nome, ValorMaximoADar))
			].



		[interesse(Nome,ValorMaximoADar,Base),
		findall(X,atual(X,_,_),L),
		L=[]]
		--->
			[
			assert(atual(Nome,ValorMaximoADar,Base)),
			retract(interesse(Nome,ValorMaximoADar,Base))
			].

% ha mais interessados?
		[comprado(IdProduto, NomeProduto, PrecoBase, Descricao, Aumento),
		atual(Nome,ValorMaximoADar,Base),
		findall(X,interesse(X,_,_),L),
		L=[]]
		--->
			[retract(comprado(IdProduto, NomeProduto, PrecoBase,Descricao, Aumento)),
			retract(atual(Nome,ValorMaximoADar,Base)),
write('----------------------------------------------------------------------------------------------------'),nl,
			write('                                    O artigo -> '), write(NomeProduto),write(' <- foi vendido!!'),nl
            ].

%Propostas
		[atual(N,M,X),
		comprado(IdProduto, NomeProduto, PrecoBase, Descricao, Aumento),
		Total is PrecoBase+Aumento,
		Total =< M]
		--->
			[
			assert(comprado(IdProduto, NomeProduto, Total, Descricao, Aumento)),
            retract(comprado(IdProduto, NomeProduto, PrecoBase, Descricao, Aumento)),
			assert(interesse(N,M,X)),
            retract(atual(N,M,X)),
            write('    O senhor '),write(N),write(' aumenta a proposta para '),
            write(Total),write(' euros.'),nl
            ].


		[atual(N,M,X),
		comprado(_,_,PrecoBase,_,Aumento),
		Total is PrecoBase+Aumento,
		Total > M]
		--->
			[
            retract(atual(N,M,X))
            ].

		[findall(X,comprado(X,_,_,_,_),L),
		L\==[]]
		--->
			[
            retract(comprado(X,_,_,_,_)),read(_)
            ].

		 []--->[stop].




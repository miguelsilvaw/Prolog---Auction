:- dynamic(produto/5), dynamic(comprador/2), dynamic(interessadoEm/3).


%produto(IdProduto,NomeProduto,PrecoBase,Descricao,Aumento).
produto(1,vanGoghAutoRetrato,5000,'o Ultimo auto-retrato realizado por Van Gogh',500).
produto(2,picassoGuernica,10000,'um Painel pintado por Pablo Picasso que retrata o bombardeamento sofrido na cidade de Guernica pelos avioes alemaes',1000).
produto(3,daVinciUltimaCeia,8000,'um Quadro que retrata Jesus á mesa com os apostolos anunciando que um deles o traia',500).
produto(4,laferrari,250000,' um supercarro da marca Ferrari',10000).
produto(5,lamborghiniGallardo,200000,'um supercarro da marca Lamborghini',10000).
produto(6,rollsRoyceSilverWraith,200000,'um Carro antigo de luxo produzido no ano 1959',10000).
produto(7,bolaautografada,600,'uma bola autografada pelos Yankees e beijada por Marilyn Monroe',50).
produto(8,raqueteAgassi,350,'a raquete utilizada por Andre Agassi após ter ganho o Roland Garros em 1999',50).
produto(9,luvaBoxManyPacquiao,400,'a luva utilizada e assinada por Many Pacquiao num combate do titulo em 2015',50). 
produto(10,casacoMichaelJackson,900,'o casaco utilizado por Michael Jackson num concerto',50).
produto(11,guitarraHendrix,1000,'a guitarra utilizada e autografada por Jimmy Hendrix',100).
produto(12,discoVinilBeattles,350,'um disco de vinil com um conjunto de musicas tocadas pelos Beattles',50).

%comprador(1ºnome,2ºnome).
comprador(joao,ribeiro).
comprador(filipe,lameiras).
comprador(miguel,silva).
comprador(andre,vale).
comprador(francisco,lourenco).



%interessadoEm(IdProduto,PrimeiroNomeComprador,ValorMaximoADar).
interessadoEm(1,joao,7600).
interessadoEm(1,francisco,9900).
interessadoEm(1,andre,9900).

interessadoEm(2,miguel,17500).
interessadoEm(2,francisco,14000).
interessadoEm(2,filipe,25000).
interessadoEm(2,andre,21000).

interessadoEm(3,filipe,14000).
interessadoEm(3,miguel,14250).
interessadoEm(3,joao,14750).

interessadoEm(4,andre,300000).
interessadoEm(4,miguel,325000).

interessadoEm(5,joao,240000).
interessadoEm(5,filipe,300000).
interessadoEm(5,miguel,276000).
interessadoEm(5,andre,220000).
interessadoEm(5,francisco,231000).

interessadoEm(6,filipe,215000).
interessadoEm(6,francisco,232000).
interessadoEm(6,andre,240000).

interessadoEm(7,miguel,800).

interessadoEm(8,joao,1000).
interessadoEm(8,francisco,1200).
interessadoEm(8,miguel,1080).
interessadoEm(8,filipe,955).

interessadoEm(9,andre,700).
interessadoEm(9,joao,900).

interessadoEm(10,filipe,5000).
interessadoEm(10,francisco,1200).
interessadoEm(10,joao,1125).
interessadoEm(10,miguel,1389).

interessadoEm(11,miguel,1200).
interessadoEm(11,francisco,1340).

interessadoEm(12,filipe,400).
interessadoEm(12,andre,560).
interessadoEm(12,joao,550).

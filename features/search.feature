Cenário: Exibição da página inicial para usuário logado
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
When acesso a página inicial
Then posso ver o campo de busca
And posso ver a seção "Músicas em Alta"
And posso ver a seção "Podcasts em Alta"
And posso ver meu histórico de músicas ouvidas recentemente
And posso ver minhas playlists
And vejo uma mensagem na parte de cima da tela: “Ola, LuisCardoso012!”

Cenário: Exibição da página inicial para usuário nao logado
Given nao estou logado na plataforma
When acesso a página inicial
Then posso ver o campo de busca
And posso ver a seção "Músicas em Alta"
And posso ver a seção "Podcasts em Alta"
And nao posso ver meu histórico de músicas ouvidas recentemente
And nao posso ver minhas playlists
And vejo uma mensagem na parte de cima da tela: “Faça login”

Cenário: Busca que não retorna resultados // implementacao do cenario
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
And estou na página de busca
And nao existe nenhum item no sistema que tenha título “MusicaPesada123” ou semelhante 
When realizo uma busca pelo termo “MusicaPesada123”
Then o sistema deve exibir um placeholder informando que nenhum resultado foi encontrado 
And nenhum conteúdo deve ser listado
And Eu continuo na página de busca

Cenário: Busca com filtro de gênero inexistente
Given estou na página de busca
When pesquiso por uma música sem preencher o campo de busca
And aplico o filtro de gênero "GeneroInexistente123"
Then devo ver um placeholder informando que não houveram resultados
And o sistema não deve exibir nenhum item na lista de resultados


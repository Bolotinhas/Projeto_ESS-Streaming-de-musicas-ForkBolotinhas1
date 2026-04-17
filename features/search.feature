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

Cenário: Busca que não retorna resultados
opapaa

Cenário: Exibição do histórico de filtros ao abrir a busca
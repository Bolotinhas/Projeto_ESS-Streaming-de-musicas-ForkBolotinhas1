# Usuário(Gledson)

#Playlists(Peuba)

#Artistas(Analia)

#Podcasts(Guerra)

# Recomendações e Busca por Filtros(Théo)
Cenário: Exibição da página inicial para usuário logado
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
When acesso a página inicial
Then posso ver o campo de busca
And posso ver a seção "Músicas em Alta"
And posso ver a seção "Podcasts em Alta"
And posso ver meu histórico de músicas ouvidas recentemente
And posso ver minhas playlists
And posso ver um ícone 
And vejo uma mensagem na parte de cima da tela: “Ola, LuisCardoso012!”

Cenário: Busca por nome que retorna resultado
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
And estou na página "Busca"
And existe um item com título "MusicaBonita123"
When realizo uma busca pelo termo "MusicaBonita123"
Then o sistema deve exibir a música "MusicaBonita123" nos resultados
And os resultados devem estar ordenados de forma descrescente priorizando correlações exatas e depois parciais
And músicas com mesma correlação devem ser ordenadas pelo total de reproduções
And nenhuma música sem correlação com "MúsicaBonita123" deve ser exibida

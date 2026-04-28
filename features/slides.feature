# Usuário(Gledson)

#Playlists(Peuba)

#Artistas(Analia)

#Podcasts(Guerra)

# Recomendações e Busca por Filtros(Théo)
Cenário: Exibição da página inicial para usuário logado
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
When acesso a página "Inicial"
Then posso ver o campo de busca
And posso ver a seção "Músicas em Alta"
And posso ver a seção "Podcasts em Alta"
And posso ver "Histórico de músicas e podcasts reproduzidos"
And posso ver "Minhas playlists"
And posso ver a seção "Configurações"
And vejo uma mensagem na parte de cima da tela: “Ola, LuisCardoso012!”

Cenário: Busca por nome que retorna resultado
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
And estou na página "Busca"
And existe um item com título "Love will tear us apart" do tipo "Música" armazenado no sistema
When realizo uma busca pelo termo "Love will tear us apart"
Then o sistema deve exibir o item "Love will tear us apart" nos resultados
And os resultados devem estar ordenados de forma descrescente priorizando correlação
And músicas com mesma correlação devem ser ordenadas por total de reproduções
And nenhuma música sem correlação com "Love will tear us apart" deve ser exibida

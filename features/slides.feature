# Usuário(Gledson)

#Playlists(Peuba)
Scenario: Criar uma playlist com sucesso
Given que o usuário "Pedro" está logado com login"pedro123" e senha "12345"
And o usuário está na página "Playlists"
When o usuário seleciona a opção "Criar Playlist"
And o usuário preenche o nome com "Músicas de rock", a descrição com
"Melhores musicas"
Then o usuário ainda está na página "Playlists"
And o usuário consegue ver a playlist com o nome "Músicas
de rock"

Scenario: Falha ao tentar criar uma playlist por não ter nome
Given que o usuário "pedro" está logado com login"pedro123" e senha "12345"
And o usuário está na página "Playlists"
When o usuário seleciona a opção "Criar Playlist"
Then o usuário ainda está na página "Playlists"
And o usuário consegue ver a mensagem "Por favor preencha o campo do nome"

Scenario: Falha ao tentar criar uma playlist pois o nome já existe
Given que o usuário "pedro" está logado com login "pedro123" e a senha "12345"
And o usuário está na página "Playlists"
And a playlist "Músicas de rock" já existe
When o usuário seleciona a opção "Criar Playlist"
And o usuário preenche o nome com "Músicas de rock", a descrição com
"melhores musicas" 
Then o usuário ainda está na página "Playlists"
And o usuário consegue ver a mensagem "Essa playlist já existe ,tente outro nome"



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

Cenário: Busca por nome com correlação integral que retorna um resultado
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
And estou na página "Busca"
And existe um item com título "Love will tear us apart" do tipo "Música" armazenado no sistema
When realizo uma busca pelo termo "Love will tear us apart"
Then o sistema deve exibir o item "Love will tear us apart" nos resultados
And eu continuo na página "Busca"

Cenário: Busca por nome com correlação parcial que retorna um resultado
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
And estou na página "Busca"
And existe um item com título "Love will tear us apart" do tipo "Música" com 2000 reproduções armazenado no sistema
And existe um item com título "Love, Hate, Love" do tipo "Música" com 3000 reproduções armazenado no sistema
And existe um item com título "Love me again" do tipo "Música" com 4000 reproduções armazenado no sistema
When realizo uma busca pelo termo "Love"
Then o sistema deve exibir o item "Love me again" em primeiro lugar nos resultados
And o sistema deve exibir o item "Love, Hate, Love" em segundo lugar nos resultados
And o sistema deve exibir o item "Love will tear us apart" em terceiro lugar nos resultados
And eu continuo na página "Busca"

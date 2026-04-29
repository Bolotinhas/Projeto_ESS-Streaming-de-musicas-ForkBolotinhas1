# Usuário(Gledson)

#Playlists(Peuba)
Feature: Playlists
As a usuário
I want to criar playlists personalizada com minhas músicas escolhidas
So that eu possa escutar as músicas desejadas naquela playlists

Scenario: Criar uma playlist com sucesso
Given estou logado como "Usuário" com login "LuisCardoso012"
And o usuário está na página "Playlists"
When o usuário seleciona a opção "Criar Playlist"
And o usuário preenche o nome com "Músicas de rock", a descrição com
"Melhores musicas" , a visibilidade como "pública"
Then o usuário consegue ver a playlist com o nome "Músicas de rock" 
And eu vejo uma mensagem de sucesso"playlist criada com sucesso"

Scenario: Falha ao tentar criar uma playlist por não ter nome
Given estou logado como "Usuário" com login "LuisCardoso012"
And o usuário está na página "Playlists"
When o usuário seleciona a opção "Criar Playlist"
And o usuário não preenche o campo nome
Then o usuário ainda está na página "Playlists"
And o usuário consegue ver a mensagem "Por favor preencha o campo do nome"





#Artistas(Analia)
Feature: Cadastro e manutenção de músicas e álbuns
As a usuário artista
I want to criar, editar e excluir músicas e álbuns
So that I can gerenciar meu conteúdo de forma eficiente

Scenario: Adição de nova música a um álbum existente com sucesso
  Given estou logado como "Artista" com login "Vivaldi"
  And existe um álbum chamado "Four Seasons" publicado por "Vivaldi"
  And a última música do álbum "Four Seasons" é "Winter" de índice "1"
  When tento adicionar a música "Spring" com gênero "Barroco" e arquivo "spring.mp3" ao álbum "Four Seasons"
  Then eu vejo uma mensagem de sucesso "Música Spring adicionada com sucesso!"
  And as músicas "Winter" de índice "1" e "Spring" de índice "2" estão no álbum "Four Seasons"



#Podcasts(Guerra)
Feature: Cadastro de episódios de podcast
As a usuário artista 
I want to criar, editar e excluir episódios de podcast
So that I can gerenciar meu conteúdo de forma eficiente

  Scenario: Criar episódio de podcast com dados válidos
    Given eu estou logado como "Artista" com login "Juninho"
    And estou na tela de criação de episódio de podcast
    When tento criar um episódio com nome "Episódio 1", descrição "primeiro episódio", arquivo "ep1.mp3" válido
    Then data e duração são preenchidos automaticamente
    Then eu vejo uma mensagem de sucesso "Episódio criado com sucesso"
    And o episódio fica disponível para visualização pública


# Recomendações e Busca por Filtros(Théo)
Feature: Funcionalidade básica da página inicial
As a usuário
I want to acessar a página inicial
So that I can acessar rapidamente as seções de histórico, Em alta, Minhas playlists, campo de busca e configurações

  Cenário: Exibição da página inicial para usuário logado
    Given estou logado como "Usuário" com login "LuisCardoso012"
    When acesso a página "Inicial"
    Then posso ver ao campo "Busca"
    And posso ver a seção "Músicas em Alta"
    And posso ver a seção "Histórico"
    And posso ver a seção "Minhas playlists"
    And posso ver a seção "Editar"
    And posso ver a seção "Músicas" selecionada
    And posso ver a seção "Podcasts" não selecionada
    And vejo uma mensagem na parte de cima da tela: "Ola, LuisCardoso012!"

Feature: Implementação inicial de Busca com Filtros
As a usuário
I want to acessar a página de busca com filtros
So that I can acessar e reproduzir rapidamente as faixas que desejo consumir

  Cenário: Busca por nome com correlação parcial que retorna um resultado
    Given estou logado como "Usuário"
    And estou na página "Busca"
    And existe um item com título "Love will tear us apart" do tipo "Música" com 3000 reproduções armazenado no sistema
    And existe um item com título "Love, Hate, Love" do tipo "Música" com 4000 reproduções armazenado no sistema
    And existe um item com título "Bizarre Love Triangle" do tipo "Música" com 2000 reproduções armazenado no sistema
    When realizo uma busca pelo termo "Love"
    Then o sistema deve exibir o item "Love, Hate, Love" em primeiro lugar nos resultados
    And o sistema deve exibir o item "Love will tear us apart" em segundo lugar nos resultados
    And o sistema deve exibir o item "Bizarre Love Triangle" em terceiro lugar nos resultados
    And eu continuo na página "Busca"

#Artistas(Victor)


Feature: Remoção de artista
As a usuário artista
I want to remover minha conta de artista
So that eu possa excluir meus dados da plataforma

Scenario: Remoção de artista já cadastrado com sucesso

Given estou logado como "Artista" com login "Vivaldi"
And o artista "Vivaldi" possui um álbum chamado "Four Seasons"
And o álbum "Four Seasons" possui uma música chamada "Winter"
When o usuário seleciona a opção "Remover Conta"
And o usuário confirma a remoção
Then eu vejo uma mensagem de sucesso "Artista removido com sucesso"
And o artista "Vivaldi" não está mais cadastrado na plataforma
And o álbum "Four Seasons" não está mais disponível na plataforma
And a música "Winter" não está mais disponível na plataformas

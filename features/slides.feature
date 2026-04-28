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
And o usuário não preenche o campo nome
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

Feature: Cadastro e manutenção de episódios de podcast
As a usuário artista 
I want to criar, editar e excluir episódios de podcast
So that I can gerenciar meu conteúdo de forma eficiente

  Scenario: Criar episódio de podcast com dados válidos
    Given o usuário está na tela de criação de episódio de podcast
    When o usuário tenta criar um episódio com nome "Episódio 1", descrição "primeiro episódio", arquivo "ep1.mp3" válido
    Then data e duração são preenchidos automaticamente
    And retorna a mensagem de sucesso "Episódio criado com sucesso"
    And o episódio fica disponível para visualização pública


  Scenario: Criar episódio de podcast com título nulo
    Given o usuário está na tela de criação de episódio de podcast
    When o usuário tenta criar um episódio com nome "", descrição "segundo episódio", arquivo "ep2.mp3" válido
    Then data e duração são preenchidos automaticamente
    Then o sistema rejeita a requisição
    And retorna a mensagem de erro "O título do episódio é obrigatório"

  Scenario: Criar episódio de podcast com descrição nula
    Given o usuário está na tela de criação de episódio de podcast
    When o usuário tenta criar um episódio com nome "Episódio 3", descrição "", arquivo "ep3.mp3" válido
    Then data e duração são preenchidos automaticamente
    Then o sistema rejeita a requisição
    And retorna a mensagem de erro "A descrição do episódio é obrigatória"

  Scenario: Criar episódio de podcast com arquivo que não é áudio
    Given o usuário está na tela de criação de episódio de podcast
    When o usuário tenta criar um episódio com nome "Episódio 4", descrição "quarto episódio", arquivo "video.mp4" inválido
    Then data e duração são preenchidos automaticamente
    Then o sistema rejeita a requisição
    And retorna a mensagem de erro "Apenas arquivos de áudio são permitidos"

  Scenario: Programar episódio de podcast para data futura
    Given o usuário está na tela de criação de episódio de podcast
    When o usuário tenta criar um episódio com nome "Episódio 5", descrição "quinto episódio", arquivo "ep5.mp3" válido  
    And ele define a data "30/04/2027"
    Then a duração é preenchida automaticamente
    And retorna a mensagem de sucesso "Episódio agendado com sucesso"
    And o episódio fica agendado para a data informada

  Scenario: Editar episódio de podcast
    Given o usuário tem um episódio de podcast criado com título "Episódio 6" e descrição "sexto episódio"
    And o episódio atual possui um arquivo de áudio publicado
    When o usuário editar o título para "Episódio 6 Editado" e a descrição para "sexto episódio editado"
    And substituir o arquivo de áudio do episódio
    Then as alterações são salvas com sucesso
    And o arquivo antigo é permanentemente substituído
    And o sistema não mantém histórico de edições

  Scenario: Excluir episódio de podcast
    Given o usuário tem um episódio de podcast criado com título "Episódio 7" e descrição "sétimo episódio"
    When o usuário excluir o episódio
    Then o episódio é removido com sucesso

Feature: Funcionalidades gerais de podcasts
As a usuário
I want to interagir com os episódios de podcast, como reproduzir, visualizar acessos e baixar arquivos
So that I can consumir o conteúdo de áudio e acompanhar a popularidade dos episódios

  Scenario: Contabilizar acesso ao iniciar reprodução de episódio
    Given existe um episódio de podcast publicado chamado "Episódio Piloto" com total de acessos igual a 10
    When o usuário iniciar a reprodução do episódio "Episódio Piloto"
    Then o sistema contabiliza o acesso imediatamente
    And o total de acessos do episódio passa a ser 11

  Scenario: Exibir total de acessos para qualquer usuário
    Given existe um episódio de podcast publicado chamado "Bate-papo Aberto" com total de acessos igual a 25
    When qualquer usuário (logado ou não) acessar a página do episódio "Bate-papo Aberto"
    Then o sistema exibe publicamente o total de acessos igual a 25

  Scenario: Fazer download do arquivo bruto com usuário autenticado
    Given existe um episódio de podcast publicado chamado "Resumo da Semana"
    And o usuário está autenticado no sistema
    When o usuário tenta fazer o download do arquivo bruto do episódio "Resumo da Semana"
    Then o sistema permite o download do arquivo com sucesso

  Scenario: Bloquear download do arquivo bruto sem autenticação
    Given existe um episódio de podcast publicado chamado "Entrevista Especial"
    And o usuário não está autenticado no sistema
    When o usuário tenta fazer o download do arquivo bruto do episódio "Entrevista Especial"
    Then o sistema rejeita a requisição
    And retorna a mensagem de erro "É necessário estar logado para baixar este episódio"

# Recomendações e Busca por Filtros(Théo)
Feature: Funcionalidade básica da página inicial
As a usuário
I want to acessar a página inicial
So that I can acessar rapidamente as seções de histórico, Em alta, Minhas playlists, campo de busca e configurações
Cenário: Exibição da página inicial para usuário logado
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
When acesso a página "Inicial"
Then posso ver ao campo "Busca"
And posso ver a seção "Músicas em Alta"
And posso ver a seção "Podcasts em Alta"
And posso ver a seção "Histórico de músicas e podcasts reproduzidos"
And posso ver a seção "Minhas playlists"
And posso ver a seção "Configurações"
And vejo uma mensagem na parte de cima da tela: “Ola, LuisCardoso012!”

Cenário: Busca por nome com correlação integral que retorna um resultado
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
And estou na página "Busca"
And existe um item com título "Love will tear us apart" do tipo "Música" armazenado no sistema
When realizo uma busca pelo termo "Love will tear us apart"
Then o sistema deve exibir o item "Love will tear us apart" nos resultados
And eu continuo na página "Busca"

Feature: Implementação inicial de Busca com Filtros
As a usuário
I want to acessar a página de busca com filtros
So that I can acessar e reproduzir rapidamente as faixas que desejo consumir

Cenário: Busca por nome com correlação parcial que retorna um resultado
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
And estou na página "Busca"
And existe um item com título "Love will tear us apart" do tipo "Música" com 3000 reproduções armazenado no sistema
And existe um item com título "Love, Hate, Love" do tipo "Música" com 4000 reproduções armazenado no sistema
And existe um item com título "Bizarre Love Triangle" do tipo "Música" com 2000 reproduções armazenado no sistema
When realizo uma busca pelo termo "Love"
Then o sistema deve exibir o item "Love, Hate, Love" em primeiro lugar nos resultados
And o sistema deve exibir o item "Love will tear us apart" em segundo lugar nos resultados
And o sistema deve exibir o item "Bizarre Love Triangle" em terceiro lugar nos resultados
And eu continuo na página "Busca"


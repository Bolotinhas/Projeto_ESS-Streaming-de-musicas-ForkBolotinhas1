Feature: Gerenciamento de playlists
  Como usuario autenticado
  Quero criar e gerenciar playlists
  Para organizar e compartilhar minhas musicas favoritas

  Background:
    Given que o usuario "pedro" esta autenticado

  Scenario: Criar playlist com nome valido
    When o usuario cria uma playlist com nome "Treino" e categoria "Workout"
    Then a playlist "Treino" deve ser criada com sucesso
    And o usuario "pedro" deve aparecer como dono da playlist

  Scenario: Nao criar playlist com nome vazio
    When o usuario tenta criar uma playlist com nome vazio
    Then o sistema deve retornar erro de validacao "nome obrigatorio"

  Scenario: Atualizar nome e categoria da playlist
    Given que existe a playlist "Treino" do usuario "pedro"
    When o usuario atualiza o nome para "Treino Pesado" e categoria para "Gym"
    Then a playlist deve ser atualizada com os novos dados

  Scenario: Remover playlist existente
    Given que existe a playlist "Treino" do usuario "pedro"
    When o usuario remove a playlist "Treino"
    Then a playlist "Treino" nao deve mais existir

  Scenario: Exibir seguidores da playlist
    Given que a playlist "Treino" possui seguidores
    When o usuario consulta os seguidores da playlist "Treino"
    Then o sistema deve retornar a lista de seguidores da playlist

  Scenario: Gerar link de compartilhamento
    Given que existe a playlist "Treino" do usuario "pedro"
    When o usuario solicita o link de compartilhamento da playlist "Treino"
    Then o sistema deve gerar um link unico e publico

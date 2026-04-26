Feature: Manutenção de usuários
As a administrador
I want to gerenciar usuários
So that eu possa manter as informações atualizadas no sistema

Scenario: Inserir um novo usuário a partir da área de manutenção
Given eu estou logado como administrador
And eu estou na página de "Gerenciamento de usuários"
When eu clico na opção "Adicionar usuário"
And eu preencho os dados do usuário com
    |  login  |  nome  |        senha        |      email       |  tipo de conta  |
    |  abcabc | abc123 | Senhasupersecreta1! | abc123@gmail.com |     Ouvinte     |
And eu clico em "Salvar"
Then o usuário deve ser cadastrado com sucesso
And ele deve aparecer na lista de usuários

Scenario: Inserir um novo usuário artista a partir da área de manutenção
Given eu estou logado como administrador
And eu estou na página de "Gerenciamento de usuários"
When eu clico na opção "Adicionar usuário"
And eu preencho os dados do usuário com
    |  login  |  nome  |        senha        |      email       |  tipo de conta  |   Descricao   |
    |  abcabc | abc123 | Senhasupersecreta1! | abc123@gmail.com |     Artista     |     xxxxx     |
And eu clico em "Salvar"
Then o usuário deve ser cadastrado com sucesso
And o usuario deve aparecer na lista de usuários
And o usuario deve ser capaz de criar músicas

Scenario: Atualizar informações de um usuário existente
Given existe um usuário cadastrado no sistema
And eu estou logado como administrador
And eu estou na página de "Gerenciamento de usuários"
When eu seleciono um usuário da lista de usuários
And eu altero o campo "Nome" do usuário selecionado para "abcabca"
And eu clico em "Salvar"
Then as informações do usuário devem ser atualizadas com sucesso
And o campo que foi alterado deve ser exibido na lista de usuários

Scenario: Remover conta de um usuário existente
Given existe um usuário cadastrado no sistema com o Login "abcabc"
And eu estou logado como administrador
And eu estou na página de "Gerenciamento de usuários"
When eu clico na opção "Remover usuário"
And eu preencho o campo "Login" com "abcabc"
And eu clico em "Remover"
Then a conta do usuário com o Login "abcabc" não deve mais existir no sistema
And eu vejo uma mensagem na tela dizendo que o usuário foi removido
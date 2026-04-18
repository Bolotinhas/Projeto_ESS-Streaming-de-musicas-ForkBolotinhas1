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

Scenario: Atualizar informações de um usuário existente
Given existe um usuário cadastrado no sistema
And eu estou logado como administrador
And eu estou na página de "Gerenciamento de usuários"
When eu seleciono um usuário da lista de usuários
And eu altero o campo "E-mail" do usuário selecionado para "novoemail@gmail.com"
And eu clico em "Salvar"
Then as informações do usuário devem ser atualizadas com sucesso
And o campo que foi alterado deve ser exibido na lista de usuários
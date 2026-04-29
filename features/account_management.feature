
Scenario: Atualização de uma informação da conta
Given eu estou logado na minha conta
And a senha atual da minha conta é "Senhasupersecreta1!"
And eu estou na página de "Página inicial”
When eu clico no botão de "Atualizar conta"
And eu preencho o campo "Senha" com "Senhasupersecreta2!"
And eu clico em "Confirmar"
Then eu vejo uma mensagem na tela dizendo "A sua senha foi alterada com sucesso."
And eu devo conseguir autenticar com a nova senha

Scenario: Não permitir atualização com valor igual ao atual
Given eu estou logado na minha conta
And o Nome atual da minha conta é "abcabc"
And eu estou na página de "Página inicial”
When eu clico no botão de "Atualizar conta"
And eu preencho o campo "Nome" com "abcabc"
And eu clico em "Confirmar"
Then eu vejo uma mensagem na tela dizendo "Preencha o campo com um valor que não seja o atual."
And o nome da minha conta não é alterado
And o campo "Nome" deve estar destacado como inválido

Scenario: Atualização de várias informações da conta
Given eu estou logado na minha conta
And as informações atuais da minha conta são
    |  nome  |        senha        |  tipo de conta  |
    | abc123 | Senhasupersecreta1! |     Ouvinte     |
And eu estou na página de "Página inicial”
When eu clico no botão de "Atualizar conta"
And eu preencho os campos com
    |  nome  |        senha        |  tipo de conta  |
    | abc124 | Senhasupersecreta2! |     Artista     |
And eu clico em "Confirmar"
Then eu vejo uma mensagem na tela dizendo "As informações da sua conta foram atualizadas com sucesso."
And meu Nome deve ser "abc124"
And meu tipo de conta deve ser alterado para "Artista"
And eu devo conseguir autenticar com a nova senha

Scenario: Atualização de informação com um valor inválido
Given eu estou logado na minha conta
And a senha atual da minha conta é "Senhasupersecreta1!"
And eu estou na página de "Página inicial”
When eu clico no botão de "Atualizar conta"
And eu preencho o campo "Senha" com "senha"
And eu clico em "Confirmar"
Then eu vejo uma mensagem na tela dizendo "Preencha os campos de atualização com dados válidos."
And a senha da minha conta não é alterada
And o campo "Senha" deve estar destacado como inválido

Scenario: Atualização de informação da conta sem preencher valores
Given eu estou logado na minha conta
And as informações atuais da minha conta são
    |  nome  |        senha        |  tipo de conta  |
    | abc123 | Senhasupersecreta1! |     Ouvinte     |
And eu estou na página de "Página inicial”
When eu clico no botão de "Atualizar conta"
And eu não preencho os campos de atualização
And eu clico em "Confirmar"
Then eu vejo uma mensagem na tela dizendo "Preencha os campos de atualização com dados válidos."
And nenhuma informação da minha conta é alterada

Scenario: Desativar conta do streaming de música
Given eu estou logado na minha conta
And a senha atual da minha conta é "Senhasupersecreta1!"
And eu estou na página de "Página inicial"
When eu clico no botão de "Desativar conta"
And eu preencho o campo de "Senha" com "Senhasupersecreta1!"
And eu clico no botão de "Confirmar"
Then eu vejo uma mensagem na tela dizendo "Sua conta foi desativada com sucesso. Para ativá-la novamente, basta realizar o login."
And minha conta deve estar desativada até eu fizer o Login

Scenario: Erro ao não inserir a senha correta para desativar conta
Given eu estou logado na minha conta
And a senha atual da minha conta é "Senhasupersecreta1!"
And eu estou na página de "Página inicial"
When eu clico no botão de "Desativar conta"
And eu preencho o campo de "Senha" com "Senha!"
And eu clico no botão de "Confirmar"
Then eu vejo uma mensagem na tela dizendo "Insira a senha correta para confirmar o desligamento."
And a minha conta deve continuar ativa

Scenario: Usuário cancela a desativação da conta
Given eu estou logado na minha conta
And eu estou na página de "Página inicial"
When eu clico no botão de "Desativar conta"
And eu clico no botão de "Cancelar"
Then eu retorno para a "Página inicial"
And minha conta não é desligada do sistema

Scenario: Remover a conta do serviço de streaming de música
Given eu estou logado na minha conta
And a senha atual da minha conta é "Senhasupersecreta1!"
And eu estou na página de "Página inicial"
When eu clico no botão de "Remover conta"
And eu preencho o campo de "Senha" com "Senhasupersecreta1!"
And eu clico no botão de "Confirmar"
Then eu vejo uma mensagem na tela dizendo "Sua conta foi removida do sistema com sucesso."
And minha conta não deve mais existir no sistema


Feature: Manutenção de conta
As a usuário
I want to ser capaz de atualizar ou desligar minha conta
So that eu possa gerenciar a minha conta

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
And meu tipo de conta deve ser "Artista"
And eu devo conseguir autenticar com a nova senha
Feature: Manutenção de usuários
As a administrador
I want to gerenciar usuários
So that eu possa manter as informações atualizadas no sistema

Scenario: Atualizar informações de um usuário existente
Given o sistema possui uma conta cadastrada com os dados:
    |  login   |  name  |     password        |      email       |  tipodeconta  |
    |  admin   | Danilo |     admin123        | danilo@gmail.com |     ADMIN     |
And o usuário "admin" está autenticado no sistema
And o sistema possui uma conta cadastrada com os dados:
    |  login   |  name  |     password        |      email       |  tipodeconta  |
    |  Carlos1 | Carlos | Senhasupersecreta1! | carlos@gmail.com |   OUVINTE     |
When o sistema recebe uma solicitação para atualizar o usuário "Carlos1" com os dados:
    |     name    |     password        |
    |   Roberto   | Senhasupersecreta2! |
Then o sistema retorna a mensagem "Dados atualizados com sucesso."
And o usuário de login "Carlos1" é armazenado corretamente pelo sistema com os campos:
    |     name    |     password        |
    |   Roberto   | Senhasupersecreta2! |

Scenario: Remover conta de um usuário existente
Given o sistema possui uma conta cadastrada com os dados:
    |  login   |  name  |     password        |      email       |  tipodeconta  |
    |  admin   | Danilo |     admin123        | danilo@gmail.com |     ADMIN     |
And o usuário "admin" está autenticado no sistema
And o sistema possui uma conta cadastrada com os dados:
    |  login   |  name  |     password        |      email       |  tipodeconta  |
    |  Carlos1 | Carlos | Senhasupersecreta1! | carlos@gmail.com |   OUVINTE     |
When o sistema recebe uma solicitação para remover o usuário "Carlos1" com os dados:
    |     password        |
    | Senhasupersecreta1! |
Then o sistema retorna a mensagem "A conta foi removida do sistema com sucesso."
And o usuário de login "Carlos1" não deve mais existir no sistema
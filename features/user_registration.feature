Feature: Cadastro de usuários
As a usuário visitante
I want to cadastrar no serviço de streaming de música
So that eu possa ouvir músicas e podcasts de acordo com as playlists que eu criar

Scenario: Cadastro realizado com sucesso
Given eu estou na página de “Cadastro de usuário”
And não há nenhum dado preenchido
When eu preencho o campo “Nome” com “abc123”
And eu preencho o campo “E-mail” com “abc123@gmail.com”
And eu preencho o campo “Senha” com “Senhasupersecreta1!”
And eu preencho o campo “Login” com “abcabc”
And eu preencho o campo “Tipo de conta” com “Ouvinte”
And eu clico na opção “Finalizar cadastro”
Then a minha conta é criada com sucesso
And eu sou redirecionado para a “Página inicial”
And eu devo ver a mensagem “Seja bem-vindo ao serviço de streaming de música”

Scenario: Tentativa de cadastro com um Login já existente
Given existe uma conta já cadastrada com o Login “abcabc”
And eu estou na página de “Cadastro de usuário”
And não há nenhum dado preenchido
When eu preencho o campo “Nome” com “abc123”
And eu preencho o campo “E-mail” com “abc123@gmail.com”
And eu preencho o campo “Senha” com “Senhasupersecreta1!”
And eu preencho o campo “Login” com “abcabc”
And eu preencho o campo “Tipo de conta” com “Ouvinte”
And eu clico na opção “Finalizar cadastro”
Then eu vejo a mensagem “Já existe uma conta que usa esse Login”
And eu continuo na página de “Cadastro de usuário”

Scenario: Erro exibido quando a senha inserida é muito curta
Given eu estou na página de “Cadastro de usuário”
And não há nenhum dado preenchido
When eu preencho o campo “Nome” com “abc123”
And eu preencho o campo “E-mail” com “abc123@gmail.com”
And eu preencho o campo “Senha” com “senha”
And eu preencho o campo “Login” com “abcabc”
And eu preencho o campo “Tipo de conta” com “Ouvinte”
And eu clico na opção “Finalizar cadastro”
Then eu vejo uma mensagem na tela dizendo “A senha deve ter pelo menos 8 caracteres”
And eu continuo na página de “Cadastro de usuário”
And o campo "Senha" deve estar destacado como inválido

Scenario: Erro ao não preencher todos os campos para o cadastro
Given eu estou na página de “Cadastro de usuário”
And não há nenhum dado preenchido
When eu não preencho o campo de “Nome”
And eu não preencho o campo de “E-mail”
And eu não preencho o campo de “Senha”
And eu não preencho o campo de “Login”
And eu não preencho o campo de “Tipo de conta”
And eu clico na opção “Finalizar cadastro”
Then eu vejo uma mensagem na tela dizendo “Todos os campos devem ser preenchidos para o cadastro ser finalizado”
And eu continuo na página de “Cadastro de usuário”

Scenario: Erro ao preencher um campo acima do limite de caracteres
Given eu estou na página de “Cadastro de usuário”
And não há nenhum dado preenchido
When eu preencho o campo “Nome” com “abc123”
And eu preencho o campo “E-mail” com “abc123@gmail.com”
And eu preencho o campo “Senha” com “Senhasupersecreta1!!!!!!!!”
And eu preencho o campo “Login” com “abcabc”
And eu preencho o campo “Tipo de conta” com “Ouvinte”
And eu clico na opção “Finalizar cadastro”
Then eu vejo uma mensagem na tela dizendo “Voce ultrapassou o limite de caracteres no campo Senha"
And eu continuo na página de “Cadastro de usuário”
And o campo "Senha" deve estar destacado como inválido
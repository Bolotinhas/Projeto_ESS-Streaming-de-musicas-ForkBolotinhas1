Feature: Cadastro de usuários
As a usuário visitante
I want to cadastrar no serviço de streaming de música
So that eu possa ouvir músicas e podcasts de acordo com as playlists que eu criar

Scenario: Cadastro realizado com sucesso
Given eu estou na página de “Cadastro de usuário”
And não há nenhum dado preenchido
When eu preencho os campos com
    |  login  |  nome  |        senha        |      email       |  tipo de conta  |
    |  abcabc | abc123 | Senhasupersecreta1! | abc123@gmail.com |     Ouvinte     |
And eu clico na opção “Finalizar cadastro”
Then a minha conta é criada com sucesso
And eu sou redirecionado para a “Página inicial”
And eu devo ver a mensagem “Seja bem-vindo ao serviço de streaming de música”

Scenario: Tentativa de cadastro com um Login já existente
Given existe uma conta já cadastrada com o Login “Carlo1”
And eu estou na página de cadastro
When eu preencho os campos com
    |  login  |   nome  |        senha        |        email         |  tipo de conta  |
    |  Carlo1 |  Carlos | Senhasupersecreta1! | Carlinhos1@gmail.com |     Ouvinte     |
And eu tento finalizar o cadastro
Then eu vejo uma mensagem na tela de “Já existe uma conta com esse Login. Use outro Login.”
And eu continuo na página de cadastro
And o campo "Login" deve estar destacado como inválido
And a conta com Login "Carlo1" continua cadastrada na plataforma

Scenario: Erro exibido quando a senha inserida é muito curta
Given eu estou na página de “Cadastro de usuário”
And não há nenhum dado preenchido
When eu preencho os campos com
    |  login  |  nome  |  senha   |      email       |  tipo de conta  |
    |  abcabc | abc123 |  senha   | abc123@gmail.com |     Ouvinte     |
And eu clico na opção “Finalizar cadastro”
Then eu vejo uma mensagem na tela dizendo “A senha deve ter pelo menos 8 caracteres”
And eu continuo na página de “Cadastro de usuário”
And o campo "Senha" deve estar destacado como inválido

Scenario: Erro ao não preencher todos os campos obrigatórios para o cadastro
Given eu estou na página de “Cadastro de usuário”
And não há nenhum dado preenchido
When eu não preencho o campo de “Nome”
And eu não preencho o campo de “E-mail”
And eu não preencho o campo de “Senha”
And eu não preencho o campo de “Login”
And eu não preencho o campo de “Tipo de conta”
And eu clico na opção “Finalizar cadastro”
Then eu vejo uma mensagem na tela dizendo “Todos os campos obrigatórios devem ser preenchidos para o cadastro ser finalizado”
And eu continuo na página de “Cadastro de usuário”
And os campos obrigatórios não preenchidos devem estar destacados como inválidos

Scenario: Erro ao preencher um campo acima do limite de caracteres
Given eu estou na página de “Cadastro de usuário”
And não há nenhum dado preenchido
When eu preencho os campos com
    |  login  |  nome  |           senha            |      email       |  tipo de conta  |
    |  abcabc | abc123 | Senhasupersecreta1!!!!!!!! | abc123@gmail.com |     Ouvinte     |
And eu clico na opção “Finalizar cadastro”
Then eu vejo uma mensagem na tela dizendo "Voce ultrapassou o limite de caracteres no campo Senha"
And eu continuo na página de “Cadastro de usuário”
And o campo "Senha" deve estar destacado como inválido

Scenario: Cadastro de um usuário artista com sucesso
Given eu estou na página de “Cadastro de usuário”
And não há nenhum dado preenchido
When eu preencho os campos com
    |  login  |  nome  |        senha        |      email       |  tipo de conta  |   Descrição  |
    |  abcabc | abc123 | Senhasupersecreta1! | abc123@gmail.com |     Artista     |     xxxxx    |
And eu clico na opção "Finalizar cadastro"
Then a minha conta de artista é criada com sucesso
And eu sou redirecionado para a “Página inicial”
And eu devo ver a mensagem “Seja bem-vindo ao serviço de streaming de música. Estamos ansiosos para ouvir seus hits musicais”
And eu devo ser capaz de criar músicas ao clicar na opção de "Adicionar músicas"

Scenario: Cadastro de um usuário podcaster com sucesso
Given eu estou na página de “Cadastro de usuário”
And não há nenhum dado preenchido
When eu preencho os campos com
    |  login  |  nome  |        senha        |      email       |  tipo de conta  |   Descrição  |
    |  abcabc | abc123 | Senhasupersecreta1! | abc123@gmail.com |     Podcast     |     xxxxx    |
And eu clico na opção "Finalizar cadastro"
Then a minha conta de podcaster é criada com sucesso
And eu sou redirecionado para a “Página inicial”
And eu devo ver a mensagem “Seja bem-vindo ao serviço de streaming de música. Estamos ansiosos para ouvir seus podcasts”
And eu devo ser capaz de criar podcasts ao clicar na opção de "Adicionar podcast"

Scenario: Usuário insere um e-mail não plausível
Given eu estou na página de "Cadastro de usuário"
And não há nenhum dado preenchido
When eu preencho os campos com
    |  login  |  nome  |        senha        |      email       |  tipo de conta  |
    |  abcabc | abc123 | Senhasupersecreta1! | abc123@ggggg.com |     Ouvinte     |
And eu clico na opção "Finalizar cadastro"
Then eu vejo uma mensagem na tela dizendo "Voce deve inserir um e-mail válido para realizar o cadastro"
And eu continuo na página de “Cadastro de usuário”
And o campo "Email" deve estar destacado como inválido
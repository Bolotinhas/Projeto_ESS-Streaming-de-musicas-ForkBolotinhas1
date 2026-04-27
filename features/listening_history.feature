Feature: Exibir histórico de músicas e podcasts ouvidos
As a usuário
I want to ver meu histórico de músicas e podcasts
So that eu possa rever as músicas e podcasts que eu escutei

Scenario: Visualizar histórico unificado
Given eu estou logado na minha conta
And eu estou na página de "Página inicial"
When eu clico na opção de "Visualizar histórico"
Then eu devo ver na tela músicas e podcasts no mesmo histórico
And os itens devem estar ordenados do mais recente para o mais antigo

Scenario: Visualizar apenas o que for filtrado no histórico
Given eu estou logado na minha conta
And existem músicas e podcasts no meu histórico
And eu estou na página de "Página inicial"
When eu clico na opção de "Visualizar histórico"
And eu filtro o histórico por "Músicas"
Then eu devo ver apenas itens do tipo "Músicas"
And os itens devem estar ordenados do mais recente para o mais antigo

Scenario: Alternar entre visualização unificada e separada
Given eu estou logado na minha conta
And existem músicas e podcasts no meu histórico
And eu estou na página de "Página inicial"
When eu clico na opção de "Visualizar histórico"
And eu filtro o histórico por "Músicas"
And eu removo o filtro
Then eu devo ver músicas e podcasts no histórico
And os itens devem estar ordenados do mais recente para o mais antigo
Feature: Criação de link para playlist
As a usuário
I want to ser capaz de criar links de uma playlist
So that eu consiga compartilhar uma playlist personalizada

Scenario: Criação com sucesso do link de uma playlist pública
Given eu estou logado como "Usuário" com nome "arthur123"
And estou na página da playlist "Músicas de Rock", com status "pública"
When eu seleciono compartilhar playlist
Then aparece uma mensagem com o link "https://.../playlist/~hash-do-link"

Scenario: Criação com erro do link de uma playlist privada
Given eu estou logado como "Usuário" com nome "arthur123"
And estou na página da playlist "Músicas de Rock", com status "privada"
When eu seleciono compartilhar playlist
Then aparece uma mensagem de erro "Essa playlist é privada, não é possível compartilhar."

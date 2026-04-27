Cenário: Exibição da página inicial para usuário logado
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
When acesso a página inicial
Then posso ver o campo de busca
And posso ver a seção "Músicas em Alta"
And posso ver a seção "Podcasts em Alta"
And posso ver meu histórico de músicas ouvidas recentemente
And posso ver minhas playlists
And vejo uma mensagem na parte de cima da tela: “Ola, LuisCardoso012!”

Cenário: Exibição da página inicial para usuário nao logado
Given nao estou logado na plataforma
When acesso a página inicial
Then posso ver o campo de busca
And posso ver a seção "Músicas em Alta"
And posso ver a seção "Podcasts em Alta"
And nao posso ver meu histórico de músicas ouvidas recentemente
And nao posso ver minhas playlists
And vejo uma mensagem na parte de cima da tela: “Faça login”

Cenário: Busca que não retorna resultados // implementacao do cenario
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
And estou na página de busca
And nao existe nenhum item no sistema que tenha título “MusicaPesada123” ou semelhante 
When realizo uma busca pelo termo “MusicaPesada123”
Then o sistema deve exibir um placeholder informando que nenhum resultado foi encontrado 
And nenhum conteúdo deve ser listado
And Eu continuo na página de busca

Cenário: Busca com filtro de gênero inexistente
Given estou na página de busca
When pesquiso por uma música sem preencher o campo de busca
And aplico o filtro de gênero "GeneroInexistente123"
Then devo ver um placeholder informando que não houveram resultados
And o sistema não deve exibir nenhum item na lista de resultados
And os stakeholders querem um passo novo ao executar a ação

Cenário: Busca por nome que retorna resultado
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
And estou na página de busca
And existe um item com título "MusicaBonita123"
When realizo uma busca pelo termo "MusicaBonita123"
Then o sistema deve exibir a música "MusicaBonita123" nos resultados
And os resultados devem estar ordenados de forma descrescente priorizando correlações exatas e depois parciais
And músicas com mesma correlação devem ser ordenadas pelo total de reproduções
And nenhuma música sem correlação com "MúsicaBonita123" deve ser exibida

Cenário: Busca por músicas utilizando filtro de ano de lançamento com resultados
Given estou logado como "Usuário" com login "LuisCardoso012" e senha "1234"
And existe no sistema músicas do ano "1994"
And estou na página de busca
When não preencho o campo de nome
And aplico o filtro de ano de lançamento "1994"
Then o sistema deve exibir as 10 músicas com maior número de reproduções do ano "1994"
And os resultados devem estar ordenados de forma descrescente pelo total de reproduções
And nenhuma música com ano de lançamento diferente de "1994" deve ser exibida

Cenário: Exibição do histórico de filtros ao abrir a busca
Given estou logado como “Usuário” com login “LuisCardoso012” e senha “1234”
And o sistema possui os filtros “MPB”, “Djavan” armazenados como filtros utilizados na última busca feita pela conta
When acesso a tela de busca sem realizar mais nenhuma ação
Then o sistema deve exibir os filtros “MPB”, “Djavan” como últimos filtros aplicados
Cenário: Busca por música utilizando apenas filtro de gênero com resultados

Cenário: Busca por músicas utilizando filtro de gênero com resultados
Given estou logado como "Usuário" com login "LuisCardoso012" e senha "1234"
And existe no sistema músicas do gênero "MPB"
And estou na página de busca
When não preencho o campo de nome
And aplico o filtro de gênero "MPB"
Then o sistema deve exibir as 10 músicas com maior número de reproduções do gênero "MPB" nos resultados
And os resultados devem estar ordenados de forma decrescente pelo total de reproduções
And nenhuma música de gênero diferente de "MPB" deve ser listada

Cenário: Busca por música utilizando filtro de gênero e campo de nome com resultados
Given estou logado como "Usuário" com login "LuisCardoso012" e senha "1234"
And existe no sistema a música "Se.." do gênero "MPB"
And estou na página de busca
When pesquiso pelo termo "Se.."
And aplico o filtro de gênero "MPB"
Then o sistema deve exibir a música "Se.." nos resultados
And os resultados devem estar ordenados de forma decrescente pelo total de reproduções
And nenhuma música de gênero diferente de "MPB" deve ser listada
And aqui esta a modificacao no ultimo cenario!!



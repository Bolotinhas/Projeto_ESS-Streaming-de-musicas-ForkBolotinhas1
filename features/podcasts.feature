Feature: Processamento de Áudio
Scenario: Upload de arquivo com formato inválido
Given que o serviço de upload recebeu um arquivo "aula_01.pdf"
When o validador de formato processar o arquivo
Then o sistema deve rejeitar o arquivo
And retornar o erro "Formato de arquivo não suportado. Utilize apenas MP3 ou WAV."

Feature: Download de Episódio
Scenario: Tentativa de download por usuário não autenticado
Given que um visitante não logado acessa a página do episódio "Episódio 1"
When o visitante clica no botão de "Baixar arquivo"
Then o sistema deve bloquear o download
And exibir a mensagem de erro "É necessário estar logado para baixar o podcast."

Feature: Upload de Conteúdo
Scenario: Tentativa de upload de arquivo contendo vídeo
Given que um criador tenta fazer o upload do arquivo "videocast.mp4"
When o sistema valida o tipo de mídia do arquivo
Then o upload deve ser rejeitado
And o sistema deve exibir a mensagem de erro "Apenas arquivos de áudio são permitidos."

Feature: Métricas de Popularidade
Scenario: Visualização de acessos totais por usuários externos
Given que o episódio "Engenharia de Software 101" possui 500 acessos
When um visitante anônimo acessa a página do podcast
Then o sistema deve exibir o contador com "500 acessos"
And essa informação deve estar disponível publicamente

Feature: Gerenciamento de Episódios
Scenario: Atualização de arquivo de áudio sem manter histórico
Given que o criador tem um episódio "Episódio 1" publicado
When ele faz o upload de um novo arquivo de áudio para atualizar o "Episódio 1"
Then o sistema deve substituir o arquivo anterior permanentemente
And não deve manter o histórico da versão antiga do áudio

Scenario: Definir fuso horario
Given que o criador quer agendar um podcast
Then o sistema deve permitir escolher o fuso horario
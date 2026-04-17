Feature: Processamento de Áudio
Scenario: Upload de arquivo com formato inválido
Given que o serviço de upload recebeu um arquivo "aula_01.pdf"
When o validador de formato processar o arquivo
Then o sistema deve rejeitar o arquivo
And retornar o erro "Formato de arquivo não suportado. Utilize apenas MP3 ou WAV."

Feature: Teste
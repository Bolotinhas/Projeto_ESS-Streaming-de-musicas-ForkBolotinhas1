Feature Validar dados ao criar playlist
  
  Scenario nome de playlist maior que o limite
    Given o usuário está na tela de criação de playlist
    And o nome da playlist foi preencido com o valor "ESSA É UMA STRING COM MAIS DE 50 CARACTERES AAAAAAA"
    When o usuário pressionar em criar playlist
    Then o sistema rejeita a requisição
    And retorna uma mensagem de erro de validação

  Scenario nome de playlist nulo
    Given o usuário está na tela de criação de playlist
    And o nome da playlist foi preencido com o valor ""
    When o usuário pressionar em criar playlist
    Then o sistema rejeita a requisição
    And retorna uma mensagem de erro de validação
  
  Scenario nome de playlist é válido
    Given o usuário está na tela de criação de playlist
    And o nome da playlist foi preencido com o valor "UM NOME LEGAL"
    When o usuário pressionar em criar playlist
    Then a playlist é criada com sucesso
    And data e dono são preenchidos automaticamente # ISSO DE (data, dono) É UMA VALIDAÇÃO A MAIS. TU PODERIA QUEBRAR ISSO EM OUTRO CENÁRIO SE QUISER, MAS DO JEITO QUE TU FEZ TAMBÉM TA CERTO
  
  Scenario controle de acesso à playlist privada
    Given o usuário "fulano" seta a playlist "minha playlist" como privada
    When o usuário "fulano" acessar a playslist "minha playlsit"
    Then o acesso é permitido

  Scenario controle de acesso à playlist privada
    Given o usuário "fulano" seta a playlist "minha playlist" como privada
    When o usuário "siclano" acessar a playslist "minha playlsit"
    Then o acesso é negado
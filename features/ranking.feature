# language: pt

Funcionalidade: Gerenciar o ranking
  * A API não deve aceitar cadastros de resultados se a competição já estiver encerrada.
  * A API pode retornar o ranking/resultado parcial, caso a disputa ainda não estiver encerrada.

  Cenário: Não aceitar cadastros de resultados se a competição estiver encerrada
    Dado que envio um POST para /competitions com os dados:
    """
      { "competition": { "sport": "corrida", "athletes": [ { "name": "MO FARAH", "code": "171" } ] } }
    """
    Dado que envio um DELETE para /competitions/1
    Então devo obter o status 200
    Dado que envio um PUT para /competitions/1 com os dados:
    """
      { "competition": { "results": [ { "athlete_code": "171", "score": "273090" } ] } }
    """
    Então devo obter o status 403


  Cenário: Retornar o ranking/resultado parcial, caso a disputa ainda não estiver encerrada
    Dado que envio um POST para /competitions com os dados:
    """
      { "competition": { "sport": "corrida", "athletes": [ { "name": "MO FARAH", "code": "171" } ] } }
    """
    E envio um PUT para /competitions/1 com os dados:
    """
      { "competition": { "results": [ { "athlete_code": "171", "score": "273090" } ] } }
    """
    Quando envio um GET para /competitions/1
    Então devo obter os dados:
    """
      {
        "status": "in_progress",
        "ranking": [ { "rank": 1, "athlete": 171, "score": 273090 } ]
      }
    """
    Dado que envio um DELETE para /competitions/1
    Então devo obter o status 200
    Quando envio um GET para /competitions/1
    Então devo obter os dados:
    """
      {
        "status": "finished",
        "ranking": [ { "rank": 1, "athlete": 171, "score": 273090 } ]
      }
    """


  Cenário: Ranking
    Dado que envio um POST para /competitions com os dados:
    """
      { "competition": { "sport": "corrida",
        "athletes": [ { "name": "fox", "code": "888" },
                      { "name": "cat", "code": "777" },
                      { "name": "dog", "code": "666" } ] } }
    """
    E envio um PUT para /competitions/1 com os dados:
    """
      { "competition": { "results": [ { "athlete_code": "666", "score": "333333" },
                                      { "athlete_code": "777", "score": "999999" },
                                      { "athlete_code": "888", "score": "422222" } ] } }
    """
    Quando envio um GET para /competitions/1
    Então devo obter os dados:
    """
      {
        "status": "in_progress",
        "ranking": [
          { "rank": 1, "athlete": 666, "score": 333333 },
          { "rank": 2, "athlete": 888, "score": 422222 },
          { "rank": 3, "athlete": 777, "score": 999999 }
        ]
      }
    """

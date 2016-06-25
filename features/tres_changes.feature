# language: pt

Funcionalidade: Três chances
  Na competição de lançamento de dardos, cada atleta tem 3 chances,
  e o resultado da competição deverá levar em conta o lançamento mais distante de cada atleta.


  Contexto:
    Dado que envio um POST para /competitions com os dados:
    """
      { "competition": { "sport": "dardo", "athletes": [{ "name": "fox", "code": "444" }] } }
    """
    E um PUT para /competitions/1 com os dados:
    """
    {
      "competition": { "results": [ { "athlete_code": "444", "score": "111111" },
                                    { "athlete_code": "444", "score": "333333" },
                                    { "athlete_code": "444", "score": "222222" } ] } }
    """
    Então devo obter o status 204


  Cenário: Melhor resultado de vários
    Quando envio um GET para /competitions/1
    Então devo obter os dados:
    """
      {
        "status": "in_progress",
        "ranking": [ { "rank": 1, "athlete": 444, "score": 333333 } ]
      }
    """

  Cenário: Limite de changes
    Quando envio um PUT para /competitions/1 com os dados:
    """
      { "competition": { "results": [ { "athlete_code": "444", "score": "444444" } ] } }
    """
    Então devo obter o status 400

# language: pt

Funcionalidade: Gerenciar a competição

  Cenário: Cadastrar
    Quando envio um POST para /competitions com os dados:
    """
    {
      "competition": {
        "sport": "corrida",
        "athletes": [
          { "name": "Jan", "code": "171" },
          { "name": "Andreas", "code": "042" }
        ]
      }
    }
    """
    Então devo obter o status 201
    E obter os dados:
    """
      {
        "id": 1,
        "athletes": [
          { "Jan": "171" },
          { "Andreas": "042" }
        ]
      }
    """

  Cenário: Finalizar
    Dado que envio um POST para /competitions com os dados:
    """
      { "competition": { "sport": "corrida", "athletes": [ { "name": "Jan", "code": "1" } ] }}
    """
    Quando envio um DELETE para /competitions/1
    Então devo obter o status 200

  Cenário: Adicionar resultados
    Dado que envio um POST para /competitions com os dados:
    """
      { "competition": { "sport": "running", "chances": 3, "athletes": [{ "name": "Jan", "code": "171" }] }}
    """
    Dado que envio um PUT para /competitions/1 com os dados:
    """
    {
      "competition": {
        "results": [
          { "athlete_code": "171", "score": "273090" }
        ]
      }
    }
    """
    Então devo obter o status 204

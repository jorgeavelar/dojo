# Dojo
---

A ideia para esse Dojo é construir uma "lib" do tipo HealthCheck para monitorar serviços e/ou operações

### Pré-requisito
- Ruby
- RSpec
- Ruby on Rails

A lib deve conter os seguintes os seguintes métodos:
- check - Recebe um bloco que deverá ser avaliado e retorna status e tempo decorrido
- heart_beat - retorna o próprio status da api
- results - listas todas os servicos e seus respectivos status e tempo decorrido
- E também deve-se desenvolver métodos customizados (sum e div) que atenda as specs dos testes


## Health Check
`http://localhost:3000/monitoring/health_check`

```
{
 "entries": {
   "sum": {
     "status": "ok",
     "elapsed_time": 0.000004154
    },
    "div": {
      "status": "error",
      "message": "ZeroDivisionError - divided by 0",
      "elapsed_time": 0.00004195
    }
  },
  "elapsed_time": 0.000096323
}
```


## Heart Beat

`http://localhost:3000/monitoring/heart_beat`

```
{
  "status": "ok"
}
```

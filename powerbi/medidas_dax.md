# Medidas DAX – Análise de Risco de AVC

Todas as medidas abaixo foram criadas na tabela `'public pacientes_avc'`.

---

## 1. Total de Pacientes

Conta o número total de registros (pacientes) na base.

```DAX

  Total de Pacientes =
  COUNTROWS ( 'public pacientes_avc' )

```

## 2. Pacientes que já tiveram AVC

Conta quantos pacientes têm a coluna [avc] igual a 1.

```DAX

  Pacientes que já tiveram AVC =
  CALCULATE (
      COUNTROWS ( 'public pacientes_avc' ),
      'public pacientes_avc'[avc] = 1
  )

```

## 3. Taxa AVC

Calcula a proporção de pacientes que já tiveram AVC em relação ao total de pacientes.

```DAX

    Taxa AVC =
    DIVIDE ( [Pacientes que já tiveram AVC], [Total de Pacientes] )

```

Observação: no Power BI, esta medida foi formatada como Porcentagem com 1 ou 2 casas decimais.



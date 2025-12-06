# Análise de Risco de AVC

Este repositório contém o projeto de conclusão de curso em Análise e Desenvolvimento de Sistemas,
focado em analisar fatores de risco associados à ocorrência de AVC (Acidente Vascular Cerebral).

## Tecnologias utilizadas

- PostgreSQL (armazenamento de dados)
- pgAdmin (carga dos dados a partir de arquivo CSV)
- Power BI Desktop (tratamento, análise e visualização)
- Power Query (limpeza e transformação dos dados dentro do Power BI)

## Estrutura do repositório

- `dados/` – arquivos de dados ( arquivo CSV e documentação da fonte)
- `sql/` – scripts SQL para criação do banco e da tabela no PostgreSQL
- `powerbi/` – arquivo .pbix com os dashboards e capturas de tela
- `docs/` – modelo de dados (DER) e documentação da carga via pgAdmin

## Como reproduzir o projeto

1. Criar o banco e a tabela no PostgreSQL usando os scripts em `sql/`.
2. Importar o arquivo CSV para a tabela `pacientes_avc` via pgAdmin
   (passo a passo em `docs/carga_dados_pgadmin.md`).
3. Abrir o arquivo `powerbi/analise_avc.pbix` no Power BI Desktop.
4. Atualizar a conexão com o servidor PostgreSQL local, se necessário.

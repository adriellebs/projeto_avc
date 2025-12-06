# Inserindo dados no PostgreSQL utilizando arquivo csv via pgAdmin

1. Criar o banco `projeto_avc` executando o script disponível em `sql/01_create_db.sql`.
2. Criar a tabela `pacientes_avc` com o script `sql/02_create_tb.sql`.
3. Abrir o pgAdmin, conectar ao servidor e selecionar o banco `projeto_avc`.
4. Em `Object Explorer`, acessar: `localhost` (ou nome do servidor onde o
  banco de dados foi criado) → `Databases` → `projeto_avc` → `Schemas` →
  `public` → `Tables` → Clicar com o botão direito em `pacientes_avc` →
  Selecionar `Import/Export Data`.
6. Na guia "General":
   - Filename selecionar o arquivo CSV do dataset.
   - Format: CSV
7. Na guia "Options":
   - Header: marcado  
   - Delimiter: `,`
9. Na guia "Columns":
   - Conferir o mapeamento de colunas e confirmar (`OK`).
11. Validar com a consulta:
   ```sql
   SELECT COUNT(*) FROM pacientes_avc;
```
Que deve retornar 5110. 

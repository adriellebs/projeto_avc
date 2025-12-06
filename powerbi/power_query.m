// Conecta ao servidor PostgreSQL local e ao banco 'projeto_avc'

let
    Fonte = PostgreSQL.Database("localhost", "projeto_avc"),

// Seleciona a tabela public.pacientes_avc
  public_pacientes_avc = Fonte{[Schema="public",Item="pacientes_avc"]}[Data],

// Renomeia colunas técnicas do banco
  #"Colunas Renomeadas" = Table.RenameColumns(
      public_pacientes_avc,
        {
            {"status_fumante", "Status Fumante"},
            {"tipo_residencia", "Tipo de Residência"},
            {"tipo_trabalho",  "Tipo de Trabalho"},
            {"casado",         "Casado"},
            {"idade",          "Idade"},
            {"genero",         "Gênero"}
        }
  ),

// Cria coluna de Faixa Etária a partir da coluna Idade
  #"Coluna Condicional Adicionada" = Table.AddColumn(
        #"Colunas Renomeadas",
        "Faixa Etária",
        each
            if [Idade] < 18 then "Menos de 18"
            else if [Idade] <= 40 then "Entre 18 e 40"
            else if [Idade] <= 60 then "Entre 41 e 60"
            else if [Idade] > 60 then "Mais de 60"
            else null
 ),

// Corrige acentuação do tipo de trabalho
  #"Valor Substituído4" = Table.ReplaceValue(
        #"Coluna Condicional Adicionada",
        "Autonomo",
        "Autônomo",
        Replacer.ReplaceText,
        {"Tipo de Trabalho"}
  ),

// Troca "N/A" de IMC por vazio (que vira null ao converter para número)
  #"Valor Substituído5" = Table.ReplaceValue(
        #"Valor Substituído4",
        "N/A",
        "",
        Replacer.ReplaceText,
        {"imc"}
  ),

// Converte IMC para número 
  #"Tipo Alterado1" = Table.TransformColumnTypes(
        #"Valor Substituído5",
        {{"imc", type number}}
  ),

// Cria coluna de Classificação de IMC levando em conta idade (adulto x idoso)
  #"Personalização Adicionada" = Table.AddColumn(
        #"Tipo Alterado1",
        "Classificação IMC por idade",
        each
            if [imc] = null or [Idade] < 18 then
                "Dados insuficientes"
            else if [Idade] >= 18 and [Idade] < 60 then
                if [imc] < 18.5 then "Baixo peso (adulto)"
                else if [imc] < 25 then "Normal (adulto)"
                else if [imc] < 30 then "Sobrepeso (adulto)"
                else "Obesidade (adulto)"
            else
                if [imc] < 22 then "Baixo peso (idoso)"
                else if [imc] <= 27 then "Adequado (idoso)"
                else "Sobrepeso (idoso)"
  ),

// Altera valor de status de fumante de desconhecido para não informado
   #"Valor Substituído6" = Table.ReplaceValue(
        #"Personalização Adicionada",
        "Desconhecido",
        "Não Informado",
        Replacer.ReplaceText,
        {"Status Fumante"}
  ),

// Cria coluna condicional Hipertensão (Sim/Não) a partir da flag numérica
  #"Coluna Condicional Adicionada1" = Table.AddColumn(
        #"Valor Substituído6",
        "Hipertensão",
        each if [hipertensao] = 1 then "Sim" else "Não"
  ),

// Cria coluna textual de Doença Cardíaca (Sim/Não)
  #"Coluna Condicional Adicionada3" = Table.AddColumn(
        #"Coluna Condicional Adicionada1",
        "Doença cardíaca",
        each if [doenca_cardiaca] = 1 then "Sim" else "Não"
  ),

// Cria Grupo de Risco combinando hipertensão e doença cardíaca
  #"Personalização Adicionada1" = Table.AddColumn(
        #"Coluna Condicional Adicionada3",
        "Grupo de Risco",
        each
            if [hipertensao] = 1 and [doenca_cardiaca] = 1 then
                "Hipertensão e Doença Cardíaca"
            else if [hipertensao] = 1 then
                "Apenas Hipertensão"
            else if [doenca_cardiaca] = 1 then
                "Apenas Doença Cardíaca"
            else
                "Sem Comorbidades"
  )
in
  #"Personalização Adicionada1"

-- TRADUÇÃO DE VALORES PARA PORTUGUÊS
-- Tabela: pacientes_avc

BEGIN;


-- 1) GÊNERO
UPDATE pacientes_avc
SET genero = 'Masculino'
WHERE genero = 'Male';

UPDATE pacientes_avc
SET genero = 'Feminino'
WHERE genero = 'Female';


-- 2) ESTADO CIVIL (casado)

UPDATE pacientes_avc
SET casado = 'Sim'
WHERE casado = 'Yes';

UPDATE pacientes_avc
SET casado = 'Não'
WHERE casado = 'No';


-- 3) TIPO DE TRABALHO
UPDATE pacientes_avc
SET tipo_trabalho = 'Empresa Privada'
WHERE tipo_trabalho = 'Private';

UPDATE pacientes_avc
SET tipo_trabalho = 'Cargo Público'
WHERE tipo_trabalho = 'Govt_job';

UPDATE pacientes_avc
SET tipo_trabalho = 'Autonomo'
WHERE tipo_trabalho = 'Self-employed';

UPDATE pacientes_avc
SET tipo_trabalho = 'Nunca Trabalhou'
WHERE tipo_trabalho = 'Never_worked';

UPDATE pacientes_avc
SET tipo_trabalho = 'Criança'
WHERE tipo_trabalho = 'children';


-- 4) TIPO DE RESIDÊNCIA
UPDATE pacientes_avc
SET tipo_residencia = 'Urbana'
WHERE tipo_residencia = 'Urban';


-- 5) STATUS FUMANTE
UPDATE pacientes_avc
SET status_fumante = 'Fuma'
WHERE status_fumante = 'smokes';

UPDATE pacientes_avc
SET status_fumante = 'Fumou anteriormente'
WHERE status_fumante = 'formerly smoked';

UPDATE pacientes_avc
SET status_fumante = 'Desconhecido'
WHERE status_fumante = 'Unknown';

UPDATE pacientes_avc
SET status_fumante = 'Nunca fumou'
WHERE status_fumante = 'never smoked';


COMMIT;

--usando RECORD para alocar mais de um dado em uma única variável:
DECLARE 
	TYPE T1 IS RECORD(L1 Imovel.Valor%TYPE, L2 Imovel.Descricao%TYPE);
    	a	T1;
	b	Imovel.Titulo%TYPE := 'Cobertura Duplex';
BEGIN 
	SELECT Valor,Descricao INTO a FROM Imovel WHERE Imovel.Titulo = b; 
 
	DBMS_OUTPUT.PUT_LINE('O Imóvel com Título: '|| b || ', custa:' || a.L1 || ' e possui a seguinte descrição: ' || a.L2); 
END;

--output:
--O Imóvel com Título: Cobertura Duplex, custa:1000000 e possui a seguinte descrição: Cobertura duplex para quem busca espaço e conforto

--criando uma PROCEDURE para mudar o estado da coluna Tem_pet, usando IF/ELSIF

CREATE OR REPLACE PROCEDURE change_pet_sta(x in Locatario.CPF_locatario%TYPE)
IS
   a  VARCHAR(10);
BEGIN
    SELECT Tem_pet INTO a FROM Locatario WHERE Locatario.CPF_locatario = x;
	If (a = 'Sim') 
        THEN UPDATE Locatario SET Tem_pet = 'Nao' WHERE Locatario.CPF_locatario = x;
	ELSIF (a = 'Nao') 
        THEN UPDATE Locatario SET Tem_pet = 'Sim' WHERE Locatario.CPF_locatario = x;
	END IF;
COMMIT;
END change_pet_sta;


--criando uma função que retorna a renda média após ser fornecido o CPF_locatario 

CREATE OR REPLACE FUNCTION pegar_renda_media (x IN Locatario.CPF_locatario%type )
RETURN FLOAT
IS
    rm Locatario.Renda_media%TYPE :=0;
BEGIN 
	SELECT Renda_media INTO rm FROM Locatario WHERE CPF_locatario = x; 
	RETURN rm;
 	
END pegar_renda_media;

--testando a função criada:
DECLARE 
	y FLOAT;
BEGIN
	y := pegar_renda_media('01234567590');
	DBMS_OUTPUT.PUT_LINE(y);
END;
output:
7500


--usando %ROWTYPE e %TYPE para mostrar apenas o átomo requisitado:

DECLARE 
	a	Cliente%ROWTYPE; 
	b	Cliente.CPF_cliente%TYPE := '78901234567'; 
BEGIN 
	SELECT * INTO a FROM Cliente WHERE CPF_cliente = b; 
 
	DBMS_OUTPUT.PUT_LINE(a.Nome || ', possuidor do telefone:' || a.Telefone || ' e CPF:' || b); 
END;

output:
	Pedro Santos, possuidor do telefone:(21) 98765-4321 e CPF:78901234567

-- verifica se o cpf pertence a algum cliente 
DECLARE
   v_nome_cliente VARCHAR2(50);
BEGIN
   SELECT nome INTO v_nome_cliente
   FROM cliente
   WHERE CPF_cliente = 123456789;
   
   DBMS_OUTPUT.PUT_LINE('Nome do cliente: ' || v_nome_cliente);

EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('O cliente com este cpf não foi encontrado');
END;


-- Cursor que retorna os imoveis com anúncios ativos
DECLARE
   -- Declarar o cursor
   CURSOR imoveis_ativos IS
      SELECT idimovel, cliente_desejado, status FROM anuncia WHERE status = 'Ativo';
   
   -- Variáveis para armazenar os dados do cursor
   v_idimovel    anuncia.idimovel%TYPE;
   v_cliente_desejado anuncia.cliente_desejado%TYPE;
   v_status anuncia.status%TYPE;

BEGIN
   -- Abrir o cursor
   OPEN imoveis_ativos;

   LOOP
      FETCH imoveis_ativos INTO v_idimovel, v_cliente_desejado, v_status;

      EXIT WHEN imoveis_ativos%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE('ID do Imóvel: ' || v_idimovel || ', Cliente desejado: ' || v_cliente_desejado || ', Status: ' || v_status);
   END LOOP;

   CLOSE imoveis_ativos;
END;

-Criando um pacote com as funções que atuam na tabela locatario

CREATE OR REPLACE PACKAGE locatario_pack IS
    FUNCTION pegar_renda_media (x IN Locatario.CPF_locatario%type )RETURN FLOAT;
    PROCEDURE change_pet_sta(x in Locatario.CPF_locatario%TYPE);
END locatario_pack;

CREATE OR REPLACE PACKAGE BODY locatario_pack IS
    FUNCTION pegar_renda_media (x IN Locatario.CPF_locatario%type )RETURN FLOAT
    IS
        rm Locatario.Renda_media%TYPE :=0;
    BEGIN
        SELECT Renda_media INTO rm FROM Locatario WHERE CPF_locatario = x;
        RETURN rm;
    END pegar_renda_media;

    PROCEDURE change_pet_sta(x in Locatario.CPF_locatario%TYPE) IS
        a VARCHAR(10);
    BEGIN
        SELECT Tem_pet INTO a FROM Locatario WHERE Locatario.CPF_locatario = x;
        IF (a = 'Sim') THEN
            UPDATE Locatario SET Tem_pet = 'Nao' WHERE Locatario.CPF_locatario = x;
        ELSIF (a = 'Nao') THEN
            UPDATE Locatario SET Tem_pet = 'Sim' WHERE Locatario.CPF_locatario = x;
        END IF;
        COMMIT;
    END change_pet_sta;
END locatario_pack;

-utilizando out, in out com PROCEDURES
CREATE OR REPLACE PROCEDURE endereco (x out Cliente.CEP%TYPE, y out Cliente.Rua%TYPE, z out Cliente.Numero%TYPE, CPF in out Cliente.CPF_cliente%TYPE)
AS
BEGIN
	SELECT CEP INTO x FROM Cliente where CPF_cliente = CPF;
	SELECT Rua INTO y FROM Cliente where CPF_cliente = CPF;
	SELECT Numero INTO z FROM Cliente where CPF_cliente = CPF;
COMMIT;
END;


DECLARE 
    x	Cliente.CEP%TYPE;
    y	Cliente.Rua%TYPE;
    z	Cliente.Numero%TYPE;
	w	Cliente.CPF_cliente%TYPE;

BEGIN
    w := '12345678903';
	endereco(x, y,z, w);
	DBMS_OUTPUT.PUT_LINE(x|| y || z || w);
END;


-trigger que identifica se depois do update tem algum valor menor que 0
CREATE TRIGGER trg_update_valor
AFTER UPDATE ON Imovel
FOR EACH ROW
WHEN (NEW.Valor < 0)
BEGIN
    RAISE_APPLICATION_ERROR(-20001, 'Valor negativo não permitido');
END;

-criação de uma tabela que armazenará os ‘DELETE’ com utilização de trigger
CREATE TABLE log_deletes (tabela VARCHAR2(20), data_hora DATE);

CREATE OR REPLACE TRIGGER trg_log_deletes
AFTER DELETE ON Cliente
BEGIN
    INSERT INTO log_deletes (tabela, data_hora)
    VALUES ('Cliente', SYSDATE);
END;



-utilização do case when
	SELECT
        Valor,
        Titulo,
        CASE
            WHEN Valor > 500000 THEN 'Luxo'
            WHEN Valor BETWEEN 250000 AND 500000 THEN 'Médio'
            ELSE 'Entrada'
        END AS faixa_preco
    FROM Imovel;

--usando while loop para contar a quantidade de anúncios ativos
DECLARE
   -- Declarar o cursor
   CURSOR imoveis_ativos IS
      SELECT  status FROM anuncia;
   

    v_status anuncia.status%TYPE;
	count_ativos NUMBER;
	count_inativos NUMBER;
BEGIN
    -- Abrir o cursor
    OPEN imoveis_ativos;
	count_ativos := 0;
	count_inativos := 0;

	LOOP
		FETCH imoveis_ativos INTO  v_status;
		IF (v_status = 'Ativo') THEN 
            count_ativos := count_ativos + 1;
		END IF;
		IF (v_status = 'Inativo') THEN 
            count_inativos := count_inativos + 1;
		END IF;
		EXIT WHEN imoveis_ativos%NOTFOUND;
		
		
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(' No momento há: ' || count_inativos || ' Anuncios Inativos e ' || count_ativos|| ' Anuncios Ativos');
	CLOSE imoveis_ativos;
END;


usando  for loop para contar a quantidade de anúncios ativos
DECLARE
  TYPE status_record IS RECORD (
    status VARCHAR2(20),
    quantidade NUMBER
  );
  v_status_rec status_record;
  v_status_result status_record;
BEGIN
  FOR v_status_rec IN (
    SELECT status, COUNT(*) AS quantidade
    FROM Anuncia
    GROUP BY Status
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Há ' || v_status_rec.quantidade || ' anúncios ' || v_status_rec.status||'s');
  END LOOP;
END;

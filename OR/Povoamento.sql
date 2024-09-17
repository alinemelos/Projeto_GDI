-- tabela endereço
INSERT INTO Endereco
VALUES ('Rua das Flores','São Paulo', '01234-567',123);
INSERT INTO Endereco
VALUES ('Rua das Flores','São Paulo', '01001-000',456);
INSERT INTO Endereco
VALUES ('Avenida Brasil','São Paulo', '22001-000',455);
INSERT INTO Endereco
VALUES ('Rua da Paz','Recife', '13001-000',789);
INSERT INTO Endereco
VALUES ('Rua do Sol','Recife', '25001-000',101);
INSERT INTO Endereco
VALUES ('Avenida Central','Recife', '14001-000',202);
INSERT INTO Endereco
VALUES ('Rua da Liberdade','Rio de Janeiro', '35001-000',303);
INSERT INTO Endereco
VALUES ('Rua das Acácias','Rio de Janeiro', '40001-000',404);
INSERT INTO Endereco
VALUES ('Avenida Independência','Brasília', '50001-000',505);
INSERT INTO Endereco
VALUES ('Rua das Palmeiras','Brasília', '60001-000',606);
INSERT INTO Endereco
VALUES ('Avenida Paulista','Brasília', '70001-000',707);
INSERT INTO Endereco
VALUES ('Rua dos Pinheiros','Limoeiro', '01234-567',100);
INSERT INTO Endereco
VALUES ('Avenida Paulista','Limoeiro', '23456-789',200);
INSERT INTO Endereco
VALUES ('Rua da Liberdade','Limoeiro', '34567-890',300);
INSERT INTO Endereco
VALUES ('Rua do Sol','Florianópolis', '45678-901',400);
INSERT INTO Endereco
VALUES ('Avenida Central','Florianópolis', '56789-012',500);
INSERT INTO Endereco
VALUES ('Rua das Flores','Florianópolis', '67890-123',600);
INSERT INTO Endereco
VALUES ('Avenida Paulista','São Paulo', '78901-234',700);
INSERT INTO Endereco
VALUES ('Rua da Liberdade','São Paulo', '89012-345',800);
INSERT INTO Endereco
VALUES ('Rua do Sol','São Paulo', '90123-456',900);
INSERT INTO Endereco
VALUES ('Avenida Central','São Paulo', '12345-698',910);

-- tabela cliente
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '01234-567';

    INSERT INTO Cliente
    VALUES ('João Silva', TO_DATE('1980-05-15', 'YYYY-MM-DD'), 'Casado', 'Masculino', array_telefone('11912345678', NULL, NULL), '12345678901', v_endereco_ref);
END;
/
-- tabela cliente
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '01001-000';

    INSERT INTO Cliente
    VALUES ('Mariana Silva', TO_DATE('2003-11-01', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('11987654321', NULL, NULL), '12345678903', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '22001-000';

    INSERT INTO Cliente
    VALUES ('Pedro Santos', TO_DATE('1998-05-15', 'YYYY-MM-DD'), 'Casado', 'Masculino', array_telefone('21987654321', NULL, NULL), '78901234567', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '13001-000';

    INSERT INTO Cliente
    VALUES ('Ana Oliveira', TO_DATE('2005-07-05', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('19987654321', '81994757498', NULL), '12345678909', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '25001-000';

    INSERT INTO Cliente
    VALUES ('Lucas Lima', TO_DATE('1992-02-10', 'YYYY-MM-DD'), 'Divorciado', 'Feminino', array_telefone('24977654321', '81994757497', NULL), '98765432109', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '14001-000';

    INSERT INTO Cliente
    VALUES ('Beatriz Souza', TO_DATE('1999-09-25', 'YYYY-MM-DD'), 'Casado', 'Feminino', array_telefone('16985654321', '81994757491', '16996739626'), '34567890123', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '35001-000';

    INSERT INTO Cliente
    VALUES ('Rafael Santos', TO_DATE('1988-05-15', 'YYYY-MM-DD'), 'Solteiro', 'Masculino', array_telefone('31987654322', '31994757491', '31996739626'), '67890123456', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '40001-000';

    INSERT INTO Cliente
    VALUES ('Juliana Pereira', TO_DATE('2002-12-30', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('41987654322', '41994757491', NULL), '01234567810', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '50001-000';

    INSERT INTO Cliente
    VALUES ('André Silva', TO_DATE('1995-08-18', 'YYYY-MM-DD'), 'Casado', 'Feminino', array_telefone('51987654322', '51994757491', NULL), '23456789012', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '60001-000';

    INSERT INTO Cliente
    VALUES ('Camila Santos', TO_DATE('2000-04-02', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('61937654321', '61994757491', NULL), '45678901234', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '70001-000';

    INSERT INTO Cliente
    VALUES ('Lucas Silva', TO_DATE('1996-11-07', 'YYYY-MM-DD'), 'Divorciado', 'Masculino', array_telefone('71987652321', '71994757491', NULL), '78901234562', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '01234-567';

    INSERT INTO Cliente
    VALUES ('Bruno Almeida', TO_DATE('1985-03-22', 'YYYY-MM-DD'), 'Casado', 'Masculino', array_telefone('11987653321', NULL, NULL), '98765432100', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '34567-890';

    INSERT INTO Cliente
    VALUES ('Carlos Oliveira', TO_DATE('1972-08-15', 'YYYY-MM-DD'), 'Divorciado', 'Masculino', array_telefone('19987655321', NULL, NULL), '34567890122', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '45678-901';

    INSERT INTO Cliente
    VALUES ('Fernanda Santos', TO_DATE('1999-04-10', 'YYYY-MM-DD'), 'Divorciado', 'Feminino', array_telefone('24987555321', NULL, NULL), '67890122456', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '56789-012';

    INSERT INTO Cliente
    VALUES ('Roberto Souza', TO_DATE('1987-12-25', 'YYYY-MM-DD'), 'Solteiro', 'Masculino', array_telefone('24987554321', NULL, NULL), '01234567890', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '67890-123';

    INSERT INTO Cliente
    VALUES ('Camila Lima', TO_DATE('2004-12-25', 'YYYY-MM-DD'), 'Solteiro', 'Feminino', array_telefone('98765554321', NULL, NULL), '18765432109', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '78901-234';

    INSERT INTO Cliente
    VALUES ('Pedro Pereira', TO_DATE('1991-09-05', 'YYYY-MM-DD'), 'Casado', 'Masculino', array_telefone('98765554321', NULL, NULL), '34367890123', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '89012-345';

    INSERT INTO Cliente
    VALUES ('Ana Silva', TO_DATE('1991-09-09', 'YYYY-MM-DD'), 'Divorciado', 'Feminino', array_telefone('98767554321', NULL, NULL), '67890123458', v_endereco_ref);
END;
/

DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '90123-456';

    INSERT INTO Cliente
    VALUES ('Lucas Santos', TO_DATE('2002-09-09', 'YYYY-MM-DD'), 'Solteiro', 'Masculino', array_telefone('98765554321', NULL, NULL), '01234567590', v_endereco_ref);
END;
/
DECLARE
    v_endereco_ref REF tipo_Endereco;
BEGIN
    -- Buscar o REF do endereço recém-inserido
    SELECT REF(e) INTO v_endereco_ref
    FROM Endereco e
    WHERE e.CEP = '12345-698';

    INSERT INTO Cliente
    VALUES ('Beatriz Souza', TO_DATE('1995-07-07', 'YYYY-MM-DD'), 'Casado', 'Feminino', array_telefone('71987654321', NULL, NULL), '28765432109', v_endereco_ref);
END;
/

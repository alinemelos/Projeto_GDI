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
VALUES ('Avenida Paulista','Limoeiro', '23456789',200);
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

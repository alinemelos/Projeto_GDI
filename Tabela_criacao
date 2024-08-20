-- Tabela Cliente

CREATE TABLE Cliente (
    Nome VARCHAR2(40) NOT NULL,
    Data_nascimento DATE NOT NULL,
    Estado_civil VARCHAR2(10),
    Genero VARCHAR2(20) CHECK (Genero IN ('Masculino', 'Feminino', 'Outro')),
    Telefone VARCHAR2(20),
    CPF_cliente CHAR(11) PRIMARY KEY,
    CEP CHAR(9),
    Rua VARCHAR2(50),
    Numero NUMBER,
    CONSTRAINT chk_estado_civil CHECK (Estado_civil IN ('Solteiro', 'Casado', 'Divorciado', 'Viúvo'))
);

-- Tabela Banco

CREATE TABLE Banco (
    Nome VARCHAR2(40) NOT NULL,
    CNPJ CHAR(14),
    Telefone  VARCHAR2(20),
    CONSTRAINT Banco_pk PRIMARY KEY (CNPJ)
);

-- Tabela Imovel
CREATE SEQUENCE seq_imovel
START WITH 1
INCREMENT BY 1;

CREATE TABLE Imovel (
    idImovel NUMBER PRIMARY KEY,
    Valor FLOAT CHECK (Valor > 0),
    Parcelas FLOAT CHECK (Parcelas > 0),
    CEP CHAR(9),
    Numero NUMBER,
    Rua VARCHAR2(50),
    CPF_Proprietario CHAR(11),
    Titulo VARCHAR2(40),
    Tipo VARCHAR2(40),
    Descricao VARCHAR2(200),
    Quartos NUMBER,
    Banheiros NUMBER,
    CONSTRAINT fk_proprietario FOREIGN KEY (CPF_Proprietario) REFERENCES Cliente(CPF_cliente)
);
-- Tabela Locatario

CREATE TABLE Locatario (
    Tipo_desejado VARCHAR2(50),
    Ocupacao VARCHAR2(20),
    Renda_Media FLOAT,
    Tem_Pet CHAR(3),
    CPF_locatario CHAR(11),
    CONSTRAINT Locatario_pk PRIMARY KEY (CPF_locatario),
    CONSTRAINT fk_locatario_cliente FOREIGN KEY (CPF_locatario) REFERENCES Cliente(CPF_cliente)
);
-- Tabela Corretor

CREATE TABLE Corretores (
    Nome VARCHAR2(40),
    CPF_corretor CHAR(11),
    Telefone VARCHAR2(20),
    CPF_gerenciador CHAR(11),
    CONSTRAINT corretor_pk PRIMARY KEY (CPF_corretor),
    CONSTRAINT CPF_corretor_gerenciador_fk FOREIGN KEY (CPF_gerenciador) REFERENCES Corretores(CPF_corretor)
);

-- Tabela Proprietario

CREATE TABLE Proprietario (
    CPF_proprietario CHAR(11),
    CONSTRAINT proprietario_pk PRIMARY KEY (CPF_proprietario),
    CONSTRAINT fk_proprietario_cliente FOREIGN KEY (CPF_proprietario) REFERENCES Cliente(CPF_cliente)
);

-- Tabela Visita

CREATE TABLE Visita (
	idImovel NUMBER,
    CPF_proprietario CHAR(11),
    CPF_locatario CHAR(11),
    CPF_corretor CHAR(11),
    Data DATE,
    Avaliacao NUMBER,
    PRIMARY KEY (CPF_proprietario, CPF_locatario , CPF_corretor),
    CONSTRAINT fk_visita_imovel FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel),
    CONSTRAINT fk_visita_proprietario FOREIGN KEY (CPF_proprietario) REFERENCES Proprietario(CPF_proprietario),
    CONSTRAINT fk_visita_locatario FOREIGN KEY (CPF_locatario) REFERENCES Locatario(CPF_locatario),
    CONSTRAINT fk_visita_corretor FOREIGN KEY (CPF_corretor) REFERENCES Corretores(CPF_corretor)
);

-- Tabela Financia

CREATE TABLE Financia (
    CPF_locatario CHAR(11),
    CNPJ_banco CHAR(14),
    idImovel NUMBER,
    Parcelas NUMBER,
    PRIMARY KEY (CPF_locatario, CNPJ_banco, idImovel),
    CONSTRAINT fk_financia_locatario FOREIGN KEY (CPF_locatario) REFERENCES Locatario(CPF_locatario),
    CONSTRAINT fk_financia_banco FOREIGN KEY (CNPJ_banco) REFERENCES Banco(CNPJ),
    CONSTRAINT fk_financia_imovel FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel)
);

-- Tabela Aluga

CREATE TABLE Aluga (
    idImovel NUMBER,
    CPF_corretor CHAR(11),
    CPF_locatario CHAR(11),
    Mensalidade FLOAT,
    Inicio DATE,
    Fim DATE,
    PRIMARY KEY (idImovel, CPF_locatario, CPF_corretor),
    CONSTRAINT fk_aluga_imovel FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel),
    CONSTRAINT fk_aluga_corretor FOREIGN KEY (CPF_corretor) REFERENCES Corretores(CPF_corretor),
    CONSTRAINT fk_aluga_locatario FOREIGN KEY (CPF_locatario) REFERENCES Locatario(CPF_locatario)
);

-- Tabela Anuncia

CREATE TABLE Anuncia (
    CPF_proprietario CHAR(11),
    idImovel NUMBER,
    Cliente_desejado VARCHAR2(40),
    Status VARCHAR2(10),
    Data DATE,
    PRIMARY KEY (CPF_proprietario, idImovel),
    CONSTRAINT fk_anuncia_proprietario FOREIGN KEY (CPF_proprietario) REFERENCES Proprietario(CPF_proprietario),
    CONSTRAINT fk_anuncia_imovel FOREIGN KEY (idImovel) REFERENCES Imovel(idImovel)
);

-- Tabela Contata: 

CREATE TABLE Contata (
    CPF_corretor CHAR(11),
    CPF_locatario CHAR(11),
    PRIMARY KEY (CPF_corretor, CPF_locatario),
    CONSTRAINT fk_contata_corretor FOREIGN KEY (CPF_corretor) REFERENCES Corretores(CPF_corretor),
    CONSTRAINT fk_contata_locatario FOREIGN KEY (CPF_locatario) REFERENCES Locatario(CPF_locatario)
);

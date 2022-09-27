/* Lógico_1: */

CREATE TABLE Autor (
    CodAutor INTEGER PRIMARY KEY,
    nome VARCHAR(30),
    dataNasci DATE
) ENGINE = innodb;

CREATE TABLE Objeto (
    CodObjeto INTEGER PRIMARY KEY AUTO_INCREMENT ,
    Custo INTEGER,
    Nome VARCHAR(30),
    Descr VARCHAR(30),
    Img LONGBLOB,
    Material VARCHAR(15),
    Altura INTEGER,
    Peso INTEGER,
    estilo VARCHAR(15),
    tipo VARCHAR(15),
    Descri VARCHAR(30),
    Objeto_TIPO INT
) ENGINE = innodb;

CREATE TABLE Pais (
    CodPais INTEGER PRIMARY KEY,
    NomePais VARCHAR(15)
) ENGINE = innodb;

CREATE TABLE Visitante (
    NumVisit INTEGER PRIMARY KEY AUTO_INCREMENT,
    Telefone INTEGER,
    Nome VARCHAR(30),
    fk_Cidade_Museu_CodCidade INTEGER
) ENGINE = innodb;

CREATE TABLE Cidade_Museu (
    CodCidade INTEGER PRIMARY KEY,
    NomeCiade VARCHAR(30),
    fk_Pais_CodPais INTEGER
) ENGINE = innodb;

CREATE TABLE Contem_Museu_Objeto_Autor (
    fk_Objeto_CodObjeto INTEGER,
    fk_Autor_CodAutor INTEGER
) ENGINE = innodb;

CREATE TABLE Visita (
    DataVisita DATE PRIMARY KEY,
    fk_Visitante_NumVisit INTEGER,
    HoraVis TIME
);
 
ALTER TABLE Visitante ADD CONSTRAINT FK_Visitante_2
    FOREIGN KEY (fk_Cidade_Museu_CodCidade)
    REFERENCES Cidade_Museu (CodCidade)
    ON DELETE RESTRICT;
 
ALTER TABLE Cidade_Museu ADD CONSTRAINT FK_Cidade_Museu_2
    FOREIGN KEY (fk_Pais_CodPais)
    REFERENCES Pais (CodPais)
    ON DELETE RESTRICT;
 
ALTER TABLE Contem_Museu_Objeto_Autor ADD CONSTRAINT FK_Contem_Museu_Objeto_Autor_1
    FOREIGN KEY (fk_Objeto_CodObjeto)
    REFERENCES Objeto (CodObjeto)
    ON DELETE RESTRICT;
 
ALTER TABLE Contem_Museu_Objeto_Autor ADD CONSTRAINT FK_Contem_Museu_Objeto_Autor_2
    FOREIGN KEY (fk_Autor_CodAutor)
    REFERENCES Autor (CodAutor)
    ON DELETE RESTRICT;
 
ALTER TABLE Visita ADD CONSTRAINT FK_Visita_2
    FOREIGN KEY (fk_Visitante_NumVisit)
    REFERENCES Visitante (NumVisit)
    ON DELETE RESTRICT;
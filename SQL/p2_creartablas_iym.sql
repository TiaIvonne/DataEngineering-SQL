/* CREACION DE ENTIDADES SEGUN MODELO RELACIONAL
Nombre: Ivonne Mendoza
mail: ivonne@imendoza.io
*/



USE EMPRESA;


/* CREAR TABLA DEPARTAMENTO */

DROP TABLE IF EXISTS EMPLEADO;
DROP TABLE IF EXISTS DEPARTAMENTO;

CREATE TABLE DEPARTAMENTO (
    codDepto VARCHAR(4) NOT NULL,
    nombreDpto VARCHAR(20),
    Ciudad VARCHAR(15),
    codDirector VARCHAR(12),
    PRIMARY KEY (codDepto)
);



CREATE TABLE EMPLEADO (
    nDIEmp VARCHAR(12) NOT NULL,
    nomEmp VARCHAR(30),
    sexEmp CHAR(1),
    fecNac DATE,
    fecIncorporacion DATE,
    salEmp FLOAT,
    comisionE FLOAT,
    cargoE VARCHAR(15),
    jefeID VARCHAR(12),
    codDepto VARCHAR(4),
    PRIMARY KEY (nDIEmp),
    -- Clave foránea para relacionar con departamento
    CONSTRAINT FK_EMP_DEPTO FOREIGN KEY (codDepto) 
        REFERENCES DEPARTAMENTO(codDepto) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    -- Clave foránea para auto referencia, un empleado 
    CONSTRAINT FK_EMP_JEFE FOREIGN KEY (jefeID) 
        REFERENCES EMPLEADO(nDIEmp) 
        ON DELETE SET NULL 
        ON UPDATE CASCADE
);

-- Descripcion de tablas ya creadas
DESCRIBE DEPARTAMENTO;
DESCRIBE EMPLEADO;

-- Ver las claves foráneas creadas
SELECT 
    TABLE_NAME,
    CONSTRAINT_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
    TABLE_SCHEMA = DATABASE()
    AND TABLE_NAME IN ('DEPARTAMENTO', 'EMPLEADO')
    AND REFERENCED_TABLE_NAME IS NOT NULL;

/* INSERCION DE DATOS EN EL MDELO RELACIONAL EMPRESA
Nombre: Ivonne Mendoza
mail: ivonne@imendoza.io
*/

USE EMPRESA;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE EMPLEADO;
TRUNCATE TABLE  DEPARTAMENTO;
SET FOREIGN_KEY_CHECKS = 1;

select * from DEPARTAMENTO d;
select * from EMPLEADO e;



-- =====================================================
-- 1. INSERTAR DEPARTAMENTOS GENERADI CIN CURSOR AI
-- =====================================================

INSERT INTO DEPARTAMENTO (codDepto, nombreDpto, Ciudad, codDirector) VALUES
('1000', 'Dirección General', 'Madrid', NULL),
('2000', 'Recursos Humanos', 'Barcelona', NULL),
('3000', 'Ventas', 'Valencia', NULL),
('4000', 'Marketing', 'Sevilla', NULL),
('5000', 'Tecnología', 'Bilbao', NULL),
('6000', 'Finanzas', 'Madrid', NULL),
('7000', 'Operaciones', 'Málaga', NULL),
('8000', 'Logística', 'Zaragoza', NULL),
('9000', 'Atención al Cliente', 'Murcia', NULL),
('A000', 'I+D e Investigación', 'Valencia', NULL);
-- Inserta en tabla departamento

-- =====================================================
-- 2. INSERTAR EMPLEADOS (40 empleados) GENERADO CON CURSOR AI
-- =====================================================

-- Primero insertamos los directores/jefes (sin jefeID)
INSERT INTO EMPLEADO (nDIEmp, nomEmp, sexEmp, fecNac, fecIncorporacion, salEmp, comisionE, cargoE, jefeID, codDepto) VALUES
-- Directores de departamento (salarios anuales)
('EMP001', 'Carlos Rodríguez', 'M', '1975-03-15', '2000-01-10', 95000.00, 500.00, 'Director', NULL, '1000'),
('EMP002', 'María González', 'F', '1980-07-22', '2005-03-20', 85000.00, 400.00, 'Directora', NULL, '2000'),
('EMP003', 'Juan Martínez', 'M', '1978-11-05', '2003-06-15', 82000.00, 450.00, 'Director', NULL, '3000'),
('EMP004', 'Ana López', 'F', '1982-02-18', '2007-09-01', 80000.00, 350.00, 'Directora', NULL, '4000'),
('EMP005', 'Pedro Sánchez', 'M', '1976-09-30', '2001-11-12', 90000.00, 500.00, 'Director', NULL, '5000'),

-- Gerentes (reportan a directores) - salarios anuales
('EMP006', 'Laura Fernández', 'F', '1985-04-12', '2010-02-15', 65000.00, 300.00, 'Gerente', 'EMP001', '1000'),
('EMP007', 'Roberto Torres', 'M', '1983-08-25', '2008-05-20', 62000.00, 280.00, 'Gerente', 'EMP002', '2000'),
('EMP008', 'Carmen Ruiz', 'F', '1987-12-08', '2012-07-10', 61000.00, 250.00, 'Gerente', 'EMP003', '3000'),
('EMP009', 'David Moreno', 'M', '1984-06-14', '2009-04-05', 63000.00, 270.00, 'Gerente', 'EMP004', '4000'),
('EMP010', 'Sofía Jiménez', 'F', '1986-10-20', '2011-08-22', 64000.00, 290.00, 'Gerente', 'EMP005', '5000'),

-- Supervisores (reportan a gerentes) - salarios anuales
('EMP011', 'Miguel Ángel Castro', 'M', '1990-01-15', '2015-03-10', 48000.00, 150.00, 'Supervisor', 'EMP006', '1000'),
('EMP012', 'Elena Vargas', 'F', '1991-05-22', '2016-06-15', 47000.00, 140.00, 'Supervisora', 'EMP007', '2000'),
('EMP013', 'Francisco Navarro', 'M', '1989-09-08', '2014-09-20', 49000.00, 160.00, 'Supervisor', 'EMP008', '3000'),
('EMP014', 'Isabel Morales', 'F', '1992-11-30', '2017-01-12', 46000.00, 130.00, 'Supervisora', 'EMP009', '4000'),
('EMP015', 'Javier Serrano', 'M', '1990-07-18', '2015-04-25', 48500.00, 155.00, 'Supervisor', 'EMP010', '5000'),

-- Analistas y especialistas - salarios anuales
('EMP016', 'Patricia Delgado', 'F', '1993-03-05', '2018-02-10', 38000.00, 100.00, 'Analista', 'EMP011', '1000'),
('EMP017', 'Antonio Ramírez', 'M', '1994-08-12', '2019-05-15', 37000.00, 90.00, 'Analista', 'EMP012', '2000'),
('EMP018', 'Lucía Herrera', 'F', '1992-12-20', '2017-08-22', 39000.00, 110.00, 'Vendedor', 'EMP013', '3000'),
('EMP019', 'Daniel Ortega', 'M', '1995-04-28', '2020-01-08', 36000.00, 80.00, 'Analista', 'EMP014', '4000'),
('EMP020', 'Marta Campos', 'F', '1993-09-14', '2018-06-30', 37500.00, 95.00, 'Especialista', 'EMP015', '5000'),

-- Empleados de otros departamentos - salarios anuales
('EMP021', 'Ricardo Méndez', 'M', '1991-06-10', '2016-09-12', 40000.00, 120.00, 'Analista', 'EMP006', '6000'),
('EMP022', 'Natalia Vega', 'F', '1994-02-25', '2019-03-18', 35000.00, 85.00, 'Asistente', 'EMP007', '7000'),
('EMP023', 'Óscar Paredes', 'M', '1992-10-08', '2017-11-05', 39000.00, 105.00, 'Coordinador', 'EMP008', '8000'),
('EMP024', 'Cristina Ramos', 'F', '1995-07-22', '2020-04-20', 34000.00, 75.00, 'Asistente', 'EMP009', '9000'),
('EMP025', 'Alberto Fuentes', 'M', '1993-01-18', '2018-07-15', 41000.00, 115.00, 'Especialista', 'EMP010', 'A000'),

-- Más empleados para llegar a 40 - salarios anuales
('EMP026', 'Rosa Mendoza', 'F', '1994-05-30', '2019-08-10', 37000.00, 90.00, 'Analista', 'EMP011', '1000'),
('EMP027', 'Fernando Silva', 'M', '1991-11-15', '2016-12-22', 38000.00, 100.00, 'Vendedor', 'EMP012', '2000'),
('EMP028', 'Beatriz Ríos', 'F', '1993-08-05', '2018-10-05', 37500.00, 95.00, 'Vendedor', 'EMP013', '3000'),
('EMP029', 'Héctor Medina', 'M', '1995-03-20', '2020-06-18', 36000.00, 80.00, 'Asistente', 'EMP014', '4000'),
('EMP030', 'Verónica Soto', 'F', '1992-09-12', '2017-02-28', 39000.00, 110.00, 'Especialista', 'EMP015', '5000'),

('EMP031', 'Gabriel Peña', 'M', '1994-12-08', '2019-09-15', 36500.00, 85.00, 'Vendedor', 'EMP016', '1000'),
('EMP032', 'Adriana Cruz', 'F', '1991-04-25', '2016-07-20', 40000.00, 120.00, 'Coordinador', 'EMP017', '2000'),
('EMP033', 'Raúl Guzmán', 'M', '1993-10-18', '2018-01-12', 37000.00, 90.00, 'Vendedor', 'EMP018', '3000'),
('EMP034', 'Silvia Núñez', 'F', '1995-06-30', '2020-08-25', 36000.00, 80.00, 'Asistente', 'EMP019', '4000'),
('EMP035', 'Manuel Acosta', 'M', '1992-02-14', '2017-05-10', 39000.00, 105.00, 'Especialista', 'EMP020', '5000'),

('EMP036', 'Claudia Rojas', 'F', '1994-08-22', '2019-11-08', 36500.00, 85.00, 'Analista', 'EMP021', '6000'),
('EMP037', 'Eduardo Valdez', 'M', '1991-01-05', '2016-04-15', 41000.00, 115.00, 'Coordinador', 'EMP022', '7000'),
('EMP038', 'Yolanda Ponce', 'F', '1993-07-18', '2018-09-22', 37500.00, 95.00, 'Especialista', 'EMP023', '8000'),
('EMP039', 'Gustavo Luna', 'M', '1995-12-28', '2020-10-12', 36000.00, 80.00, 'Secretario', 'EMP024', '9000'),
('EMP040', 'Diana Espinoza', 'F', '1992-03-10', '2017-06-30', 39000.00, 110.00, 'Analista', 'EMP025', 'A000');

-- Asignar directores a cada departamento
UPDATE DEPARTAMENTO SET codDirector = 'EMP001' WHERE codDepto = '1000';
UPDATE DEPARTAMENTO SET codDirector = 'EMP002' WHERE codDepto = '2000';
UPDATE DEPARTAMENTO SET codDirector = 'EMP003' WHERE codDepto = '3000';
UPDATE DEPARTAMENTO SET codDirector = 'EMP004' WHERE codDepto = '4000';
UPDATE DEPARTAMENTO SET codDirector = 'EMP005' WHERE codDepto = '5000';
UPDATE DEPARTAMENTO SET codDirector = 'EMP006' WHERE codDepto = '6000';
UPDATE DEPARTAMENTO SET codDirector = 'EMP007' WHERE codDepto = '7000';
UPDATE DEPARTAMENTO SET codDirector = 'EMP008' WHERE codDepto = '8000';
UPDATE DEPARTAMENTO SET codDirector = 'EMP009' WHERE codDepto = '9000';
UPDATE DEPARTAMENTO SET codDirector = 'EMP010' WHERE codDepto = 'A000';





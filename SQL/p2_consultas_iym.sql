/* Consultas para la base de datos empresa parte 2
Nombre: Ivonne Mendoza
mail: ivonne@imendoza.io
*/

USE EMPRESA;

-- 3. Obtener los datos completos de los empleados.
select * 
from DEPARTAMENTO; 

-- 4. Obtener los datos completos de los departamentos.
SELECT * 
FROM EMPLEADO;

-- 5. Obtener los datos de los empleados con cargo 'Secretaria’ / ‘Secretario’.
SELECT * 
FROM EMPLEADO
WHERE cargoE in ('Secretario', 'Secretaria');

-- 6. Obtener el nombre y salario de los empleados.
select 
	nomEmp
	, saLEmp
from EMPLEADO;

-- 7. Obtener los datos de los vendedores, ordenado por nombre.
SELECT *
FROM EMPLEADO 
WHERE cargoE = 'Vendedor'
order by nomEmp desc;

-- 8. Listar el nombre de los departamentos, ordenado por nombre y ciudad en orden ascendente,
SELECT 
	nombreDpto
	, Ciudad
FROM DEPARTAMENTO
ORDER BY nombreDpto asc, Ciudad desc;

-- 9. Obtener el nombre y cargo de los empleados, ordenado por cargo y salario
SELECT 
	nomEmp
	, cargoE  
from EMPLEADO
order by cargoE, salEmp asc;

-- 10. Listar el nombre del departamento cuya suma de salarios sea la más alta.
SELECT 
    d.nombreDpto
    , SUM(e.salEmp) AS suma_salarios
FROM DEPARTAMENTO d
INNER JOIN EMPLEADO e ON d.codDepto = e.codDepto
GROUP BY d.codDepto, d.nombreDpto
ORDER BY suma_salarios DESC
LIMIT 1;

-- 11. Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión.
SELECT 
	e.nomEmp
	, e.salEmp
	, e.comisionE 
FROM EMPLEADO e 
INNER JOIN DEPARTAMENTO d ON e.codDepto = d.codDepto 
where e.codDepto = '2000'
order by e.comisionE desc;

-- 12. Listar todas las comisiones que sean diferentes, ordenada por valor.
select distinct e.comisionE 
from EMPLEADO e 
ORDER BY comisionE desc;

-- 13. Listar los diferentes salarios.
select DISTINCT e.salEmp
from EMPLEADO e;

-- 14. Obtener el valor total a pagar que resulta de sumar a los empleados del departamento ‘3000’ una bonificación de 5.000€, en orden alfabético del empleado.
SELECT 
	e.nomEmp
	, (e.salEmp + 5000)
FROM EMPLEADO e 
WHERE e.codDepto = '3000'
order by e.nomEmp asc;

-- 15. Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
select * from EMPLEADO e 
WHERE e.comisionE > e.salEmp;

-- 16. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
SELECT * 
FROM EMPLEADO e
WHERE e.comisionE <= (e.salEmp * 0.30);

-- 17. Listar los empleados cuyo salario es menor o igual que el 40% de su comisión.
SELECT * 
FROM EMPLEADO e
WHERE e.salEmp <= (e.comisionE * 0.40);


-- 18. Listar el salario, la comisión, el salario total (salario + comisión), documento de identidad del empleado y nombre, de aquellos empleados que tienen comisión superior a 10.000 €,
-- ordenar el informe por el número del documento de identidad.
select 
	salEmp
	, comisionE
	, (salEMp + comisionE)
	, nDIEmp
	, nomEmp
from EMPLEADO e 
where e.comisionE  > 10000
order by e.nDIEmp asc;

-- 19. Hallar el nombre de los empleados que tienen un salario superior a 50.000 €, y tienen como jefe al
-- empleado con documento de identidad '31.840.269’.
-- Comentario iym: no tengo documentos de identidad guardados en esta tabla, solo codigos internos para identificar empleados.
SELECT 
	nomEmp
from EMPLEADO e 
where e.salEmp > 50000 and e.jefeID = 'EMP001';


-- 20. Obtener los nombres de los departamentos que no sean 'VENTAS', 'INVESTIGACIÓN', ni 'MANTENIMIENTO', ordenados por ciudad.
select * 
from DEPARTAMENTO d 
where d.nombreDpto not in ('Ventas', 'Investigacion', 'Mantenimiento')
order by Ciudad asc;

-- 21. Listar los datos de los empleados cuyo nombre (inicia por la letra 'M’), AND (su salario es mayor a 40.000 OR reciben comisión) AND y trabajan para el departamento de 'VENTAS’.
select *
from EMPLEADO e 
where e.nomEmp  like 'M%'
	and (e.salEmp > 40000) or (e.comisionE is not null and e.comisionE > 0)
	and e.codDepto = '3000'; -- ventas

-- 22. Obtener nombre, salario y comisión de los empleados que reciben un salario situado entre la mitad de la comisión la propia comisión.
SELECT 
    e.nomEmp,
    e.salEmp,
    e.comisionE
FROM EMPLEADO e
WHERE e.salEmp BETWEEN (e.comisionE / 2) AND e.comisionE
    AND e.comisionE IS NOT NULL
    AND e.comisionE > 0
ORDER BY e.nomEmp;

--  23.Entregar el salario más alto de la empresa.
SELECT 
    e.nomEmp
	,e.salEmp AS Salario_max
FROM EMPLEADO e
WHERE e.salEmp = (SELECT MAX(salEmp) FROM EMPLEADO);


-- 24. Entregar el total a pagar por comisiones, y el número de empleados que las reciben.
select 
	SUM(comisionE) as total_comision,
	COUNT(comisionE) as empleados_comisiones
from EMPLEADO e;


-- 25. Hallar el salario más alto, el más bajo y la diferencia entre ellos.
SELECT 
	MAX(e.salEmp)
	, MIN(e.salEmp)
	, (MAX(e.salEmp) - MIN(e.salEmp)) AS diferencia_salario
FROM EMPLEADO e;


-- 26. Entregar el número de empleados de sexo femenino y de sexo masculino, por departamento
SELECT
	d.codDepto 
	, d.nombreDpto 
	, sum(case when e.sexEmp = 'F' then 1 else 0 end) as emp_fem
	, sum(case when e.sexEmp = 'M' then 1 else 0 end) as emp_masc
FROM EMPLEADO e 
INNER JOIN DEPARTAMENTO d ON e.codDepto = d.codDepto 
GROUP BY d.codDepto, d.nombreDpto;

-- 27. Hallar el salario promedio por departamento.
select 
	d.codDepto 
	, ROUND(AVG(e.salEmp), 2)
from EMPLEADO e 
join DEPARTAMENTO d on e.codDepto = d.codDepto
group by d.codDepto ;

-- 28. Entregar un reporte con el número de cargos en cada departamento y cual es el promedio de salario de cada uno. Indicar el nombre del departamento en el resultado.
SELECT 
	d.nombreDpto 
	, COUNT(DISTINCT e.cargoE) AS cargos_depto
	, ROUND(AVG(e.salEmp ), 2) AS promedio_salario
FROM EMPLEADO e 
INNER JOIN DEPARTAMENTO d ON e.codDepto = d.codDepto
GROUP BY d.nombreDpto 
ORDER BY d.nombreDpto ASC;

-- 29. Calcular el total de salarios por departamento.
SELECT 
    COALESCE(d.codDepto, 'TOTAL GENERAL') AS codDepto
    , SUM(e.salEmp) AS suma_salarios
FROM EMPLEADO e 
JOIN DEPARTAMENTO d ON e.codDepto = d.codDepto
GROUP BY d.codDepto WITH ROLLUP;


-- 30. Hallar la suma de salarios más alta, crear para ello una vista.

DROP VIEW IF EXISTS VW_SUMA_SALARIOS;

-- Crear vista con RANK para identificar el máximo
CREATE OR REPLACE VIEW VW_SUMA_SALARIOS AS
WITH cte AS (
    SELECT 
        d.codDepto,
        d.nombreDpto,
        SUM(e.salEmp) AS suma_salarios,
        RANK() OVER (ORDER BY SUM(e.salEmp) DESC) AS rango
    FROM EMPLEADO e
    JOIN DEPARTAMENTO d ON e.codDepto = d.codDepto
    GROUP BY d.codDepto, d.nombreDpto
)
SELECT 
    codDepto,
    nombreDpto,
    suma_salarios
FROM cte
WHERE rango = 1;

-- Consultar la vista
SELECT * FROM VW_SUMA_SALARIOS;


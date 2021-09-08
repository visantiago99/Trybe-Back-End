SELECT COUNTRY_NAME AS 'País', IF(REGION_ID = 1, 'incluído', 'não incluído') AS 'Status Inclusão' FROM hr.countries;

---

SELECT JOB_TITLE AS Cargo, 
CASE 
WHEN MAX_SALARY BETWEEN 5000 AND 10000 THEN 'Baixo'
WHEN MAX_SALARY BETWEEN 10001 AND 20000 THEN 'Médio'
WHEN MAX_SALARY BETWEEN 20001 AND 30000 THEN 'Alto'
WHEN MAX_SALARY > 30000 THEN 'Altíssimo' END AS 'Nível'
FROM hr.jobs
ORDER BY Cargo; 

--

SELECT JOB_TITLE AS Cargo,
MAX_SALARY - MIN_SALARY AS 'Diferença entre salários máximo e mínimo'
FROM hr.jobs
ORDER BY `Diferença entre salários máximo e mínimo`, Cargo;

--

SELECT A.JOB_TITLE AS Cargo, ROUND(AVG(B.SALARY), 2) AS 'Média salarial',
CASE
WHEN ROUND(AVG(B.SALARY), 2) BETWEEN 2000 AND 5800 THEN 'Júnior'
WHEN ROUND(AVG(B.SALARY), 2) BETWEEN 5801 AND 7500 THEN 'Pleno'
WHEN ROUND(AVG(B.SALARY), 2) BETWEEN 7501 AND 10500 THEN 'Sênior'
WHEN ROUND(AVG(B.SALARY), 2) > 10500 THEN 'CEO' END
AS 'Senioridade'
FROM hr.jobs AS A
INNER JOIN hr.employees AS B
ON A.JOB_ID = B.JOB_ID
GROUP BY Cargo
ORDER BY ROUND(AVG(B.SALARY), 2), Cargo;

--

SELECT JOB_TITLE AS Cargo,
MAX_SALARY - MIN_SALARY AS 'Variação Salarial',
ROUND(AVG(MIN_SALARY) / 12, 2) AS 'Média mínima mensal',
ROUND(AVG(MAX_SALARY) / 12, 2) AS 'Média máxima mensal' FROM hr.jobs
GROUP BY JOB_ID
ORDER BY 'Variação Salarial', Cargo;


-- 

SELECT CONCAT(A.first_name, ' ', A.last_name) AS 'Nome completo',
B.JOB_TITLE AS Cargo,
C.START_DATE AS 'Data de início do cargo',
D.DEPARTMENT_NAME AS 'Departamento'
FROM hr.employees AS A
INNER JOIN hr.jobs AS B
INNER JOIN hr.job_history AS C
INNER JOIN hr.departments AS D
ON B.JOB_ID = C.JOB_ID
AND A.EMPLOYEE_ID = C.EMPLOYEE_ID
AND C.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY `Nome completo` DESC, Cargo;

-- 

SELECT UCASE(CONCAT(E.first_name, ' ', E.last_name)) AS 'Nome completo',
JH.START_DATE AS 'Data de início',
E.SALARY AS 'Salário'
FROM hr.employees AS E
INNER JOIN hr.job_history AS JH
ON E.EMPLOYEE_ID = JH.EMPLOYEE_ID
WHERE MONTH(JH.START_DATE) IN(1, 2, 3)
ORDER BY `Nome completo`, `Data de início`;

--   

SELECT C.ContactName AS 'Nome de contato',
S.ShipperName AS 'Empresa que fez o envio',
O.OrderDate AS 'Data do pedido'
FROM w3schools.customers AS C
INNER JOIN w3schools.shippers AS S
INNER JOIN w3schools.orders AS O
ON C.CustomerID = O.CustomerID
AND S.ShipperID = O.ShipperID
WHERE S.ShipperName = 'Speedy Express' OR S.ShipperName = 'United Package'
ORDER BY C.ContactName, S.ShipperName, O.OrderDate;

--    

SELECT CONCAT(E.FirstName, ' ', E.LastName) AS 'Nome completo',
COUNT(O.OrderID) AS 'Total de pedidos'
FROM w3schools.employees AS E
INNER JOIN w3schools.orders AS O
ON E.EmployeeID = O.EmployeeID
GROUP BY E.EmployeeID
ORDER BY COUNT(O.OrderID);

--

SELECT P.ProductName AS 'Produto',
MIN(OD.Quantity) AS 'Mínima',
MAX(OD.Quantity) AS 'Máxima',
ROUND(AVG(OD.Quantity), 2) AS 'Média'
FROM w3schools.products AS P
INNER JOIN w3schools.order_details AS OD
ON P.ProductID = OD.ProductID
GROUP BY P.ProductName
HAVING AVG(OD.Quantity) > 20.00
ORDER BY ROUND(AVG(OD.Quantity), 2), P.ProductName;

--

SELECT C.ContactName AS 'Nome',
C.Country AS 'País',
COUNT(*) AS 'Número de compatriotas'
FROM w3schools.customers AS C,
w3schools.customers AS B
WHERE C.Country = B.Country AND C.ContactName <> B.ContactName
GROUP BY `Nome`, `País`
ORDER BY `Nome`;

--

SELECT CONCAT(A.FIRST_NAME, ' ', A.LAST_NAME) AS 'Nome completo funcionário 1',
A.SALARY AS 'Salário funcionário 1',
A.PHONE_NUMBER AS 'Telefone funcionário 1',
CONCAT(B.FIRST_NAME, ' ', B.LAST_NAME) AS 'Nome completo funcionário 2',
B.SALARY AS 'Salário funcionário 2',
B.PHONE_NUMBER AS 'Telefone funcionário 2'
FROM hr.employees AS A,
hr.employees AS B
WHERE A.JOB_ID = B.JOB_ID AND A.EMPLOYEE_ID <> B.EMPLOYEE_ID
ORDER BY `Nome completo funcionário 1`, `Nome completo funcionário 2`;

-- 

SELECT P.ProductName AS 'Produto',
P.Price AS 'Preço'
FROM w3schools.products AS P
INNER JOIN w3schools.order_details AS OD
ON P.ProductID = OD.ProductID
WHERE OD.Quantity > 80
ORDER BY `Preço`;

--

SELECT Country AS 'País' FROM w3schools.customers
UNION 
SELECT Country AS 'País' FROM w3schools.suppliers
ORDER BY `País`
LIMIT 5

--

USE hr;
DELIMITER $$ 
CREATE PROCEDURE buscar_media_por_cargo(IN cargo VARCHAR(50))
BEGIN
SELECT ROUND(AVG(E.SALARY), 2) AS 'Média salarial' FROM hr.employees AS E
INNER JOIN hr.jobs AS J
ON E.JOB_ID = J.JOB_ID
WHERE J.JOB_TITLE = cargo;
END $$
DELIMITER ;

-- 

USE hr;
DELIMITER $$
CREATE FUNCTION buscar_quantidade_de_empregos_por_funcionario(emailFuncionario VARCHAR(50))
RETURNS INT READS SQL DATA 
BEGIN
DECLARE quantity DOUBLE;
SELECT COUNT(E.EMPLOYEE_ID) FROM job_history AS JH
INNER JOIN employees AS E
ON JH.EMPLOYEE_ID = E.EMPLOYEE_ID
WHERE E.EMAIL = emailFuncionario
INTO quantity;
RETURN quantity;
END $$
DELIMITER ;

-- 


USE w3schools;
DELIMITER $$

CREATE TRIGGER trigger_insert_order_date
BEFORE INSERT ON w3schools.orders
FOR EACH ROW
BEGIN
SET NEW.OrderDate = Date(NOW());
END $$

DELIMITER ;
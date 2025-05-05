
-- 1. List the names of all products
SELECT nombre FROM producto;

-- 2. List the names and prices of all products
SELECT nombre, precio FROM producto;

-- 3. List all columns of the 'producto' table
SELECT * FROM producto;

-- 4. List product names, prices in euros and in USD (assume 1€ = 1.1 USD)
SELECT nombre, precio, precio * 1.1 AS precio_usd FROM producto;

-- 5. Same as above, using aliases: product name, euros, dollars
SELECT nombre AS "product name", precio AS euros, precio * 1.1 AS dollars FROM producto;

-- 6. List names and prices, converting product names to uppercase
SELECT UPPER(nombre) AS nombre, precio FROM producto;

-- 7. List names and prices, converting product names to lowercase
SELECT LOWER(nombre) AS nombre, precio FROM producto;

-- 8. List manufacturer names and the first two uppercase letters of their names
SELECT nombre, UPPER(LEFT(nombre, 2)) AS initials FROM fabricante;

-- 9. List product names and their prices rounded to the nearest integer
SELECT nombre, ROUND(precio) AS rounded_price FROM producto;

-- 10. List product names and their prices truncated (no decimal digits)
SELECT nombre, TRUNCATE(precio, 0) AS truncated_price FROM producto;

-- 11. List manufacturer codes that have products
SELECT codigo_fabricante FROM producto;

-- 12. Same as above but removing duplicates
SELECT DISTINCT codigo_fabricante FROM producto;

-- 13. List manufacturer names in ascending order
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. List manufacturer names in descending order
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. List product names ordered by name ASC, then price DESC
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. Return the first 5 rows from 'fabricante'
SELECT * FROM fabricante LIMIT 5;

-- 17. Return 2 rows starting from the 4th row from 'fabricante'
SELECT * FROM fabricante LIMIT 3, 2;

-- 18. List the name and price of the cheapest product (ORDER BY + LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. List the name and price of the most expensive product (ORDER BY + LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20. List names of products with manufacturer code 2
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21. List product name, price, and manufacturer name (JOIN)
SELECT producto.nombre, producto.precio, fabricante.nombre AS manufacturer_name
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 22. Same as above, ordered by manufacturer name
SELECT producto.nombre, producto.precio, fabricante.nombre AS manufacturer_name
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY fabricante.nombre;

-- 23. List product code, product name, manufacturer code and name
SELECT producto.codigo AS product_code, producto.nombre AS product_name,
       fabricante.codigo AS manufacturer_code, fabricante.nombre AS manufacturer_name
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 24. Cheapest product with manufacturer name
SELECT producto.nombre, producto.precio, fabricante.nombre AS manufacturer_name
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio ASC LIMIT 1;

-- 25. Most expensive product with manufacturer name
SELECT producto.nombre, producto.precio, fabricante.nombre AS manufacturer_name
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
ORDER BY producto.precio DESC LIMIT 1;

-- 26. List all products from manufacturer 'Lenovo'
SELECT producto.*
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Lenovo';

-- 27. List all products from 'Crucial' with price > 200
SELECT producto.*
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;

-- 28. List all products from Asus, Hewlett-Packard, and Seagate (without IN)
SELECT producto.*
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre = 'Asus'
   OR fabricante.nombre = 'Hewlett-Packard'
   OR fabricante.nombre = 'Seagate';

-- 29. Same as above, using IN
SELECT producto.*
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30. List name and price of products whose manufacturer name ends with 'e'
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%e';

-- 31. List name and price of products whose manufacturer name contains 'w'
SELECT producto.nombre, producto.precio
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE fabricante.nombre LIKE '%w%';

-- 32. List products with price >= 180€, ordered by price DESC and name ASC
SELECT producto.nombre, producto.precio, fabricante.nombre AS manufacturer
FROM producto
JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo
WHERE producto.precio >= 180
ORDER BY producto.precio DESC, producto.nombre ASC;

-- 33. List all students' first surname, second surname, and name ordered alphabetically
SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, nombre;

-- 34. Find students without a registered phone number
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;

-- 35. List students born in 1999
SELECT nombre, apellido1, apellido2, fecha_nacimiento
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 36. List professors without a phone number and whose NIF ends with 'K'
SELECT nombre, apellido1, apellido2, nif
FROM persona
WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

-- 37. List subjects taught in the first semester of the third course of degree with ID 7
SELECT nombre
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 38. List professors along with the name of their department
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS department_name
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor
JOIN departamento d ON pr.id_departamento = d.id
ORDER BY p.apellido1, p.apellido2, p.nombre;

-- 39. List subject name, school year start and end years for student with NIF 26902806M
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin
FROM persona p
JOIN alumno_se_matricula_asignatura m ON p.id = m.id_alumno
JOIN asignatura a ON m.id_asignatura = a.id
JOIN curso_escolar ce ON m.id_curso_escolar = ce.id
WHERE p.nif = '26902806M';

-- 40. List departments with professors teaching in Computer Engineering (Plan 2015)
SELECT DISTINCT d.nombre AS department_name
FROM asignatura a
JOIN grado g ON a.id_grado = g.id
JOIN profesor pr ON a.id_profesor = pr.id_profesor
JOIN departamento d ON pr.id_departamento = d.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 41. List students enrolled in any subject during academic year 2018/2019
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2
FROM persona p
JOIN alumno_se_matricula_asignatura m ON p.id = m.id_alumno
JOIN curso_escolar ce ON m.id_curso_escolar = ce.id
WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

-- 42. List all professors and their departments, including those without any department
SELECT d.nombre AS department_name, p.apellido1, p.apellido2, p.nombre
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN departamento d ON pr.id_departamento = d.id
WHERE p.tipo = 'profesor'
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

-- 43. List professors without a department
SELECT p.nombre, p.apellido1, p.apellido2
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor
WHERE p.tipo = 'profesor' AND pr.id_departamento IS NULL;

-- 44. List departments without professors
SELECT d.nombre
FROM departamento d
LEFT JOIN profesor pr ON d.id = pr.id_departamento
WHERE pr.id_profesor IS NULL;

-- 45. List professors who do not teach any subject
SELECT p.nombre, p.apellido1, p.apellido2
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
WHERE a.id IS NULL;

-- 46. List subjects without a professor assigned
SELECT nombre
FROM asignatura
WHERE id_profesor IS NULL;

-- 47. List departments that have not taught any subject in any academic year
SELECT d.nombre
FROM departamento d
LEFT JOIN profesor pr ON d.id = pr.id_departamento
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
WHERE a.id IS NULL;

-- 48. Count total number of students
SELECT COUNT(*) AS total_students
FROM persona
WHERE tipo = 'alumno';

-- 49. Count number of students born in 1999
SELECT COUNT(*) AS students_1999
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 50. Count number of professors in each department (only those with professors)
SELECT d.nombre AS department, COUNT(pr.id_profesor) AS num_professors
FROM profesor pr
JOIN departamento d ON pr.id_departamento = d.id
GROUP BY d.nombre
ORDER BY num_professors DESC;

-- 51. Count number of professors in all departments (including those without professors)
SELECT d.nombre AS department, COUNT(pr.id_profesor) AS num_professors
FROM departamento d
LEFT JOIN profesor pr ON d.id = pr.id_departamento
GROUP BY d.nombre
ORDER BY num_professors DESC;

-- 52. List all degrees and number of associated subjects
SELECT g.nombre AS degree, COUNT(a.id) AS num_subjects
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
ORDER BY num_subjects DESC;

-- 53. List all products from manufacturer 'Lenovo' (without JOIN)
SELECT *
FROM producto
WHERE codigo_fabricante = (
    SELECT codigo
    FROM fabricante
    WHERE nombre = 'Lenovo'
);

-- 54. List all products with the same price as Lenovo's most expensive product
SELECT *
FROM producto
WHERE precio = (
    SELECT MAX(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Lenovo'
    )
);

-- 55. List the name of the most expensive product from Lenovo
SELECT nombre
FROM producto
WHERE codigo_fabricante = (
    SELECT codigo
    FROM fabricante
    WHERE nombre = 'Lenovo'
)
ORDER BY precio DESC
LIMIT 1;

-- 56. List Asus products priced above their own average
SELECT *
FROM producto
WHERE codigo_fabricante = (
    SELECT codigo
    FROM fabricante
    WHERE nombre = 'Asus'
)
AND precio > (
    SELECT AVG(precio)
    FROM producto
    WHERE codigo_fabricante = (
        SELECT codigo
        FROM fabricante
        WHERE nombre = 'Asus'
    )
);

-- 57. List code and name of manufacturers who have products
SELECT DISTINCT f.codigo, f.nombre
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 58. List all manufacturers along with their products (including those without products)
SELECT f.nombre AS manufacturer, p.nombre AS product
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 59. List only those manufacturers who have no products
SELECT f.nombre
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.codigo IS NULL;

-- 60. List all degrees and number of subjects they have, only if more than 40 subjects
SELECT g.nombre AS degree, COUNT(a.id) AS num_subjects
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
HAVING COUNT(a.id) > 40;

-- 61. List the total number of credits per subject type and degree
SELECT g.nombre AS degree, a.tipo AS subject_type, SUM(a.creditos) AS total_credits
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre, a.tipo;

-- 62. Number of students enrolled per academic year
SELECT ce.anyo_inicio, COUNT(DISTINCT m.id_alumno) AS num_students
FROM curso_escolar ce
LEFT JOIN alumno_se_matricula_asignatura m ON ce.id = m.id_curso_escolar
GROUP BY ce.anyo_inicio
ORDER BY ce.anyo_inicio;

-- 63. Number of subjects taught by each professor (include those with zero)
SELECT p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.id) AS num_subjects
FROM profesor p
JOIN persona pe ON p.id_profesor = pe.id
LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor
GROUP BY p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2
ORDER BY num_subjects DESC;

-- 64. All data from the youngest student
SELECT *
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;

-- 65. Professors with a department assigned but not teaching any subject
SELECT pe.nombre, pe.apellido1, pe.apellido2
FROM profesor p
JOIN persona pe ON p.id_profesor = pe.id
LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor
WHERE a.id IS NULL;

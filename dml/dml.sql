
--Atualizar dados

UPDATE Aluno
SET email = REPLACE(email, 'email.com', 'universidade.edu.br')
WHERE email LIKE '%@email.com';

UPDATE Livro
SET titulo = 'Algoritmos e Lógica de Programação'
WHERE id_livro = 1;

UPDATE Multa
SET valor = 3.00
WHERE valor > 3.00;

--Excluir dados isolados

DELETE FROM Aluno
WHERE id_aluno NOT IN (
    SELECT DISTINCT id_aluno FROM Emprestimo
);

DELETE FROM Livro
WHERE id_livro NOT IN (
    SELECT DISTINCT id_livro FROM Emprestimo
);

DELETE FROM Curso
WHERE id_curso NOT IN (
    SELECT DISTINCT id_curso FROM Aluno
);


--Consultas


-- Alunos do curso 1 OU 2 E que não têm "universidade.edu.br" no email
SELECT * FROM Aluno
WHERE (id_curso = 1 OR id_curso = 2)
AND email NOT LIKE '%@universidade.edu.br';


-- Multas com valor maior que 2 e menor que 5
SELECT * FROM Multa
WHERE valor > 2 AND valor < 5;


-- Livros cujo título começa com "A"
SELECT * FROM Livro
WHERE titulo LIKE 'A%';


-- Alunos que pertencem aos cursos 1, 3 ou 5
SELECT * FROM Aluno
WHERE id_curso IN (1, 3, 5);


-- Mostrar nome do aluno e título do livro que ele pegou emprestado
SELECT Aluno.nome, Livro.titulo
FROM Emprestimo
JOIN Aluno ON Emprestimo.id_aluno = Aluno.id_aluno
JOIN Livro ON Emprestimo.id_livro = Livro.id_livro;


-- Aluno, livro, categoria do livro
SELECT Aluno.nome AS aluno, Livro.titulo AS livro, CategoriaLivro.nome AS categoria
FROM Emprestimo
JOIN Aluno ON Emprestimo.id_aluno = Aluno.id_aluno
JOIN Livro ON Emprestimo.id_livro = Livro.id_livro
JOIN CategoriaLivro ON Livro.id_categoria = CategoriaLivro.id_categoria;


-- Quantidade de alunos por curso
SELECT Curso.nome, COUNT(Aluno.id_aluno) AS total_alunos
FROM Curso
JOIN Aluno ON Curso.id_curso = Aluno.id_curso
GROUP BY Curso.nome;


-- Mostrar cursos com mais de 1 aluno
SELECT Curso.nome, COUNT(Aluno.id_aluno) AS total_alunos
FROM Curso
JOIN Aluno ON Curso.id_curso = Aluno.id_curso
GROUP BY Curso.nome
HAVING COUNT(Aluno.id_aluno) > 1;


-- Listar todos os livros ordenados pelo ano de publicação (mais novos primeiro)
SELECT * FROM Livro
ORDER BY ano_publicacao DESC;


-- Estatísticas de valor das multas
SELECT 
  MAX(valor) AS maior_multa,
  MIN(valor) AS menor_multa,
  AVG(valor) AS media_multa,
  SUM(valor) AS total_multas
FROM Multa;
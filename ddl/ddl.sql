-- Tabela de Cursos
CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela de Alunos
CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Tabela de Categorias de Livros
CREATE TABLE CategoriaLivro (
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(50)
);

-- Tabela de Livros
CREATE TABLE Livro (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(200),
    autor VARCHAR(100),
    ano_publicacao INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES CategoriaLivro(id_categoria)
);

-- Tabela de Empréstimos
CREATE TABLE Emprestimo (
    id_emprestimo INT PRIMARY KEY,
    id_aluno INT,
    id_livro INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
);

-- Tabela de Multas
CREATE TABLE Multa (
    id_multa INT PRIMARY KEY,
    id_emprestimo INT,
    valor DECIMAL(10,2),
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimo(id_emprestimo)
);


--Inserir Dados

INSERT INTO Curso VALUES 
(1, 'Engenharia de Software'),
(2, 'Direito'),
(3, 'Medicina'),
(4, 'Arquitetura'),
(5, 'Administração'),
(6, 'Matemática'),
(7, 'História'),
(8, 'Física'),
(9, 'Biologia'),
(10, 'Psicologia');

INSERT INTO Aluno VALUES 
(1, 'Ana Silva', 'ana@email.com', 1),
(2, 'Bruno Costa', 'bruno@email.com', 2),
(3, 'Carlos Souza', 'carlos@email.com', 3),
(4, 'Daniela Lima', 'daniela@email.com', 4),
(5, 'Eduardo Alves', 'eduardo@email.com', 5),
(6, 'Fernanda Rocha', 'fernanda@email.com', 6),
(7, 'Gustavo Mendes', 'gustavo@email.com', 7),
(8, 'Helena Borges', 'helena@email.com', 8),
(9, 'Igor Teixeira', 'igor@email.com', 9),
(10, 'Juliana Martins', 'juliana@email.com', 10);

INSERT INTO CategoriaLivro VALUES 
(1, 'Tecnologia'),
(2, 'Ciências Humanas'),
(3, 'Saúde'),
(4, 'Arquitetura e Design'),
(5, 'Negócios'),
(6, 'Matemática'),
(7, 'História'),
(8, 'Física'),
(9, 'Biologia'),
(10, 'Psicologia');

INSERT INTO Livro VALUES 
(1, 'Algoritmos e Programação', 'José da Silva', 2018, 1),
(2, 'Introdução ao Direito', 'Maria Oliveira', 2015, 2),
(3, 'Anatomia Humana', 'Dr. Luiz Souza', 2020, 3),
(4, 'Design de Interiores', 'Ana Paula', 2016, 4),
(5, 'Gestão de Empresas', 'Carlos Lima', 2017, 5),
(6, 'Álgebra Linear', 'João Mendes', 2019, 6),
(7, 'História do Brasil', 'Fernanda Costa', 2014, 7),
(8, 'Física Moderna', 'Lucas Tavares', 2021, 8),
(9, 'Genética Básica', 'Patrícia Rocha', 2013, 9),
(10, 'Psicologia Social', 'Rafael Nunes', 2019, 10);

INSERT INTO Emprestimo VALUES 
(1, 1, 1, '2025-04-01', '2025-04-10'),
(2, 2, 2, '2025-04-02', '2025-04-12'),
(3, 3, 3, '2025-04-03', '2025-04-15'),
(4, 4, 4, '2025-04-04', '2025-04-11'),
(5, 5, 5, '2025-04-05', '2025-04-13'),
(6, 6, 6, '2025-04-06', '2025-04-14'),
(7, 7, 7, '2025-04-07', '2025-04-15'),
(8, 8, 8, '2025-04-08', '2025-04-16'),
(9, 9, 9, '2025-04-09', '2025-04-18'),
(10, 10, 10, '2025-04-10', '2025-04-19');

INSERT INTO Multa VALUES 
(1, 1, 5.00),
(2, 2, 0.00),
(3, 3, 2.50),
(4, 4, 0.00),
(5, 5, 3.00),
(6, 6, 0.00),
(7, 7, 1.00),
(8, 8, 0.00),
(9, 9, 4.00),
(10, 10, 0.00);
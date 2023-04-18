CREATE DATABASE IF NOT EXISTS BIBLIOTECA_ESTACIO;

USE BIBLIOTECA_ESTACIO;


CREATE TABLE livros (
  codigo_livro INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100),
  ano_publicacao YEAR,
  editora_id INT,
  autores INT,
  data_aquisicao DATE,
  aquisicao VARCHAR(15), 
  custo_aquisicao DECIMAL(8,2),
  genero_livro INT, 
  descricao_livro VARCHAR(100),
  ISBN VARCHAR(25),
  status BOOLEAN 
);

CREATE TABLE editoras (
  codigo_editora INT AUTO_INCREMENT PRIMARY KEY,
  nome_editora VARCHAR(50)
);

CREATE TABLE generos (
  codigo_genero INT AUTO_INCREMENT PRIMARY KEY,
  nome_genero VARCHAR(30)
);

CREATE TABLE livro_genero(
	codigo_livro int,
	codigo_genero int,
	FOREIGN KEY (codigo_livro) REFERENCES livros(codigo_livro),
	FOREIGN KEY (codigo_genero) REFERENCES generos(codigo_genero)
);
	
CREATE TABLE livro_editoras(
	codigo_livro int, 
	codigo_editora int,
	FOREIGN KEY (codigo_livro) REFERENCES livros(codigo_livro),
	FOREIGN KEY (codigo_editora) REFERENCES editoras(codigo_editora)
);	

CREATE TABLE autores (
  codigo_autor INT AUTO_INCREMENT PRIMARY KEY,
  nome_autor VARCHAR(50),
  nacionalidade VARCHAR(50),
  codigo_livro INT,
  FOREIGN KEY (codigo_livro) REFERENCES livros(codigo_livro)
);

create table livros_autores(
  codigo_livro int,
  codigo_autor int,
  FOREIGN KEY (codigo_livro) REFERENCES livros(codigo_livro),
  FOREIGN KEY (codigo_autor) REFERENCES autores(codigo_autor)
  );
    
CREATE TABLE usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  codigo_usuario INT NOT NULL,
  nome VARCHAR(100),
  sobrenome VARCHAR(30),
  telefone INT,
  nome_rua VARCHAR(100),
  numero_casa INT,
  complemento VARCHAR(20),
  cep VARCHAR(8),
  ativo BOOLEAN,
  CONSTRAINT unique_codigo_usuario UNIQUE (codigo_usuario)
);


CREATE TABLE emprestimos (
  emprestimo_id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_usuario INT,
  codigo_livro INT,
  data_inicio DATE,
  data_prev_devolucao DATE,
  data_devolucao DATE,
  FOREIGN KEY (codigo_usuario) REFERENCES usuarios(codigo_usuario),
  FOREIGN KEY (codigo_livro) REFERENCES livros(codigo_livro)
);

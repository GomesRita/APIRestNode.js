-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14/07/2024 às 23:40
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `biblioteca`
--

-- --------------------------------------------------------

--
-- Verifica se a tabela autor não existe antes de criá-la
DROP TABLE IF EXISTS `autor`;

-- Cria a tabela autor
CREATE TABLE `autor` (
  `CodAutor` int(11) NOT NULL,
  `NomeAutor` text NOT NULL,
  PRIMARY KEY (`CodAutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `autor`
--

INSERT INTO `autor` (`CodAutor`, `NomeAutor`) VALUES
(1, 'Leonardo Soares e Silva'),
(2, 'Gabriel Fortes'),
(3, 'Joice Barbosa Mendes'),
(4, 'Rafael da Silva Muniz'),
(5, 'Carlos Emilio Padilla Severo'),
(6, 'Sérgio Campelo'),
(7, 'Nelson Fabbri Gerbelli'),
(8, 'Valéria Helena P. Gerbelli'),
(9, 'Vitor Gonçalves'),
(10, 'Luiz Roque');

-- --------------------------------------------------------

--
-- Estrutura para tabela `editora`
--
DROP TABLE IF EXISTS `editora`;
CREATE TABLE `editora` (
  `CodEditora` int(11) NOT NULL,
  `NomeEditora` text NOT NULL,
  `CodTelefone` int(11) NOT NULL,
  `Email` text NOT NULL,
  `LocalEditora` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `editora`
--

INSERT INTO `editora` (`CodEditora`, `NomeEditora`, `CodTelefone`, `Email`, `LocalEditora`) VALUES
(1, 'Casa do Código', 0, 'casadocodigo@gmail.com', 'São Paulo'),
(2, 'Moderna', 0, 'Moderna@gmail.com', 'Natal'),
(3, 'Saraiva', 0, 'saraiva@gmail.com', 'São Paulo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimo`
--
DROP TABLE IF EXISTS `emprestimo`;
CREATE TABLE `emprestimo` (
  `DataEmprestimo` date NOT NULL,
  `DataDevolucao` date NOT NULL,
  `CodLivro` int(11) NOT NULL,
  `CodLeitor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `leitors`
--
DROP TABLE IF EXISTS `leitors`;
CREATE TABLE `leitors` (
  `CodLeitor` int(11) NOT NULL,
  `NomeLeitor` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `situacao` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_criacao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `leitors`
--

INSERT INTO `leitors` (`CodLeitor`, `NomeLeitor`, `Email`, `situacao`, `senha`, `data_criacao`) VALUES
(2, 'Maria Rita', 'emailRita@gmail.com', 'regular', '123456', '2024-07-14 17:56:04'),
(3, 'Maria Rita', 'emailRita@gmail.com', 'regular', '123456', '2024-07-14 17:57:15'),
(4, 'Maria Rita', 'emailMaria@gmail.com', 'regular', '123456', '2024-07-14 18:24:17'),
(5, 'Maria Rita', 'emailmm@gmail.com', 'regular', '123456', '2024-07-14 18:57:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `livro`
--
DROP TABLE IF EXISTS `livro`;
CREATE TABLE `livro` (
  `CodLivro` int(11) NOT NULL,
  `Titulo` text NOT NULL,
  `Edicao` int(11) DEFAULT NULL,
  `Ano` int(11) NOT NULL,
  `Genero` varchar(20) NOT NULL,
  `CodEditora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livro`
--

INSERT INTO `livro` (`CodLivro`, `Titulo`, `Edicao`, `Ano`, `Genero`, `CodEditora`) VALUES
(1, 'Aprenda a programar com Python', 1, 2022, 'Tecnologia', 1),
(2, 'Lógica de programação com Portugol', 1, 2022, 'Tecnologia', 1),
(3, 'Jogos com Scratch', 1, 2022, 'Tecnologia', 1),
(4, 'Jogos 2D com Stencyl', 1, 2020, 'Tecnologia', 1),
(5, 'Kodular', 1, 2019, 'Tecnologia', 1),
(6, 'Introdução ao kit robótico LEGO® EV3', 1, 2018, 'Tecnologia', 1),
(8, 'App Inventor', 1, 2017, 'Tecnologia', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `livroautor`
--
DROP TABLE IF EXISTS `livroautor`;
CREATE TABLE `livroautor` (
  `CodLivroAutor` int(11) NOT NULL,
  `CodLivro` int(11) NOT NULL,
  `CodAutor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `livroautor`
--

INSERT INTO `livroautor` (`CodLivroAutor`, `CodLivro`, `CodAutor`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 4, 6),
(7, 5, 7),
(8, 5, 8),
(9, 6, 9),
(10, 6, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sequelizemeta`
--
DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20240713173438-create-leitor.js');

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefoneeditora`
--
DROP TABLE IF EXISTS `telefoneeditora`;
CREATE TABLE `telefoneeditora` (
  `CodTelEditora` int(11) NOT NULL,
  `CodEditora` int(11) NOT NULL,
  `Telefone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `telefoneeditora`
--

INSERT INTO `telefoneeditora` (`CodTelEditora`, `CodEditora`, `Telefone`) VALUES
(1, 1, '9999-9999'),
(2, 1, '9999-9998'),
(3, 2, '9999-9997'),
(4, 2, '9999-9996'),
(5, 3, '9999-9995'),
(6, 3, '9999-9994'),
(7, 3, '9999-9995');

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefoneleitor`
--
DROP TABLE IF EXISTS `telefoneleitor`;
CREATE TABLE `telefoneleitor` (
  `CodTelefone` int(11) NOT NULL,
  `Telefone` int(11) NOT NULL,
  `CodLeitor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Estrutura para view `view_autor`
--
DROP VIEW IF EXISTS `view_autor`;
CREATE VIEW `view_autor` AS SELECT `CodAutor`, `NomeAutor` FROM `autor`;

--
-- Estrutura para view `view_editora`
--
DROP VIEW IF EXISTS `view_editora`;
CREATE VIEW `view_editora` AS SELECT `CodEditora`, `NomeEditora`, `CodTelefone`, `Email`, `LocalEditora` FROM `editora`;

--
-- Estrutura para view `view_emprestimo`
--
DROP VIEW IF EXISTS `view_emprestimo`;
CREATE VIEW `view_emprestimo` AS SELECT `DataEmprestimo`, `DataDevolucao`, `CodLivro`, `CodLeitor` FROM `emprestimo`;

--
-- Estrutura para view `view_leitors`
--
DROP VIEW IF EXISTS `view_leitors`;
CREATE VIEW `view_leitors` AS SELECT `CodLeitor`, `NomeLeitor`, `Email`, `situacao`, `senha`, `data_criacao` FROM `leitors`;

--
-- Estrutura para view `view_livro`
--
DROP VIEW IF EXISTS `view_livro`;
CREATE VIEW `view_livro` AS SELECT `CodLivro`, `Titulo`, `Edicao`, `Ano`, `Genero`, `CodEditora` FROM `livro`;

--
-- Estrutura para view `view_livroautor`
--
DROP VIEW IF EXISTS `view_livroautor`;
CREATE VIEW `view_livroautor` AS SELECT `CodLivroAutor`, `CodLivro`, `CodAutor` FROM `livroautor`;

--
-- Estrutura para view `view_telefoneeditora`
--
DROP VIEW IF EXISTS `view_telefoneeditora`;
CREATE VIEW `view_telefoneeditora` AS SELECT `CodTelEditora`, `CodEditora`, `Telefone` FROM `telefoneeditora`;

--
-- Estrutura para view `view_telefoneleitor`
--
DROP VIEW IF EXISTS `view_telefoneleitor`;
CREATE VIEW `view_telefoneleitor` AS SELECT `CodTelefone`, `Telefone`, `CodLeitor` FROM `telefoneleitor`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
COMMIT;

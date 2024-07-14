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
-- Estrutura para tabela `autor`
--

CREATE TABLE `autor` (
  `CodAutor` int(11) NOT NULL,
  `NomeAutor` text NOT NULL
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

CREATE TABLE `telefoneleitor` (
  `CodTelefone` int(11) NOT NULL,
  `Telefone` int(11) NOT NULL,
  `CodLeitor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwemprestimos`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwemprestimos` (
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwlivrosautores`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwlivrosautores` (
`CodLivro` int(11)
,`CodAutor` int(11)
,`Titulo` text
,`NomeAutor` text
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwtelefoneeditora`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwtelefoneeditora` (
`CodEditora` int(11)
,`NomeEditora` text
,`Telefone` varchar(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vwtelefoneleitor`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vwtelefoneleitor` (
);

-- --------------------------------------------------------

--
-- Estrutura para view `vwemprestimos`
--
DROP TABLE IF EXISTS `vwemprestimos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwemprestimos`  AS SELECT `emp`.`CodLivro` AS `CodLivro`, `emp`.`CodLeitor` AS `CodLeitor`, `leitor`.`NomeLeitor` AS `NomeLeitor`, `livro`.`Titulo` AS `Titulo`, `emp`.`DataEmprestimo` AS `DataEmprestimo`, `emp`.`DataDevolucao` AS `DataDevolucao` FROM ((`emprestimo` `emp` join `leitor` on(`leitor`.`CodLeitor` = `leitor`.`CodLeitor`)) join `livro` on(`emp`.`CodLivro` = `livro`.`CodLivro`)) ORDER BY `livro`.`Titulo` ASC ;

-- --------------------------------------------------------

--
-- Estrutura para view `vwlivrosautores`
--
DROP TABLE IF EXISTS `vwlivrosautores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwlivrosautores`  AS SELECT `livroautor`.`CodLivro` AS `CodLivro`, `livroautor`.`CodAutor` AS `CodAutor`, `livro`.`Titulo` AS `Titulo`, `autor`.`NomeAutor` AS `NomeAutor` FROM ((`livroautor` join `livro` on(`livroautor`.`CodLivro` = `livro`.`CodLivro`)) join `autor` on(`livroautor`.`CodAutor` = `autor`.`CodAutor`)) ORDER BY `livro`.`Titulo` ASC ;

-- --------------------------------------------------------

--
-- Estrutura para view `vwtelefoneeditora`
--
DROP TABLE IF EXISTS `vwtelefoneeditora`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwtelefoneeditora`  AS SELECT `te`.`CodEditora` AS `CodEditora`, `editora`.`NomeEditora` AS `NomeEditora`, `te`.`Telefone` AS `Telefone` FROM (`telefoneeditora` `te` join `editora` on(`te`.`CodEditora` = `editora`.`NomeEditora`)) ORDER BY `editora`.`NomeEditora` ASC ;

-- --------------------------------------------------------

--
-- Estrutura para view `vwtelefoneleitor`
--
DROP TABLE IF EXISTS `vwtelefoneleitor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwtelefoneleitor`  AS SELECT `tl`.`CodLeitor` AS `CodLeitor`, `leitor`.`NomeLeitor` AS `NomeLeitor`, `tl`.`Telefone` AS `Telefone` FROM (`telefoneleitor` `tl` join `leitor` on(`tl`.`CodLeitor` = `leitor`.`CodLeitor`)) ORDER BY `leitor`.`NomeLeitor` ASC ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`CodAutor`),
  ADD UNIQUE KEY `CodAutor` (`CodAutor`);

--
-- Índices de tabela `editora`
--
ALTER TABLE `editora`
  ADD PRIMARY KEY (`CodEditora`),
  ADD UNIQUE KEY `CodEditora` (`CodEditora`);

--
-- Índices de tabela `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD KEY `Emprestimo_fk2` (`CodLivro`),
  ADD KEY `fk_CodLeitor` (`CodLeitor`);

--
-- Índices de tabela `leitors`
--
ALTER TABLE `leitors`
  ADD PRIMARY KEY (`CodLeitor`);

--
-- Índices de tabela `livro`
--
ALTER TABLE `livro`
  ADD PRIMARY KEY (`CodLivro`),
  ADD UNIQUE KEY `CodLivro` (`CodLivro`),
  ADD KEY `Livro_fk5` (`CodEditora`);

--
-- Índices de tabela `livroautor`
--
ALTER TABLE `livroautor`
  ADD PRIMARY KEY (`CodLivroAutor`),
  ADD UNIQUE KEY `CodLivroAutor` (`CodLivroAutor`),
  ADD KEY `LivroAutor_fk1` (`CodLivro`),
  ADD KEY `LivroAutor_fk2` (`CodAutor`);

--
-- Índices de tabela `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `telefoneeditora`
--
ALTER TABLE `telefoneeditora`
  ADD PRIMARY KEY (`CodTelEditora`),
  ADD UNIQUE KEY `CodTelEditora` (`CodTelEditora`),
  ADD KEY `TelefoneEditora_fk1` (`CodEditora`);

--
-- Índices de tabela `telefoneleitor`
--
ALTER TABLE `telefoneleitor`
  ADD PRIMARY KEY (`CodTelefone`),
  ADD UNIQUE KEY `CodTelefone` (`CodTelefone`),
  ADD KEY `CodLeitor` (`CodLeitor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `autor`
--
ALTER TABLE `autor`
  MODIFY `CodAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `editora`
--
ALTER TABLE `editora`
  MODIFY `CodEditora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `leitors`
--
ALTER TABLE `leitors`
  MODIFY `CodLeitor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `livro`
--
ALTER TABLE `livro`
  MODIFY `CodLivro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `livroautor`
--
ALTER TABLE `livroautor`
  MODIFY `CodLivroAutor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `telefoneeditora`
--
ALTER TABLE `telefoneeditora`
  MODIFY `CodTelEditora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `telefoneleitor`
--
ALTER TABLE `telefoneleitor`
  MODIFY `CodTelefone` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `emprestimo`
--
ALTER TABLE `emprestimo`
  ADD CONSTRAINT `Emprestimo_fk2` FOREIGN KEY (`CodLivro`) REFERENCES `livro` (`CodLivro`),
  ADD CONSTRAINT `fk_CodLeitor` FOREIGN KEY (`CodLeitor`) REFERENCES `leitors` (`CodLeitor`);

--
-- Restrições para tabelas `livro`
--
ALTER TABLE `livro`
  ADD CONSTRAINT `Livro_fk5` FOREIGN KEY (`CodEditora`) REFERENCES `editora` (`CodEditora`);

--
-- Restrições para tabelas `livroautor`
--
ALTER TABLE `livroautor`
  ADD CONSTRAINT `LivroAutor_fk1` FOREIGN KEY (`CodLivro`) REFERENCES `livro` (`CodLivro`),
  ADD CONSTRAINT `LivroAutor_fk2` FOREIGN KEY (`CodAutor`) REFERENCES `autor` (`CodAutor`);

--
-- Restrições para tabelas `telefoneeditora`
--
ALTER TABLE `telefoneeditora`
  ADD CONSTRAINT `TelefoneEditora_fk1` FOREIGN KEY (`CodEditora`) REFERENCES `editora` (`CodEditora`);

--
-- Restrições para tabelas `telefoneleitor`
--
ALTER TABLE `telefoneleitor`
  ADD CONSTRAINT `CodLeitor` FOREIGN KEY (`CodLeitor`) REFERENCES `leitors` (`CodLeitor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

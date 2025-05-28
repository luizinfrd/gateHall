-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/05/2025 às 01:00
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
-- Banco de dados: `gatehall`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `eventos`
--

CREATE TABLE `eventos` (
  `Id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `localizacao` varchar(80) NOT NULL,
  `dataEvento` date NOT NULL,
  `hora` time NOT NULL,
  `dataCriacao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `eventos`
--

INSERT INTO `eventos` (`Id`, `titulo`, `descricao`, `localizacao`, `dataEvento`, `hora`, `dataCriacao`) VALUES
(1, 'Rock no Vale com Metallica', 'Show explosivo da lendária banda Metallica.', 'Vale do Anhangabaú, SP', '2025-08-10', '21:00:00', '2025-05-28 19:57:53'),
(2, 'Noite Pop com Taylor Swift', 'Turnê mundial de Taylor Swift.', 'Allianz Parque, SP', '2025-09-15', '20:30:00', '2025-05-28 19:57:53'),
(3, 'Festival Épico - Coldplay', 'Coldplay com luzes e muita emoção.', 'Maracanã, RJ', '2025-10-20', '19:00:00', '2025-05-28 19:57:53'),
(4, 'Sertanejo Sunset', 'Jorge & Mateus ao pôr do sol.', 'Parque Ibirapuera, SP', '2025-09-01', '17:00:00', '2025-05-28 19:57:53'),
(5, 'Baile Funk Supremo', 'MC Kevinho e convidados.', 'Sambódromo do Anhembi, SP', '2025-11-12', '23:00:00', '2025-05-28 19:57:53'),
(6, 'Jazz Night com Norah Jones', 'Noite relaxante de jazz.', 'Blue Note SP', '2025-07-08', '20:00:00', '2025-05-28 19:57:53'),
(7, 'Festival Anime Songs', 'Músicas de animes com orquestra.', 'Auditório Ibirapuera, SP', '2025-08-30', '18:00:00', '2025-05-28 19:57:53'),
(8, 'Rock Nacional Retrô', 'RPM, Legião Urbana cover e Paralamas.', 'Estádio do Morumbi, SP', '2025-10-01', '20:00:00', '2025-05-28 19:57:53'),
(9, 'EDM Explosion com David Guetta', 'Show de luzes e batidas.', 'Arena BR, Brasília', '2025-09-18', '22:00:00', '2025-05-28 19:57:53'),
(10, 'Festival Reggae & Paz', 'Natiruts e convidados.', 'Praia de Copacabana, RJ', '2025-12-05', '16:00:00', '2025-05-28 19:57:53');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ingressos`
--

CREATE TABLE `ingressos` (
  `Id` int(11) NOT NULL,
  `IdEventos` int(11) NOT NULL,
  `valor` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `ingressos`
--

INSERT INTO `ingressos` (`Id`, `IdEventos`, `valor`) VALUES
(1, 1, 300),
(2, 2, 450),
(3, 3, 500),
(4, 4, 200),
(5, 5, 150),
(6, 6, 350),
(7, 7, 250),
(8, 8, 280),
(9, 9, 600),
(10, 10, 180);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `Id` int(11) NOT NULL,
  `IdUsuarios` int(11) NOT NULL,
  `IdIngressos` int(11) NOT NULL,
  `qtdIngressos` int(11) NOT NULL,
  `valorTotal` decimal(10,0) NOT NULL,
  `dataPedido` datetime NOT NULL,
  `status` varchar(15) NOT NULL,
  `metodoPagamento` varchar(10) NOT NULL,
  `dataPagamento` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`Id`, `IdUsuarios`, `IdIngressos`, `qtdIngressos`, `valorTotal`, `dataPedido`, `status`, `metodoPagamento`, `dataPagamento`) VALUES
(1, 1, 1, 2, 600, '2025-05-28 19:57:53', 'CONFIRMADO', 'PIX', '2025-05-28 19:57:53'),
(2, 2, 2, 1, 450, '2025-05-28 19:57:53', 'CONFIRMADO', 'CARTAO', '2025-05-28 19:57:53'),
(3, 3, 3, 3, 1500, '2025-05-28 19:57:53', 'CONFIRMADO', 'BOLETO', '2025-05-28 19:57:53'),
(4, 4, 4, 2, 400, '2025-05-28 19:57:53', 'CONFIRMADO', 'PIX', '2025-05-28 19:57:53'),
(5, 5, 5, 1, 150, '2025-05-28 19:57:53', 'CONFIRMADO', 'CARTAO', '2025-05-28 19:57:53'),
(6, 6, 6, 2, 700, '2025-05-28 19:57:53', 'CONFIRMADO', 'PIX', '2025-05-28 19:57:53'),
(7, 7, 7, 1, 250, '2025-05-28 19:57:53', 'CONFIRMADO', 'BOLETO', '2025-05-28 19:57:53'),
(8, 8, 8, 2, 560, '2025-05-28 19:57:53', 'CONFIRMADO', 'PIX', '2025-05-28 19:57:53'),
(9, 9, 9, 1, 600, '2025-05-28 19:57:53', 'CONFIRMADO', 'CARTAO', '2025-05-28 19:57:53'),
(10, 10, 10, 3, 540, '2025-05-28 19:57:53', 'CONFIRMADO', 'PIX', '2025-05-28 19:57:53');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `senha` varchar(16) NOT NULL,
  `tipoUsuario` varchar(10) NOT NULL,
  `permissao` varchar(5) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(80) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `dataNascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`Id`, `cpf`, `senha`, `tipoUsuario`, `permissao`, `nome`, `email`, `telefone`, `dataNascimento`) VALUES
(1, '12345678901', 'iron123', 'INTEIRA', 'COMUM', 'Tony Stark', 'tony@stark.com', '11999990001', '1970-05-29'),
(2, '23456789012', 'batman123', 'MEIA', 'COMUM', 'Bruce Wayne', 'bruce@wayne.com', '11999990002', '1972-02-19'),
(3, '34567890123', 'admin456', 'INTEIRA', 'ADMIN', 'Gandalf Cinzento', 'gandalf@valinor.com', '11999990003', '1911-01-01'),
(4, '45678901234', 'harryp123', 'MEIA', 'COMUM', 'Harry Potter', 'harry@hogwarts.edu', '11999990004', '1990-07-31'),
(5, '56789012345', 'capitao123', 'INTEIRA', 'COMUM', 'Steve Rogers', 'steve@avengers.com', '11999990005', '1918-07-04'),
(6, '67890123456', 'thor12345', 'INTEIRA', 'COMUM', 'Thor Odinson', 'thor@asgard.com', '11999990006', '1500-01-01'),
(7, '78901234567', 'legolas12', 'MEIA', 'COMUM', 'Legolas Greenleaf', 'legolas@floresta.com', '11999990007', '1050-03-15'),
(8, '89012345678', 'luffy123', 'MEIA', 'COMUM', 'Monkey D. Luffy', 'luffy@onepiece.com', '11999990008', '2000-05-05'),
(9, '90123456789', 'goku12345', 'INTEIRA', 'COMUM', 'Son Goku', 'goku@capsule.com', '11999990009', '1980-04-16'),
(10, '01234567890', 'elsa1234', 'MEIA', 'COMUM', 'Elsa Arendelle', 'elsa@frozen.com', '11999990010', '1995-12-25');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`Id`);

--
-- Índices de tabela `ingressos`
--
ALTER TABLE `ingressos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdEventos` (`IdEventos`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdIngressos` (`IdIngressos`),
  ADD KEY `IdUsuarios` (`IdUsuarios`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `eventos`
--
ALTER TABLE `eventos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `ingressos`
--
ALTER TABLE `ingressos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
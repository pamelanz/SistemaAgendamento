-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 12-Jul-2016 às 00:21
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `agendamento_estoque`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ambiente`
--

CREATE TABLE IF NOT EXISTS `ambiente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo` int(11) NOT NULL,
  `id_instituicao` int(11) NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_instituicao_ambiente` (`id_instituicao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `defeito`
--

CREATE TABLE IF NOT EXISTS `defeito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `id_equipamento` int(11) NOT NULL,
  `id_ambiente` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  KEY `fk_ambiente_defeito` (`id_ambiente`),
  KEY `id_equipamento` (`id_equipamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipamento`
--

CREATE TABLE IF NOT EXISTS `equipamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `cod_patrimonial` varchar(40) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Extraindo dados da tabela `equipamento`
--

INSERT INTO `equipamento` (`id`, `nome`, `cod_patrimonial`, `descricao`) VALUES
(5, 'usahusadsa', 'isosajas', 'aos'),
(6, 'dsssas', 'rerwe', 'bcbcc'),
(7, 'dsssas', 'rerwe', 'bcbcc'),
(8, 'dffdddf', 'f', 'f');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE IF NOT EXISTS `estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ambiente` int(11) NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ambiente` (`id_ambiente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `horario`
--

CREATE TABLE IF NOT EXISTS `horario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` time NOT NULL,
  `fim` time NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `instituicao`
--

CREATE TABLE IF NOT EXISTS `instituicao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itemcompra`
--

CREATE TABLE IF NOT EXISTS `itemcompra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `validade` int(11) NOT NULL,
  `lote` varchar(255) NOT NULL,
  `quantidade` float NOT NULL,
  `produto` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto_ItemCompra` (`produto`),
  KEY `fk_compra` (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `procedimento`
--

CREATE TABLE IF NOT EXISTS `procedimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `descricao` text NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `id_estoque` int(11) NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_estoque` (`id_estoque`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva_informatica`
--

CREATE TABLE IF NOT EXISTS `reserva_informatica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_ambiente` int(11) NOT NULL,
  `assunto` text NOT NULL,
  `data_reserva` date NOT NULL,
  `id_horario` int(11) NOT NULL,
  `infos_adicionais` int(11) NOT NULL,
  `criado_em` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_usuario` (`id_usuario`),
  UNIQUE KEY `id_ambiente` (`id_ambiente`),
  UNIQUE KEY `id_horario` (`id_horario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva_laboratorio`
--

CREATE TABLE IF NOT EXISTS `reserva_laboratorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `tipo` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_ambiente` int(11) NOT NULL,
  `id_procedimento` int(11) NOT NULL,
  `disciplina` text NOT NULL,
  `assunto` text NOT NULL,
  `quant_bancadas` int(11) NOT NULL,
  `turma` text NOT NULL,
  `infos_adicionais` text NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_horario` (`id_horario`),
  KEY `fk_usuario` (`id_usuario`),
  KEY `fk_ambiente_reserva` (`id_ambiente`),
  KEY `fk_procedimento` (`id_procedimento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `solucao`
--

CREATE TABLE IF NOT EXISTS `solucao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantidade` varchar(200) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `login` varchar(10) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `id_instituicao` int(11) NOT NULL,
  `cargo` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `observacao` varchar(255) NOT NULL,
  `criado_em` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_instituicao` (`id_instituicao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id`);

--
-- Limitadores para a tabela `defeito`
--
ALTER TABLE `defeito`
  ADD CONSTRAINT `defeito_ibfk_1` FOREIGN KEY (`id_equipamento`) REFERENCES `equipamento` (`id`),
  ADD CONSTRAINT `fk_ambiente` FOREIGN KEY (`id_ambiente`) REFERENCES `ambiente` (`id`),
  ADD CONSTRAINT `fk_usuario_defeito` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`id_ambiente`) REFERENCES `ambiente` (`id`);

--
-- Limitadores para a tabela `itemcompra`
--
ALTER TABLE `itemcompra`
  ADD CONSTRAINT `fk_compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id`),
  ADD CONSTRAINT `fk_produto_ItemCompra` FOREIGN KEY (`produto`) REFERENCES `produto` (`id`);

--
-- Limitadores para a tabela `procedimento`
--
ALTER TABLE `procedimento`
  ADD CONSTRAINT `procedimento_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_estoque` FOREIGN KEY (`id_estoque`) REFERENCES `estoque` (`id`);

--
-- Limitadores para a tabela `reserva_informatica`
--
ALTER TABLE `reserva_informatica`
  ADD CONSTRAINT `reserva_informatica_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `reserva_informatica_ibfk_2` FOREIGN KEY (`id_ambiente`) REFERENCES `ambiente` (`id`),
  ADD CONSTRAINT `reserva_informatica_ibfk_3` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id`);

--
-- Limitadores para a tabela `reserva_laboratorio`
--
ALTER TABLE `reserva_laboratorio`
  ADD CONSTRAINT `fk_ambiente_reserva` FOREIGN KEY (`id_ambiente`) REFERENCES `ambiente` (`id`),
  ADD CONSTRAINT `fk_horario` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id`),
  ADD CONSTRAINT `fk_procedimento` FOREIGN KEY (`id_procedimento`) REFERENCES `procedimento` (`id`),
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Limitadores para a tabela `solucao`
--
ALTER TABLE `solucao`
  ADD CONSTRAINT `fk_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_instituicao`) REFERENCES `instituicao` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema biblioteca_fc
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca_fc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `biblioteca_fc` ;
-- DROP DATABASE `biblioteca_fc`;

-- -----------------------------------------------------
-- Table `biblioteca_fc`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_fc`.`Funcionario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contacto_emergencia` VARCHAR(13) NOT NULL,
  `telefone` VARCHAR(9) NOT NULL CHECK (`telefone` REGEXP "[0-9]{9}") ,
  `cc` VARCHAR(8) NOT NULL UNIQUE CHECK (`cc` REGEXP "[0-9]{8}"),
  `email` VARCHAR(100) NOT NULL CHECK ( `email` REGEXP ".+@.+" ),
  `dta_nascimento` DATE NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `dta_fim_servico` DATE NULL DEFAULT NULL,
  `dta_inicio_servico` DATE NOT NULL,
  `codigo_postal` CHAR(8) NOT NULL CHECK ( `codigo_postal` REGEXP "[0-9]{4}\-[0-9]{3}" ),
  `morada` VARCHAR(60) NOT NULL,
  `cidade` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `biblioteca_fc`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_fc`.`Livro` (
	`ISBN` CHAR(13) NOT NULL CHECK( `ISBN` REGEXP "[0-9]{13}"),
	`autor` VARCHAR(50) NOT NULL,
	`editora` VARCHAR(45) NOT NULL,
	`titulo` VARCHAR(50) NOT NULL,
	`localizacao` CHAR(3) NULL CHECK (`localizacao` REGEXP "[0-9]{3}"),
	`paginas` INT NULL CHECK(`paginas` > 0),
	`dta_publicacao` DATE NULL,
  PRIMARY KEY (`ISBN`));


-- -----------------------------------------------------
-- Table `biblioteca_fc`.`Genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_fc`.`Genero` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `biblioteca_fc`.`LivroGenero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_fc`.`LivroGenero` (
  `Livro` CHAR(13) NOT NULL,
  `Genero` INT NOT NULL,
  PRIMARY KEY (`Livro`, `Genero`), 
  CONSTRAINT `fk_LivroGenero_Livro1`
    FOREIGN KEY (`Livro`)
    REFERENCES `biblioteca_fc`.`Livro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LivroGenero_Genero1`
    FOREIGN KEY (`Genero`)
    REFERENCES `biblioteca_fc`.`Genero` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `biblioteca_fc`.`Utilizador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_fc`.`Utilizador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cc` CHAR(8) NOT NULL UNIQUE CHECK (`cc` REGEXP "[0-9]{8}"),
  `email` VARCHAR(100) NOT NULL,
  `data_de_nascimento` DATE NOT NULL,
  `telefone` VARCHAR(9) NOT NULL CHECK (`telefone` REGEXP "[0-9]{9}"),
  `nome` VARCHAR(60) NOT NULL,
  `morada` VARCHAR(60) NOT NULL,
  `codigo_postal` CHAR(8) NOT NULL CHECK ( `codigo_postal` REGEXP "[0-9]{4}\-[0-9]{3}" ),
  `cidade` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Function idade
-- -----------------------------------------------------

DELIMITER //

CREATE FUNCTION idade(data_de_nascimento date) RETURNS int DETERMINISTIC
BEGIN
	RETURN (SELECT DATEDIFF(data_de_nascimento,CURDATE()));
END

// DELIMITER ;


-- -----------------------------------------------------
-- Table `biblioteca_fc`.`Exemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_fc`.`Exemplar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `condicao` CHAR(1) NOT NULL DEFAULT 'I' CHECK (`condicao` IN ('S', 'A', 'B', 'C', 'D','I')), -- Condição baseada no sistema de notas americanas
  `disponibilidade` CHAR(1) NOT NULL DEFAULT 'D' CHECK (`disponibilidade` IN ('I','D') ), -- criar trigger que sempre que um livro é requisitado o valor da disponibilidade é alterado
  `Livro` CHAR(13) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Livro_Livro1`
    FOREIGN KEY (`Livro`)
    REFERENCES `biblioteca_fc`.`Livro` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `biblioteca_fc`.`Requisicao`
-- -----------------------------------------------------
    
CREATE TABLE IF NOT EXISTS `biblioteca_fc`.`Requisicao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `estado` CHAR(1) NOT NULL DEFAULT 'A' CHECK (`estado` IN ('A','C') ), -- 'A' Aberta e 'C' Concluída
  `data` DATE NOT NULL,
  `Utilizador` INT NOT NULL,
  `Funcionario` INT NOT NULL,
  `Exemplar` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Requisicao_Funcionario1`
    FOREIGN KEY (`Funcionario`)
    REFERENCES `biblioteca_fc`.`Funcionario` (`id`),
  CONSTRAINT `fk_Requisicao_Utilizador1`
    FOREIGN KEY (`Utilizador`)
    REFERENCES `biblioteca_fc`.`Utilizador` (`id`),
  CONSTRAINT `fk_Requisicao_Livro1`
    FOREIGN KEY (`Exemplar`)
    REFERENCES `biblioteca_fc`.`Exemplar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    
-- -----------------------------------------------------
-- Trigger tgINDisponibilidadeLivroRequisicao
-- -----------------------------------------------------

DELIMITER //
CREATE TRIGGER tgINDisponibilidadeLivroRequisicao
	AFTER INSERT ON `biblioteca_fc`.`Requisicao`
	FOR EACH ROW
BEGIN
	UPDATE Exemplar
		SET disponibilidade = 'I'
		WHERE id = NEW.Exemplar;
END //

-- -----------------------------------------------------
-- Trigger tgALTDisponibilidadeLivroRequisicao
-- -----------------------------------------------------
CREATE TRIGGER tgALTDisponibilidadeLivroRequisicao
	AFTER UPDATE ON `biblioteca_fc`.`Requisicao`
	FOR EACH ROW
BEGIN
	IF NOT (NEW.estado <=> OLD.estado) THEN
		UPDATE Exemplar
			SET disponibilidade = 'D'
			WHERE id = NEW.Exemplar;
	END IF;
END //
DELIMITER ;


-- -----------------------------------------------------
-- Table `biblioteca_fc`.`Multa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_fc`.`Multa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `estado` CHAR(1) NOT NULL DEFAULT 'N' CHECK (`estado` IN ('N','P') ),
  `montante` DECIMAL(8,2) NOT NULL,
  `tipo` CHAR(1) NOT NULL DEFAULT 'A' CHECK (`tipo` IN ('A','D')), -- 'A' Atraso, 'D' Dano
  `Requisicao` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_Multa_Requisicao1`
    FOREIGN KEY (`Requisicao`)
    REFERENCES `biblioteca_fc`.`Requisicao` (`id`));


-- -----------------------------------------------------
-- EVENT evMultaAtraso
-- -----------------------------------------------------

DELIMITER //
CREATE EVENT evMultaAtraso
    ON SCHEDULE EVERY 1 DAY
	STARTS NOW()
    ON COMPLETION PRESERVE
      
DO
BEGIN

    INSERT INTO Multa (montante,Requisicao)
		SELECT '10',r.id FROM Requisicao r
			WHERE r.`data` + INTERVAL 30 DAY <= NOW() 
				AND r.id NOT IN (SELECT id FROM MULTA m
					WHERE m.Requisicao AND m.tipo!='A'); -- Garantir que uma multa de atraso não é cobrada duas vezes
END //
DELIMITER ;


-- -----------------------------------------------------
-- Table `biblioteca_fc`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca_fc`.`Reserva` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`estado` CHAR(1) NOT NULL DEFAULT 'R' CHECK (`estado` IN ('R','C') ),
	`data` DATE NOT NULL,
	`Utilizador` INT NOT NULL,
	`Livro` CHAR(13) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `fk_Reserva_Utilizador1`
		FOREIGN KEY (`Utilizador`)
		REFERENCES `biblioteca_fc`.`Utilizador` (`id`),
	CONSTRAINT `fk_Reserva_Livro_1`
		FOREIGN KEY (`Livro`)
		REFERENCES `biblioteca_fc`.`Livro` (`ISBN`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE biblioteca_fc;

-- DELETE FROM Funcionario;
-- DELETE FROM Genero;
-- DELETE FROM Livro;
-- DELETE FROM LivroInfo;
-- DELETE FROM LivroInfoGenero;
-- DELETE FROM Multa;
-- DELETE FROM Requisicao;
-- DELETE FROM Reserva;
-- DELETE FROM Utilizador;

-- LivroInfos

INSERT INTO `biblioteca_fc`.`Livro` ( `ISBN`, `autor`, `editora`, `titulo`, `localizacao`, `paginas`, `dta_publicacao`) VALUES
	('9781574590784', 'Pamela Jones', 'Russell-Warner', 'Cross-group 24hour standardization', '155', 465, '2017-12-05'),
	('9781015871595', 'Alicia Holland', 'Jackson-Hicks', 'User-centric mission-critical Local Area Network', '782', 464, '2015-06-07'),
	('9781613543634', 'Kenneth Benjamin', 'Berry, Harmon and Valenzuela', 'Enterprise-wide impactful support', '639', 169, '2017-11-04'),
	('9780575988583', 'Jennifer Dunn', 'Johnson PLC', 'Networked motivating workforce', '929', 446, '2022-08-01'),
	('9780578693569', 'Paul Miller', 'Fisher-Miller', 'Devolved dedicated architecture', '616', 97, '2015-11-17'),
	('9781382372343', 'Ronald Edwards', 'Bentley-Weber', 'Robust discrete hierarchy', '837', 224, '2022-03-29'),
	('9780816782819', 'Brian Parker', 'Mcknight-Gibson', 'Monitored optimal collaboration', '566', 111, '2020-05-13'),
	('9781177554350', 'Daniel Ryan', 'Martin Inc', 'Synergized bi-directional architecture', '340', 162, '2017-07-23'),
	('9780483782914', 'Matthew Burns', 'Thomas, Walters and Summers', 'Monitored multi-state process improvement', '249', 380, '2022-10-19'),
	('9780596398057', 'Jose Mcdonald', 'Allen, Stephenson and Galloway', 'Expanded coherent archive', '141', 304, '2022-01-09');


-- Livros

INSERT INTO `biblioteca_fc`.`Exemplar` (`condicao`, `disponibilidade`, `Livro`) VALUES
	('S', 'D', '9781574590784'),
	('A', 'D', '9781015871595'),
	('B', 'D', '9781613543634'),
	('C', 'D', '9780575988583'),
	('D', 'D', '9780578693569'),
	('I', 'D', '9781382372343'),
	('S', 'D', '9780816782819'),
	('A', 'D', '9781177554350'),
	('B', 'D', '9780483782914'),
	('C', 'D', '9780596398057'),
	('D', 'D', '9781574590784'),
	('I', 'D', '9781015871595'),
	('S', 'D', '9781613543634'),
	('A', 'D', '9780575988583'),
	('B', 'D', '9780578693569'),
	('C', 'D', '9781382372343'),
	('D', 'D', '9780816782819'),
	('I', 'D', '9781177554350'),
	('S', 'D', '9780483782914'),
	('A', 'D', '9780596398057'),
	('B', 'D', '9781574590784'),
	('C', 'D', '9781015871595'),
	('D', 'D', '9781613543634'),
	('I', 'D', '9780575988583'),
	('S', 'D', '9780578693569');

-- Utilizadores (já feito pelo python)



-- Livro Género
INSERT INTO `biblioteca_fc`.`Genero` (descricao) VALUES
    ('Romance'),
    ('Ficção científica'),
    ('Fantasia'),
    ('Suspense'),
    ('Mistério'),
    ('Aventura'),
    ('Horror'),
    ('História'),
    ('Biografia'),
    ('Autobiografia'),
    ('Poesia'),
    ('Drama'),
    ('Comédia'),
    ('Fábula'),
    ('Ficcção');


-- Funcionário

INSERT INTO `biblioteca_fc`.`Funcionario` (`contacto_emergencia`, `telefone`, `cc`, `email`, `dta_nascimento`, `nome`, `dta_fim_servico`, `dta_inicio_servico`, `codigo_postal`, `morada`, `cidade`) VALUES
	('912345678', '987654321', '12345678', 'funcionario1@example.com', '1990-01-01', 'José Silva', NULL, '2022-01-01', '1234-567', 'Rua Principal, 1', 'Lisboa'),
	('923456789', '876543210', '23456789', 'funcionario2@example.com', '1985-02-02', 'Ana Santos', NULL, '2021-12-01', '2345-678', 'Avenida Central, 2', 'Porto'),
	('934567890', '765432109', '34567890', 'funcionario3@example.com', '1992-03-03', 'Pedro Costa', NULL, '2022-03-15', '3456-789', 'Travessa Secundária, 3', 'Braga'),
	('945678901', '654321098', '45678901', 'funcionario4@example.com', '1988-04-04', 'Marta Rodrigues', NULL, '2022-02-28', '4567-890', 'Praça Central, 4', 'Coimbra'),
	('956789012', '543210987', '56789012', 'funcionario5@example.com', '1995-05-05', 'Ricardo Ferreira', '2023-05-15', '2022-01-01', '5678-901', 'Rua Principal, 5', 'Faro'), -- 5
	('967890123', '432109876', '67890123', 'funcionario6@example.com', '1993-06-06', 'Sofia Gonçalves', NULL, '2022-04-30', '6789-012', 'Avenida Central, 6', 'Lisboa'),
	('978901234', '321098765', '78901234', 'funcionario7@example.com', '1987-07-07', 'Carlos Almeida', NULL, '2021-11-15', '7890-123', 'Travessa Secundária, 7', 'Porto'),
	('989012345', '210987654', '89012345', 'funcionario8@example.com', '1994-08-08', 'Inês Sousa', NULL, '2022-06-30', '8901-234', 'Praça Central, 8', 'Braga'),
	('990123456', '109876543', '90123456', 'funcionario9@example.com', '1989-09-09', 'João Lopes', '2023-05-31', '2022-01-01', '9012-345', 'Rua Principal, 9', 'Coimbra'), -- 9
	('901234567', '098765432', '01234567', 'funcionario10@example.com', '1991-10-10', 'Mariana Oliveira', NULL, '2022-05-31', '0123-456', 'Avenida Central, 10', 'Faro');


-- Requisição

INSERT INTO `biblioteca_fc`.`Requisicao` (`estado`, `data`, `Utilizador`, `Funcionario`, `Exemplar`) VALUES -- Falta aqui rever as foreign keys
	-- Em aberto
	('A', '2023-05-01', 1, 1, 1),
	('A', '2023-05-02', 2, 2, 2),
	('A', '2023-05-03', 3, 3, 3),
	('A', '2023-04-04', 4, 4, 4),
	('A', '2023-04-05', 5, 2, 5),
	('A', '2023-04-06', 6, 6, 6),
	('A', '2023-03-07', 7, 7, 7),
	('A', '2023-03-08', 8, 8, 8),
	('A', '2023-03-09', 9, 2, 9),
	('A', '2023-03-10', 10, 10, 10),
	-- Concluídos
	('C', '2021-05-11', 11, 1, 11),
	('C', '2021-05-12', 12, 5, 12),
	('C', '2021-05-13', 13, 3, 13),
	('C', '2022-05-14', 14, 4, 14),
	('C', '2022-05-15', 15, 5, 15),
	('C', '2022-05-16', 16, 6, 16),
	('C', '2022-05-17', 17, 7, 17),
	('C', '2022-05-18', 8, 8, 18),
	('C', '2022-05-19', 8, 9, 19),
	('C', '2022-05-20', 8, 10, 20),
	('C', '2022-05-21', 1, 1, 21),
	('C', '2022-01-22', 2, 1, 3),
	('C', '2022-01-23', 3, 1, 3),
	('C', '2022-01-24', 4, 1, 3),
	('C', '2022-01-25', 5, 1, 3),
	('C', '2021-06-11', 11, 1, 11),
	('C', '2021-06-12', 12, 5, 12),
	('C', '2021-06-13', 13, 3, 13),
	('C', '2022-06-14', 14, 4, 14),
	('C', '2022-07-15', 15, 5, 15),
	('C', '2022-07-16', 16, 6, 16),
	('C', '2022-07-17', 17, 7, 17),
	('C', '2022-07-18', 8, 8, 18),
	('C', '2022-07-19', 8, 9, 19),
	('C', '2022-07-20', 8, 10, 20),
	('C', '2022-07-21', 1, 1, 21),
	('C', '2022-07-22', 2, 1, 5),
	('C', '2022-07-23', 3, 1, 5),
	('C', '2022-08-24', 4, 1, 5),
	('C', '2021-08-11', 11, 1, 11),
	('C', '2021-08-12', 12, 5, 12),
	('C', '2021-08-13', 13, 3, 13),
	('C', '2022-08-14', 14, 4, 14),
	('C', '2022-08-15', 15, 5, 15),
	('C', '2022-08-16', 16, 6, 16),
	('C', '2022-08-17', 17, 7, 17),
	('C', '2022-08-18', 8, 8, 18),
	('C', '2022-08-19', 8, 9, 19),
	('C', '2022-08-20', 8, 10, 20),
	('C', '2022-08-21', 1, 1, 21),
	('C', '2022-08-22', 2, 1, 3),
	('C', '2022-08-23', 3, 1, 5),
	('C', '2022-08-24', 4, 1, 5),
	('C', '2022-08-25', 5, 1, 6),
	('C', '2021-08-11', 11, 1, 11),
	('C', '2021-06-12', 12, 5, 12),
	('C', '2021-09-13', 13, 3, 13),
	('C', '2022-09-14', 14, 4, 14),
	('C', '2021-09-15', 15, 5, 15),
	('C', '2021-09-16', 16, 6, 16),
	('C', '2020-09-17', 17, 7, 17),
	('C', '2020-09-18', 8, 8, 18),
	('C', '2020-09-19', 8, 9, 19),
	('C', '2020-09-20', 8, 10, 20),
	('C', '2020-09-21', 1, 1, 21),
	('C', '2020-09-22', 2, 1, 6),
	('C', '2020-09-23', 3, 1, 6),
	('C', '2020-09-24', 4, 1, 6),
	('C', '2022-10-20', 8, 10, 20),
	('C', '2022-10-21', 1, 1, 21),
	('C', '2022-10-22', 2, 1, 9),
	('C', '2022-10-23', 3, 1, 9),
	('C', '2022-10-24', 4, 1, 9),
	('C', '2022-10-25', 5, 1, 9),
	('C', '2021-10-11', 11, 1, 11),
	('C', '2021-11-12', 12, 5, 12),
	('C', '2021-11-13', 13, 3, 13),
	('C', '2022-11-14', 14, 4, 14),
	('C', '2021-11-15', 15, 5, 15),
	('C', '2021-12-16', 16, 6, 16),
	('C', '2020-12-17', 17, 7, 17),
	('C', '2020-12-18', 8, 8, 18),
	('C', '2020-12-19', 8, 9, 19),
	('C', '2020-12-20', 8, 10, 20),
	('C', '2020-12-21', 1, 1, 21),
	('C', '2020-12-22', 2, 1, 3),
	('C', '2020-12-23', 3, 1, 3),
	('C', '2020-12-24', 4, 1, 3),
	('C', '2022-12-25', 5, 1, 3);
-- Multa

INSERT INTO `biblioteca_fc`.`Multa` (`estado`, `montante`, `tipo`, `Requisicao`) VALUES 
	('N', 10.00, 'A', 1),
	('N', 25.00, 'D', 1),
	('P', 5.75, 'D', 2),
	('N', 10.00, 'A', 4),
	('P', 1.25, 'D', 9),
	('N', 10.00, 'A', 6),
	('N', 10.00, 'A', 7),
	('N', 10.00, 'A', 8),
	('P', 10.00, 'A', 9),
	('P', 10.00, 'A', 10),
	('P', 10.00, 'A', 5),
	('N', 10.00, 'A', 3);

-- Reserva

INSERT INTO `biblioteca_fc`.`Reserva` (`estado`, `data`, `Utilizador`, `Livro`) VALUES -- Falta aqui rever as foreign keys
	('C', '2023-05-01', 1, 9780578693569),
	('C', '2023-04-02', 2, 9780575988583),
	('R', '2023-04-03', 3, 9780596398057),
	('R', '2023-05-04', 4, 9780483782914);


-- LivroInfoGenero

INSERT INTO `biblioteca_fc`.`LivroGenero` (`Livro`, `Genero`) VALUES
	(9781574590784,1),
	(9781574590784,2),
	(9781574590784,3),
	(9781015871595,4),
	(9781015871595,6),
	(9781613543634,1),
	(9780575988583,10),
	(9780578693569,11),
	(9781382372343,15),
	(9780816782819,14),
	(9780816782819,9),
	(9780816782819,2),
	(9780816782819,5),
	(9781177554350,2),
	(9780596398057,13);

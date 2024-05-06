CREATE TABLE `morador` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `telefone` char,
  `status` varchar(255)
);

CREATE TABLE `medidor` (
  `id` integer PRIMARY KEY,
  `tipo` varchar(255),
  `marca` varchar(255),
  `modelo` varchar(255),
  `instalacao` datetime,
  `status` bool,
  `morador_id` integer
);

CREATE TABLE `consumo` (
  `id` integer PRIMARY KEY,
  `consumo` float,
  `datademonitoramento` datetime,
  `medidor_id` integer,
  `morador_id` integer,
  `tarifaDeEnergia_id` integer
);

CREATE TABLE `tarifaDeEnergia` (
  `id` integer PRIMARY KEY,
  `valor` decimal,
  `codigodepagamento` float,
  `tipo` varchar(255),
  `vigencia` date
);

CREATE TABLE `indicadorAltoConsumo` (
  `id` integer PRIMARY KEY,
  `tipo` varchar(255),
  `descricao` varchar(255),
  `data` datetime,
  `morador_id` integer
);

CREATE TABLE `eletrodomestico` (
  `id` integer PRIMARY KEY,
  `nome` varchar(255),
  `potencia` float,
  `morador_id` integer,
  `status` varchar(255),
  `descricao` varchar(255)
);

ALTER TABLE `indicadorAltoConsumo` ADD FOREIGN KEY (`id`) REFERENCES `medidor` (`id`);

ALTER TABLE `consumo` ADD FOREIGN KEY (`id`) REFERENCES `morador` (`id`);

ALTER TABLE `medidor` ADD FOREIGN KEY (`id`) REFERENCES `morador` (`id`);

ALTER TABLE `consumo` ADD FOREIGN KEY (`consumo`) REFERENCES `medidor` (`id`);

ALTER TABLE `consumo` ADD FOREIGN KEY (`consumo`) REFERENCES `tarifaDeEnergia` (`id`);

ALTER TABLE `indicadorAltoConsumo` ADD FOREIGN KEY (`id`) REFERENCES `eletrodomestico` (`id`);

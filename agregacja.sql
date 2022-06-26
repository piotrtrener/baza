-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 23 Paź 2020, 17:07
-- Wersja serwera: 10.1.34-MariaDB
-- Wersja PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `agregacja`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osoby`
--

CREATE TABLE `osoby` (
  `id` int(11) NOT NULL,
  `imie` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `nazwisko` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL,
  `rok_urodzenia` year(4) DEFAULT NULL,
  `miejscowosc` varchar(45) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `osoby`
--

INSERT INTO `osoby` (`id`, `imie`, `nazwisko`, `rok_urodzenia`, `miejscowosc`) VALUES
(1, 'Adam', 'Kowalski', 1984, 'Bydgoszcz'),
(2, 'Adam', 'Nowak', 1982, 'Szczecin'),
(3, 'Andrzej', 'Kowalski', 1996, 'Nidzica'),
(4, 'Arkadiusz', 'Malinowski', 1996, 'Kielce'),
(5, 'Andrzej', 'Malinowski', 1976, 'Kielce'),
(6, 'Krzysztof', 'Nowicki', 1996, 'Bydgoszcz'),
(7, 'Kacper', 'Adamczyk', 1981, 'Kielce'),
(8, 'Kamil', 'Andrzejczak', 1981, 'Kraków'),
(9, 'Krzysztof', 'Arkuszewski', 1978, 'Szczecin'),
(10, 'Kamil', 'Borowski', 1986, 'Skierniewice');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id` int(11) NOT NULL,
  `klient_id` int(11) DEFAULT NULL,
  `towar_id` int(11) DEFAULT NULL,
  `data` datetime DEFAULT CURRENT_TIMESTAMP,
  `wartosc` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id`, `klient_id`, `towar_id`, `data`, `wartosc`) VALUES
(1, 1, 2, '2010-01-01 00:00:00', 122.44),
(2, 1, 4, '2010-01-01 00:00:00', 100.22),
(3, 1, 2, '2010-02-12 00:00:00', 158.88),
(4, 2, 1, '2010-01-01 00:00:00', 224.35),
(5, 2, 1, '2010-02-12 00:00:00', 223.35),
(6, 2, 4, '2010-03-01 00:00:00', 267.28),
(7, 3, 1, '2010-02-11 00:00:00', 180.48),
(8, 3, 4, '2010-01-01 00:00:00', 120.44),
(9, 4, 1, '2010-03-11 00:00:00', 150.26),
(10, 5, 4, '2010-03-02 00:00:00', 60.11);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `osoby`
--
ALTER TABLE `osoby`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `klient_id` (`klient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `osoby`
--
ALTER TABLE `osoby`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD CONSTRAINT `zamowienia_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `osoby` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

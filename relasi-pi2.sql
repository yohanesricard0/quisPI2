-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jun 2021 pada 15.16
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `relasi-pi2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `member`
--

CREATE TABLE `member` (
  `member_id` int(11) NOT NULL,
  `nama` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `alamat` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `tlp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `member`
--

INSERT INTO `member` (`member_id`, `nama`, `alamat`, `tlp`) VALUES
(1, 'Ricardo', 'Jl. Cipto', '083567498723'),
(2, 'muhammad', 'Jl. Perum', '089754860971'),
(3, 'puja', 'Jl. Pegambiran', '082109865486');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mobil`
--

CREATE TABLE `mobil` (
  `mobil_id` int(11) NOT NULL,
  `merktipe` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `thnkeluaran` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `tarif` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mobil`
--

INSERT INTO `mobil` (`mobil_id`, `merktipe`, `thnkeluaran`, `tarif`) VALUES
(100, 'Avanza', '2010', '500.000'),
(101, 'Toyota', '2008', '400.000'),
(102, 'Sedan', '2005', '300.000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rental`
--

CREATE TABLE `rental` (
  `rental_id` int(11) NOT NULL,
  `mobil_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `lamarental` varchar(100) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rental`
--

INSERT INTO `rental` (`rental_id`, `mobil_id`, `member_id`, `lamarental`) VALUES
(1, 100, 1, '2 jam'),
(2, 101, 2, '3 jam'),
(3, 102, 3, '2 jam');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member_id`);

--
-- Indeks untuk tabel `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`mobil_id`);

--
-- Indeks untuk tabel `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`rental_id`),
  ADD KEY `mobil_id` (`mobil_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`mobil_id`) REFERENCES `mobil` (`mobil_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
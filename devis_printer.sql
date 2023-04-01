-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Apr 2023 pada 19.29
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `devis_printer`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesan`
--

CREATE TABLE `detail_pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_produk` char(5) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_pesan`
--

INSERT INTO `detail_pesan` (`id_pesan`, `id_produk`, `jumlah`, `harga`) VALUES
(1, 'K0001', 1, 1000000),
(2, 'K0002', 2, 3000000),
(3, 'K0006', 1, 3500000),
(4, 'K0006', 2, 7000000),
(5, 'K0005', 1, 2500000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `faktur`
--

CREATE TABLE `faktur` (
  `id_faktur` int(11) NOT NULL,
  `tgl_faktur` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `faktur`
--

INSERT INTO `faktur` (`id_faktur`, `tgl_faktur`) VALUES
(1, '2023-01-12'),
(2, '2023-02-22'),
(3, '2023-02-08'),
(4, '2023-02-06'),
(5, '2023-02-05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kuitansi`
--

CREATE TABLE `kuitansi` (
  `id_kuitansi` int(11) NOT NULL,
  `tgl_kuitansi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kuitansi`
--

INSERT INTO `kuitansi` (`id_kuitansi`, `tgl_kuitansi`) VALUES
(101, '2023-01-12'),
(102, '2023-01-22'),
(103, '2023-01-23'),
(104, '2023-01-24'),
(105, '2023-01-26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nm_pelanggan` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nm_pelanggan`, `alamat`, `telepon`, `email`) VALUES
(1, 'devis', 'bekasi', '0866878', 'devis@gmail.com'),
(2, 'deka', 'bekasi', '0866878', 'deka@gmail.com'),
(3, 'jamal', 'jakarta', '085657888786', 'jamal@gmail.com'),
(4, 'yusuf', 'jakarta', '0812898989', 'yusuf@gmail.com'),
(5, 'fajar', 'batam', '0812676879', 'fajar@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(11) NOT NULL,
  `tgl_pesan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `tgl_pesan`) VALUES
(1, '2023-03-22'),
(2, '2023-01-02'),
(3, '2003-04-11'),
(4, '0000-00-00'),
(5, '2003-05-10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` char(5) NOT NULL,
  `nm_produk` varchar(25) NOT NULL,
  `satuan` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nm_produk`, `satuan`, `harga`, `stock`) VALUES
('K0001', 'Canon ip320', 1, 1000000, 12),
('K0002', 'EPSON L100', 1, 1500000, 5),
('K0003', 'HP L00', 1, 1500000, 5),
('K0004', 'CANON T300', 1, 8500000, 6),
('K0005', 'SAMSUNG LASER JET L100', 1, 2500000, 11),
('K0006', 'EPSON X320', 1, 3500000, 10);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_pesan`
--
ALTER TABLE `detail_pesan`
  ADD PRIMARY KEY (`id_pesan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indeks untuk tabel `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`id_faktur`);

--
-- Indeks untuk tabel `kuitansi`
--
ALTER TABLE `kuitansi`
  ADD PRIMARY KEY (`id_kuitansi`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_pesan`
--
ALTER TABLE `detail_pesan`
  ADD CONSTRAINT `detail_pesan_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

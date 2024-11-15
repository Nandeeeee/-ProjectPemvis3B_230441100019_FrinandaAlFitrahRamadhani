-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Nov 2024 pada 17.26
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_tradisiwide`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `nama`, `password`) VALUES
(1, 'admin', 123);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_varian_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id`, `id_transaksi`, `id_varian_produk`, `jumlah`) VALUES
(1, 1, 4, 2),
(2, 2, 1, 2),
(3, 3, 7, 3),
(4, 4, 7, 1),
(5, 5, 6, 1),
(6, 6, 6, 1),
(7, 7, 2, 2),
(8, 8, 2, 3),
(9, 9, 5, 1),
(10, 10, 6, 2),
(11, 11, 6, 2),
(12, 12, 6, 2),
(13, 13, 3, 1),
(14, 14, 5, 1),
(15, 15, 6, 1),
(16, 16, 5, 2),
(17, 17, 6, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `status` enum('tersedia','tidak tersedia') NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `gambar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `deskripsi`, `harga`, `status`, `tipe`, `gambar`) VALUES
(1, 'Baju Adat Kebaya', 'Kebaya tradisional dengan desain modern yang tetap mempertahankan unsur klasik. Cocok untuk acara resmi maupun perayaan adat.', 350000, 'tersedia', 'pakaian', 'kebaya2.png'),
(2, 'Sarung Tenun Ikat', 'Sarung tenun asli buatan tangan dengan motif khas Nusantara. Dapat digunakan sebagai bawahan untuk acara adat atau pakaian sehari-hari.', 150000, 'tersedia', 'pakaian', 'sarung_tenun2.png'),
(3, 'Topeng Bali', 'Topeng ukiran tangan khas Bali yang sering digunakan dalam tarian dan pertunjukan adat. Cocok sebagai dekorasi rumah atau koleksi.', 180000, 'tersedia', 'kerajinan tangan', 'topeng_bali2.jpg'),
(4, 'Anyaman Rotan Lampit', 'Anyaman rotan khas Kalimantan yang dapat digunakan sebagai alas duduk atau dekorasi ruangan. Ringan dan mudah dibawa.', 90000, 'tersedia', 'kerajinan tangan', 'rotan2.png'),
(5, 'Angklung', 'Alat musik tradisional Sunda yang terbuat dari bambu dan menghasilkan nada saat digoyangkan. Ideal untuk koleksi atau hiasan rumah.', 75000, 'tersedia', 'alat musik', 'angklung2.jpg'),
(6, 'Gendang Jawa', 'Gendang tradisional Jawa dengan suara khas, sering digunakan dalam musik gamelan. Cocok untuk melengkapi koleksi alat musik tradisional.', 250000, 'tersedia', 'alat musik', 'gendang_jawa2.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `total_harga` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_user`, `tgl_transaksi`, `total_harga`) VALUES
(1, 3, '2024-11-14', 150000),
(2, 3, '2024-11-14', 700000),
(3, 3, '2024-11-15', 369),
(4, 3, '2024-11-15', 123),
(5, 4, '2024-11-15', 250000),
(6, 4, '2024-11-15', 250000),
(7, 5, '2024-11-15', 300000),
(8, 5, '2024-11-15', 450000),
(9, 5, '2024-11-15', 75000),
(10, 2, '2024-11-15', 500000),
(11, 2, '2024-11-15', 500000),
(12, 2, '2024-11-15', 500000),
(13, 2, '2024-11-15', 180000),
(14, 2, '2024-11-15', 75000),
(15, 2, '2024-11-15', 250000),
(16, 3, '2024-11-15', 150000),
(17, 3, '2024-11-15', 1000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` int(8) NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `jenis_kelamin`, `alamat`, `no_hp`) VALUES
(1, 'fulan fulano', 'fulann', 123, 'Laki-Laki', 'Dsn Daja Lorong RT 013 RW 002 Desa Tanamerah Kecamatan Saronggi Kabupaten Sumenep', '081234567890'),
(2, 'Umar Bin Khatab', 'umar', 123, 'Laki-Laki', 'Dsn Daja Lorong RT 013 RW 002 Desa Tanamerah Keamatan Saronggi Kabupaten Sumenep', '085123456789'),
(3, 'Frinanda Al Fitrah Ramadhani', 'Nandee', 123, 'Laki-Laki', 'Dsn Daja Lorong RT 013 RW 002 Desa Tanamerah Kecamatan Saronggi Kabupaten Sumenep ', '089876543210'),
(4, 'asdasd', 'asd', 123, 'Laki-Laki', 'asd', '812'),
(5, 'Budiono Siregar', 'aaa', 123, 'Perempuan', 'aaa', '11111'),
(6, 'aaa', 'bbb', 123, 'Perempuan', 'aaa', 'aaa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `varian_produk`
--

CREATE TABLE `varian_produk` (
  `id` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `atribut_nama` varchar(50) NOT NULL,
  `atribut_nilai` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `varian_produk`
--

INSERT INTO `varian_produk` (`id`, `id_produk`, `atribut_nama`, `atribut_nilai`, `stok`) VALUES
(1, 1, 'Ukuran', 'S', 20),
(2, 1, 'Ukuran', 'L', 20),
(3, 1, 'Ukuran', 'XL', 20),
(4, 2, 'Ukuran', 'S', 20),
(6, 2, 'Ukuran', 'L', 20),
(7, 2, 'Ukuran', 'XL', 20),
(8, 3, 'Ukuran', 'Kecil', 20),
(10, 3, 'Ukuran', 'Besar', 20),
(11, 4, 'Ukuran', 'Sedang', 20),
(12, 4, 'Ukuran', 'Besar', 20),
(13, 5, 'Bahan', 'Bambu Asli', 20),
(14, 5, 'Bahan', 'Bambu Premium', 20),
(15, 6, 'Bahan', 'Kayu Nangka', 20),
(16, 6, 'Bahan', 'Kayu Mahoni', 20),
(17, 1, 'Ukuran', 'XXL', 21),
(18, 6, 'Bahan', 'Kayu Rambutan', 20);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_transaksi` (`id_transaksi`,`id_varian_produk`),
  ADD KEY `id_varian_produk` (`id_varian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `varian_produk`
--
ALTER TABLE `varian_produk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produk` (`id_produk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `varian_produk`
--
ALTER TABLE `varian_produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

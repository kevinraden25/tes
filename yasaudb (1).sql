-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2022 at 01:59 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yasaudb`
--

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `kode_guru` char(5) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `nama_guru` varchar(100) NOT NULL,
  `kelamin` varchar(10) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `status_aktif` enum('Aktif','Tidak') NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(30) NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`kode_guru`, `nip`, `nama_guru`, `kelamin`, `alamat`, `no_telepon`, `status_aktif`, `username`, `password`, `gambar`) VALUES
('G0002', '-', 'Asep Aris Setiawan, ST', 'Laki-Laki', 'Juntinyuat', '087828644808', 'Aktif', 'aris', 'guru', 'gambar_guru/Penguins.jpg'),
('G0001', '-', 'Handika', 'Laki-Laki', 'Kepandean', '089653475617', 'Aktif', 'handika', 'guru', 'gambar_guru/handika.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kode_kelas` char(4) NOT NULL,
  `tahun_ajar` varchar(12) NOT NULL,
  `kelas` char(2) NOT NULL,
  `nama_kelas` varchar(20) NOT NULL,
  `kode_guru` char(5) NOT NULL,
  `status_aktif` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kode_kelas`, `tahun_ajar`, `kelas`, `nama_kelas`, `kode_guru`, `status_aktif`) VALUES
('K001', '2015/2016', 'X', 'Kelas A', 'G0001', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_siswa`
--

CREATE TABLE `kelas_siswa` (
  `id` int(5) NOT NULL,
  `kode_kelas` char(4) NOT NULL,
  `kode_siswa` char(5) NOT NULL,
  `jurusan` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_siswa`
--

INSERT INTO `kelas_siswa` (`id`, `kode_kelas`, `kode_siswa`, `jurusan`) VALUES
(1, 'K001', 'S0001', 'Teknik Komputer & Jaringan');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id` int(5) NOT NULL,
  `semester` int(2) NOT NULL,
  `kode_pelajaran` char(4) NOT NULL,
  `kode_guru` char(5) NOT NULL,
  `kode_kelas` char(4) NOT NULL,
  `kode_siswa` char(5) NOT NULL,
  `nilai_tugas1` int(4) NOT NULL,
  `nilai_tugas2` int(4) NOT NULL,
  `nilai_tugas3` int(4) NOT NULL,
  `nilai_uts` int(4) NOT NULL,
  `nilai_uas` int(4) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id`, `semester`, `kode_pelajaran`, `kode_guru`, `kode_kelas`, `kode_siswa`, `nilai_tugas1`, `nilai_tugas2`, `nilai_tugas3`, `nilai_uts`, `nilai_uas`, `keterangan`) VALUES
(4, 1, 'P009', 'G0001', 'K001', 'S0001', 80, 80, 80, 80, 80, 'Lulus'),
(5, 2, 'P010', 'G0002', 'K001', 'S0001', 80, 80, 80, 80, 80, 'Lulus'),
(6, 1, 'P010', 'G0002', 'K001', 'S0001', 80, 80, 80, 80, 80, 'Lulus');

-- --------------------------------------------------------

--
-- Table structure for table `pelajaran`
--

CREATE TABLE `pelajaran` (
  `kode_pelajaran` char(4) NOT NULL,
  `nama_pelajaran` varchar(100) NOT NULL,
  `kkm` varchar(2) NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelajaran`
--

INSERT INTO `pelajaran` (`kode_pelajaran`, `nama_pelajaran`, `kkm`, `keterangan`) VALUES
('P001', 'Pendidikan Agama', '60', 'Wajib'),
('P002', 'Pendidikan Pancasila dan Kewarganegaraan', '70', 'Wajib'),
('P003', 'Bahasa Indonesia', '68', 'Wajib'),
('P004', 'Bahasa Inggris', '62', 'Wajib'),
('P005', 'Matematika', '60', 'Wajib'),
('P006', 'Sejarah Indonesia', '63', 'Wajib'),
('P007', 'Bahasa dan Sastra Inggris', '70', 'Wajib'),
('P008', 'Kimia', '68', 'Wajib'),
('P009', 'Jaringan Dasar', '75', 'Wajib'),
('P010', 'Pemrograman Dasar', '75', 'Wajib');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `kode_siswa` char(5) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `kelamin` varchar(20) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `tahun_angkatan` char(4) NOT NULL,
  `status` enum('Aktif','Lulus','Keluar') NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gambar` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`kode_siswa`, `nis`, `nama_siswa`, `kelamin`, `agama`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `no_telepon`, `tahun_angkatan`, `status`, `username`, `password`, `gambar`) VALUES
('S002', '12312', 'keren', 'Laki-Laki', '089776272', 'jakarta', '0022-02-22', 'dsdasd', '2222', '2019', 'Aktif', '', '', 'gambar_siswa/DN_j_VVVQAAqAma.j'),
('S001', '123123', 'udin', 'Perempuan', 'Islam', 'jakarta', '1992-02-22', 'weqwe', 'qewe', '2019', 'Aktif', '', '', 'gambar_siswa/download (1).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(4) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `gambar` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `fullname`, `gambar`) VALUES
(4, 'admin', 'Yasau12345', 'ADMIN', 'gambar_admin/yasau.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`kode_guru`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kode_kelas`);

--
-- Indexes for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelajaran`
--
ALTER TABLE `pelajaran`
  ADD PRIMARY KEY (`kode_pelajaran`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`kode_siswa`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2024 at 05:27 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webkontraktor`
--

DELIMITER $$
--
-- Procedures
--
CREATE PROCEDURE `adminweb_projectberjalan` ()  SELECT * FROM adminweb_projectberjalan
WHERE status = 'sedang_berjalan'$$

CREATE PROCEDURE `adminweb_projectsel` ()  SELECT * FROM adminweb_projectsel
WHERE status = 'selesai'$$

CREATE PROCEDURE `filter_absen` (IN `tgl_mulai` DATE, IN `tgl_selesai` DATE, IN `iduser` INT)  SELECT * FROM absen WHERE id_user = iduser AND (date BETWEEN tgl_mulai AND tgl_selesai)$$

CREATE PROCEDURE `new_project` (IN `id_project1` INT, IN `nama_project1` VARCHAR(255), IN `lokasi1` VARCHAR(255), IN `estimasi1` VARCHAR(255), IN `cost1` VARCHAR(255), IN `deskripsi1` TEXT)  BEGIN
 
 DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    
    START TRANSACTION;

        INSERT INTO project(id_project, status, created_at) VALUES(id_project1, 'sedang_berjalan', now());
        INSERT INTO detail_project(id_project, nama_project, lokasi, estimasi, cost, deskripsi) VALUES(id_project1, nama_project1, lokasi1, estimasi1, cost1, deskripsi1);

    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;

END$$

CREATE PROCEDURE `pm_detail_project` (IN `idproject` INT(50))  SELECT * FROM pm_detail_project
WHERE id_project = idproject$$

CREATE PROCEDURE `pm_laporan_project` (IN `idproject` INT(50))  SELECT * FROM pm_laporan_project
WHERE id_project = idproject$$

CREATE PROCEDURE `pm_la_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_la_laporan
WHERE id_project = idproject
AND id_type = 'LA'$$

CREATE PROCEDURE `pm_la_project` (IN `idproject` INT(50))  SELECT * FROM pm_laporan_project
WHERE id_project = idproject$$

CREATE PROCEDURE `pm_lda_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lda_laporan
WHERE id_project = idproject
AND id_type = 'DT'
AND status = 'Accept'$$

CREATE PROCEDURE `pm_ldp_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_ldp_laporan
where id_project = idproject
AND id_type = 'DT'
AND status = 'pending'$$

CREATE PROCEDURE `pm_ld_project` (IN `idproject` INT)  SELECT * FROM pm_ld_project
WHERE id_project = idproject$$

CREATE PROCEDURE `pm_lha_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lha_laporan
WHERE id_project = idproject
AND id_type = 'LH'
AND status = 'Accept'$$

CREATE PROCEDURE `pm_lhp_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lhp_laporan
WHERE id_project = idproject
AND id_type = 'LH'
AND status = 'pending'$$

CREATE PROCEDURE `pm_lhv_identify` (IN `idlaporan` VARCHAR(50))  SELECT * FROM pm_lhv_identify
WHERE id_laporan = idlaporan$$

CREATE PROCEDURE `pm_lh_project` (IN `idproject` INT(50))  SELECT * FROM pm_lh_project
WHERE id_project = idproject$$

CREATE PROCEDURE `pm_lpa_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lpa_laporan
WHERE id_project = idproject
AND id_type = 'LP'
AND status = 'Accept'$$

CREATE PROCEDURE `pm_lpp_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lpp_laporan
WHERE id_project = idproject
AND id_type = 'LP'
AND status = 'Pending'$$

CREATE PROCEDURE `pm_lp_project` (IN `idproject` INT(50))  SELECT * FROM pm_lp_project
WHERE id_project = idproject$$

CREATE PROCEDURE `pm_lra_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lra_laporan
WHERE id_project = idproject
AND id_type = 'LR'
AND status = 'Accept'$$

CREATE PROCEDURE `pm_lrp_laporan` (IN `idproject` INT(50))  SELECT * FROM pm_lrp_laporan
WHERE id_project = idproject
AND id_type = 'LR'
AND status = 'Pending'$$

CREATE PROCEDURE `pm_lr_project` (IN `idproject` INT(50))  SELECT * FROM pm_lr_project
WHERE id_project = idproject$$

CREATE PROCEDURE `pm_pb2_project` (IN `idproject` INT(50))  SELECT * FROM pm_pb2_project
WHERE id_project = idproject$$

CREATE PROCEDURE `pm_pb_project` ()  SELECT * FROM pm_pb_project
WHERE status = 'sedang_berjalan'$$

CREATE PROCEDURE `pm_selesai_project` ()  SELECT * FROM pm_selesai_project
WHERE status = 'selesai'$$

CREATE PROCEDURE `pm_team_tp` (IN `idproject` INT(50))  SELECT * FROM pm_team_tp
WHERE id_project = idproject$$

CREATE PROCEDURE `repository_detail_project` (IN `idproject` INT(50))  SELECT * FROM repository_detail_project
WHERE id_project = idproject$$

CREATE PROCEDURE `repository_index_project1` (IN `search` VARCHAR(255))  SELECT * FROM repository_index_project1 
WHERE status = 'selesai' AND nama_project LIKE CONCAT('%',search,'%')$$

CREATE PROCEDURE `repository_index_project2` ()  SELECT * FROM repository_index_project2
WHERE status = 'selesai'$$

CREATE PROCEDURE `repository_lamanproject_project` (IN `idproject` INT(50))  SELECT * FROM repository_lamanproject_project
WHERE id_project = idproject$$

CREATE PROCEDURE `repository_laporanakhir_laporan` (IN `idproject` INT(50))  SELECT * FROM repository_laporanakhir_laporan
WHERE id_project = idproject AND id_type = 'LA'$$

CREATE PROCEDURE `repository_laporanakhir_project` (IN `idproject` INT(50))  SELECT * FROM repository_laporanakhir_project
WHERE id_project = idproject$$

CREATE PROCEDURE `repository_laporandokumen_laporan` (IN `idproject` INT(50))  SELECT * FROM repository_laporandokumen_laporan
WHERE id_project = idproject AND id_type = 'DT' AND status = 'Accept'$$

CREATE PROCEDURE `repository_laporanharianview_identify` (IN `idlaporan` INT(50))  SELECT * FROM repository_laporanharianview_identify
WHERE id_laporan = idlaporan$$

CREATE PROCEDURE `repository_laporanharian_laporan` (IN `idproject` INT(50))  SELECT * FROM repository_laporanharian_laporan
WHERE id_project = idproject AND id_type = 'LH' AND status = 'Accept'$$

CREATE PROCEDURE `repository_laporanprogress_laporan` (IN `idproject` INT(25))  SELECT * FROM repository_laporanprogress_laporan
WHERE id_project = idproject AND id_type = 'LP' AND status = 'Accept'$$

CREATE PROCEDURE `repository_laporanrab_laporan` (IN `idproject` INT(50))  SELECT * FROM repository_laporanrab_laporan
WHERE id_project = idproject AND id_type = 'LR' AND status = 'Accept'$$

CREATE PROCEDURE `repository_laporan_project` (IN `idproject` INT(50))  SELECT * FROM repository_laporan_project
WHERE id_project = idproject$$

CREATE PROCEDURE `repository_team_teamproject` (IN `idproject` INT(50))  SELECT * FROM repository_team_teamproject
WHERE id_project = idproject$$

CREATE PROCEDURE `stafflapangan_project_doktambahan` (IN `idproject` INT(50), IN `iduser` INT(50))  SELECT * FROM stafflapangan_project_doktambahan
WHERE id_project = idproject AND id_type = 'DT' AND id_user = iduser$$

CREATE PROCEDURE `stafflapangan_project_lapprogress` (IN `idproject` INT(50), IN `iduser` INT(50))  SELECT * FROM stafflapangan_project_lapprogress
WHERE id_project = idproject AND id_type = 'LP' AND id_user = iduser$$

CREATE PROCEDURE `stafflapangan_project_lapproject` (IN `idproject` INT(50))  SELECT * FROM stafflapangan_project_lapproject
WHERE id_project = idproject$$

CREATE PROCEDURE `stafflapangan_project_laprab` (IN `idproject` INT(50), IN `iduser` INT(50))  SELECT * FROM stafflapangan_project_laprab
WHERE id_project = idproject AND id_type = 'LR' AND id_user = iduser$$

CREATE PROCEDURE `stafflapangan_project_selpro` (IN `idu` INT(50))  SELECT * FROM stafflapangan_project_selpro1
WHERE id_user = idu AND status = 'selesai'$$

CREATE PROCEDURE `stafflapangan_project_selselesai` (IN `idu` INT(50))  SELECT * FROM stafflapangan_project_selselesai
WHERE id_user = idu AND status = 'selesai'$$

CREATE PROCEDURE `stafflapangan_project_tsp` (IN `iduser` INT(50))  SELECT * FROM stafflapangan_project_tsp1
WHERE id_user = iduser AND status = 'sedang_berjalan'$$

CREATE PROCEDURE `store_dokumen_tambahan` (IN `idlaporan` VARCHAR(15), IN `idproject` INT(10), IN `iduser` INT(10), IN `idtype` VARCHAR(5), IN `dokumen1` VARCHAR(255))  BEGIN
 
 DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    
    START TRANSACTION;

        INSERT INTO laporan_project(id_laporan, id_project, id_user, id_type, waktu_dibuat, waktu_dikirim, waktu_dikonfirmasi , status) 
	VALUES(idlaporan, idproject, iduser, idtype, CURRENT_TIMESTAMP(), '', '', 'Belum Dikirim');
        INSERT INTO dokumen_tambahan(id_laporan, dokumen) VALUES(idlaporan, dokumen1);

    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;

END$$

CREATE PROCEDURE `store_laporan_akhir` (IN `idlaporan` VARCHAR(15), IN `idproject` INT(10), IN `iduser` INT(10), IN `idtype` VARCHAR(5), IN `dokumen1` VARCHAR(255))  BEGIN
 
 DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    
    START TRANSACTION;

        INSERT INTO laporan_project(id_laporan, id_project, id_user, id_type, waktu_dibuat, waktu_dikirim, waktu_dikonfirmasi , status) 
	VALUES(idlaporan, idproject, iduser, idtype, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP(), 'Accept');
        INSERT INTO laporan_akhir(id_laporan, dokumen) VALUES(idlaporan, dokumen1);

    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;

END$$

CREATE PROCEDURE `store_laporan_harian` (IN `project_id` VARCHAR(3), IN `user_id` VARCHAR(3))  BEGIN
	INSERT INTO laporan_project(id_laporan, id_project, id_user, id_type, waktu_dibuat, waktu_dikirim, waktu_dikonfirmasi , status)
	SELECT CONCAT(project_id, '-',COUNT(*)+1), project_id, user_id ,'LH', CURRENT_TIMESTAMP(), '', '','Belum Dikirim' FROM laporan_project  WHERE id_project = project_id;
END$$

CREATE PROCEDURE `store_laporan_progress` (IN `idlaporan` VARCHAR(15), IN `idproject` INT(10), IN `iduser` INT(10), IN `idtype` VARCHAR(5), IN `dokumen1` VARCHAR(255))  BEGIN
 
 DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    
    START TRANSACTION;

        INSERT INTO laporan_project(id_laporan, id_project, id_user, id_type, waktu_dibuat, waktu_dikirim, waktu_dikonfirmasi , status) 
	VALUES(idlaporan, idproject, iduser, idtype, CURRENT_TIMESTAMP(), '', '', 'Belum Dikirim');
        INSERT INTO laporan_progress(id_laporan, dokumen) VALUES(idlaporan, dokumen1);

    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;

END$$

CREATE PROCEDURE `store_laporan_rab` (IN `idlaporan` VARCHAR(15), IN `idproject` INT(10), IN `iduser` INT(10), IN `idtype` VARCHAR(5), IN `dokumen1` VARCHAR(255))  BEGIN
 
 DECLARE `_rollback` BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_rollback` = 1;
    
    START TRANSACTION;

        INSERT INTO laporan_project(id_laporan, id_project, id_user, id_type, waktu_dibuat, waktu_dikirim, waktu_dikonfirmasi , status) 
	VALUES(idlaporan, idproject, iduser, idtype, CURRENT_TIMESTAMP(), '', '', 'Belum Dikirim');
        INSERT INTO laporan_rab(id_laporan, dokumen) VALUES(idlaporan, dokumen1);

    IF `_rollback` THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;

END$$

--
-- Functions
--
CREATE FUNCTION `jumlah_laporan_byProject` (`idproject` INT) RETURNS INT(11) READS SQL DATA  BEGIN
DECLARE jml INT;
SELECT COUNT(*) AS total_laporan INTO jml FROM laporan_project WHERE id_project = idproject;
RETURN jml;
END$$

CREATE FUNCTION `jumlah_project` () RETURNS INT(11) READS SQL DATA  BEGIN
DECLARE jml INT;
SELECT COUNT(*) AS total_project INTO jml FROM project;
RETURN jml;
END$$

CREATE FUNCTION `jumlah_project_berjalan` () RETURNS INT(11) READS SQL DATA  BEGIN
DECLARE jml INT;
SELECT COUNT(*) AS total_project INTO jml FROM project WHERE status = 'sedang_berjalan';
RETURN jml;
END$$

CREATE FUNCTION `jumlah_project_selesai` () RETURNS INT(11) READS SQL DATA  BEGIN
DECLARE jml INT;
SELECT COUNT(*) AS total_project INTO jml FROM project WHERE status = 'selesai';
RETURN jml;
END$$

CREATE FUNCTION `jumlah_staffkantor` () RETURNS INT(11) READS SQL DATA  BEGIN
DECLARE jml INT;
SELECT COUNT(*) AS total_staffKantor INTO jml FROM users WHERE jabatan = 'Staff';
RETURN jml;
END$$

CREATE FUNCTION `jumlah_stafflapangan` () RETURNS INT(11) READS SQL DATA  BEGIN
DECLARE jml INT;
SELECT COUNT(*) AS total_stafflapangan INTO jml FROM users WHERE jabatan = 'Admin' OR jabatan = 'Drafter' OR jabatan = 'Pengawas_Lapangan';
RETURN jml;
END$$

CREATE FUNCTION `stafflapangan_pb` (`iduser` INT) RETURNS INT(11) READS SQL DATA  BEGIN
DECLARE jml INT;
SELECT COUNT(*) AS total_project_stafflapangan INTO jml FROM stafflapangan_project_tsp WHERE status = 'sedang_berjalan' AND id_user = iduser;
RETURN jml;
END$$

CREATE FUNCTION `stafflapangan_ps` (`iduser` INT) RETURNS INT(11) READS SQL DATA  BEGIN
DECLARE jml INT;
SELECT COUNT(*) AS total_project_stafflapangan INTO jml FROM stafflapangan_project_tsp WHERE status = 'selesai' AND id_user = iduser;
RETURN jml;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `id_absen` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `absen`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_ID` BEFORE UPDATE ON `absen` FOR EACH ROW BEGIN 
IF(new.id_absen <> old.id_absen)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "gabisa di update id";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_IDUSER` BEFORE UPDATE ON `absen` FOR EACH ROW BEGIN
IF(new.id_user <> old.id_user)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "TIDAK BOLEH MENGUPDATE ID USER";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_WAKTU_OUT_IF_NOT_NULL` BEFORE UPDATE ON `absen` FOR EACH ROW BEGIN
IF(old.time_out IS NOT NULL)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "WAKTU KELUAR SUDAH DIBUAT, TIDAK BOLEH DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_absen` AFTER INSERT ON `absen` FOR EACH ROW INSERT INTO log_table_absen (from_table, date_time, user, aktivitas)
VALUES ('absen', now(), USER(), CONCAT('Insert data, id user = ', NEW.id_user, ' ,id_absen = ',NEW.id_absen))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_absen` AFTER UPDATE ON `absen` FOR EACH ROW INSERT INTO log_table_absen (from_table, date_time, user, aktivitas)
VALUES ('absen', now(), USER(), CONCAT('Update data, id user = ', NEW.id_user, ' ,id_absen = ',NEW.id_absen))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_absen` BEFORE DELETE ON `absen` FOR EACH ROW INSERT INTO log_table_absen (from_table, date_time, user, aktivitas)
VALUES ('absen', now(), USER(), CONCAT('Delete data, id user = ', old.id_user, ' ,id_absen = ',old.id_absen))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_idabsen` BEFORE UPDATE ON `absen` FOR EACH ROW BEGIN
IF(new.id_absen <> old.id_absen)
THEN
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf Tidak bisa Merubah id";
 END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_today_absen` BEFORE INSERT ON `absen` FOR EACH ROW BEGIN
IF EXISTS(SELECT date FROM `absen` WHERE date = new.date AND id_user = new.id_user)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf Absen Hari ini Sudah Ada";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_notif_not_karyawan` BEFORE INSERT ON `absen` FOR EACH ROW IF (new.id_user NOT IN (SELECT id FROM users)) THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, id user anda tidak terdaftar";
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dont_update_timein` BEFORE UPDATE ON `absen` FOR EACH ROW BEGIN
IF(new.time_in <> old.time_in)
THEN
 SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'WAKTU MASUK TIDAK BOLEH DI UPDATE';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `adminweb_projectberjalan`
-- (See below for the actual view)
--
CREATE TABLE `adminweb_projectberjalan` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`Total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `adminweb_projectsel`
-- (See below for the actual view)
--
CREATE TABLE `adminweb_projectsel` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`Total` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_client` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nohp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id_client`, `email`, `name`, `nohp`, `created_at`, `updated_at`) VALUES
(1, 'nikodema01@gmail.com', 'Budiman', '0812313451541', '2024-10-11 06:39:59', NULL),
(2, 'bobby@gmail.com', 'bobby', '0888989898', '2024-11-25 20:13:29', NULL),
(3, 'bobby@gmail.com', 'bobby', '0888989898', '2024-11-25 20:59:07', NULL),
(4, 'qodemenu@gmail.com', 'bobby', '0888989898', '2024-11-25 21:11:36', NULL),
(5, 'qodemenu@gmail.com', 'bobby', '0888989898', '2024-11-25 21:14:15', NULL),
(6, 'qodemenu@gmail.com', 'bobby', '081823123123', '2024-11-25 21:14:43', NULL),
(7, 'qodemenu@gmail.com', 'bobby', '08123123123', '2024-11-25 21:33:11', NULL),
(8, 'boby@gmail.com', 'boby', '08123123123', '2024-11-25 21:47:55', NULL),
(9, 'qodemenu@gmail.com', 'boby', '08123123123', '2024-11-25 21:49:41', NULL),
(10, 'anonim@gmail.com', 'anonim', '0812999999', '2024-11-25 21:52:29', NULL);

--
-- Triggers `client`
--
DELIMITER $$
CREATE TRIGGER `after_insert_client` AFTER INSERT ON `client` FOR EACH ROW INSERT INTO log_table_client (from_table, date_time, user, aktivitas)
VALUES ('client', now(), USER(), CONCAT('Insert data, id client = ', NEW.id_client))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_client` AFTER UPDATE ON `client` FOR EACH ROW INSERT INTO log_table_client (from_table, date_time, user, aktivitas)
VALUES ('client', now(), USER(), CONCAT('Update data, id client = ', NEW.id_client))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_client` BEFORE DELETE ON `client` FOR EACH ROW INSERT INTO log_table_client (from_table, date_time, user, aktivitas)
VALUES ('client', now(), USER(), CONCAT('Delete data, id client = ', OLD.id_client))
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_project`
--

CREATE TABLE `detail_project` (
  `id_project` int(10) UNSIGNED NOT NULL,
  `nama_project` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `lokasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_project`
--

INSERT INTO `detail_project` (`id_project`, `nama_project`, `lokasi`, `estimasi`, `cost`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Pembangunan Gudang Beras', 'Medan Estate, Kec. Percut Sei Tuan, Kabupaten Deli Serdang, Sumatera Utara 20371', '2 Bulan', '2 Milliar', 'Membangun Gudang untuk penyimpanan beras di Deli Sedang', NULL, NULL),
(2, 'Konstruksi Jalan Tegal Rejo', 'Tegal Rejo, Kec. Medan Perjuangan, Kota Medan, Sumatera Utara 20236', '2  Bulan', '800 Juta', 'Perbaikan jalan di Tegal Rejo Medan Perjuangan', NULL, NULL),
(3, 'Pembangunan Outlet Alfamidi', 'Jalan Medan Tenggara No. VII, Medan Tenggara, Kec. Medan Denai, Kota Medan, Sumatera Utara 20228', '1 Bulan', '600 Juta', 'Pembangunan Outlet Alfamidi Jalan Medan Tenggara', NULL, NULL),
(4, 'Project SMP 27 Medan', 'Jl. Pancing Pasar IV No.2, Kenangan Baru, Kec. Percut Sei Tuan, Kabupaten Deli Serdang, Sumatera Utara 20241', '2 Bulan', '800 Juta', 'Pembangunan Gedung Sekolah Baru di SMP 27 Medan', NULL, NULL),
(5, 'Outlet Jualan Mixue Medan', 'Jl. Asia Raya No.7, Sukaramai II, Kec. Medan Area, Kota Medan, Sumatera Utara 20224', '1 Bulan', '400 JT', 'Pembangunan Outlet Jualan Mixue Medan Asia Megamas', NULL, NULL),
(6, 'Pembangunan Jalan Tol Simalingkar', 'Jl Simalingkar', '2 Bulan', '3 M', 'Pembangunan Jalan Tol Simalingkar sepanjang 200 KM', NULL, NULL),
(7, 'test project', 'usu', '2 bulan', '1 M', 'poject jalan usu', NULL, NULL),
(8, 'test', 'sdc', '34r3', 'cedc', 'edced', NULL, NULL),
(9, 'Project Stadion USU', '121e123', '3234', '1M', 'SCDSC', NULL, NULL),
(10, 'Project Stadion USU 1', '121e123', '3234', '1M', '121', NULL, NULL),
(11, 'Ruko', 'Jl. Abadi', '2 Bulan', 'Rp. 750.000', 'Ruko 3 Lantai', NULL, NULL),
(12, 'Ruko', 'Jl. Abadi', '2 Bulan', 'Rp. 750.000', 'Ruko 3 Lantai', NULL, NULL),
(13, 'Ruko', 'Jl. Abadi', '2 Bulan', 'Rp. 750.000.000', 'Ruko 3 Lantai', NULL, NULL);

--
-- Triggers `detail_project`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_ID_PROJECT` BEFORE UPDATE ON `detail_project` FOR EACH ROW BEGIN
IF(new.id_project <> old.id_project)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_detail_project` AFTER INSERT ON `detail_project` FOR EACH ROW INSERT INTO log_table_detail_project (from_table, date_time, user, aktivitas)
VALUES ('detail_project', now(), USER(), CONCAT('Insert data, id project = ', NEW.id_project))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_detail_project` AFTER UPDATE ON `detail_project` FOR EACH ROW INSERT INTO log_table_detail_project (from_table, date_time, user, aktivitas)
VALUES ('detail_project', now(), USER(), CONCAT('Update data, id project = ', NEW.id_project))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_detail_project` BEFORE DELETE ON `detail_project` FOR EACH ROW INSERT INTO log_table_detail_project (from_table, date_time, user, aktivitas)
VALUES ('detail_project', now(), USER(), CONCAT('Delete data, id project = ', OLD.id_project))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_detail-project_notif_project_id_not_exist` BEFORE INSERT ON `detail_project` FOR EACH ROW IF (new.id_project not IN(SELECT id_project FROM project)) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, id Project belum terdaftar";
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_sub_laporan_harian`
--

CREATE TABLE `detail_sub_laporan_harian` (
  `id_sub_laporan` enum('PKR','TMPB','PR','PK','CBA','KJPP') NOT NULL,
  `deskripsi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_sub_laporan_harian`
--

INSERT INTO `detail_sub_laporan_harian` (`id_sub_laporan`, `deskripsi`) VALUES
('PKR', 'Pekerjaan'),
('TMPB', 'TIba Mutasi Dan Bahan Kontruksi Pokok'),
('PR', 'Pemakaian Peralatan'),
('PK', 'Personil Kontraktor/Konsultan Dan Proyek'),
('CBA', 'Cuaca Dan Bencana Alam'),
('KJPP', 'Kejadian Lain Penghambat Pekerjaan');

--
-- Triggers `detail_sub_laporan_harian`
--
DELIMITER $$
CREATE TRIGGER `dont_update_kodesub` BEFORE UPDATE ON `detail_sub_laporan_harian` FOR EACH ROW BEGIN
IF(new.id_sub_laporan <> old.id_sub_laporan)
THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id sub laporan tidak bisa dirubah";
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_type_laporan`
--

CREATE TABLE `detail_type_laporan` (
  `id_type` enum('LH','LP','LR','DT','LA') NOT NULL,
  `deskripsi` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_type_laporan`
--

INSERT INTO `detail_type_laporan` (`id_type`, `deskripsi`) VALUES
('LH', 'Laporan Harian'),
('LP', 'Laporan Progress'),
('LR', 'Laporan RAB'),
('DT', 'Dokumen Tambahan'),
('LA', 'Laporan Akhir');

--
-- Triggers `detail_type_laporan`
--
DELIMITER $$
CREATE TRIGGER `dont_update_kodetype` BEFORE UPDATE ON `detail_type_laporan` FOR EACH ROW BEGIN
IF(new.id_type <> old.id_type)
THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id sub laporan tidak bisa dirubah";
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_tambahan`
--

CREATE TABLE `dokumen_tambahan` (
  `id_laporan` varchar(15) NOT NULL,
  `dokumen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokumen_tambahan`
--

INSERT INTO `dokumen_tambahan` (`id_laporan`, `dokumen`) VALUES
('1-6', '1-6-KURVA S.pdf'),
('1-7', '1-7-Surat Pemberitahuan Revisi Lapangan.pdf'),
('1-8', '1-9-PAGAR.pdf'),
('10-4', '10-4-Tugas Keahlian Presentasi dan Komunikasi.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_akhir`
--

CREATE TABLE `laporan_akhir` (
  `id_laporan` varchar(15) NOT NULL,
  `dokumen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_akhir`
--

INSERT INTO `laporan_akhir` (`id_laporan`, `dokumen`) VALUES
('1-10', '1-10-LAPORAN-AKHIR-CCS-Petobo-1.pdf'),
('4-2', '4-2-LAPORAN-AKHIR-CCS-Petobo-1.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian`
--

CREATE TABLE `laporan_harian` (
  `id_laporan` varchar(15) NOT NULL,
  `kode_laporan_harian` varchar(30) NOT NULL,
  `id_sub_laporan` enum('PKR','TMPB','PR','PK','CBA','KJPP') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_harian`
--

INSERT INTO `laporan_harian` (`id_laporan`, `kode_laporan_harian`, `id_sub_laporan`) VALUES
('1-9', '1-9-CBA', 'CBA'),
('1-9', '1-9-KJPP', 'KJPP'),
('1-9', '1-9-PK', 'PK'),
('1-9', '1-9-PKR', 'PKR'),
('1-9', '1-9-PR', 'PR'),
('1-9', '1-9-TMPB', 'TMPB'),
('10-1', '10-1-CBA', 'CBA'),
('10-1', '10-1-KJPP', 'KJPP'),
('10-1', '10-1-PK', 'PK'),
('10-1', '10-1-PKR', 'PKR'),
('10-1', '10-1-PR', 'PR'),
('10-1', '10-1-TMPB', 'TMPB'),
('4-1', '4-1-CBA', 'CBA'),
('4-1', '4-1-KJPP', 'KJPP'),
('4-1', '4-1-PK', 'PK'),
('4-1', '4-1-PKR', 'PKR'),
('4-1', '4-1-PR', 'PR'),
('4-1', '4-1-TMPB', 'TMPB');

--
-- Triggers `laporan_harian`
--
DELIMITER $$
CREATE TRIGGER `decline_if_notexist` BEFORE INSERT ON `laporan_harian` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_project WHERE id_laporan = new.id_laporan )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id laporan harian belum terdaftar";
     ELSEIF NOT EXISTS(SELECT * FROM detail_sub_laporan_harian WHERE id_sub_laporan = new.id_sub_laporan)
     THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "sub laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_cba`
--

CREATE TABLE `laporan_harian_cba` (
  `kode_laporan_harian` varchar(15) NOT NULL,
  `jenis` varchar(25) DEFAULT NULL,
  `rentang_waktu` varchar(50) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_harian_cba`
--

INSERT INTO `laporan_harian_cba` (`kode_laporan_harian`, `jenis`, `rentang_waktu`, `ket`) VALUES
('1-9-CBA', 'Cerah', '11.00 - 17.00', 'Cerah Sepanjang Hari');

--
-- Triggers `laporan_harian_cba`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_KODE_LH_CBA` BEFORE UPDATE ON `laporan_harian_cba` FOR EACH ROW BEGIN
IF(new.kode_laporan_harian <> old.kode_laporan_harian)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexist` BEFORE INSERT ON `laporan_harian_cba` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_harian WHERE kode_laporan_harian = new.kode_laporan_harian )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "kode laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_kjpp`
--

CREATE TABLE `laporan_harian_kjpp` (
  `kode_laporan_harian` varchar(15) NOT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `rentang_jam` varchar(50) DEFAULT NULL,
  `ket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `laporan_harian_kjpp`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_KODE_LH_KJPP` BEFORE UPDATE ON `laporan_harian_kjpp` FOR EACH ROW BEGIN
IF(new.kode_laporan_harian <> old.kode_laporan_harian)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexistkjpp` BEFORE INSERT ON `laporan_harian_kjpp` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_harian WHERE kode_laporan_harian = new.kode_laporan_harian )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "kode laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_pk`
--

CREATE TABLE `laporan_harian_pk` (
  `kode_laporan_harian` varchar(15) NOT NULL,
  `tugas_jabatan` varchar(50) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_harian_pk`
--

INSERT INTO `laporan_harian_pk` (`kode_laporan_harian`, `tugas_jabatan`, `jumlah`, `lokasi`) VALUES
('1-9-PK', 'Drafter', 2, 'project gudang beras, Medan Estate'),
('1-9-PK', 'Pengawas Lapangan', 1, 'project gudang beras, Medan Estate');

--
-- Triggers `laporan_harian_pk`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_HARIAN_PK` BEFORE UPDATE ON `laporan_harian_pk` FOR EACH ROW BEGIN
IF(new.kode_laporan_harian <> old.kode_laporan_harian)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexistpr` BEFORE INSERT ON `laporan_harian_pk` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_harian WHERE kode_laporan_harian = new.kode_laporan_harian )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "kode laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_pkr`
--

CREATE TABLE `laporan_harian_pkr` (
  `kode_laporan_harian` varchar(15) NOT NULL,
  `jenis_pekerjaan` varchar(50) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_harian_pkr`
--

INSERT INTO `laporan_harian_pkr` (`kode_laporan_harian`, `jenis_pekerjaan`, `volume`, `lokasi`) VALUES
('1-9-PKR', 'pembuatan pondasi', NULL, 'project gudang beras, Medan Estate'),
('1-9-PKR', 'Pengecoran Pondasi', NULL, 'project gudang beras, Medan Estate'),
('1-9-PKR', 'Pembangunan Kerangka', NULL, 'project gudang beras, Medan Estate'),
('4-1-PKR', 'Pembangunan Pondasi', NULL, 'SMP 27 medan'),
('10-1-PKR', 'qeqw', 'eqweq', '124124');

--
-- Triggers `laporan_harian_pkr`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_KODE_LH_PKR` BEFORE UPDATE ON `laporan_harian_pkr` FOR EACH ROW BEGIN
IF(new.kode_laporan_harian <> old.kode_laporan_harian)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexistpkr` BEFORE INSERT ON `laporan_harian_pkr` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_harian WHERE kode_laporan_harian = new.kode_laporan_harian )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "kode laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_pr`
--

CREATE TABLE `laporan_harian_pr` (
  `kode_laporan_harian` varchar(15) NOT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_harian_pr`
--

INSERT INTO `laporan_harian_pr` (`kode_laporan_harian`, `jenis`, `volume`, `lokasi`) VALUES
('1-9-PR', 'Semen', '400 Sak', 'project gudang beras, Medan Estate');

--
-- Triggers `laporan_harian_pr`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_KODE_LH_PR` BEFORE UPDATE ON `laporan_harian_pr` FOR EACH ROW BEGIN
IF(new.kode_laporan_harian <> old.kode_laporan_harian)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexistpk` BEFORE INSERT ON `laporan_harian_pr` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_harian WHERE kode_laporan_harian = new.kode_laporan_harian )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "kode laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_harian_tmpb`
--

CREATE TABLE `laporan_harian_tmpb` (
  `kode_laporan_harian` varchar(15) NOT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  `volume` varchar(50) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_harian_tmpb`
--

INSERT INTO `laporan_harian_tmpb` (`kode_laporan_harian`, `jenis`, `volume`, `lokasi`) VALUES
('1-9-TMPB', 'Semen', '800 Sak', 'project gudang beras, Medan Estate'),
('1-9-TMPB', 'Batu Kerikil', '3 Dam Truck', 'project gudang beras, Medan Estate');

--
-- Triggers `laporan_harian_tmpb`
--
DELIMITER $$
CREATE TRIGGER `DONT_UPDATE_KODE_LH_TMPB` BEFORE UPDATE ON `laporan_harian_tmpb` FOR EACH ROW BEGIN
IF(new.kode_laporan_harian <> old.kode_laporan_harian)
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UPDATE";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexisttmpb` BEFORE INSERT ON `laporan_harian_tmpb` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_harian WHERE kode_laporan_harian = new.kode_laporan_harian )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "kode laporan harian belum terdaftar";
     END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_progress`
--

CREATE TABLE `laporan_progress` (
  `id_laporan` varchar(15) NOT NULL,
  `dokumen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_progress`
--

INSERT INTO `laporan_progress` (`id_laporan`, `dokumen`) VALUES
('1-1', '1-1-PROGRES.pdf'),
('1-2', '1-2-document (1).pdf'),
('1-3', '1-3-PROGRES.pdf'),
('10-2', '10-2-Tugas Keahlian Presentasi dan Komunikasi.pdf');

--
-- Triggers `laporan_progress`
--
DELIMITER $$
CREATE TRIGGER `check_if_idlaporanexist` BEFORE INSERT ON `laporan_progress` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_project WHERE id_laporan = new.id_laporan )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id laporan progress belum terdaftar";
     END IF;
     END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_project`
--

CREATE TABLE `laporan_project` (
  `id_laporan` varchar(15) CHARACTER SET utf8mb4 NOT NULL,
  `id_project` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_type` enum('LH','LP','LR','DT','LA') COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu_dibuat` timestamp NOT NULL DEFAULT current_timestamp(),
  `waktu_dikirim` datetime NOT NULL DEFAULT current_timestamp(),
  `waktu_dikonfirmasi` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','Accept','Decline','Belum Dikirim') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laporan_project`
--

INSERT INTO `laporan_project` (`id_laporan`, `id_project`, `id_user`, `id_type`, `waktu_dibuat`, `waktu_dikirim`, `waktu_dikonfirmasi`, `status`) VALUES
('1-1', 1, 40, 'LP', '2023-01-08 23:31:29', '2023-01-09 06:31:38', '2023-01-08 23:42:10', 'Accept'),
('1-10', 1, 50, 'LA', '2023-01-08 23:43:21', '2023-01-09 06:43:21', '2023-01-09 06:43:21', 'Accept'),
('1-2', 1, 40, 'LP', '2023-01-08 23:31:50', '2023-01-09 06:31:55', '2023-01-08 23:42:20', 'Accept'),
('1-3', 1, 40, 'LP', '2023-01-08 23:32:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Belum Dikirim'),
('1-4', 1, 40, 'LR', '2023-01-08 23:32:22', '2023-01-09 06:32:44', '2023-01-08 23:42:40', 'Decline'),
('1-5', 1, 40, 'LR', '2023-01-08 23:32:40', '2023-01-09 06:32:47', '2023-01-08 23:42:45', 'Accept'),
('1-6', 1, 40, 'DT', '2023-01-08 23:33:08', '2023-01-09 06:33:21', '2023-01-08 23:42:57', 'Accept'),
('1-7', 1, 40, 'DT', '2023-01-08 23:33:16', '2023-01-09 06:33:26', '0000-00-00 00:00:00', 'Pending'),
('1-8', 1, 40, 'DT', '2023-01-08 23:34:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Belum Dikirim'),
('1-9', 1, 40, 'LH', '2023-01-08 23:34:46', '2023-01-09 06:41:01', '2023-01-08 23:41:44', 'Accept'),
('10-1', 10, 34, 'LH', '2024-11-26 05:15:26', '2024-11-26 12:16:11', '0000-00-00 00:00:00', 'Pending'),
('10-2', 10, 34, 'LP', '2024-11-26 05:16:31', '2024-11-26 12:16:38', '0000-00-00 00:00:00', 'Pending'),
('10-3', 10, 34, 'LR', '2024-11-26 05:17:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Belum Dikirim'),
('10-4', 10, 34, 'DT', '2024-11-26 05:17:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Belum Dikirim'),
('4-1', 4, 41, 'LH', '2023-01-11 14:32:44', '2023-01-11 21:39:27', '2023-01-11 14:51:20', 'Decline'),
('4-2', 4, 50, 'LA', '2023-01-11 14:57:31', '2023-01-11 21:57:31', '2023-01-11 21:57:31', 'Accept');

--
-- Triggers `laporan_project`
--
DELIMITER $$
CREATE TRIGGER `DONT_CHANGE_SEMUAWAKTU` BEFORE UPDATE ON `laporan_project` FOR EACH ROW BEGIN
IF((new.waktu_dikirim <> old.waktu_dikirim OR new.waktu_dikonfirmasi <> old.waktu_dikonfirmasi OR new.waktu_dibuat <> old.waktu_dibuat) AND (old.status = 'Accept'))
THEN
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI HAPUS";
 END IF;
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DONT_CHANGE_WAKTU_DIKIRIM` BEFORE UPDATE ON `laporan_project` FOR EACH ROW BEGIN
IF((new.waktu_dikirim <> old.waktu_dikirim ) AND (old.status = 'Pending'))
THEN
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI HAPUS";
 END IF;
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `DONT_UBAH_WAKTUDIKIRIM` BEFORE UPDATE ON `laporan_project` FOR EACH ROW BEGIN
IF(new.waktu_dibuat <> old.waktu_dibuat)
THEN
 SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "JANGAN DI UBAH BRO\r\n ";
 END IF;
 END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_laporan_project` AFTER INSERT ON `laporan_project` FOR EACH ROW INSERT INTO log_table_laporan_project (from_table, date_time, user, aktivitas)
VALUES ('laporan_project', now(), USER(), CONCAT('Insert data, id project = ', NEW.id_project, ' ,id_laporan = ',NEW.id_laporan))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_laporan_project` AFTER UPDATE ON `laporan_project` FOR EACH ROW INSERT INTO log_table_laporan_project (from_table, date_time, user, aktivitas)
VALUES ('laporan_project', now(), USER(), CONCAT('Update data, id project = ', NEW.id_project, ' ,id_laporan = ',NEW.id_laporan))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_laporan_project` BEFORE DELETE ON `laporan_project` FOR EACH ROW INSERT INTO log_table_laporan_project (from_table, date_time, user, aktivitas)
VALUES ('laporan_project', now(), USER(), CONCAT('Delete data, id project = ', OLD.id_project, ' ,id_laporan = ',OLD.id_laporan))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `check_ifexist_today_lh` BEFORE INSERT ON `laporan_project` FOR EACH ROW BEGIN
IF EXISTS(SELECT DATE(waktu_dibuat) FROM `laporan_project` WHERE DATE(waktu_dibuat) = CURRENT_DATE() AND id_project = new.id_project AND id_type = 'LH' AND new.id_type = 'LH')
THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf Laporan Harian Hari ini Sudah Ada";
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_laporan-project_notif_project_id_not_exist` BEFORE INSERT ON `laporan_project` FOR EACH ROW IF (new.id_project not IN(SELECT id_project FROM project)) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, id Project belum terdaftar";
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert_laporan_harian` AFTER INSERT ON `laporan_project` FOR EACH ROW BEGIN IF (NEW.id_type = 'LH') THEN 
INSERT INTO laporan_harian(id_laporan, kode_laporan_harian, id_sub_laporan) VALUES(new.id_laporan, CONCAT(NEW.id_laporan, '-CBA'), 'CBA'); 
INSERT INTO laporan_harian(id_laporan, kode_laporan_harian, id_sub_laporan) VALUES(new.id_laporan, CONCAT(NEW.id_laporan, '-PK'), 'PK'); 
INSERT INTO laporan_harian(id_laporan, kode_laporan_harian, id_sub_laporan) VALUES(new.id_laporan, CONCAT(NEW.id_laporan, '-PKR'), 'PKR');
INSERT INTO laporan_harian(id_laporan, kode_laporan_harian, id_sub_laporan) VALUES(new.id_laporan, CONCAT(NEW.id_laporan, '-PR'), 'PR');
INSERT INTO laporan_harian(id_laporan, kode_laporan_harian, id_sub_laporan) VALUES(new.id_laporan, CONCAT(NEW.id_laporan, '-KJPP'), 'KJPP'); 
INSERT INTO laporan_harian(id_laporan, kode_laporan_harian, id_sub_laporan) VALUES(new.id_laporan, CONCAT(NEW.id_laporan, '-TMPB'), 'TMPB'); 
END IF; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `laporan_rab`
--

CREATE TABLE `laporan_rab` (
  `id_laporan` varchar(15) NOT NULL,
  `dokumen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan_rab`
--

INSERT INTO `laporan_rab` (`id_laporan`, `dokumen`) VALUES
('1-4', '1-4-CONTOH-RAB.pdf'),
('1-5', '1-5-CONTOH-RAB.pdf'),
('10-3', '10-3-Tugas Keahlian Presentasi dan Komunikasi.pdf');

--
-- Triggers `laporan_rab`
--
DELIMITER $$
CREATE TRIGGER `decline_id_ifnotexistrab` BEFORE INSERT ON `laporan_rab` FOR EACH ROW BEGIN
	IF NOT EXISTS(SELECT * FROM laporan_project WHERE id_laporan = new.id_laporan )
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id laporan harian belum terdaftar";
     END IF;
     END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_absen`
--

CREATE TABLE `log_table_absen` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_absen`
--

INSERT INTO `log_table_absen` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('absen', '2022-12-27 12:55:36', 'root@localhost', 'Insert data, id user = 28 ,id_absen = 12'),
('absen', '2022-12-27 12:56:47', 'root@localhost', 'Update data, id user = 28 ,id_absen = 12'),
('absen', '2022-12-27 12:57:53', 'root@localhost', 'Delete data, id user = 28 ,id_absen = 12'),
('absen', '2022-12-27 13:42:47', 'root@localhost', 'Insert data, id user = 28 ,id_absen = 7'),
('absen', '2022-12-27 13:42:59', 'root@localhost', 'Delete data, id user = 28 ,id_absen = 11'),
('absen', '2023-01-07 19:21:18', 'root@localhost', 'Insert data, id user = 28 ,id_absen = 13'),
('absen', '2023-01-07 19:21:23', 'root@localhost', 'Update data, id user = 28 ,id_absen = 13');

--
-- Triggers `log_table_absen`
--
DELIMITER $$
CREATE TRIGGER `absen_send_to_monitoring` AFTER INSERT ON `log_table_absen` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_client`
--

CREATE TABLE `log_table_client` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_client`
--

INSERT INTO `log_table_client` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('client', '2022-12-27 13:28:50', 'root@localhost', 'Insert data, id client = 7'),
('client', '2022-12-27 13:28:50', 'root@localhost', 'Update data, id client = 7'),
('client', '2022-12-27 13:29:48', 'root@localhost', 'Update data, id client = 7'),
('client', '2022-12-27 13:29:54', 'root@localhost', 'Delete data, id client = 7'),
('client', '2022-12-27 13:43:14', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:09:59', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:27:18', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:27:25', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:27:34', 'root@localhost', 'Update data, id client = 4'),
('client', '2022-12-27 15:27:42', 'root@localhost', 'Update data, id client = 4'),
('client', '2023-01-08 17:04:47', 'root@localhost', 'Delete data, id client = 2'),
('client', '2023-01-08 17:04:49', 'root@localhost', 'Delete data, id client = 4'),
('client', '2023-01-08 17:04:50', 'root@localhost', 'Delete data, id client = 5'),
('client', '2023-01-08 17:04:52', 'root@localhost', 'Delete data, id client = 6'),
('client', '2023-01-11 13:39:59', 'root@localhost', 'Insert data, id client = 1'),
('client', '2024-11-19 07:36:34', 'root@localhost', 'Update data, id client = 1'),
('client', '2024-11-26 03:13:29', 'root@localhost', 'Insert data, id client = 2'),
('client', '2024-11-26 03:59:07', 'root@localhost', 'Insert data, id client = 3'),
('client', '2024-11-26 04:11:36', 'root@localhost', 'Insert data, id client = 4'),
('client', '2024-11-26 04:14:15', 'root@localhost', 'Insert data, id client = 5'),
('client', '2024-11-26 04:14:43', 'root@localhost', 'Insert data, id client = 6'),
('client', '2024-11-26 04:33:11', 'root@localhost', 'Insert data, id client = 7'),
('client', '2024-11-26 04:47:55', 'root@localhost', 'Insert data, id client = 8'),
('client', '2024-11-26 04:49:41', 'root@localhost', 'Insert data, id client = 9'),
('client', '2024-11-26 04:52:29', 'root@localhost', 'Insert data, id client = 10');

--
-- Triggers `log_table_client`
--
DELIMITER $$
CREATE TRIGGER `client_send_to_monitoring` AFTER INSERT ON `log_table_client` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_detail_project`
--

CREATE TABLE `log_table_detail_project` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_detail_project`
--

INSERT INTO `log_table_detail_project` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('detail_project', '2022-12-27 13:14:41', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 02:08:18', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 02:23:10', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 02:23:32', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 14:23:54', 'root@localhost', 'Insert data, id project = 104'),
('detail_project', '2023-01-07 15:03:20', 'root@localhost', 'Update data, id project = 104'),
('detail_project', '2023-01-07 15:03:30', 'root@localhost', 'Update data, id project = 104'),
('detail_project', '2023-01-07 15:06:15', 'root@localhost', 'Update data, id project = 104'),
('detail_project', '2023-01-07 15:55:27', 'root@localhost', 'Update data, id project = 103'),
('detail_project', '2023-01-07 18:06:11', 'root@localhost', 'Insert data, id project = 105'),
('detail_project', '2023-01-07 18:31:53', 'root@localhost', 'Update data, id project = 102'),
('detail_project', '2023-01-08 17:25:26', 'root@localhost', 'Insert data, id project = 1'),
('detail_project', '2023-01-08 23:20:36', 'root@localhost', 'Insert data, id project = 2'),
('detail_project', '2023-01-08 23:24:51', 'root@localhost', 'Insert data, id project = 3'),
('detail_project', '2023-01-08 23:26:28', 'root@localhost', 'Insert data, id project = 4'),
('detail_project', '2023-01-08 23:28:36', 'root@localhost', 'Insert data, id project = 5'),
('detail_project', '2023-01-11 13:44:50', 'root@localhost', 'Insert data, id project = 6'),
('detail_project', '2023-01-11 13:53:17', 'root@localhost', 'Update data, id project = 2'),
('detail_project', '2024-11-19 07:42:55', 'root@localhost', 'Insert data, id project = 7'),
('detail_project', '2024-11-19 09:01:45', 'root@localhost', 'Insert data, id project = 8'),
('detail_project', '2024-11-19 09:05:32', 'root@localhost', 'Insert data, id project = 9'),
('detail_project', '2024-11-26 04:57:44', 'root@localhost', 'Insert data, id project = 10'),
('detail_project', '2024-11-26 06:25:14', 'root@localhost', 'Insert data, id project = 11'),
('detail_project', '2024-11-26 06:26:47', 'root@localhost', 'Insert data, id project = 12'),
('detail_project', '2024-11-26 06:30:36', 'root@localhost', 'Insert data, id project = 13');

--
-- Triggers `log_table_detail_project`
--
DELIMITER $$
CREATE TRIGGER `detail_project_send_to_monitoring` AFTER INSERT ON `log_table_detail_project` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_laporan_project`
--

CREATE TABLE `log_table_laporan_project` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_laporan_project`
--

INSERT INTO `log_table_laporan_project` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('laporan_project', '2022-12-27 13:20:05', 'root@localhost', 'Insert data, id project = 103 ,id_laporan = 103-1'),
('laporan_project', '2022-12-27 13:20:19', 'root@localhost', 'Update data, id project = 103 ,id_laporan = 103-2'),
('laporan_project', '2022-12-27 13:21:39', 'root@localhost', 'Insert data, id project = 103 ,id_laporan = 103-1'),
('laporan_project', '2022-12-27 13:21:47', 'root@localhost', 'Delete data, id project = 103 ,id_laporan = 103-1'),
('laporan_project', '2022-12-27 13:21:51', 'root@localhost', 'Delete data, id project = 103 ,id_laporan = 103-2'),
('laporan_project', '2023-01-07 17:08:25', 'root@localhost', 'Update data, id project = 102 ,id_laporan = 102-2'),
('laporan_project', '2023-01-07 17:08:50', 'root@localhost', 'Update data, id project = 102 ,id_laporan = 102-3'),
('laporan_project', '2023-01-07 17:12:04', 'root@localhost', 'Update data, id project = 102 ,id_laporan = 102-7'),
('laporan_project', '2023-01-07 17:32:22', 'root@localhost', 'Update data, id project = 102 ,id_laporan = 102-8'),
('laporan_project', '2023-01-08 01:50:37', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 02:53:08', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 02:54:09', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 02:57:27', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 02:57:52', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 02:59:33', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 02:59:39', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 02:59:54', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 03:00:02', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 03:00:16', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 03:00:21', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 03:00:43', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 03:04:28', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 03:04:37', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 03:06:12', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 03:06:17', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 03:06:29', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:06:34', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:06:55', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:07:04', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:08:25', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:08:30', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:12:56', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 03:24:45', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 03:24:49', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 03:24:53', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 03:26:18', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:26:29', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:26:55', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:27:00', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:27:04', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:27:14', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:27:34', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:27:43', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:27:55', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:32:33', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:33:09', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:34:04', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:34:40', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:35:17', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:36:29', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:36:36', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:37:46', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:44:05', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 03:48:04', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 03:48:10', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 03:51:34', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:51:57', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:58:46', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:58:54', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:59:07', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:03:00', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:03:50', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 04:04:22', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 04:04:35', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:07:29', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:07:46', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:07:55', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:09:30', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:10:04', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:13:25', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:36:23', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:36:34', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:38:36', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-6'),
('laporan_project', '2023-01-08 04:38:41', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-6'),
('laporan_project', '2023-01-08 04:38:45', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:39:48', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:39:55', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:40:40', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-6'),
('laporan_project', '2023-01-08 04:40:45', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-6'),
('laporan_project', '2023-01-08 04:42:11', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:42:38', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:42:46', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:43:00', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:44:37', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:46:18', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:46:27', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:46:32', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 17:05:31', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-6'),
('laporan_project', '2023-01-08 17:05:33', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 17:05:35', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-16'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-15'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-14'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-13'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-12'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-11'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-9'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-8'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-7'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-6'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-5'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-4'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-3'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-2'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-10'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-1'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 101 ,id_laporan = 1-1'),
('laporan_project', '2023-01-08 23:31:29', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-1'),
('laporan_project', '2023-01-08 23:31:38', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-1'),
('laporan_project', '2023-01-08 23:31:50', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-2'),
('laporan_project', '2023-01-08 23:31:55', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-2'),
('laporan_project', '2023-01-08 23:32:03', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-3'),
('laporan_project', '2023-01-08 23:32:22', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-4'),
('laporan_project', '2023-01-08 23:32:40', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-5'),
('laporan_project', '2023-01-08 23:32:44', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-4'),
('laporan_project', '2023-01-08 23:32:47', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-5'),
('laporan_project', '2023-01-08 23:33:08', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-6'),
('laporan_project', '2023-01-08 23:33:16', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-7'),
('laporan_project', '2023-01-08 23:33:21', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-6'),
('laporan_project', '2023-01-08 23:33:26', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-7'),
('laporan_project', '2023-01-08 23:33:36', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-8'),
('laporan_project', '2023-01-08 23:34:00', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-9'),
('laporan_project', '2023-01-08 23:34:11', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-8'),
('laporan_project', '2023-01-08 23:34:36', 'root@localhost', 'Delete data, id project = 1 ,id_laporan = 1-8'),
('laporan_project', '2023-01-08 23:34:40', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-8'),
('laporan_project', '2023-01-08 23:34:46', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-9'),
('laporan_project', '2023-01-08 23:41:01', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-9'),
('laporan_project', '2023-01-08 23:41:44', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-9'),
('laporan_project', '2023-01-08 23:42:10', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-1'),
('laporan_project', '2023-01-08 23:42:20', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-2'),
('laporan_project', '2023-01-08 23:42:40', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-4'),
('laporan_project', '2023-01-08 23:42:45', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-5'),
('laporan_project', '2023-01-08 23:42:57', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-6'),
('laporan_project', '2023-01-08 23:43:21', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-10'),
('laporan_project', '2023-01-11 14:32:44', 'root@localhost', 'Insert data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:39:27', 'root@localhost', 'Update data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:46:34', 'root@localhost', 'Update data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:48:06', 'root@localhost', 'Update data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:49:23', 'root@localhost', 'Update data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:50:51', 'root@localhost', 'Update data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:51:20', 'root@localhost', 'Update data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:57:31', 'root@localhost', 'Insert data, id project = 4 ,id_laporan = 4-2'),
('laporan_project', '2024-11-26 05:15:26', 'root@localhost', 'Insert data, id project = 10 ,id_laporan = 10-1'),
('laporan_project', '2024-11-26 05:16:11', 'root@localhost', 'Update data, id project = 10 ,id_laporan = 10-1'),
('laporan_project', '2024-11-26 05:16:31', 'root@localhost', 'Insert data, id project = 10 ,id_laporan = 10-2'),
('laporan_project', '2024-11-26 05:16:38', 'root@localhost', 'Update data, id project = 10 ,id_laporan = 10-2'),
('laporan_project', '2024-11-26 05:17:04', 'root@localhost', 'Insert data, id project = 10 ,id_laporan = 10-3'),
('laporan_project', '2024-11-26 05:17:20', 'root@localhost', 'Insert data, id project = 10 ,id_laporan = 10-4');

--
-- Triggers `log_table_laporan_project`
--
DELIMITER $$
CREATE TRIGGER `laporan_project_send_to_monitoring` AFTER INSERT ON `log_table_laporan_project` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_negosiasi`
--

CREATE TABLE `log_table_negosiasi` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_negosiasi`
--

INSERT INTO `log_table_negosiasi` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('negosiasi', '2022-12-27 13:33:07', 'root@localhost', 'Insert data, id client = 2 ,id negosiasi = 5'),
('negosiasi', '2022-12-27 13:33:16', 'root@localhost', 'Update data, id client = 2 ,id negosiasi = 5'),
('negosiasi', '2022-12-27 13:33:23', 'root@localhost', 'Delete data, id client = 2 ,id negosiasi = 5'),
('negosiasi', '2022-12-27 14:17:18', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2022-12-27 14:17:58', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2022-12-27 14:41:51', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2022-12-27 15:09:43', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2023-01-07 03:02:36', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 5'),
('negosiasi', '2023-01-07 03:02:44', 'root@localhost', 'Delete data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2023-01-07 03:52:58', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 5'),
('negosiasi', '2023-01-07 03:54:05', 'root@localhost', 'Delete data, id client = 2 ,id negosiasi = 1'),
('negosiasi', '2023-01-07 03:54:23', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 6'),
('negosiasi', '2023-01-07 03:54:36', 'root@localhost', 'Insert data, id client = 5 ,id negosiasi = 7'),
('negosiasi', '2023-01-07 03:54:42', 'root@localhost', 'Delete data, id client = 5 ,id negosiasi = 7'),
('negosiasi', '2023-01-07 03:58:38', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 6'),
('negosiasi', '2023-01-07 03:59:27', 'root@localhost', 'Insert data, id client = 5 ,id negosiasi = 7'),
('negosiasi', '2023-01-07 03:59:38', 'root@localhost', 'Insert data, id client = 5 ,id negosiasi = 8'),
('negosiasi', '2023-01-07 03:59:47', 'root@localhost', 'Delete data, id client = 5 ,id negosiasi = 8'),
('negosiasi', '2023-01-07 04:00:10', 'root@localhost', 'Insert data, id client = 5 ,id negosiasi = 9'),
('negosiasi', '2023-01-07 04:00:16', 'root@localhost', 'Insert data, id client = 5 ,id negosiasi = 10'),
('negosiasi', '2023-01-07 04:03:32', 'root@localhost', 'Delete data, id client = 5 ,id negosiasi = 10'),
('negosiasi', '2023-01-07 04:03:55', 'root@localhost', 'Delete data, id client = 5 ,id negosiasi = 9'),
('negosiasi', '2023-01-07 04:04:57', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 11'),
('negosiasi', '2023-01-07 04:05:01', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 12'),
('negosiasi', '2023-01-07 04:05:06', 'root@localhost', 'Delete data, id client = 5 ,id negosiasi = 7'),
('negosiasi', '2023-01-07 04:05:51', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 12'),
('negosiasi', '2023-01-07 04:10:14', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 11'),
('negosiasi', '2023-01-07 04:10:35', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 13'),
('negosiasi', '2023-01-07 04:10:40', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 14'),
('negosiasi', '2023-01-07 04:10:48', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 15'),
('negosiasi', '2023-01-07 04:10:53', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 16'),
('negosiasi', '2023-01-07 04:11:00', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 16'),
('negosiasi', '2023-01-07 04:11:11', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 15'),
('negosiasi', '2023-01-07 04:11:29', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 17'),
('negosiasi', '2023-01-07 04:11:40', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 18'),
('negosiasi', '2023-01-07 04:11:54', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 18'),
('negosiasi', '2023-01-07 04:13:03', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 17'),
('negosiasi', '2023-01-07 04:13:23', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 14'),
('negosiasi', '2023-01-07 04:13:46', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 19'),
('negosiasi', '2023-01-07 04:13:52', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 20'),
('negosiasi', '2023-01-07 04:14:44', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 20'),
('negosiasi', '2023-01-07 04:15:25', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 19'),
('negosiasi', '2023-01-07 04:16:02', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 13'),
('negosiasi', '2023-01-07 04:16:21', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 20'),
('negosiasi', '2023-01-07 04:16:25', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 20'),
('negosiasi', '2023-01-07 04:16:34', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 20'),
('negosiasi', '2023-01-07 04:16:38', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 21'),
('negosiasi', '2023-01-07 04:17:10', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 21'),
('negosiasi', '2023-01-07 13:32:15', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 20'),
('negosiasi', '2023-01-11 13:40:00', 'root@localhost', 'Insert data, id client = 1 ,id negosiasi = 22'),
('negosiasi', '2024-11-26 03:13:29', 'root@localhost', 'Insert data, id client = 2 ,id negosiasi = 23'),
('negosiasi', '2024-11-26 03:59:07', 'root@localhost', 'Insert data, id client = 3 ,id negosiasi = 24'),
('negosiasi', '2024-11-26 04:11:36', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 25'),
('negosiasi', '2024-11-26 04:14:15', 'root@localhost', 'Insert data, id client = 5 ,id negosiasi = 26'),
('negosiasi', '2024-11-26 04:14:43', 'root@localhost', 'Insert data, id client = 6 ,id negosiasi = 27'),
('negosiasi', '2024-11-26 04:33:11', 'root@localhost', 'Insert data, id client = 7 ,id negosiasi = 28'),
('negosiasi', '2024-11-26 04:47:55', 'root@localhost', 'Insert data, id client = 8 ,id negosiasi = 29'),
('negosiasi', '2024-11-26 04:49:41', 'root@localhost', 'Insert data, id client = 9 ,id negosiasi = 30'),
('negosiasi', '2024-11-26 04:52:29', 'root@localhost', 'Insert data, id client = 10 ,id negosiasi = 31');

--
-- Triggers `log_table_negosiasi`
--
DELIMITER $$
CREATE TRIGGER `negosiasi_send_to_monitoring` AFTER INSERT ON `log_table_negosiasi` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_project`
--

CREATE TABLE `log_table_project` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_project`
--

INSERT INTO `log_table_project` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('project', '2022-12-27 13:05:17', 'root@localhost', 'Update data, id project = 103'),
('project', '2022-12-27 13:05:22', 'root@localhost', 'Delete data, id project = 103'),
('project', '2022-12-27 13:14:19', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-27 13:43:38', 'root@localhost', 'Delete data, id project = 103'),
('project', '2022-12-28 02:08:18', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-28 02:08:38', 'root@localhost', 'Delete data, id project = 103'),
('project', '2022-12-28 02:23:10', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-28 02:23:18', 'root@localhost', 'Delete data, id project = 103'),
('project', '2022-12-28 02:23:32', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-28 14:23:54', 'root@localhost', 'Insert data, id project = 104'),
('project', '2023-01-07 13:39:07', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 13:52:13', 'root@localhost', 'Update data, id project = 103'),
('project', '2023-01-07 15:09:49', 'root@localhost', 'Update data, id project = 103'),
('project', '2023-01-07 15:10:04', 'root@localhost', 'Update data, id project = 103'),
('project', '2023-01-07 15:10:12', 'root@localhost', 'Update data, id project = 103'),
('project', '2023-01-07 15:11:05', 'root@localhost', 'Update data, id project = 103'),
('project', '2023-01-07 15:16:19', 'root@localhost', 'Update data, id project = 103'),
('project', '2023-01-07 17:07:49', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 18:06:10', 'root@localhost', 'Insert data, id project = 105'),
('project', '2023-01-07 18:14:06', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 18:14:28', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 18:14:56', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 18:15:27', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 18:17:36', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 18:17:53', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 18:56:25', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-08 17:03:27', 'root@localhost', 'Delete data, id project = 105'),
('project', '2023-01-08 17:05:59', 'root@localhost', 'Delete data, id project = 104'),
('project', '2023-01-08 17:06:01', 'root@localhost', 'Delete data, id project = 103'),
('project', '2023-01-08 17:06:03', 'root@localhost', 'Delete data, id project = 102'),
('project', '2023-01-08 17:06:05', 'root@localhost', 'Delete data, id project = 101'),
('project', '2023-01-08 17:25:26', 'root@localhost', 'Insert data, id project = 1'),
('project', '2023-01-08 23:20:36', 'root@localhost', 'Insert data, id project = 2'),
('project', '2023-01-08 23:24:51', 'root@localhost', 'Insert data, id project = 3'),
('project', '2023-01-08 23:26:28', 'root@localhost', 'Insert data, id project = 4'),
('project', '2023-01-08 23:28:36', 'root@localhost', 'Insert data, id project = 5'),
('project', '2023-01-08 23:43:35', 'root@localhost', 'Update data, id project = 1'),
('project', '2023-01-08 23:45:43', 'root@localhost', 'Update data, id project = 1'),
('project', '2023-01-11 13:44:50', 'root@localhost', 'Insert data, id project = 6'),
('project', '2023-01-11 14:15:49', 'root@localhost', 'Update data, id project = 3'),
('project', '2023-01-11 15:00:12', 'root@localhost', 'Update data, id project = 4'),
('project', '2024-11-19 07:31:40', 'root@localhost', 'Update data, id project = 1'),
('project', '2024-11-19 07:31:56', 'root@localhost', 'Update data, id project = 2'),
('project', '2024-11-19 07:32:16', 'root@localhost', 'Update data, id project = 3'),
('project', '2024-11-19 07:32:37', 'root@localhost', 'Update data, id project = 2'),
('project', '2024-11-19 07:32:45', 'root@localhost', 'Update data, id project = 3'),
('project', '2024-11-19 07:32:57', 'root@localhost', 'Update data, id project = 4'),
('project', '2024-11-19 07:33:11', 'root@localhost', 'Update data, id project = 5'),
('project', '2024-11-19 07:33:28', 'root@localhost', 'Update data, id project = 6'),
('project', '2024-11-19 07:34:05', 'root@localhost', 'Update data, id project = 1'),
('project', '2024-11-19 07:34:20', 'root@localhost', 'Update data, id project = 3'),
('project', '2024-11-19 07:42:55', 'root@localhost', 'Insert data, id project = 7'),
('project', '2024-11-19 09:01:45', 'root@localhost', 'Insert data, id project = 8'),
('project', '2024-11-19 09:05:32', 'root@localhost', 'Insert data, id project = 9'),
('project', '2024-11-19 09:07:24', 'root@localhost', 'Update data, id project = 1'),
('project', '2024-11-26 04:57:44', 'root@localhost', 'Insert data, id project = 10'),
('project', '2024-11-26 06:25:14', 'root@localhost', 'Insert data, id project = 11'),
('project', '2024-11-26 06:26:47', 'root@localhost', 'Insert data, id project = 12'),
('project', '2024-11-26 06:30:36', 'root@localhost', 'Insert data, id project = 13');

--
-- Triggers `log_table_project`
--
DELIMITER $$
CREATE TRIGGER `project_send_to_monitoring` AFTER INSERT ON `log_table_project` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_team_project`
--

CREATE TABLE `log_table_team_project` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_team_project`
--

INSERT INTO `log_table_team_project` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('team_project', '2022-12-27 13:09:28', 'root@localhost', 'Insert data, id project = 102 ,id_user = 23'),
('team_project', '2022-12-28 14:24:00', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2022-12-28 14:24:00', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:45:11', 'root@localhost', 'Delete data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:45:11', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:46:00', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:46:00', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:48:36', 'root@localhost', 'Delete data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:48:36', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:48:36', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:48:36', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:48:36', 'root@localhost', 'Insert data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:48:39', 'root@localhost', 'Delete data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:48:39', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:48:39', 'root@localhost', 'Delete data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:48:39', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:48:39', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:48:39', 'root@localhost', 'Insert data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:49:04', 'root@localhost', 'Delete data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:49:04', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:04', 'root@localhost', 'Delete data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:49:04', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:49:04', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:04', 'root@localhost', 'Insert data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:49:24', 'root@localhost', 'Delete data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:49:24', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:24', 'root@localhost', 'Delete data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:49:24', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:49:24', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:25', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:31', 'root@localhost', 'Delete data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:49:31', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:31', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:31', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:49:31', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:31', 'root@localhost', 'Insert data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:55:49', 'root@localhost', 'Insert data, id project = 103 ,id_user = 25'),
('team_project', '2023-01-07 15:55:49', 'root@localhost', 'Insert data, id project = 103 ,id_user = 26'),
('team_project', '2023-01-07 18:06:17', 'root@localhost', 'Insert data, id project = 105 ,id_user = 25'),
('team_project', '2023-01-07 18:06:17', 'root@localhost', 'Insert data, id project = 105 ,id_user = 26'),
('team_project', '2023-01-07 18:33:36', 'root@localhost', 'Delete data, id project = 102 ,id_user = 25'),
('team_project', '2023-01-07 18:33:36', 'root@localhost', 'Delete data, id project = 102 ,id_user = 26'),
('team_project', '2023-01-07 18:33:36', 'root@localhost', 'Delete data, id project = 102 ,id_user = 27'),
('team_project', '2023-01-07 18:33:36', 'root@localhost', 'Delete data, id project = 102 ,id_user = 23'),
('team_project', '2023-01-07 18:33:37', 'root@localhost', 'Insert data, id project = 102 ,id_user = 25'),
('team_project', '2023-01-07 18:33:37', 'root@localhost', 'Insert data, id project = 102 ,id_user = 26'),
('team_project', '2023-01-07 18:33:37', 'root@localhost', 'Insert data, id project = 102 ,id_user = 27'),
('team_project', '2023-01-08 17:25:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 34'),
('team_project', '2023-01-08 17:25:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 37'),
('team_project', '2023-01-08 17:25:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 40'),
('team_project', '2023-01-08 17:25:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 35'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Delete data, id project = 1 ,id_user = 34'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Delete data, id project = 1 ,id_user = 37'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Delete data, id project = 1 ,id_user = 40'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Delete data, id project = 1 ,id_user = 35'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 34'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 37'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 40'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 35'),
('team_project', '2023-01-08 23:20:55', 'root@localhost', 'Insert data, id project = 2 ,id_user = 40'),
('team_project', '2023-01-08 23:20:55', 'root@localhost', 'Insert data, id project = 2 ,id_user = 38'),
('team_project', '2023-01-08 23:20:55', 'root@localhost', 'Insert data, id project = 2 ,id_user = 36'),
('team_project', '2023-01-08 23:25:10', 'root@localhost', 'Insert data, id project = 3 ,id_user = 40'),
('team_project', '2023-01-08 23:25:10', 'root@localhost', 'Insert data, id project = 3 ,id_user = 36'),
('team_project', '2023-01-08 23:25:10', 'root@localhost', 'Insert data, id project = 3 ,id_user = 41'),
('team_project', '2023-01-08 23:25:10', 'root@localhost', 'Insert data, id project = 3 ,id_user = 39'),
('team_project', '2023-01-08 23:26:55', 'root@localhost', 'Insert data, id project = 4 ,id_user = 40'),
('team_project', '2023-01-08 23:26:55', 'root@localhost', 'Insert data, id project = 4 ,id_user = 41'),
('team_project', '2023-01-08 23:26:55', 'root@localhost', 'Insert data, id project = 4 ,id_user = 34'),
('team_project', '2023-01-08 23:26:55', 'root@localhost', 'Insert data, id project = 4 ,id_user = 37'),
('team_project', '2023-01-08 23:28:53', 'root@localhost', 'Insert data, id project = 5 ,id_user = 40'),
('team_project', '2023-01-08 23:28:53', 'root@localhost', 'Insert data, id project = 5 ,id_user = 35'),
('team_project', '2023-01-11 13:46:02', 'root@localhost', 'Insert data, id project = 6 ,id_user = 36'),
('team_project', '2023-01-11 13:46:02', 'root@localhost', 'Insert data, id project = 6 ,id_user = 38'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Delete data, id project = 2 ,id_user = 40'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Delete data, id project = 2 ,id_user = 38'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Delete data, id project = 2 ,id_user = 36'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Insert data, id project = 2 ,id_user = 40'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Insert data, id project = 2 ,id_user = 38'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Insert data, id project = 2 ,id_user = 36'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Insert data, id project = 2 ,id_user = 43'),
('team_project', '2024-11-19 07:43:02', 'root@localhost', 'Insert data, id project = 7 ,id_user = 34'),
('team_project', '2024-11-19 09:02:02', 'root@localhost', 'Insert data, id project = 8 ,id_user = 36'),
('team_project', '2024-11-19 09:02:02', 'root@localhost', 'Insert data, id project = 8 ,id_user = 39'),
('team_project', '2024-11-19 09:05:46', 'root@localhost', 'Insert data, id project = 9 ,id_user = 34'),
('team_project', '2024-11-26 04:58:44', 'root@localhost', 'Insert data, id project = 10 ,id_user = 34'),
('team_project', '2024-11-26 04:58:44', 'root@localhost', 'Insert data, id project = 10 ,id_user = 37'),
('team_project', '2024-11-26 04:58:44', 'root@localhost', 'Insert data, id project = 10 ,id_user = 40'),
('team_project', '2024-11-26 06:26:53', 'root@localhost', 'Insert data, id project = 12 ,id_user = 34'),
('team_project', '2024-11-26 06:30:40', 'root@localhost', 'Insert data, id project = 13 ,id_user = 34');

--
-- Triggers `log_table_team_project`
--
DELIMITER $$
CREATE TRIGGER `team_project_send_to_monitoring` AFTER INSERT ON `log_table_team_project` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log_table_users`
--

CREATE TABLE `log_table_users` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_table_users`
--

INSERT INTO `log_table_users` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('users', '2022-12-27 12:39:31', 'root@localhost', 'Insert data, id user = 29'),
('users', '2022-12-27 12:40:26', 'root@localhost', 'Insert data, id user = 29'),
('users', '2022-12-27 12:46:58', 'root@localhost', 'Update data, id user = 29'),
('users', '2022-12-27 12:48:48', 'root@localhost', 'Delete data, id user = 29'),
('project', '2022-12-27 13:03:53', 'root@localhost', 'Insert data, id project = 103'),
('users', '2023-01-07 18:02:39', 'root@localhost', 'Insert data, id user = 30'),
('users', '2023-01-07 19:11:24', 'root@localhost', 'Update data, id user = 24'),
('users', '2023-01-07 19:13:36', 'root@localhost', 'Update data, id user = 24'),
('users', '2023-01-07 19:13:49', 'root@localhost', 'Update data, id user = 24'),
('users', '2023-01-07 19:14:41', 'root@localhost', 'Update data, id user = 24'),
('users', '2023-01-07 19:15:02', 'root@localhost', 'Update data, id user = 24'),
('users', '2023-01-07 19:21:06', 'root@localhost', 'Update data, id user = 28'),
('users', '2023-01-08 03:02:57', 'root@localhost', 'Update data, id user = 27'),
('users', '2023-01-08 17:02:25', 'root@localhost', 'Delete data, id user = 23'),
('users', '2023-01-08 17:02:28', 'root@localhost', 'Delete data, id user = 24'),
('users', '2023-01-08 17:02:30', 'root@localhost', 'Delete data, id user = 25'),
('users', '2023-01-08 17:02:33', 'root@localhost', 'Delete data, id user = 26'),
('users', '2023-01-08 17:02:50', 'root@localhost', 'Delete data, id user = 28'),
('users', '2023-01-08 17:02:53', 'root@localhost', 'Delete data, id user = 30'),
('users', '2023-01-08 17:06:11', 'root@localhost', 'Delete data, id user = 27'),
('users', '2023-01-08 17:06:21', 'root@localhost', 'Update data, id user = 22'),
('users', '2023-01-08 17:06:26', 'root@localhost', 'Update data, id user = 18'),
('users', '2023-01-08 17:07:25', 'root@localhost', 'Update data, id user = 18'),
('users', '2023-01-08 17:07:34', 'root@localhost', 'Update data, id user = 22'),
('users', '2023-01-08 17:10:18', 'root@localhost', 'Insert data, id user = 31'),
('users', '2023-01-08 17:10:36', 'root@localhost', 'Insert data, id user = 32'),
('users', '2023-01-08 17:10:52', 'root@localhost', 'Insert data, id user = 33'),
('users', '2023-01-08 17:11:28', 'root@localhost', 'Insert data, id user = 34'),
('users', '2023-01-08 17:11:47', 'root@localhost', 'Insert data, id user = 35'),
('users', '2023-01-08 17:12:04', 'root@localhost', 'Insert data, id user = 36'),
('users', '2023-01-08 17:12:36', 'root@localhost', 'Insert data, id user = 37'),
('users', '2023-01-08 17:12:57', 'root@localhost', 'Insert data, id user = 38'),
('users', '2023-01-08 17:13:20', 'root@localhost', 'Insert data, id user = 39'),
('users', '2023-01-08 17:13:52', 'root@localhost', 'Insert data, id user = 40'),
('users', '2023-01-08 17:14:10', 'root@localhost', 'Insert data, id user = 41'),
('users', '2023-01-08 17:14:27', 'root@localhost', 'Insert data, id user = 42'),
('users', '2023-01-08 17:14:46', 'root@localhost', 'Insert data, id user = 43'),
('users', '2023-01-08 17:15:14', 'root@localhost', 'Insert data, id user = 44'),
('users', '2023-01-08 17:15:34', 'root@localhost', 'Insert data, id user = 45'),
('users', '2023-01-08 17:16:02', 'root@localhost', 'Insert data, id user = 46'),
('users', '2023-01-08 17:16:19', 'root@localhost', 'Insert data, id user = 47'),
('users', '2023-01-08 17:16:33', 'root@localhost', 'Insert data, id user = 48'),
('users', '2023-01-08 17:16:55', 'root@localhost', 'Insert data, id user = 49'),
('users', '2023-01-08 17:17:14', 'root@localhost', 'Insert data, id user = 50'),
('users', '2023-01-08 17:21:38', 'root@localhost', 'Update data, id user = 50'),
('users', '2023-01-08 17:21:44', 'root@localhost', 'Update data, id user = 50'),
('users', '2023-01-11 13:25:44', 'root@localhost', 'Insert data, id user = 51'),
('users', '2023-01-11 13:31:50', 'root@localhost', 'Update data, id user = 51'),
('users', '2023-01-11 13:32:12', 'root@localhost', 'Delete data, id user = 51'),
('users', '2024-11-26 06:16:30', 'root@localhost', 'Delete data, id user = 48');

--
-- Triggers `log_table_users`
--
DELIMITER $$
CREATE TRIGGER `users_send_to_monitoring` AFTER INSERT ON `log_table_users` FOR EACH ROW INSERT INTO monitoring_log_activity
VALUES(new.from_table,new.date_time,new.user,new.aktivitas)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_12_01_145509_absen', 1),
(6, '2022_12_01_145800_project', 1),
(7, '2022_12_01_145944_team_project', 1),
(8, '2022_12_01_150827_detail_project', 1),
(9, '2022_12_01_151114_laporan_project', 1),
(10, '2022_12_01_151322_negosiasi', 1),
(11, '2022_12_01_151533_client', 1);

-- --------------------------------------------------------

--
-- Table structure for table `monitoring_log_activity`
--

CREATE TABLE `monitoring_log_activity` (
  `from_table` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `user` varchar(50) NOT NULL,
  `aktivitas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `monitoring_log_activity`
--

INSERT INTO `monitoring_log_activity` (`from_table`, `date_time`, `user`, `aktivitas`) VALUES
('absen', '2022-12-27 13:42:47', 'root@localhost', 'Insert data, id user = 28 ,id_absen = 7'),
('absen', '2022-12-27 13:42:59', 'root@localhost', 'Delete data, id user = 28 ,id_absen = 11'),
('client', '2022-12-27 13:43:14', 'root@localhost', 'Update data, id client = 6'),
('project', '2022-12-27 13:43:38', 'root@localhost', 'Delete data, id project = 103'),
('negosiasi', '2022-12-27 14:17:18', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2022-12-27 14:17:58', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2022-12-27 14:41:51', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2022-12-27 15:09:43', 'root@localhost', 'Update data, id client = 5 ,id negosiasi = 4'),
('client', '2022-12-27 15:09:59', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:27:18', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:27:25', 'root@localhost', 'Update data, id client = 6'),
('client', '2022-12-27 15:27:34', 'root@localhost', 'Update data, id client = 4'),
('client', '2022-12-27 15:27:42', 'root@localhost', 'Update data, id client = 4'),
('project', '2022-12-28 02:08:18', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 02:08:18', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-28 02:08:38', 'root@localhost', 'Delete data, id project = 103'),
('project', '2022-12-28 02:23:10', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 02:23:10', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-28 02:23:18', 'root@localhost', 'Delete data, id project = 103'),
('project', '2022-12-28 02:23:32', 'root@localhost', 'Insert data, id project = 103'),
('detail_project', '2022-12-28 02:23:32', 'root@localhost', 'Insert data, id project = 103'),
('project', '2022-12-28 14:23:54', 'root@localhost', 'Insert data, id project = 104'),
('detail_project', '2022-12-28 14:23:54', 'root@localhost', 'Insert data, id project = 104'),
('team_project', '2022-12-28 14:24:00', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2022-12-28 14:24:00', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('negosiasi', '2023-01-07 03:02:36', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 5'),
('negosiasi', '2023-01-07 03:02:44', 'root@localhost', 'Delete data, id client = 5 ,id negosiasi = 4'),
('negosiasi', '2023-01-07 03:52:58', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 5'),
('negosiasi', '2023-01-07 03:54:05', 'root@localhost', 'Delete data, id client = 2 ,id negosiasi = 1'),
('negosiasi', '2023-01-07 03:54:23', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 6'),
('negosiasi', '2023-01-07 03:54:36', 'root@localhost', 'Insert data, id client = 5 ,id negosiasi = 7'),
('negosiasi', '2023-01-07 03:54:42', 'root@localhost', 'Delete data, id client = 5 ,id negosiasi = 7'),
('negosiasi', '2023-01-07 03:58:38', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 6'),
('negosiasi', '2023-01-07 03:59:27', 'root@localhost', 'Insert data, id client = 5 ,id negosiasi = 7'),
('negosiasi', '2023-01-07 03:59:38', 'root@localhost', 'Insert data, id client = 5 ,id negosiasi = 8'),
('negosiasi', '2023-01-07 03:59:47', 'root@localhost', 'Delete data, id client = 5 ,id negosiasi = 8'),
('negosiasi', '2023-01-07 04:00:10', 'root@localhost', 'Insert data, id client = 5 ,id negosiasi = 9'),
('negosiasi', '2023-01-07 04:00:16', 'root@localhost', 'Insert data, id client = 5 ,id negosiasi = 10'),
('negosiasi', '2023-01-07 04:03:32', 'root@localhost', 'Delete data, id client = 5 ,id negosiasi = 10'),
('negosiasi', '2023-01-07 04:03:55', 'root@localhost', 'Delete data, id client = 5 ,id negosiasi = 9'),
('negosiasi', '2023-01-07 04:04:57', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 11'),
('negosiasi', '2023-01-07 04:05:01', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 12'),
('negosiasi', '2023-01-07 04:05:06', 'root@localhost', 'Delete data, id client = 5 ,id negosiasi = 7'),
('negosiasi', '2023-01-07 04:05:51', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 12'),
('negosiasi', '2023-01-07 04:10:14', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 11'),
('negosiasi', '2023-01-07 04:10:35', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 13'),
('negosiasi', '2023-01-07 04:10:40', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 14'),
('negosiasi', '2023-01-07 04:10:48', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 15'),
('negosiasi', '2023-01-07 04:10:53', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 16'),
('negosiasi', '2023-01-07 04:11:00', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 16'),
('negosiasi', '2023-01-07 04:11:11', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 15'),
('negosiasi', '2023-01-07 04:11:29', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 17'),
('negosiasi', '2023-01-07 04:11:40', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 18'),
('negosiasi', '2023-01-07 04:11:54', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 18'),
('negosiasi', '2023-01-07 04:13:03', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 17'),
('negosiasi', '2023-01-07 04:13:23', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 14'),
('negosiasi', '2023-01-07 04:13:46', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 19'),
('negosiasi', '2023-01-07 04:13:52', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 20'),
('negosiasi', '2023-01-07 04:14:44', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 20'),
('negosiasi', '2023-01-07 04:15:25', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 19'),
('negosiasi', '2023-01-07 04:16:02', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 13'),
('negosiasi', '2023-01-07 04:16:21', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 20'),
('negosiasi', '2023-01-07 04:16:25', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 20'),
('negosiasi', '2023-01-07 04:16:34', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 20'),
('negosiasi', '2023-01-07 04:16:38', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 21'),
('negosiasi', '2023-01-07 04:17:10', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 21'),
('negosiasi', '2023-01-07 13:32:15', 'root@localhost', 'Delete data, id client = 4 ,id negosiasi = 20'),
('project', '2023-01-07 13:39:07', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 13:52:13', 'root@localhost', 'Update data, id project = 103'),
('detail_project', '2023-01-07 15:03:20', 'root@localhost', 'Update data, id project = 104'),
('detail_project', '2023-01-07 15:03:30', 'root@localhost', 'Update data, id project = 104'),
('detail_project', '2023-01-07 15:06:15', 'root@localhost', 'Update data, id project = 104'),
('project', '2023-01-07 15:09:49', 'root@localhost', 'Update data, id project = 103'),
('project', '2023-01-07 15:10:04', 'root@localhost', 'Update data, id project = 103'),
('project', '2023-01-07 15:10:12', 'root@localhost', 'Update data, id project = 103'),
('project', '2023-01-07 15:11:05', 'root@localhost', 'Update data, id project = 103'),
('project', '2023-01-07 15:16:19', 'root@localhost', 'Update data, id project = 103'),
('team_project', '2023-01-07 15:45:11', 'root@localhost', 'Delete data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:45:11', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:46:00', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:46:00', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:48:36', 'root@localhost', 'Delete data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:48:36', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:48:36', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:48:36', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:48:36', 'root@localhost', 'Insert data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:48:39', 'root@localhost', 'Delete data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:48:39', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:48:39', 'root@localhost', 'Delete data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:48:39', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:48:39', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:48:39', 'root@localhost', 'Insert data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:49:04', 'root@localhost', 'Delete data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:49:04', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:04', 'root@localhost', 'Delete data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:49:04', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:49:04', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:04', 'root@localhost', 'Insert data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:49:24', 'root@localhost', 'Delete data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:49:24', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:24', 'root@localhost', 'Delete data, id project = 104 ,id_user = 27'),
('team_project', '2023-01-07 15:49:24', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:49:24', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:25', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:31', 'root@localhost', 'Delete data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:49:31', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:31', 'root@localhost', 'Delete data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:31', 'root@localhost', 'Insert data, id project = 104 ,id_user = 25'),
('team_project', '2023-01-07 15:49:31', 'root@localhost', 'Insert data, id project = 104 ,id_user = 26'),
('team_project', '2023-01-07 15:49:31', 'root@localhost', 'Insert data, id project = 104 ,id_user = 27'),
('detail_project', '2023-01-07 15:55:27', 'root@localhost', 'Update data, id project = 103'),
('team_project', '2023-01-07 15:55:49', 'root@localhost', 'Insert data, id project = 103 ,id_user = 25'),
('team_project', '2023-01-07 15:55:49', 'root@localhost', 'Insert data, id project = 103 ,id_user = 26'),
('project', '2023-01-07 17:07:49', 'root@localhost', 'Update data, id project = 102'),
('laporan_project', '2023-01-07 17:08:25', 'root@localhost', 'Update data, id project = 102 ,id_laporan = 102-2'),
('laporan_project', '2023-01-07 17:08:50', 'root@localhost', 'Update data, id project = 102 ,id_laporan = 102-3'),
('laporan_project', '2023-01-07 17:12:04', 'root@localhost', 'Update data, id project = 102 ,id_laporan = 102-7'),
('laporan_project', '2023-01-07 17:32:22', 'root@localhost', 'Update data, id project = 102 ,id_laporan = 102-8'),
('users', '2023-01-07 18:02:39', 'root@localhost', 'Insert data, id user = 30'),
('project', '2023-01-07 18:06:10', 'root@localhost', 'Insert data, id project = 105'),
('detail_project', '2023-01-07 18:06:11', 'root@localhost', 'Insert data, id project = 105'),
('team_project', '2023-01-07 18:06:17', 'root@localhost', 'Insert data, id project = 105 ,id_user = 25'),
('team_project', '2023-01-07 18:06:17', 'root@localhost', 'Insert data, id project = 105 ,id_user = 26'),
('project', '2023-01-07 18:14:06', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 18:14:28', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 18:14:56', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 18:15:27', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 18:17:36', 'root@localhost', 'Update data, id project = 102'),
('project', '2023-01-07 18:17:53', 'root@localhost', 'Update data, id project = 102'),
('detail_project', '2023-01-07 18:31:53', 'root@localhost', 'Update data, id project = 102'),
('team_project', '2023-01-07 18:33:36', 'root@localhost', 'Delete data, id project = 102 ,id_user = 25'),
('team_project', '2023-01-07 18:33:36', 'root@localhost', 'Delete data, id project = 102 ,id_user = 26'),
('team_project', '2023-01-07 18:33:36', 'root@localhost', 'Delete data, id project = 102 ,id_user = 27'),
('team_project', '2023-01-07 18:33:36', 'root@localhost', 'Delete data, id project = 102 ,id_user = 23'),
('team_project', '2023-01-07 18:33:37', 'root@localhost', 'Insert data, id project = 102 ,id_user = 25'),
('team_project', '2023-01-07 18:33:37', 'root@localhost', 'Insert data, id project = 102 ,id_user = 26'),
('team_project', '2023-01-07 18:33:37', 'root@localhost', 'Insert data, id project = 102 ,id_user = 27'),
('project', '2023-01-07 18:56:25', 'root@localhost', 'Update data, id project = 102'),
('users', '2023-01-07 19:11:24', 'root@localhost', 'Update data, id user = 24'),
('users', '2023-01-07 19:13:36', 'root@localhost', 'Update data, id user = 24'),
('users', '2023-01-07 19:13:49', 'root@localhost', 'Update data, id user = 24'),
('users', '2023-01-07 19:14:41', 'root@localhost', 'Update data, id user = 24'),
('users', '2023-01-07 19:15:02', 'root@localhost', 'Update data, id user = 24'),
('users', '2023-01-07 19:21:06', 'root@localhost', 'Update data, id user = 28'),
('absen', '2023-01-07 19:21:18', 'root@localhost', 'Insert data, id user = 28 ,id_absen = 13'),
('absen', '2023-01-07 19:21:23', 'root@localhost', 'Update data, id user = 28 ,id_absen = 13'),
('laporan_project', '2023-01-08 01:50:37', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 02:53:08', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 02:54:09', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 02:57:27', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 02:57:52', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 02:59:33', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 02:59:39', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 02:59:54', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 03:00:02', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 03:00:16', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 03:00:21', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 03:00:43', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-2'),
('users', '2023-01-08 03:02:57', 'root@localhost', 'Update data, id user = 27'),
('laporan_project', '2023-01-08 03:04:28', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 03:04:37', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 03:06:12', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 03:06:17', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 03:06:29', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:06:34', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:06:55', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:07:04', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:08:25', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:08:30', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:12:56', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 03:24:45', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 03:24:49', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 03:24:53', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 03:26:18', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:26:29', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:26:55', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:27:00', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:27:04', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:27:14', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:27:34', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:27:43', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:27:55', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:32:33', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:33:09', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:34:04', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:34:40', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:35:17', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:36:29', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:36:36', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:37:46', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:44:05', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 03:48:04', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 03:48:10', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 03:51:34', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:51:57', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:58:46', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 03:58:54', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 03:59:07', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:03:00', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:03:50', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 04:04:22', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 04:04:35', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:07:29', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:07:46', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:07:55', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:09:30', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:10:04', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:13:25', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:36:23', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:36:34', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:38:36', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-6'),
('laporan_project', '2023-01-08 04:38:41', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-6'),
('laporan_project', '2023-01-08 04:38:45', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:39:48', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:39:55', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 04:40:40', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-6'),
('laporan_project', '2023-01-08 04:40:45', 'root@localhost', 'Update data, id project = 104 ,id_laporan = 104-6'),
('laporan_project', '2023-01-08 04:42:11', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:42:38', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:42:46', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:43:00', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:44:37', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:46:18', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:46:27', 'root@localhost', 'Insert data, id project = 104 ,id_laporan = 104-7'),
('laporan_project', '2023-01-08 04:46:32', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-7'),
('users', '2023-01-08 17:02:25', 'root@localhost', 'Delete data, id user = 23'),
('users', '2023-01-08 17:02:28', 'root@localhost', 'Delete data, id user = 24'),
('users', '2023-01-08 17:02:30', 'root@localhost', 'Delete data, id user = 25'),
('users', '2023-01-08 17:02:33', 'root@localhost', 'Delete data, id user = 26'),
('users', '2023-01-08 17:02:50', 'root@localhost', 'Delete data, id user = 28'),
('users', '2023-01-08 17:02:53', 'root@localhost', 'Delete data, id user = 30'),
('project', '2023-01-08 17:03:27', 'root@localhost', 'Delete data, id project = 105'),
('client', '2023-01-08 17:04:47', 'root@localhost', 'Delete data, id client = 2'),
('client', '2023-01-08 17:04:49', 'root@localhost', 'Delete data, id client = 4'),
('client', '2023-01-08 17:04:50', 'root@localhost', 'Delete data, id client = 5'),
('client', '2023-01-08 17:04:52', 'root@localhost', 'Delete data, id client = 6'),
('laporan_project', '2023-01-08 17:05:31', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-6'),
('laporan_project', '2023-01-08 17:05:33', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-5'),
('laporan_project', '2023-01-08 17:05:35', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-4'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-3'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-2'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 104 ,id_laporan = 104-1'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-16'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-15'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-14'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-13'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-12'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-11'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-9'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-8'),
('laporan_project', '2023-01-08 17:05:40', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-7'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-6'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-5'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-4'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-3'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-2'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-10'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 102 ,id_laporan = 102-1'),
('laporan_project', '2023-01-08 17:05:41', 'root@localhost', 'Delete data, id project = 101 ,id_laporan = 1-1'),
('project', '2023-01-08 17:05:59', 'root@localhost', 'Delete data, id project = 104'),
('project', '2023-01-08 17:06:01', 'root@localhost', 'Delete data, id project = 103'),
('project', '2023-01-08 17:06:03', 'root@localhost', 'Delete data, id project = 102'),
('project', '2023-01-08 17:06:05', 'root@localhost', 'Delete data, id project = 101'),
('users', '2023-01-08 17:06:11', 'root@localhost', 'Delete data, id user = 27'),
('users', '2023-01-08 17:06:21', 'root@localhost', 'Update data, id user = 22'),
('users', '2023-01-08 17:06:26', 'root@localhost', 'Update data, id user = 18'),
('users', '2023-01-08 17:07:25', 'root@localhost', 'Update data, id user = 18'),
('users', '2023-01-08 17:07:34', 'root@localhost', 'Update data, id user = 22'),
('users', '2023-01-08 17:10:18', 'root@localhost', 'Insert data, id user = 31'),
('users', '2023-01-08 17:10:36', 'root@localhost', 'Insert data, id user = 32'),
('users', '2023-01-08 17:10:52', 'root@localhost', 'Insert data, id user = 33'),
('users', '2023-01-08 17:11:28', 'root@localhost', 'Insert data, id user = 34'),
('users', '2023-01-08 17:11:47', 'root@localhost', 'Insert data, id user = 35'),
('users', '2023-01-08 17:12:04', 'root@localhost', 'Insert data, id user = 36'),
('users', '2023-01-08 17:12:36', 'root@localhost', 'Insert data, id user = 37'),
('users', '2023-01-08 17:12:57', 'root@localhost', 'Insert data, id user = 38'),
('users', '2023-01-08 17:13:20', 'root@localhost', 'Insert data, id user = 39'),
('users', '2023-01-08 17:13:52', 'root@localhost', 'Insert data, id user = 40'),
('users', '2023-01-08 17:14:10', 'root@localhost', 'Insert data, id user = 41'),
('users', '2023-01-08 17:14:27', 'root@localhost', 'Insert data, id user = 42'),
('users', '2023-01-08 17:14:46', 'root@localhost', 'Insert data, id user = 43'),
('users', '2023-01-08 17:15:14', 'root@localhost', 'Insert data, id user = 44'),
('users', '2023-01-08 17:15:34', 'root@localhost', 'Insert data, id user = 45'),
('users', '2023-01-08 17:16:02', 'root@localhost', 'Insert data, id user = 46'),
('users', '2023-01-08 17:16:19', 'root@localhost', 'Insert data, id user = 47'),
('users', '2023-01-08 17:16:33', 'root@localhost', 'Insert data, id user = 48'),
('users', '2023-01-08 17:16:55', 'root@localhost', 'Insert data, id user = 49'),
('users', '2023-01-08 17:17:14', 'root@localhost', 'Insert data, id user = 50'),
('users', '2023-01-08 17:21:38', 'root@localhost', 'Update data, id user = 50'),
('users', '2023-01-08 17:21:44', 'root@localhost', 'Update data, id user = 50'),
('project', '2023-01-08 17:25:26', 'root@localhost', 'Insert data, id project = 1'),
('detail_project', '2023-01-08 17:25:26', 'root@localhost', 'Insert data, id project = 1'),
('team_project', '2023-01-08 17:25:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 34'),
('team_project', '2023-01-08 17:25:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 37'),
('team_project', '2023-01-08 17:25:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 40'),
('team_project', '2023-01-08 17:25:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 35'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Delete data, id project = 1 ,id_user = 34'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Delete data, id project = 1 ,id_user = 37'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Delete data, id project = 1 ,id_user = 40'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Delete data, id project = 1 ,id_user = 35'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 34'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 37'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 40'),
('team_project', '2023-01-08 23:08:41', 'root@localhost', 'Insert data, id project = 1 ,id_user = 35'),
('project', '2023-01-08 23:20:36', 'root@localhost', 'Insert data, id project = 2'),
('detail_project', '2023-01-08 23:20:36', 'root@localhost', 'Insert data, id project = 2'),
('team_project', '2023-01-08 23:20:55', 'root@localhost', 'Insert data, id project = 2 ,id_user = 40'),
('team_project', '2023-01-08 23:20:55', 'root@localhost', 'Insert data, id project = 2 ,id_user = 38'),
('team_project', '2023-01-08 23:20:55', 'root@localhost', 'Insert data, id project = 2 ,id_user = 36'),
('project', '2023-01-08 23:24:51', 'root@localhost', 'Insert data, id project = 3'),
('detail_project', '2023-01-08 23:24:51', 'root@localhost', 'Insert data, id project = 3'),
('team_project', '2023-01-08 23:25:10', 'root@localhost', 'Insert data, id project = 3 ,id_user = 40'),
('team_project', '2023-01-08 23:25:10', 'root@localhost', 'Insert data, id project = 3 ,id_user = 36'),
('team_project', '2023-01-08 23:25:10', 'root@localhost', 'Insert data, id project = 3 ,id_user = 41'),
('team_project', '2023-01-08 23:25:10', 'root@localhost', 'Insert data, id project = 3 ,id_user = 39'),
('project', '2023-01-08 23:26:28', 'root@localhost', 'Insert data, id project = 4'),
('detail_project', '2023-01-08 23:26:28', 'root@localhost', 'Insert data, id project = 4'),
('team_project', '2023-01-08 23:26:55', 'root@localhost', 'Insert data, id project = 4 ,id_user = 40'),
('team_project', '2023-01-08 23:26:55', 'root@localhost', 'Insert data, id project = 4 ,id_user = 41'),
('team_project', '2023-01-08 23:26:55', 'root@localhost', 'Insert data, id project = 4 ,id_user = 34'),
('team_project', '2023-01-08 23:26:55', 'root@localhost', 'Insert data, id project = 4 ,id_user = 37'),
('project', '2023-01-08 23:28:36', 'root@localhost', 'Insert data, id project = 5'),
('detail_project', '2023-01-08 23:28:36', 'root@localhost', 'Insert data, id project = 5'),
('team_project', '2023-01-08 23:28:53', 'root@localhost', 'Insert data, id project = 5 ,id_user = 40'),
('team_project', '2023-01-08 23:28:53', 'root@localhost', 'Insert data, id project = 5 ,id_user = 35'),
('laporan_project', '2023-01-08 23:31:29', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-1'),
('laporan_project', '2023-01-08 23:31:38', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-1'),
('laporan_project', '2023-01-08 23:31:50', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-2'),
('laporan_project', '2023-01-08 23:31:55', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-2'),
('laporan_project', '2023-01-08 23:32:03', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-3'),
('laporan_project', '2023-01-08 23:32:22', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-4'),
('laporan_project', '2023-01-08 23:32:40', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-5'),
('laporan_project', '2023-01-08 23:32:44', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-4'),
('laporan_project', '2023-01-08 23:32:47', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-5'),
('laporan_project', '2023-01-08 23:33:08', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-6'),
('laporan_project', '2023-01-08 23:33:16', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-7'),
('laporan_project', '2023-01-08 23:33:21', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-6'),
('laporan_project', '2023-01-08 23:33:26', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-7'),
('laporan_project', '2023-01-08 23:33:36', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-8'),
('laporan_project', '2023-01-08 23:34:00', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-9'),
('laporan_project', '2023-01-08 23:34:11', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-8'),
('laporan_project', '2023-01-08 23:34:36', 'root@localhost', 'Delete data, id project = 1 ,id_laporan = 1-8'),
('laporan_project', '2023-01-08 23:34:40', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-8'),
('laporan_project', '2023-01-08 23:34:46', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-9'),
('laporan_project', '2023-01-08 23:41:01', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-9'),
('laporan_project', '2023-01-08 23:41:44', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-9'),
('laporan_project', '2023-01-08 23:42:10', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-1'),
('laporan_project', '2023-01-08 23:42:20', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-2'),
('laporan_project', '2023-01-08 23:42:40', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-4'),
('laporan_project', '2023-01-08 23:42:45', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-5'),
('laporan_project', '2023-01-08 23:42:57', 'root@localhost', 'Update data, id project = 1 ,id_laporan = 1-6'),
('laporan_project', '2023-01-08 23:43:21', 'root@localhost', 'Insert data, id project = 1 ,id_laporan = 1-10'),
('project', '2023-01-08 23:43:35', 'root@localhost', 'Update data, id project = 1'),
('project', '2023-01-08 23:45:43', 'root@localhost', 'Update data, id project = 1'),
('users', '2023-01-11 13:25:44', 'root@localhost', 'Insert data, id user = 51'),
('users', '2023-01-11 13:31:50', 'root@localhost', 'Update data, id user = 51'),
('users', '2023-01-11 13:32:12', 'root@localhost', 'Delete data, id user = 51'),
('client', '2023-01-11 13:39:59', 'root@localhost', 'Insert data, id client = 1'),
('negosiasi', '2023-01-11 13:40:00', 'root@localhost', 'Insert data, id client = 1 ,id negosiasi = 22'),
('project', '2023-01-11 13:44:50', 'root@localhost', 'Insert data, id project = 6'),
('detail_project', '2023-01-11 13:44:50', 'root@localhost', 'Insert data, id project = 6'),
('team_project', '2023-01-11 13:46:02', 'root@localhost', 'Insert data, id project = 6 ,id_user = 36'),
('team_project', '2023-01-11 13:46:02', 'root@localhost', 'Insert data, id project = 6 ,id_user = 38'),
('detail_project', '2023-01-11 13:53:17', 'root@localhost', 'Update data, id project = 2'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Delete data, id project = 2 ,id_user = 40'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Delete data, id project = 2 ,id_user = 38'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Delete data, id project = 2 ,id_user = 36'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Insert data, id project = 2 ,id_user = 40'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Insert data, id project = 2 ,id_user = 38'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Insert data, id project = 2 ,id_user = 36'),
('team_project', '2023-01-11 13:55:35', 'root@localhost', 'Insert data, id project = 2 ,id_user = 43'),
('project', '2023-01-11 14:15:49', 'root@localhost', 'Update data, id project = 3'),
('laporan_project', '2023-01-11 14:32:44', 'root@localhost', 'Insert data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:39:27', 'root@localhost', 'Update data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:46:34', 'root@localhost', 'Update data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:48:06', 'root@localhost', 'Update data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:49:23', 'root@localhost', 'Update data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:50:51', 'root@localhost', 'Update data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:51:20', 'root@localhost', 'Update data, id project = 4 ,id_laporan = 4-1'),
('laporan_project', '2023-01-11 14:57:31', 'root@localhost', 'Insert data, id project = 4 ,id_laporan = 4-2'),
('project', '2023-01-11 15:00:12', 'root@localhost', 'Update data, id project = 4'),
('project', '2024-11-19 07:31:40', 'root@localhost', 'Update data, id project = 1'),
('project', '2024-11-19 07:31:56', 'root@localhost', 'Update data, id project = 2'),
('project', '2024-11-19 07:32:16', 'root@localhost', 'Update data, id project = 3'),
('project', '2024-11-19 07:32:37', 'root@localhost', 'Update data, id project = 2'),
('project', '2024-11-19 07:32:45', 'root@localhost', 'Update data, id project = 3'),
('project', '2024-11-19 07:32:57', 'root@localhost', 'Update data, id project = 4'),
('project', '2024-11-19 07:33:11', 'root@localhost', 'Update data, id project = 5'),
('project', '2024-11-19 07:33:28', 'root@localhost', 'Update data, id project = 6'),
('project', '2024-11-19 07:34:05', 'root@localhost', 'Update data, id project = 1'),
('project', '2024-11-19 07:34:20', 'root@localhost', 'Update data, id project = 3'),
('client', '2024-11-19 07:36:34', 'root@localhost', 'Update data, id client = 1'),
('project', '2024-11-19 07:42:55', 'root@localhost', 'Insert data, id project = 7'),
('detail_project', '2024-11-19 07:42:55', 'root@localhost', 'Insert data, id project = 7'),
('team_project', '2024-11-19 07:43:02', 'root@localhost', 'Insert data, id project = 7 ,id_user = 34'),
('project', '2024-11-19 09:01:45', 'root@localhost', 'Insert data, id project = 8'),
('detail_project', '2024-11-19 09:01:45', 'root@localhost', 'Insert data, id project = 8'),
('team_project', '2024-11-19 09:02:02', 'root@localhost', 'Insert data, id project = 8 ,id_user = 36'),
('team_project', '2024-11-19 09:02:02', 'root@localhost', 'Insert data, id project = 8 ,id_user = 39'),
('project', '2024-11-19 09:05:32', 'root@localhost', 'Insert data, id project = 9'),
('detail_project', '2024-11-19 09:05:32', 'root@localhost', 'Insert data, id project = 9'),
('team_project', '2024-11-19 09:05:46', 'root@localhost', 'Insert data, id project = 9 ,id_user = 34'),
('project', '2024-11-19 09:07:24', 'root@localhost', 'Update data, id project = 1'),
('client', '2024-11-26 03:13:29', 'root@localhost', 'Insert data, id client = 2'),
('negosiasi', '2024-11-26 03:13:29', 'root@localhost', 'Insert data, id client = 2 ,id negosiasi = 23'),
('client', '2024-11-26 03:59:07', 'root@localhost', 'Insert data, id client = 3'),
('negosiasi', '2024-11-26 03:59:07', 'root@localhost', 'Insert data, id client = 3 ,id negosiasi = 24'),
('client', '2024-11-26 04:11:36', 'root@localhost', 'Insert data, id client = 4'),
('negosiasi', '2024-11-26 04:11:36', 'root@localhost', 'Insert data, id client = 4 ,id negosiasi = 25'),
('client', '2024-11-26 04:14:15', 'root@localhost', 'Insert data, id client = 5'),
('negosiasi', '2024-11-26 04:14:15', 'root@localhost', 'Insert data, id client = 5 ,id negosiasi = 26'),
('client', '2024-11-26 04:14:43', 'root@localhost', 'Insert data, id client = 6'),
('negosiasi', '2024-11-26 04:14:43', 'root@localhost', 'Insert data, id client = 6 ,id negosiasi = 27'),
('client', '2024-11-26 04:33:11', 'root@localhost', 'Insert data, id client = 7'),
('negosiasi', '2024-11-26 04:33:11', 'root@localhost', 'Insert data, id client = 7 ,id negosiasi = 28'),
('client', '2024-11-26 04:47:55', 'root@localhost', 'Insert data, id client = 8'),
('negosiasi', '2024-11-26 04:47:55', 'root@localhost', 'Insert data, id client = 8 ,id negosiasi = 29'),
('client', '2024-11-26 04:49:41', 'root@localhost', 'Insert data, id client = 9'),
('negosiasi', '2024-11-26 04:49:41', 'root@localhost', 'Insert data, id client = 9 ,id negosiasi = 30'),
('client', '2024-11-26 04:52:29', 'root@localhost', 'Insert data, id client = 10'),
('negosiasi', '2024-11-26 04:52:29', 'root@localhost', 'Insert data, id client = 10 ,id negosiasi = 31'),
('project', '2024-11-26 04:57:44', 'root@localhost', 'Insert data, id project = 10'),
('detail_project', '2024-11-26 04:57:44', 'root@localhost', 'Insert data, id project = 10'),
('team_project', '2024-11-26 04:58:44', 'root@localhost', 'Insert data, id project = 10 ,id_user = 34'),
('team_project', '2024-11-26 04:58:44', 'root@localhost', 'Insert data, id project = 10 ,id_user = 37'),
('team_project', '2024-11-26 04:58:44', 'root@localhost', 'Insert data, id project = 10 ,id_user = 40'),
('laporan_project', '2024-11-26 05:15:26', 'root@localhost', 'Insert data, id project = 10 ,id_laporan = 10-1'),
('laporan_project', '2024-11-26 05:16:11', 'root@localhost', 'Update data, id project = 10 ,id_laporan = 10-1'),
('laporan_project', '2024-11-26 05:16:31', 'root@localhost', 'Insert data, id project = 10 ,id_laporan = 10-2'),
('laporan_project', '2024-11-26 05:16:38', 'root@localhost', 'Update data, id project = 10 ,id_laporan = 10-2'),
('laporan_project', '2024-11-26 05:17:04', 'root@localhost', 'Insert data, id project = 10 ,id_laporan = 10-3'),
('laporan_project', '2024-11-26 05:17:20', 'root@localhost', 'Insert data, id project = 10 ,id_laporan = 10-4'),
('users', '2024-11-26 06:16:30', 'root@localhost', 'Delete data, id user = 48'),
('project', '2024-11-26 06:25:14', 'root@localhost', 'Insert data, id project = 11'),
('detail_project', '2024-11-26 06:25:14', 'root@localhost', 'Insert data, id project = 11'),
('project', '2024-11-26 06:26:47', 'root@localhost', 'Insert data, id project = 12'),
('detail_project', '2024-11-26 06:26:47', 'root@localhost', 'Insert data, id project = 12'),
('team_project', '2024-11-26 06:26:53', 'root@localhost', 'Insert data, id project = 12 ,id_user = 34'),
('project', '2024-11-26 06:30:36', 'root@localhost', 'Insert data, id project = 13'),
('detail_project', '2024-11-26 06:30:36', 'root@localhost', 'Insert data, id project = 13'),
('team_project', '2024-11-26 06:30:40', 'root@localhost', 'Insert data, id project = 13 ,id_user = 34');

-- --------------------------------------------------------

--
-- Table structure for table `negosiasi`
--

CREATE TABLE `negosiasi` (
  `id_negosiasi` int(10) UNSIGNED NOT NULL,
  `id_client` int(10) UNSIGNED NOT NULL,
  `sketsa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Pengerjaan','Perencanaan','Pengerjaan Dan Perencanaan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `negosiasi`
--

INSERT INTO `negosiasi` (`id_negosiasi`, `id_client`, `sketsa`, `desc`, `alamat`, `type`, `created_at`, `updated_at`) VALUES
(22, 1, NULL, 'pembuatan Jalan raya simalingkar', 'Jl. simalingkar', 'Pengerjaan Dan Perencanaan', NULL, NULL),
(23, 2, NULL, 'test', 'lapmer', 'Pengerjaan Dan Perencanaan', NULL, NULL),
(24, 3, NULL, 'test', 'lapmer', 'Pengerjaan Dan Perencanaan', NULL, NULL),
(25, 4, NULL, 'test', 'lapmer', 'Pengerjaan Dan Perencanaan', NULL, NULL),
(26, 5, NULL, 'test', 'lapmer', 'Pengerjaan Dan Perencanaan', NULL, NULL),
(27, 6, NULL, 'assdasd', 'adasd', 'Pengerjaan', NULL, NULL),
(28, 7, NULL, 'asdasdas', 'dasdasd', 'Pengerjaan', NULL, NULL),
(29, 8, NULL, 'asdasdassdaweadcaxc', 'Jl Pembangunan', 'Pengerjaan Dan Perencanaan', NULL, NULL),
(30, 9, NULL, 'dasdasdasd', 'Jl Pembangunan', 'Pengerjaan', NULL, NULL),
(31, 10, NULL, 'asfasfasfasf', 'Jl Pembangunan', 'Pengerjaan Dan Perencanaan', NULL, NULL);

--
-- Triggers `negosiasi`
--
DELIMITER $$
CREATE TRIGGER `after_insert_negosiasi` AFTER INSERT ON `negosiasi` FOR EACH ROW INSERT INTO log_table_negosiasi (from_table, date_time, user, aktivitas)
VALUES ('negosiasi', now(), USER(), CONCAT('Insert data, id client = ', NEW.id_client, ' ,id negosiasi = ',NEW.id_negosiasi))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_negosiasi` AFTER UPDATE ON `negosiasi` FOR EACH ROW INSERT INTO log_table_negosiasi (from_table, date_time, user, aktivitas)
VALUES ('negosiasi', now(), USER(), CONCAT('Update data, id client = ', NEW.id_client, ' ,id negosiasi = ',NEW.id_negosiasi))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_negosiasi` BEFORE DELETE ON `negosiasi` FOR EACH ROW INSERT INTO log_table_negosiasi (from_table, date_time, user, aktivitas)
VALUES ('negosiasi', now(), USER(), CONCAT('Delete data, id client = ', OLD.id_client, ' ,id negosiasi = ',OLD.id_negosiasi))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_negosiasi_notif_client_id_not_exist` BEFORE INSERT ON `negosiasi` FOR EACH ROW IF (new.id_client not IN(SELECT id_client FROM client)) 
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, client belum terdaftar";
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_detail_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_detail_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`lokasi` varchar(255)
,`estimasi` varchar(255)
,`cost` varchar(255)
,`deskripsi` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_laporan_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_laporan_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_la_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_la_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lda_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lda_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_ldp_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_ldp_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_ld_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_ld_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lha_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lha_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lhp_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lhp_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lhv_identify`
-- (See below for the actual view)
--
CREATE TABLE `pm_lhv_identify` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`nama_project` varchar(255)
,`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lh_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_lh_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lpa_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lpa_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lpp_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lpp_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lp_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_lp_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lra_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lra_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lrp_laporan`
-- (See below for the actual view)
--
CREATE TABLE `pm_lrp_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_lr_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_lr_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_pb2_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_pb2_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_pb_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_pb_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`Total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_selesai_project`
-- (See below for the actual view)
--
CREATE TABLE `pm_selesai_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`Total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `pm_team_tp`
-- (See below for the actual view)
--
CREATE TABLE `pm_team_tp` (
`id_user` int(10) unsigned
,`id_project` int(10) unsigned
,`name` varchar(255)
,`email` varchar(255)
,`jabatan` enum('Direktur','AdminWeb','Project_Manager','Admin','Drafter','Pengawas_Lapangan','Staff')
);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id_project` int(10) UNSIGNED NOT NULL,
  `status` enum('sedang_berjalan','selesai') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sedang_berjalan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id_project`, `status`, `created_at`, `updated_at`) VALUES
(1, 'sedang_berjalan', '2024-09-30 17:25:26', '2024-11-12 16:43:35'),
(2, 'sedang_berjalan', '2024-10-08 23:20:36', NULL),
(3, 'selesai', '2024-10-08 23:24:51', '2024-11-21 07:15:49'),
(4, 'selesai', '2024-10-08 23:26:28', '2023-01-11 08:00:12'),
(5, 'sedang_berjalan', '2024-10-08 23:28:36', NULL),
(6, 'sedang_berjalan', '2024-10-11 13:44:50', NULL),
(7, 'sedang_berjalan', '2024-11-19 07:42:55', NULL),
(8, 'sedang_berjalan', '2024-11-19 09:01:45', NULL),
(9, 'sedang_berjalan', '2024-11-19 09:05:32', NULL),
(10, 'sedang_berjalan', '2024-11-26 04:57:44', NULL),
(11, 'sedang_berjalan', '2024-11-26 06:25:14', NULL),
(12, 'sedang_berjalan', '2024-11-26 06:26:47', NULL),
(13, 'sedang_berjalan', '2024-11-26 06:30:36', NULL);

--
-- Triggers `project`
--
DELIMITER $$
CREATE TRIGGER `after_insert_project` AFTER INSERT ON `project` FOR EACH ROW INSERT INTO log_table_project (from_table, date_time, user, aktivitas)
VALUES ('project', now(), USER(), CONCAT('Insert data, id project = ', NEW.id_project))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_project` AFTER UPDATE ON `project` FOR EACH ROW INSERT INTO log_table_project (from_table, date_time, user, aktivitas)
VALUES ('project', now(), USER(), CONCAT('Update data, id project = ', NEW.id_project))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_project` BEFORE DELETE ON `project` FOR EACH ROW INSERT INTO log_table_project (from_table, date_time, user, aktivitas)
VALUES ('project', now(), USER(), CONCAT('Delete data, id project = ', OLD.id_project))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dont_update_idproject` BEFORE UPDATE ON `project` FOR EACH ROW BEGIN
IF(new.id_project <> old.id_project)
THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "id project tidak bisa dirubah";
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `projectmanager_laporanakhir_project`
-- (See below for the actual view)
--
CREATE TABLE `projectmanager_laporanakhir_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_detail_project`
-- (See below for the actual view)
--
CREATE TABLE `repository_detail_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`lokasi` varchar(255)
,`estimasi` varchar(255)
,`cost` varchar(255)
,`deskripsi` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_index_project1`
-- (See below for the actual view)
--
CREATE TABLE `repository_index_project1` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_index_project2`
-- (See below for the actual view)
--
CREATE TABLE `repository_index_project2` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_lamanproject_project`
-- (See below for the actual view)
--
CREATE TABLE `repository_lamanproject_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporanakhir_laporan`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporanakhir_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporanakhir_project`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporanakhir_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporandokumen_laporan`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporandokumen_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporanharianview_identify`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporanharianview_identify` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`nama_project` varchar(255)
,`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporanharian_laporan`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporanharian_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporanprogress_laporan`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporanprogress_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dibuat` timestamp
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporanrab_laporan`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporanrab_laporan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
,`name` varchar(255)
,`dokumen` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_laporan_project`
-- (See below for the actual view)
--
CREATE TABLE `repository_laporan_project` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `repository_team_teamproject`
-- (See below for the actual view)
--
CREATE TABLE `repository_team_teamproject` (
`id_user` int(10) unsigned
,`id_project` int(10) unsigned
,`name` varchar(255)
,`email` varchar(255)
,`jabatan` enum('Direktur','AdminWeb','Project_Manager','Admin','Drafter','Pengawas_Lapangan','Staff')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_doktambahan`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_doktambahan` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`waktu_dibuat` timestamp
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`dokumen` varchar(255)
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_lapprogress`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_lapprogress` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`dokumen` varchar(255)
,`waktu_dibuat` timestamp
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_lapproject`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_lapproject` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_laprab`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_laprab` (
`id_laporan` varchar(15)
,`id_project` int(10) unsigned
,`id_user` int(10) unsigned
,`id_type` enum('LH','LP','LR','DT','LA')
,`dokumen` varchar(255)
,`waktu_dibuat` timestamp
,`waktu_dikirim` datetime
,`waktu_dikonfirmasi` datetime
,`status` enum('Pending','Accept','Decline','Belum Dikirim')
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_selpro`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_selpro` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`id_user` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_selpro1`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_selpro1` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`id_user` int(10) unsigned
,`Total` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_selselesai`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_selselesai` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`id_user` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_tsp`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_tsp` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`id_user` int(10) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `stafflapangan_project_tsp1`
-- (See below for the actual view)
--
CREATE TABLE `stafflapangan_project_tsp1` (
`id_project` int(10) unsigned
,`status` enum('sedang_berjalan','selesai')
,`created_at` timestamp
,`updated_at` timestamp
,`nama_project` varchar(255)
,`id_user` int(10) unsigned
,`Total` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `team_project`
--

CREATE TABLE `team_project` (
  `id_project` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_project`
--

INSERT INTO `team_project` (`id_project`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 34, NULL, NULL),
(1, 37, NULL, NULL),
(1, 40, NULL, NULL),
(1, 35, NULL, NULL),
(3, 40, NULL, NULL),
(3, 36, NULL, NULL),
(3, 41, NULL, NULL),
(3, 39, NULL, NULL),
(4, 40, NULL, NULL),
(4, 41, NULL, NULL),
(4, 34, NULL, NULL),
(4, 37, NULL, NULL),
(5, 40, NULL, NULL),
(5, 35, NULL, NULL),
(6, 36, NULL, NULL),
(6, 38, NULL, NULL),
(2, 40, NULL, NULL),
(2, 38, NULL, NULL),
(2, 36, NULL, NULL),
(2, 43, NULL, NULL),
(7, 34, NULL, NULL),
(8, 36, NULL, NULL),
(8, 39, NULL, NULL),
(9, 34, NULL, NULL),
(10, 34, NULL, NULL),
(10, 37, NULL, NULL),
(10, 40, NULL, NULL),
(12, 34, NULL, NULL),
(13, 34, NULL, NULL);

--
-- Triggers `team_project`
--
DELIMITER $$
CREATE TRIGGER `after_insert_team_project` AFTER INSERT ON `team_project` FOR EACH ROW INSERT INTO log_table_team_project (from_table, date_time, user, aktivitas)
VALUES ('team_project', now(), USER(), CONCAT('Insert data, id project = ', NEW.id_project, ' ,id_user = ',NEW.id_user))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_team_project` AFTER UPDATE ON `team_project` FOR EACH ROW INSERT INTO log_table_team_project (from_table, date_time, user, aktivitas)
VALUES ('team_project', now(), USER(), CONCAT('Update data, id project = ', NEW.id_project, ' ,id_user = ',NEW.id_user))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_team_project` BEFORE DELETE ON `team_project` FOR EACH ROW INSERT INTO log_table_team_project (from_table, date_time, user, aktivitas)
VALUES ('team_project', now(), USER(), CONCAT('Delete data, id project = ', OLD.id_project, ' ,id_user = ',OLD.id_user))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `decline_notif_user_and_project_not_exist` BEFORE INSERT ON `team_project` FOR EACH ROW IF ( new.id_user not IN(SELECT id FROM users) AND new.id_project NOT IN(SELECT id_project FROM project))
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, User Id dan Project belum terdaftar";
ELSEIF (new.id_project NOT IN(SELECT id_project FROM project))
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, Project belum terdaftar";
ELSEIF (new.id_user not IN(SELECT id FROM users)) 
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Maaf, User Id belum terdaftar";
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` enum('Direktur','AdminWeb','Project_Manager','Admin','Drafter','Pengawas_Lapangan','Staff') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `jabatan`, `remember_token`, `created_at`, `updated_at`) VALUES
(18, 'Adhi Utomo', 'direktur1@gmail.com', NULL, '$2y$10$rYmZSF/mMb4BEB25DDeEy.PtNvuRPzZcWr0p6Kv28eCBknoHgfQi6', 'Direktur', NULL, '2022-12-03 10:07:05', '2022-12-03 10:07:05'),
(22, 'Ago Harlim', 'direktur2@gmail.com', NULL, '$2y$10$LR09dPKvPiq/A22vsq39J.dJ6tS/qMdjMavTHau5gspX1A2FCZTQK', 'Direktur', NULL, '2022-12-03 10:15:11', '2022-12-03 10:15:11'),
(31, 'Kardja Rahardjo', 'adminweb1@gmail.com', NULL, '$2y$10$p5eSMODpOw9Fk0VFfgr8oew6vH/HWQBAFJBeXZpq6..2dhLaIonGG', 'AdminWeb', NULL, '2023-01-08 10:10:18', '2023-01-08 10:10:18'),
(32, 'Faiz Shahab', 'adminweb2@gmail.com', NULL, '$2y$10$vXbxsYDg1zjJL32L6lE8H.z12dyfN/lumD7HFv9JSkYqNvy2g/esO', 'AdminWeb', NULL, '2023-01-08 10:10:36', '2023-01-08 10:10:36'),
(33, 'Sandra Setijono', 'adminweb3@gmail.com', NULL, '$2y$10$CYG9eiebFdvpePq9CnoxNe4JQbGxgRdIhmxVOvnPeAmq.OgmrlKJW', 'AdminWeb', NULL, '2023-01-08 10:10:52', '2023-01-08 10:10:52'),
(34, 'Adi Sumito', 'drafter1@gmail.com', NULL, '$2y$10$c7wZ3hW6ZoVYop.ehdsvcu/73fVFk6P7nghMFcPoWMBa495isGZtu', 'Drafter', NULL, '2023-01-08 10:11:28', '2023-01-08 10:11:28'),
(35, 'Kang Aries Fuksar', 'drafter2@gmail.com', NULL, '$2y$10$2QKlGgxtcVXr7.bYA4L/g.S4Q8kcImNY0CWMOB/KBsszyO9j3wNe.', 'Drafter', NULL, '2023-01-08 10:11:47', '2023-01-08 10:11:47'),
(36, 'Fahmi Idris', 'drafter3@gmail.com', NULL, '$2y$10$oID9Ggk/i.caUXBBXtGTdOcWktR5hocLKDohF2cind8vIDm2fjeh.', 'Drafter', NULL, '2023-01-08 10:12:04', '2023-01-08 10:12:04'),
(37, 'Sandi Gunawan Ho', 'admin1@gmail.com', NULL, '$2y$10$c8HAQ.ax9tJYANBxADX04OJ1eGm4zYbzkB8e46x0oj4VYPEX8mHHu', 'Admin', NULL, '2023-01-08 10:12:36', '2023-01-08 10:12:36'),
(38, 'Koko Poernomo Santoso', 'admin2@gmail.com', NULL, '$2y$10$zI4yF9R9sfc4gPDHHPa1C.tv6ZTgSQWMggic/74ro5n2z7MK6Fawa', 'Admin', NULL, '2023-01-08 10:12:57', '2023-01-08 10:12:57'),
(39, 'Santy Jennice Lioe', 'admin3@gmail.com', NULL, '$2y$10$jk/r1X8Sir.pLea4RWyJV.3emLZ/WyHf4RSdpj1j/sbCKevaKKYYu', 'Admin', NULL, '2023-01-08 10:13:20', '2023-01-08 10:13:20'),
(40, 'Agus Makmur', 'pengawaslapangan1@gmail.com', NULL, '$2y$10$fNLzvJ45SfUsz41.FZmwMeHkde9R2SCDcP5r4ZQRLr97l5j//UHdS', 'Pengawas_Lapangan', NULL, '2023-01-08 10:13:52', '2023-01-08 10:13:52'),
(41, 'Agoeng Noegroho', 'pengawaslapangan2@gmail.com', NULL, '$2y$10$kYFcKyYfHVuVMfSNoEFrWexAMuSnAW3I9W6ATYd22AVeCMSxHm56u', 'Pengawas_Lapangan', NULL, '2023-01-08 10:14:10', '2023-01-08 10:14:10'),
(42, 'Flores Samudro', 'pengawaslapangan3@gmail.com', NULL, '$2y$10$Zru/LH550Yilf8IAaVnajuviiOrFmUt7n4iUXgk0Wmzp7fyXRQmFC', 'Pengawas_Lapangan', NULL, '2023-01-08 10:14:27', '2023-01-08 10:14:27'),
(43, 'Simon Lim', 'pengawaslapangan4@gmail.com', NULL, '$2y$10$LalBeALH9uiuQWVxm7nWvOtX7uHQVpflLWNt9SdX.eQOQ0jxg0dhC', 'Pengawas_Lapangan', NULL, '2023-01-08 10:14:46', '2023-01-08 10:14:46'),
(44, 'Andrew Tanoto', 'staff1@gmail.com', NULL, '$2y$10$soY.NVOPLBdWQrK5JkbyyOahw5iIVJ5kEiI9wFxzA9KsvYl.cTlVS', 'Staff', NULL, '2023-01-08 10:15:14', '2023-01-08 10:15:14'),
(45, 'Angie Christina', 'staff2@gmail.com', NULL, '$2y$10$g2BM3x.uwovLxHnMv.iZi.x.Yw/65A2bprs2R9N4vAPOeau18BKQa', 'Staff', NULL, '2023-01-08 10:15:34', '2023-01-08 10:15:34'),
(46, 'Anita Ratnasari', 'staff3@gmail.com', NULL, '$2y$10$LsoIKN9xlHXm.d6EFQ5tj.nku6qEgC6lz9Bw2uyUt/I4rHeHj/gnO', 'Staff', NULL, '2023-01-08 10:16:02', '2023-01-08 10:16:02'),
(47, 'Leda Magdangal Tamin', 'staff4@gmail.com', NULL, '$2y$10$4b9v94P7qKwX8ZLwOMvXQe0Q4/AN7LO9W8XBnfwrmVwi0cu.1gLA6', 'Staff', NULL, '2023-01-08 10:16:19', '2023-01-08 10:16:19'),
(49, 'Gesang Budiarso', 'staff6@gmail.com', NULL, '$2y$10$4.MZcX/IX6lxawGoXjgr0OZrO9ttysG.fNPT5uhX5znlsshDwqxS.', 'Staff', NULL, '2023-01-08 10:16:55', '2023-01-08 10:16:55'),
(50, 'Gunawan Jusuf', 'projectmanager@gmail.com', NULL, '$2y$10$Nb6i6of7KRFgDLHT8gdDFOhEwd6kaW9GS/VKgVPklJGbXTUUHlclS', 'Project_Manager', NULL, '2023-01-08 10:17:14', '2023-01-08 10:17:14');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `after_insert_users` AFTER INSERT ON `users` FOR EACH ROW INSERT INTO log_table_users (from_table, date_time, user, aktivitas)
VALUES ('users', now(), USER(), CONCAT('Insert data, id user = ', NEW.id))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_update_users` AFTER UPDATE ON `users` FOR EACH ROW INSERT INTO log_table_users (from_table, date_time, user, aktivitas)
VALUES ('users', now(), USER(), CONCAT('Update data, id user = ', NEW.id))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_users` BEFORE DELETE ON `users` FOR EACH ROW INSERT INTO log_table_users (from_table, date_time, user, aktivitas)
VALUES ('users', now(), USER(), CONCAT('Delete data, id user = ', OLD.id))
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_id` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
	IF (new.id <> old.id)
    THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Tidak bisa Merubah id";
     END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dont_insert_except_integer` BEFORE INSERT ON `users` FOR EACH ROW BEGIN 
IF(new.id < 0)
THEN
SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'INPUT HANYA BOLEH ANGKA';
 END IF;
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `adminweb_projectberjalan`
--
DROP TABLE IF EXISTS `adminweb_projectberjalan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `adminweb_projectberjalan`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project`, count(`team_project`.`id_user`) AS `Total` FROM ((`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) left join `team_project` on(`project`.`id_project` = `team_project`.`id_project`)) GROUP BY `project`.`id_project` ;

-- --------------------------------------------------------

--
-- Structure for view `adminweb_projectsel`
--
DROP TABLE IF EXISTS `adminweb_projectsel`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `adminweb_projectsel`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project`, count(`team_project`.`id_user`) AS `Total` FROM ((`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) left join `team_project` on(`project`.`id_project` = `team_project`.`id_project`)) GROUP BY `project`.`id_project` ;

-- --------------------------------------------------------

--
-- Structure for view `pm_detail_project`
--
DROP TABLE IF EXISTS `pm_detail_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_detail_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project`, `detail_project`.`lokasi` AS `lokasi`, `detail_project`.`estimasi` AS `estimasi`, `detail_project`.`cost` AS `cost`, `detail_project`.`deskripsi` AS `deskripsi` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_laporan_project`
--
DROP TABLE IF EXISTS `pm_laporan_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_laporan_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_la_laporan`
--
DROP TABLE IF EXISTS `pm_la_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_la_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `laporan_akhir`.`dokumen` AS `dokumen` FROM (`laporan_project` join `laporan_akhir` on(`laporan_project`.`id_laporan` = `laporan_akhir`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lda_laporan`
--
DROP TABLE IF EXISTS `pm_lda_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_lda_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `dokumen_tambahan`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `dokumen_tambahan` on(`laporan_project`.`id_laporan` = `dokumen_tambahan`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_ldp_laporan`
--
DROP TABLE IF EXISTS `pm_ldp_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_ldp_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `dokumen_tambahan`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `dokumen_tambahan` on(`laporan_project`.`id_laporan` = `dokumen_tambahan`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_ld_project`
--
DROP TABLE IF EXISTS `pm_ld_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_ld_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lha_laporan`
--
DROP TABLE IF EXISTS `pm_lha_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_lha_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name` FROM (`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lhp_laporan`
--
DROP TABLE IF EXISTS `pm_lhp_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_lhp_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name` FROM (`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lhv_identify`
--
DROP TABLE IF EXISTS `pm_lhv_identify`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_lhv_identify`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `detail_project`.`nama_project` AS `nama_project`, `users`.`name` AS `name` FROM ((`laporan_project` join `detail_project` on(`laporan_project`.`id_project` = `detail_project`.`id_project`)) join `users` on(`laporan_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lh_project`
--
DROP TABLE IF EXISTS `pm_lh_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_lh_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lpa_laporan`
--
DROP TABLE IF EXISTS `pm_lpa_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_lpa_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `laporan_progress`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `laporan_progress` on(`laporan_project`.`id_laporan` = `laporan_progress`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lpp_laporan`
--
DROP TABLE IF EXISTS `pm_lpp_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_lpp_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `laporan_progress`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `laporan_progress` on(`laporan_project`.`id_laporan` = `laporan_progress`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lp_project`
--
DROP TABLE IF EXISTS `pm_lp_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_lp_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lra_laporan`
--
DROP TABLE IF EXISTS `pm_lra_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_lra_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `laporan_rab`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `laporan_rab` on(`laporan_project`.`id_laporan` = `laporan_rab`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lrp_laporan`
--
DROP TABLE IF EXISTS `pm_lrp_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_lrp_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `laporan_rab`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `laporan_rab` on(`laporan_project`.`id_laporan` = `laporan_rab`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_lr_project`
--
DROP TABLE IF EXISTS `pm_lr_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_lr_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_pb2_project`
--
DROP TABLE IF EXISTS `pm_pb2_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_pb2_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `pm_pb_project`
--
DROP TABLE IF EXISTS `pm_pb_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_pb_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project`, count(`team_project`.`id_user`) AS `Total` FROM ((`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) left join `team_project` on(`project`.`id_project` = `team_project`.`id_project`)) GROUP BY `project`.`id_project` ;

-- --------------------------------------------------------

--
-- Structure for view `pm_selesai_project`
--
DROP TABLE IF EXISTS `pm_selesai_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_selesai_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project`, count(`team_project`.`id_user`) AS `Total` FROM ((`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) left join `team_project` on(`project`.`id_project` = `team_project`.`id_project`)) GROUP BY `project`.`id_project` ;

-- --------------------------------------------------------

--
-- Structure for view `pm_team_tp`
--
DROP TABLE IF EXISTS `pm_team_tp`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `pm_team_tp`  AS SELECT `team_project`.`id_user` AS `id_user`, `team_project`.`id_project` AS `id_project`, `users`.`name` AS `name`, `users`.`email` AS `email`, `users`.`jabatan` AS `jabatan` FROM (`team_project` join `users` on(`team_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `projectmanager_laporanakhir_project`
--
DROP TABLE IF EXISTS `projectmanager_laporanakhir_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `projectmanager_laporanakhir_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_detail_project`
--
DROP TABLE IF EXISTS `repository_detail_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_detail_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project`, `detail_project`.`lokasi` AS `lokasi`, `detail_project`.`estimasi` AS `estimasi`, `detail_project`.`cost` AS `cost`, `detail_project`.`deskripsi` AS `deskripsi` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_index_project1`
--
DROP TABLE IF EXISTS `repository_index_project1`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_index_project1`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_index_project2`
--
DROP TABLE IF EXISTS `repository_index_project2`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_index_project2`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_lamanproject_project`
--
DROP TABLE IF EXISTS `repository_lamanproject_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_lamanproject_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporanakhir_laporan`
--
DROP TABLE IF EXISTS `repository_laporanakhir_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_laporanakhir_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `laporan_akhir`.`dokumen` AS `dokumen` FROM (`laporan_project` join `laporan_akhir` on(`laporan_project`.`id_project` = `laporan_akhir`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporanakhir_project`
--
DROP TABLE IF EXISTS `repository_laporanakhir_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_laporanakhir_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporandokumen_laporan`
--
DROP TABLE IF EXISTS `repository_laporandokumen_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_laporandokumen_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `dokumen_tambahan`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `dokumen_tambahan` on(`laporan_project`.`id_laporan` = `dokumen_tambahan`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporanharianview_identify`
--
DROP TABLE IF EXISTS `repository_laporanharianview_identify`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_laporanharianview_identify`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `detail_project`.`nama_project` AS `nama_project`, `users`.`name` AS `name` FROM ((`laporan_project` join `detail_project` on(`laporan_project`.`id_project` = `detail_project`.`id_project`)) join `users` on(`laporan_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporanharian_laporan`
--
DROP TABLE IF EXISTS `repository_laporanharian_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_laporanharian_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name` FROM (`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporanprogress_laporan`
--
DROP TABLE IF EXISTS `repository_laporanprogress_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_laporanprogress_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dibuat` AS `waktu_dibuat`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `laporan_progress`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `laporan_progress` on(`laporan_project`.`id_laporan` = `laporan_progress`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporanrab_laporan`
--
DROP TABLE IF EXISTS `repository_laporanrab_laporan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_laporanrab_laporan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status`, `users`.`name` AS `name`, `laporan_rab`.`dokumen` AS `dokumen` FROM ((`laporan_project` join `users` on(`laporan_project`.`id_user` = `users`.`id`)) join `laporan_rab` on(`laporan_project`.`id_laporan` = `laporan_rab`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_laporan_project`
--
DROP TABLE IF EXISTS `repository_laporan_project`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_laporan_project`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `repository_team_teamproject`
--
DROP TABLE IF EXISTS `repository_team_teamproject`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `repository_team_teamproject`  AS SELECT `team_project`.`id_user` AS `id_user`, `team_project`.`id_project` AS `id_project`, `users`.`name` AS `name`, `users`.`email` AS `email`, `users`.`jabatan` AS `jabatan` FROM (`team_project` join `users` on(`team_project`.`id_user` = `users`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_doktambahan`
--
DROP TABLE IF EXISTS `stafflapangan_project_doktambahan`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `stafflapangan_project_doktambahan`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_project`.`waktu_dibuat` AS `waktu_dibuat`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `dokumen_tambahan`.`dokumen` AS `dokumen`, `laporan_project`.`status` AS `status` FROM (`laporan_project` join `dokumen_tambahan` on(`laporan_project`.`id_laporan` = `dokumen_tambahan`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_lapprogress`
--
DROP TABLE IF EXISTS `stafflapangan_project_lapprogress`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `stafflapangan_project_lapprogress`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_progress`.`dokumen` AS `dokumen`, `laporan_project`.`waktu_dibuat` AS `waktu_dibuat`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status` FROM (`laporan_project` join `laporan_progress` on(`laporan_project`.`id_laporan` = `laporan_progress`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_lapproject`
--
DROP TABLE IF EXISTS `stafflapangan_project_lapproject`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `stafflapangan_project_lapproject`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project` FROM (`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_laprab`
--
DROP TABLE IF EXISTS `stafflapangan_project_laprab`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `stafflapangan_project_laprab`  AS SELECT `laporan_project`.`id_laporan` AS `id_laporan`, `laporan_project`.`id_project` AS `id_project`, `laporan_project`.`id_user` AS `id_user`, `laporan_project`.`id_type` AS `id_type`, `laporan_rab`.`dokumen` AS `dokumen`, `laporan_project`.`waktu_dibuat` AS `waktu_dibuat`, `laporan_project`.`waktu_dikirim` AS `waktu_dikirim`, `laporan_project`.`waktu_dikonfirmasi` AS `waktu_dikonfirmasi`, `laporan_project`.`status` AS `status` FROM (`laporan_project` join `laporan_rab` on(`laporan_project`.`id_laporan` = `laporan_rab`.`id_laporan`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_selpro`
--
DROP TABLE IF EXISTS `stafflapangan_project_selpro`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `stafflapangan_project_selpro`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project`, `team_project`.`id_user` AS `id_user` FROM ((`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) join `team_project` on(`project`.`id_project` = `team_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_selpro1`
--
DROP TABLE IF EXISTS `stafflapangan_project_selpro1`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `stafflapangan_project_selpro1`  AS SELECT `stafflapangan_project_selpro`.`id_project` AS `id_project`, `stafflapangan_project_selpro`.`status` AS `status`, `stafflapangan_project_selpro`.`created_at` AS `created_at`, `stafflapangan_project_selpro`.`updated_at` AS `updated_at`, `stafflapangan_project_selpro`.`nama_project` AS `nama_project`, `stafflapangan_project_selpro`.`id_user` AS `id_user`, count(`team_project`.`id_user`) AS `Total` FROM (`stafflapangan_project_selpro` left join `team_project` on(`stafflapangan_project_selpro`.`id_project` = `team_project`.`id_project`)) GROUP BY `stafflapangan_project_selpro`.`id_project`, `stafflapangan_project_selpro`.`id_user` ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_selselesai`
--
DROP TABLE IF EXISTS `stafflapangan_project_selselesai`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `stafflapangan_project_selselesai`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `team_project`.`id_user` AS `id_user` FROM (`project` join `team_project` on(`project`.`id_project` = `team_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_tsp`
--
DROP TABLE IF EXISTS `stafflapangan_project_tsp`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `stafflapangan_project_tsp`  AS SELECT `project`.`id_project` AS `id_project`, `project`.`status` AS `status`, `project`.`created_at` AS `created_at`, `project`.`updated_at` AS `updated_at`, `detail_project`.`nama_project` AS `nama_project`, `team_project`.`id_user` AS `id_user` FROM ((`project` join `detail_project` on(`project`.`id_project` = `detail_project`.`id_project`)) join `team_project` on(`project`.`id_project` = `team_project`.`id_project`)) ;

-- --------------------------------------------------------

--
-- Structure for view `stafflapangan_project_tsp1`
--
DROP TABLE IF EXISTS `stafflapangan_project_tsp1`;

CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `stafflapangan_project_tsp1`  AS SELECT `stafflapangan_project_tsp`.`id_project` AS `id_project`, `stafflapangan_project_tsp`.`status` AS `status`, `stafflapangan_project_tsp`.`created_at` AS `created_at`, `stafflapangan_project_tsp`.`updated_at` AS `updated_at`, `stafflapangan_project_tsp`.`nama_project` AS `nama_project`, `stafflapangan_project_tsp`.`id_user` AS `id_user`, count(`team_project`.`id_user`) AS `Total` FROM (`stafflapangan_project_tsp` left join `team_project` on(`stafflapangan_project_tsp`.`id_project` = `team_project`.`id_project`)) GROUP BY `stafflapangan_project_tsp`.`id_project`, `stafflapangan_project_tsp`.`id_user` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id_absen`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indexes for table `detail_project`
--
ALTER TABLE `detail_project`
  ADD KEY `id_project` (`id_project`);

--
-- Indexes for table `detail_sub_laporan_harian`
--
ALTER TABLE `detail_sub_laporan_harian`
  ADD PRIMARY KEY (`id_sub_laporan`);

--
-- Indexes for table `detail_type_laporan`
--
ALTER TABLE `detail_type_laporan`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `dokumen_tambahan`
--
ALTER TABLE `dokumen_tambahan`
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `laporan_akhir`
--
ALTER TABLE `laporan_akhir`
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `laporan_harian`
--
ALTER TABLE `laporan_harian`
  ADD PRIMARY KEY (`kode_laporan_harian`),
  ADD KEY `id_sub_laporan` (`id_sub_laporan`),
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `laporan_harian_cba`
--
ALTER TABLE `laporan_harian_cba`
  ADD KEY `kode_laporan_harian` (`kode_laporan_harian`);

--
-- Indexes for table `laporan_harian_kjpp`
--
ALTER TABLE `laporan_harian_kjpp`
  ADD KEY `kode_laporan_harian` (`kode_laporan_harian`);

--
-- Indexes for table `laporan_harian_pk`
--
ALTER TABLE `laporan_harian_pk`
  ADD KEY `kode_laporan_harian` (`kode_laporan_harian`);

--
-- Indexes for table `laporan_harian_pkr`
--
ALTER TABLE `laporan_harian_pkr`
  ADD KEY `kode_laporan_harian` (`kode_laporan_harian`);

--
-- Indexes for table `laporan_harian_pr`
--
ALTER TABLE `laporan_harian_pr`
  ADD KEY `kode_laporan_harian` (`kode_laporan_harian`);

--
-- Indexes for table `laporan_harian_tmpb`
--
ALTER TABLE `laporan_harian_tmpb`
  ADD KEY `kode_laporan_harian` (`kode_laporan_harian`);

--
-- Indexes for table `laporan_progress`
--
ALTER TABLE `laporan_progress`
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `laporan_project`
--
ALTER TABLE `laporan_project`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `laporan_rab`
--
ALTER TABLE `laporan_rab`
  ADD KEY `id_laporan` (`id_laporan`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `negosiasi`
--
ALTER TABLE `negosiasi`
  ADD PRIMARY KEY (`id_negosiasi`),
  ADD KEY `id_client` (`id_client`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id_project`);

--
-- Indexes for table `team_project`
--
ALTER TABLE `team_project`
  ADD KEY `team_project_ibfk_3` (`id_project`),
  ADD KEY `team_project_ibfk_2` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `id_absen` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `negosiasi`
--
ALTER TABLE `negosiasi`
  MODIFY `id_negosiasi` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id_project` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `absen_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_project`
--
ALTER TABLE `detail_project`
  ADD CONSTRAINT `detail_project_ibfk_1` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dokumen_tambahan`
--
ALTER TABLE `dokumen_tambahan`
  ADD CONSTRAINT `dokumen_tambahan_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_project` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_akhir`
--
ALTER TABLE `laporan_akhir`
  ADD CONSTRAINT `laporan_akhir_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_project` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian`
--
ALTER TABLE `laporan_harian`
  ADD CONSTRAINT `laporan_harian_ibfk_1` FOREIGN KEY (`id_sub_laporan`) REFERENCES `detail_sub_laporan_harian` (`id_sub_laporan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_harian_ibfk_2` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_project` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian_cba`
--
ALTER TABLE `laporan_harian_cba`
  ADD CONSTRAINT `laporan_harian_cba_ibfk_1` FOREIGN KEY (`kode_laporan_harian`) REFERENCES `laporan_harian` (`kode_laporan_harian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian_kjpp`
--
ALTER TABLE `laporan_harian_kjpp`
  ADD CONSTRAINT `laporan_harian_kjpp_ibfk_1` FOREIGN KEY (`kode_laporan_harian`) REFERENCES `laporan_harian` (`kode_laporan_harian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian_pk`
--
ALTER TABLE `laporan_harian_pk`
  ADD CONSTRAINT `laporan_harian_pk_ibfk_1` FOREIGN KEY (`kode_laporan_harian`) REFERENCES `laporan_harian` (`kode_laporan_harian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian_pkr`
--
ALTER TABLE `laporan_harian_pkr`
  ADD CONSTRAINT `laporan_harian_pkr_ibfk_1` FOREIGN KEY (`kode_laporan_harian`) REFERENCES `laporan_harian` (`kode_laporan_harian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian_pr`
--
ALTER TABLE `laporan_harian_pr`
  ADD CONSTRAINT `laporan_harian_pr_ibfk_1` FOREIGN KEY (`kode_laporan_harian`) REFERENCES `laporan_harian` (`kode_laporan_harian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_harian_tmpb`
--
ALTER TABLE `laporan_harian_tmpb`
  ADD CONSTRAINT `laporan_harian_tmpb_ibfk_1` FOREIGN KEY (`kode_laporan_harian`) REFERENCES `laporan_harian` (`kode_laporan_harian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_progress`
--
ALTER TABLE `laporan_progress`
  ADD CONSTRAINT `laporan_progress_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_project` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laporan_project`
--
ALTER TABLE `laporan_project`
  ADD CONSTRAINT `laporan_project_ibfk_1` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`) ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_project_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `detail_type_laporan` (`id_type`) ON UPDATE CASCADE,
  ADD CONSTRAINT `laporan_project_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `laporan_rab`
--
ALTER TABLE `laporan_rab`
  ADD CONSTRAINT `laporan_rab_ibfk_1` FOREIGN KEY (`id_laporan`) REFERENCES `laporan_project` (`id_laporan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `negosiasi`
--
ALTER TABLE `negosiasi`
  ADD CONSTRAINT `negosiasi_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_project`
--
ALTER TABLE `team_project`
  ADD CONSTRAINT `team_project_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `team_project_ibfk_3` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

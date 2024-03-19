-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gazdă: 127.0.0.1
-- Timp de generare: mart. 19, 2024 la 08:31 PM
-- Versiune server: 10.4.32-MariaDB
-- Versiune PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Bază de date: `library`
--

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Eliminarea datelor din tabel `admin`
--

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2024-03-19 17:16:21');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tblauthors`
--

CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Eliminarea datelor din tabel `tblauthors`
--

INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
(1, 'Anuj kumar', '2024-01-25 07:23:03', '2024-02-04 06:34:19'),
(2, 'Chetan Bhagatt', '2024-01-25 07:23:03', '2024-02-04 06:34:26'),
(3, 'Anita Desai', '2024-01-25 07:23:03', '2024-02-04 06:34:26'),
(4, 'HC Verma', '2024-01-25 07:23:03', '2024-02-04 06:34:26'),
(5, 'R.D. Sharma ', '2024-01-25 07:23:03', '2024-02-04 06:34:26'),
(9, 'fwdfrwer', '2024-01-25 07:23:03', '2024-02-04 06:34:26'),
(10, 'Dr. Andy Williams', '2024-01-25 07:23:03', '2024-02-04 06:34:26'),
(11, 'Kyle Hill', '2024-01-25 07:23:03', '2024-02-04 06:34:26'),
(12, 'Robert T. Kiyosak', '2024-01-25 07:23:03', '2024-02-04 06:34:26'),
(13, 'Kelly Barnhill', '2024-01-25 07:23:03', '2024-02-04 06:34:26'),
(14, 'Herbert Schildt', '2024-01-25 07:23:03', '2024-02-04 06:34:26'),
(16, 'Brianna Wiest', '2024-03-19 19:10:28', NULL),
(17, 'Oliver Burkeman', '2024-03-19 19:10:36', NULL),
(18, 'Loic Audrain, Sandra LeBrun', '2024-03-19 19:10:49', NULL),
(19, 'Kevin Dutton', '2024-03-19 19:10:58', NULL),
(20, 'Chris Voss , Tahl Raz', '2024-03-19 19:11:06', NULL);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tblbooks`
--

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `CatId` int(11) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` varchar(25) DEFAULT NULL,
  `BookPrice` decimal(10,2) DEFAULT NULL,
  `bookImage` varchar(250) NOT NULL,
  `isIssued` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Eliminarea datelor din tabel `tblbooks`
--

INSERT INTO `tblbooks` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `bookImage`, `isIssued`, `RegDate`, `UpdationDate`) VALUES
(1, 'PHP And MySql programming', 5, 1, '222333', 1.00, '1efecc0ca822e40b7b673c0d79ae943f.jpg', 1, '2024-01-30 07:23:03', '2024-03-19 17:41:15'),
(3, 'physics', 6, 4, '1111', 15.00, 'dd8267b57e0e4feee5911cb1e1a03a79.jpg', 0, '2024-01-30 07:23:03', '2024-02-04 06:34:11'),
(5, 'Murach\'s MySQL', 5, 1, '9350237695', 455.00, '5939d64655b4d2ae443830d73abc35b6.jpg', 1, '2024-01-30 07:23:03', '2024-02-04 06:34:11'),
(6, 'WordPress for Beginners 2022: A Visual Step-by-Step Guide to Mastering WordPress', 5, 10, 'B019MO3WCM', 100.00, '144ab706ba1cb9f6c23fd6ae9c0502b3.jpg', NULL, '2024-01-30 07:23:03', '2024-02-04 06:34:11'),
(7, 'WordPress Mastery Guide:', 5, 11, 'B09NKWH7NP', 53.00, '90083a56014186e88ffca10286172e64.jpg', NULL, '2024-01-30 07:23:03', '2024-02-04 06:34:11'),
(8, 'Rich Dad Poor Dad: What the Rich Teach Their Kids About Money That the Poor and Middle Class Do Not', 8, 12, 'B07C7M8SX9', 120.00, '52411b2bd2a6b2e0df3eb10943a5b640.jpg', NULL, '2024-01-30 07:23:03', '2024-02-04 06:34:11'),
(9, 'The Girl Who Drank the Moon', 8, 13, '1848126476', 200.00, 'f05cd198ac9335245e1fdffa793207a7.jpg', NULL, '2024-01-30 07:23:03', '2024-02-04 06:34:11'),
(10, 'C++: The Complete Reference, 4th Edition', 5, 14, '007053246X', 142.00, '36af5de9012bf8c804e499dc3c3b33a5.jpg', 0, '2024-01-30 07:23:03', '2024-02-04 06:34:11'),
(11, 'ASP.NET Core 5 for Beginners', 9, 11, 'GBSJ36344563', 422.00, 'b1b6788016bbfab12cfd2722604badc9.jpg', 0, '2024-01-30 07:23:03', '2024-02-04 06:34:11'),
(12, 'test', 5, 1, '1234', 2.00, '723876f234c6e1b02614bced5b94c63d.png', NULL, '2024-03-19 19:02:37', NULL),
(13, '101 eseuri care î?i vor schimba modul de a gândi', 8, 16, '111111', 1.00, 'cfb1575be8211f04d43f1a589fc026a3.png', NULL, '2024-03-19 19:13:55', NULL),
(14, '4000 de s?pt?mâni', 8, 17, '222222', 2.00, '65f69a92ee4c6b926a26f64607bb269d.png', NULL, '2024-03-19 19:16:39', NULL);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Eliminarea datelor din tabel `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(4, 'Romantic', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:43'),
(5, 'Technology', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(6, 'Science', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(7, 'Management', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(8, 'General', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(9, 'Programming', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tblfiliala`
--

CREATE TABLE `tblfiliala` (
  `id` int(11) NOT NULL,
  `Filiala` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Eliminarea datelor din tabel `tblfiliala`
--

INSERT INTO `tblfiliala` (`id`, `Filiala`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Piatra-Neamt', 1, '2024-01-31 05:23:03', '2024-02-04 04:33:43'),
(2, 'Iasi', 1, '2024-01-31 05:23:03', '2024-02-04 04:33:51'),
(3, 'Bacau', 1, '2024-01-31 05:23:03', '2024-02-04 04:33:51'),
(4, 'Suceava', 1, '2024-01-31 05:23:03', '2024-02-04 04:33:51'),
(5, 'Botosani', 1, '2024-01-31 05:23:03', '2024-02-04 04:33:51'),
(6, 'Bucuresti', 1, '2024-01-31 05:23:03', '2024-02-04 04:33:51');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tblissuedbookdetails`
--

CREATE TABLE `tblissuedbookdetails` (
  `id` int(11) NOT NULL,
  `BookId` int(11) DEFAULT NULL,
  `StudentID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT current_timestamp(),
  `ReturnDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `RetrunStatus` int(1) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Eliminarea datelor din tabel `tblissuedbookdetails`
--

INSERT INTO `tblissuedbookdetails` (`id`, `BookId`, `StudentID`, `IssuesDate`, `ReturnDate`, `RetrunStatus`, `fine`) VALUES
(7, 5, 'SID011', '2024-02-01 05:45:57', NULL, NULL, NULL),
(8, 1, 'SID002', '2024-02-01 05:45:57', '2024-02-04 06:33:08', 1, 0),
(9, 10, 'SID009', '2024-02-01 05:45:57', '2024-02-04 06:33:08', 1, 0),
(10, 11, 'SID009', '2024-02-01 05:45:57', '2024-02-04 06:33:08', 1, 0),
(11, 1, 'SID012', '2024-02-01 05:45:57', NULL, NULL, NULL),
(12, 10, 'SID012', '2024-02-01 05:45:57', '2024-02-04 06:33:08', 1, 5);

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tblsectiune`
--

CREATE TABLE `tblsectiune` (
  `id` int(11) NOT NULL,
  `Sectiune` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Eliminarea datelor din tabel `tblsectiune`
--

INSERT INTO `tblsectiune` (`id`, `Sectiune`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(1, 'FINANCIAR', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:43'),
(2, 'A ETAJ 3', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(3, 'CONTABILITATE', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(4, 'PROIECTE SPECIALE', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(5, 'A ETAJ 2', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(6, 'OPERATIONAL', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(7, 'FUNDATIE', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:43'),
(8, 'ADMINISTRATIV', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(9, 'CALL CENTER/CUSTOMER CARE', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(10, 'A ETAJ 1', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51'),
(11, 'TEHNIC', 1, '2024-01-31 07:23:03', '2024-02-04 06:33:51');

-- --------------------------------------------------------

--
-- Structură tabel pentru tabel `tblstudents`
--

CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Eliminarea datelor din tabel `tblstudents`
--

INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `EmailId`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(1, 'SID002', 'Anuj kumar', 'anujk@gmail.com', '9865472555', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-01-31 07:23:03', '2024-02-04 06:32:36'),
(4, 'SID005', 'sdfsd', 'csfsd@dfsfks.com', '8569710025', '92228410fc8b872914e023160cf4ae8f', 1, '2024-01-31 07:23:03', '2024-02-04 06:32:42'),
(8, 'SID009', 'test', 'test@gmail.com', '2359874527', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-01-31 07:23:03', '2024-02-04 06:32:42'),
(9, 'SID010', 'Amit', 'amit@gmail.com', '8585856224', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-01-31 07:23:03', '2024-02-04 06:32:42'),
(10, 'SID011', 'Sarita Pandey', 'sarita@gmail.com', '4672423754', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-01-31 07:23:03', '2024-02-04 06:32:42'),
(11, 'SID012', 'John Doe', 'john@test.com', '1234569870', 'f925916e2754e5e03f75dd58a5733251', 1, '2024-01-31 07:23:03', '2024-02-04 06:32:42');

--
-- Indexuri pentru tabele eliminate
--

--
-- Indexuri pentru tabele `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `tblauthors`
--
ALTER TABLE `tblauthors`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `tblbooks`
--
ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `tblsectiune`
--
ALTER TABLE `tblsectiune`
  ADD PRIMARY KEY (`id`);

--
-- Indexuri pentru tabele `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StudentId` (`StudentId`);

--
-- AUTO_INCREMENT pentru tabele eliminate
--

--
-- AUTO_INCREMENT pentru tabele `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pentru tabele `tblauthors`
--
ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pentru tabele `tblbooks`
--
ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pentru tabele `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pentru tabele `tblissuedbookdetails`
--
ALTER TABLE `tblissuedbookdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pentru tabele `tblsectiune`
--
ALTER TABLE `tblsectiune`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pentru tabele `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

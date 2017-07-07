-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 07, 2017 lúc 10:25 SA
-- Phiên bản máy phục vụ: 10.1.21-MariaDB
-- Phiên bản PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlyravao`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `configstatus`
--

CREATE TABLE `configstatus` (
  `ID` int(11) NOT NULL,
  `TableName` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Tag` int(11) NOT NULL,
  `Status` text COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `countryName` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `population` text COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `country`
--

INSERT INTO `country` (`id`, `countryName`, `population`) VALUES
(1, 'abv', '12'),
(2, 'abv', '12'),
(3, 'abc', '14'),
(4, 'abc', '14'),
(5, 'abc', '14'),
(6, 'abc', '14'),
(7, 'abc', '14'),
(8, 'abc', '14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `department`
--

CREATE TABLE `department` (
  `ID` int(11) NOT NULL,
  `Name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Descriptions` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `department`
--

INSERT INTO `department` (`ID`, `Name`, `Descriptions`, `Status`) VALUES
(1, 'M40.ADMIN - HR', 'M40.ADMIN - HR', 1),
(2, 'M40.IT', 'M40.IT', 1),
(3, 'M40.MAD.GP04', 'M40.MAD.GP04', 1),
(4, 'M40.QC', 'M40.QC', 1),
(5, 'M40.MAD.GENERAL', 'M40.MAD.GENERAL', 1),
(6, 'M40.DEV.01', 'M40.DEV.01', 1),
(7, 'M40.DEPT.06', 'M40.DEPT.06', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leavetype`
--

CREATE TABLE `leavetype` (
  `ID` int(11) NOT NULL,
  `Name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Description` text COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `leavetype`
--

INSERT INTO `leavetype` (`ID`, `Name`, `Description`) VALUES
(1, 'Cô - Con ốm', 'Cô - Con ốm'),
(2, 'CT - Công tác', 'CT - Công tác'),
(3, 'U - Nghỉ bù', 'U - Nghỉ bù'),
(4, 'Ô - Nghỉ ốm', 'Ô - Nghỉ ốm'),
(5, 'Ro - Việc riêng không lương', 'Ro - Việc riêng không lương'),
(6, 'Rt - Việc riêng ( hiếu, hỷ)', 'Rt - Việc riêng ( hiếu, hỷ)'),
(7, 'Ro - Việc riêng không lương', 'Ro - Việc riêng không lương');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `ID` int(11) NOT NULL,
  `Name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Descriptions` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`ID`, `Name`, `Descriptions`, `Status`) VALUES
(1, 'SUPERADMIN', 'SUPERADMIN', 1),
(2, 'SAMPLE', 'SAMPLE', 1),
(3, 'ADMIN', 'ADMIN', 1),
(4, 'NEWS', 'News', 1),
(5, 'DIV', 'DIV', 1),
(6, 'QC', 'QC', 1),
(7, 'Hr', 'new cac Depment and roles ', 1),
(8, 'HR_APPROVAL', 'HR_APPROVAL', 1),
(9, 'DIRECTOR', 'DIRECTOR', 1),
(10, 'HR_SECURITY', 'HR_SECURITY', 1),
(11, 'Clinic', 'Clinic', 1),
(12, 'HR_INSERT', 'HR_INSERT', 1),
(13, 'FINANCIAL', 'FINANCIAL', 1),
(14, 'HR_Report', 'HR_Report', 1),
(15, 'Report_HRM', 'Report_HRM', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `UserName` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Password` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `DepartmentID` int(3) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `Created` date NOT NULL,
  `Actived` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `IsLock` tinyint(1) NOT NULL,
  `Name` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `FullName` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Team` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Type` int(1) NOT NULL,
  `Address` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Email` text COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`ID`, `UserName`, `Password`, `DepartmentID`, `Status`, `Created`, `Actived`, `IsLock`, `Name`, `FullName`, `Team`, `Type`, `Address`, `Email`) VALUES
(1, '4424', 'abc', 1, 1, '2017-06-22', '1', 0, 'Tuấn', 'Nguyễn Đăng Tuấn', 'WED', 2, 'Ha noi', 'Tuannd04424@gmail.com'),
(2, '2923', 'abc', 2, 1, '2017-06-23', ' hoat dong', 0, 'Huyền', 'Nguyễn Thị Huyền', 'Mobile', 1, 'Ha noi', 'Hanoipgo@gmail.com'),
(3, '1221', 'abc', 4, 1, '2017-06-23', 'Hoat dong', 0, 'Toàn', 'Nguyễn Văn Toàn', 'MObile Sever', 1, 'Ha noi', 'lanhQuangHanoi@gmail.com'),
(4, '4423', 'abc', 2, 1, '2017-07-07', '1', 0, 'Thông', 'Hoàng Văn Thông', 'Wed PHP', 1, 'Bắc Giang', 'Thong@gmail.com'),
(5, '4422', 'abc', 2, 1, '2017-07-07', '1', 0, 'Chí', 'Dương Đức Chí', 'Wed MObile', 1, 'Bắc Giang', 'Chí@gmail.com'),
(6, '4429', 'abc', 2, 1, '2017-07-07', '1', 0, 'DƯ', 'Nguyễn Hoàng DƯ', 'Wed MObile', 1, 'Hà Nam', 'DƯ@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userfcroles`
--

CREATE TABLE `userfcroles` (
  `ID` int(11) NOT NULL,
  `UserID` int(5) NOT NULL,
  `RolesID` int(5) NOT NULL,
  `DeptID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `userfcroles`
--

INSERT INTO `userfcroles` (`ID`, `UserID`, `RolesID`, `DeptID`) VALUES
(1, 1, 8, 1),
(2, 1, 1, 5),
(3, 2, 8, 7),
(4, 1, 7, 5),
(5, 2, 7, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userlogin`
--

CREATE TABLE `userlogin` (
  `ID` int(11) NOT NULL,
  `UserID` int(5) NOT NULL,
  `Created` text COLLATE utf8mb4_unicode_520_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userroles`
--

CREATE TABLE `userroles` (
  `ID` int(11) NOT NULL,
  `UserID` int(5) NOT NULL,
  `RolesID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `userroles`
--

INSERT INTO `userroles` (`ID`, `UserID`, `RolesID`) VALUES
(1, 1, 9),
(2, 1, 1),
(3, 1, 8),
(4, 2, 8),
(5, 2, 7),
(6, 4, 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `usertimeout`
--

CREATE TABLE `usertimeout` (
  `ID` int(11) NOT NULL,
  `TimekeepingType` int(11) DEFAULT NULL,
  `Offdate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `NumberDay` text COLLATE utf8mb4_unicode_520_ci,
  `Descriptions` varchar(200) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `TimeIn` text COLLATE utf8mb4_unicode_520_ci,
  `TimeOut` text COLLATE utf8mb4_unicode_520_ci,
  `SecurityTimeIn` text COLLATE utf8mb4_unicode_520_ci,
  `SecurityTimeOut` text COLLATE utf8mb4_unicode_520_ci,
  `Created` date DEFAULT NULL,
  `DeptID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `LeadApproval` int(11) DEFAULT NULL,
  `LeadApprovalDate` date DEFAULT NULL,
  `ManagerApproval` int(11) DEFAULT NULL,
  `ManagerApprovalCanel` text COLLATE utf8mb4_unicode_520_ci,
  `ManagerApprovalDate` date DEFAULT NULL,
  `DirectorApproval` int(11) DEFAULT NULL,
  `DirectorApprovalCannel` text COLLATE utf8mb4_unicode_520_ci,
  `DirectorApprovalDate` date DEFAULT NULL,
  `UserCancal` int(11) DEFAULT NULL,
  `UserCancalDate` date DEFAULT NULL,
  `CancalDate` date DEFAULT NULL,
  `ManagerApprovalStatus` int(11) DEFAULT NULL,
  `DirectorApprovalStatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Đang đổ dữ liệu cho bảng `usertimeout`
--

INSERT INTO `usertimeout` (`ID`, `TimekeepingType`, `Offdate`, `EndDate`, `NumberDay`, `Descriptions`, `Status`, `Type`, `TimeIn`, `TimeOut`, `SecurityTimeIn`, `SecurityTimeOut`, `Created`, `DeptID`, `UserID`, `LeadApproval`, `LeadApprovalDate`, `ManagerApproval`, `ManagerApprovalCanel`, `ManagerApprovalDate`, `DirectorApproval`, `DirectorApprovalCannel`, `DirectorApprovalDate`, `UserCancal`, `UserCancalDate`, `CancalDate`, `ManagerApprovalStatus`, `DirectorApprovalStatus`) VALUES
(140, 2, '2017-07-07', NULL, NULL, 'Đi Khám', 1, 4, '10h:00p', NULL, NULL, NULL, '2017-07-07', 3, 3, NULL, NULL, 2, NULL, '2017-07-07', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(141, 4, '2017-07-08', NULL, NULL, 'Về Sớm Đón Con', 0, 1, NULL, '3h:00p', NULL, NULL, '2017-07-07', 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(142, 3, '2017-07-07', '2017-07-08', '2 ngÃ y ', 'Về Thăm Gia Đình', 1, 3, NULL, NULL, NULL, NULL, '2017-07-07', 2, 6, NULL, NULL, 2, NULL, '2017-07-07', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0),
(143, 6, '2017-07-11', NULL, NULL, 'Lên Quê Muôn', 0, 4, '10h:00p', NULL, NULL, NULL, '2017-07-07', 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(144, 1, '2017-07-08', NULL, NULL, 'Chuyển Nhà', 0, 1, NULL, '3h:00p', NULL, NULL, '2017-07-07', 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0),
(145, 4, '2017-07-08', NULL, NULL, 'Đi khám', 0, 4, '10h:00p', NULL, NULL, NULL, '2017-07-07', 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `configstatus`
--
ALTER TABLE `configstatus`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `leavetype`
--
ALTER TABLE `leavetype`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_nhlj4yg1eu98r0p1q37dwr1lf` (`DepartmentID`);

--
-- Chỉ mục cho bảng `userfcroles`
--
ALTER TABLE `userfcroles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_tmu865ifdgxc4k7x9ceybys60` (`DeptID`),
  ADD KEY `FK_me5p8q3rw4kjwf7uhrtyb6wj5` (`RolesID`),
  ADD KEY `FK_l8cnyvp9xafxj3scs1kfosonl` (`UserID`);

--
-- Chỉ mục cho bảng `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_5lb23tpjse99wadah58y49gt1` (`RolesID`);

--
-- Chỉ mục cho bảng `usertimeout`
--
ALTER TABLE `usertimeout`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_drijenrx1yla9cl4s4ct5u1t8` (`DeptID`),
  ADD KEY `FK_9cfcgtut00ljmha09ua55h6gx` (`DirectorApproval`),
  ADD KEY `FK_1q80pmx4nub2tg3wq7vntwen` (`LeadApproval`),
  ADD KEY `FK_sl0yvcbgmvds4rdfujw8wugws` (`ManagerApproval`),
  ADD KEY `FK_kfod7oapvk97cb8otygm4s7on` (`TimekeepingType`),
  ADD KEY `FK_sk50lxfgewtg33myi56t6u33p` (`UserCancal`),
  ADD KEY `FK_qugk7f7pbm2t0qcmk3ksdbbgx` (`UserID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `configstatus`
--
ALTER TABLE `configstatus`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `department`
--
ALTER TABLE `department`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT cho bảng `leavetype`
--
ALTER TABLE `leavetype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `userfcroles`
--
ALTER TABLE `userfcroles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `userroles`
--
ALTER TABLE `userroles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `usertimeout`
--
ALTER TABLE `usertimeout`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_nhlj4yg1eu98r0p1q37dwr1lf` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`ID`);

--
-- Các ràng buộc cho bảng `userfcroles`
--
ALTER TABLE `userfcroles`
  ADD CONSTRAINT `FK_l8cnyvp9xafxj3scs1kfosonl` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_me5p8q3rw4kjwf7uhrtyb6wj5` FOREIGN KEY (`RolesID`) REFERENCES `roles` (`ID`),
  ADD CONSTRAINT `FK_tmu865ifdgxc4k7x9ceybys60` FOREIGN KEY (`DeptID`) REFERENCES `department` (`ID`);

--
-- Các ràng buộc cho bảng `userroles`
--
ALTER TABLE `userroles`
  ADD CONSTRAINT `FK_5lb23tpjse99wadah58y49gt1` FOREIGN KEY (`RolesID`) REFERENCES `roles` (`ID`);

--
-- Các ràng buộc cho bảng `usertimeout`
--
ALTER TABLE `usertimeout`
  ADD CONSTRAINT `FK_1q80pmx4nub2tg3wq7vntwen` FOREIGN KEY (`LeadApproval`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_9cfcgtut00ljmha09ua55h6gx` FOREIGN KEY (`DirectorApproval`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_drijenrx1yla9cl4s4ct5u1t8` FOREIGN KEY (`DeptID`) REFERENCES `department` (`ID`),
  ADD CONSTRAINT `FK_kfod7oapvk97cb8otygm4s7on` FOREIGN KEY (`TimekeepingType`) REFERENCES `leavetype` (`ID`),
  ADD CONSTRAINT `FK_qugk7f7pbm2t0qcmk3ksdbbgx` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_sk50lxfgewtg33myi56t6u33p` FOREIGN KEY (`UserCancal`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `FK_sl0yvcbgmvds4rdfujw8wugws` FOREIGN KEY (`ManagerApproval`) REFERENCES `user` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

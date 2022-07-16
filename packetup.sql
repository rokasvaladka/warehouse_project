-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 16, 2022 at 06:21 PM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `packetup`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `ID` int(55) NOT NULL,
  `status` int(6) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `BarCode` varchar(255) DEFAULT NULL,
  `item_type` int(55) DEFAULT NULL,
  `item_count` int(55) DEFAULT NULL,
  `SHELF` int(55) DEFAULT NULL,
  `ROW` int(55) DEFAULT NULL,
  `SEGMENT` int(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`ID`, `status`, `item_name`, `BarCode`, `item_type`, `item_count`, `SHELF`, `ROW`, `SEGMENT`) VALUES
(90, 0, 'asdasd', '9440381500265620945\r\n', NULL, 1111, NULL, NULL, NULL),
(91, 0, 'jh34h234u2347823h4u2i3h42', '00973968\r\n', NULL, 212, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `ID` int(11) NOT NULL,
  `state` varchar(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `BarCode` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`ID`, `state`, `datetime`, `item`, `BarCode`, `text`, `user`) VALUES
(156, 'new item', '2022-07-16 21:17:49', 'asdasd', '9440381500265620945\r\n', 'New Item in warehouse. +1111', 'Rokas'),
(157, 'deleted', '2022-07-16 21:18:04', 'asdasd', '9440381500265620945\r\n', 'Item was deleted.', 'Rokas'),
(158, 'new item', '2022-07-16 21:19:35', 'jh34h234u2347823h4u2i3h42', '00973968\r\n', 'New Item in warehouse. +212', 'Rokas'),
(159, 'deleted', '2022-07-16 21:19:43', 'jh34h234u2347823h4u2i3h42', '00973968\r\n', 'Item was deleted.', 'Rokas');

-- --------------------------------------------------------

--
-- Table structure for table `order_excel_lines`
--

CREATE TABLE `order_excel_lines` (
  `ID` int(55) NOT NULL,
  `import_date` date DEFAULT NULL,
  `Order_number` varchar(255) DEFAULT NULL,
  `Ship_To_Name` varchar(255) DEFAULT NULL,
  `Ship_To_State` varchar(255) DEFAULT NULL,
  `Ship_To_Postal_Code` varchar(255) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `Address_1` varchar(255) DEFAULT NULL,
  `Address_2` varchar(255) DEFAULT NULL,
  `Ship_To_City` varchar(255) DEFAULT NULL,
  `Ship_To_Country` varchar(255) DEFAULT NULL,
  `Ship_To_Phone` varchar(255) DEFAULT NULL,
  `Ship_To_Email` varchar(255) DEFAULT NULL,
  `Item_Name` varchar(55) DEFAULT NULL,
  `weight` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rowss`
--

CREATE TABLE `rowss` (
  `ID` int(55) NOT NULL,
  `row_num` int(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `segments`
--

CREATE TABLE `segments` (
  `ID` int(55) NOT NULL,
  `segment_num` int(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shelves`
--

CREATE TABLE `shelves` (
  `ID` int(55) NOT NULL,
  `Shelve_Num` int(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `ID` int(55) NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`ID`, `type_name`) VALUES
(1, 'T-Shirt'),
(2, 'LP'),
(3, 'Book');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(55) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `License` int(55) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `user_name`, `password`, `License`, `name`) VALUES
(1, 'rokas', 'b7433696216f6f2e16999f908ff9234e', 11111, 'Rokas'),
(3, 'edvinas', '56c1eabb820c2716f89fc87a06771166', 11100, 'Edvinas'),
(4, 'gustas', 'ed146e74cbbff83db80ed80da860d887', 11000, 'Gustas'),
(5, 'aiste', '871ac92acac65307bceb5a7272eae981', 10010, 'Aistė'),
(6, 'gabriel', '647431b5ca55b04fdf3c2fce31ef1915', 10000, 'Gabriel');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `BarCode` (`BarCode`),
  ADD UNIQUE KEY `item_name` (`item_name`),
  ADD KEY `SHELF` (`SHELF`,`ROW`,`SEGMENT`),
  ADD KEY `ROW` (`ROW`),
  ADD KEY `SEGMENT` (`SEGMENT`),
  ADD KEY `item_type` (`item_type`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `order_excel_lines`
--
ALTER TABLE `order_excel_lines`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rowss`
--
ALTER TABLE `rowss`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `segments`
--
ALTER TABLE `segments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `shelves`
--
ALTER TABLE `shelves`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `ID` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `order_excel_lines`
--
ALTER TABLE `order_excel_lines`
  MODIFY `ID` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rowss`
--
ALTER TABLE `rowss`
  MODIFY `ID` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `segments`
--
ALTER TABLE `segments`
  MODIFY `ID` int(55) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shelves`
--
ALTER TABLE `shelves`
  MODIFY `ID` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `ID` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(55) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`ROW`) REFERENCES `rowss` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`SEGMENT`) REFERENCES `segments` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_3` FOREIGN KEY (`SHELF`) REFERENCES `shelves` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_4` FOREIGN KEY (`item_type`) REFERENCES `types` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2025 at 01:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customer_segmentation`
--

-- --------------------------------------------------------

--
-- Table structure for table `customerengagement`
--

CREATE TABLE `customerengagement` (
  `EngagementID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `LastPurchaseDate` date DEFAULT NULL,
  `TotalOrders` int(11) DEFAULT NULL,
  `TotalSpent` decimal(10,2) DEFAULT NULL,
  `LastEngagementDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customerengagement`
--

INSERT INTO `customerengagement` (`EngagementID`, `CustomerID`, `LastPurchaseDate`, `TotalOrders`, `TotalSpent`, `LastEngagementDate`) VALUES
(301, 1, '2024-01-08', 2, 500.00, '2024-01-10'),
(302, 2, '2024-01-06', 1, 150.00, '2024-01-07'),
(303, 3, '2024-01-07', 1, 75.00, '2024-01-07'),
(304, 4, '2024-01-09', 1, 500.00, '2024-01-09'),
(305, 5, '2024-01-05', 1, 200.00, '2024-01-06');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `SignupDate` date DEFAULT NULL,
  `CustomerSegment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `Name`, `Age`, `Gender`, `SignupDate`, `CustomerSegment`) VALUES
(1, 'Alice Johnson', 32, 'Female', '2020-01-15', 'High-Value'),
(2, 'Bob Smith', 45, 'Male', '2019-03-22', 'Medium-Value'),
(3, 'Charlie Brown', 29, 'Male', '2021-07-08', 'Low-Value'),
(4, 'Diana Prince', 38, 'Female', '2018-06-12', 'High-Value'),
(5, 'Ethan Hunt', 50, 'Male', '2017-11-02', 'Medium-Value');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `Price`) VALUES
(201, 101, 1, 1, 1000.00),
(202, 102, 2, 1, 500.00),
(203, 103, 3, 2, 200.00),
(204, 104, 4, 3, 240.00),
(205, 105, 5, 1, 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `OrderDate`, `TotalAmount`) VALUES
(101, 1, '2024-01-05', 200.00),
(102, 2, '2024-01-06', 150.00),
(103, 3, '2024-01-07', 75.00),
(104, 1, '2024-01-08', 300.00),
(105, 4, '2024-01-09', 500.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `ProductName`, `Category`, `Price`) VALUES
(1, 'Laptop', 'Electronics', 1000.00),
(2, 'Phone', 'Electronics', 500.00),
(3, 'Headphones', 'Accessories', 100.00),
(4, 'Shoes', 'Fashion', 80.00),
(5, 'Watch', 'Fashion', 150.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customerengagement`
--
ALTER TABLE `customerengagement`
  ADD PRIMARY KEY (`EngagementID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customerengagement`
--
ALTER TABLE `customerengagement`
  ADD CONSTRAINT `customerengagement_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

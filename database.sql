-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2025 at 07:54 AM
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
-- Database: `food_for_algo`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(11) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com', '', '2024-06-17 17:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `d_id` int(11) NOT NULL,
  `rs_id` int(11) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`d_id`, `rs_id`, `title`, `slogan`, `price`, `img`) VALUES
(18, 5, 'susi', 'vinegared rice, raw or cooked seafood, and various ingredients wrapped in seaweed', 450.00, '66710052d778b.jpg'),
(19, 5, 'Ramen', 'Chinese-style wheat noodles served in a flavorful broth, often flavored with soy sauce or miso', 350.00, '6671008090a3e.jpg'),
(20, 6, 'Veg Momo', 'steamed filled dumpling in Tibetan and Nepali cuisine that is also popular ', 120.00, '667100fec2eaf.jpg'),
(21, 7, 'Chowmin', 'Chinese-style noodles that can be served with proteins, vegetables or gravy', 120.00, '66710160442c5.jpg'),
(22, 8, 'Grill Chicken', 'Barbecue chicken consists of chicken parts or entire chickens that are barbecued, grilled or smoked', 650.00, '667102a6e63c3.jpg'),
(23, 8, 'Grill Fish', 'Barbecue Fish consists of Chest parts or entire Fish that are barbecued, grilled or smoked', 600.00, '667102e27aa85.jpg'),
(24, 7, 'French Fries', 'Potatoes that have deep fried in vegetable oil to a light golden colour', 150.00, '6671b7f0c8f1e.jpg'),
(25, 7, 'Pizza', 'flatbread was often topped with ingredients', 350.00, '6671b8570d9ab.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `d_id` int(11) NOT NULL,
  `food_name` varchar(222) NOT NULL,
  `food_img` varchar(222) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rating` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`rating_id`, `o_id`, `u_id`, `d_id`, `food_name`, `food_img`, `quantity`, `price`, `rating`, `date`) VALUES
(1, 27, 11, 18, 'Sushi', '66710052d778b.jpg', 1, 450.00, 3, '2024-07-15 08:40:23'),
(2, 28, 11, 19, 'Ramen', '6671008090a3e.jpg', 1, 350.00, 8, '2024-07-15 08:53:20'),
(4, 32, 11, 21, 'Chowmin', '66710160442c5.jpg', 1, 120.00, 4, '2024-11-22 02:18:23'),
(5, 33, 11, 19, 'Ramen', '6671008090a3e.jpg', 1, 350.00, 4, '2024-11-22 06:20:15');

-- --------------------------------------------------------

--
-- Table structure for table `remark`
--

CREATE TABLE `remark` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `remark`
--

INSERT INTO `remark` (`id`, `frm_id`, `status`, `remark`, `remarkDate`) VALUES
(1, 23, 'closed', 'delever complete\r\n', '2024-06-18 15:55:58'),
(2, 24, 'in process', 'on my way\r\n', '2024-06-18 15:56:52'),
(3, 24, 'closed', 'complete\r\n', '2024-06-18 15:57:18'),
(4, 25, 'in process', 'abc', '2024-06-19 04:53:37'),
(5, 25, 'rejected', 'd', '2024-06-19 04:53:57'),
(6, 27, 'closed', 'thank you', '2024-07-15 13:56:24'),
(7, 28, 'in process', 'on the way', '2024-07-15 14:37:36'),
(8, 28, 'closed', 'your food is delivered', '2024-07-15 14:38:06'),
(9, 29, 'closed', 'your food is delivered', '2024-07-16 01:07:08'),
(10, 30, 'closed', 'you order has been delivered', '2024-07-16 16:42:49'),
(11, 31, 'closed', 'thank you for ordering', '2024-11-17 11:06:03'),
(12, 32, 'closed', 'thank you for ordering', '2024-11-22 02:14:48'),
(13, 33, 'closed', 'thank you for ordering', '2024-11-22 06:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `rs_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(5, 5, 'Momotarou', 'momotarou@gmail.com', '9775262563', 'www.momotarou.com', '8am', '8pm', 'Sun-sat', ' Thamel, Kathmandu ', '6671003658648.jpg', '2024-06-18 03:34:14'),
(6, 6, 'ShandarMomo', 'shandar@gmail.com', '9856236523', 'www.sandarmomo.com', '10am', '8pm', 'Sun-sat', ' Bagbazzar, Kathmandu ', '6670ffd86dd22.png', '2024-06-18 03:32:40'),
(7, 7, 'Burger House', 'burgerhouse@gmail.com', '97752642186', 'www.burgerhouse.com', '9am', '10pm', 'Sun-Sat', 'Sundhara, Kathmandu', '6670ff2ee66b7.jpg', '2024-06-18 03:29:50'),
(8, 8, 'Grill House', 'grilhouse@gmail.com', '9856236412', 'www.grillhouse.com', '9am', '10pm', 'Sun-Fri', 'Budanilkantha, Kathmandu', '6671025a9ad71.jpg', '2024-06-18 03:43:22');

-- --------------------------------------------------------

--
-- Table structure for table `res_category`
--

CREATE TABLE `res_category` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `res_category`
--

INSERT INTO `res_category` (`c_id`, `c_name`, `date`) VALUES
(5, 'Japanese', '2024-06-17 17:27:17'),
(6, 'Momo', '2024-06-17 17:52:08'),
(7, 'FastFood', '2024-06-18 03:22:50'),
(8, 'Grill ', '2024-06-18 03:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(11, 'Sushil', 'sushil', 'khadka', 'khadkasushil555@gmail.com', '9860370086', '41edd4833f5892a500f53f7ae6761aed', 'kathmandu', 1, '2024-07-13 08:36:08');

-- --------------------------------------------------------

--
-- Table structure for table `users_orders`
--

CREATE TABLE `users_orders` (
  `o_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users_orders`
--

INSERT INTO `users_orders` (`o_id`, `u_id`, `title`, `quantity`, `price`, `status`, `date`) VALUES
(23, 9, 'susi', 1, 450.00, 'closed', '2024-06-18 15:55:58'),
(24, 9, 'Ramen', 1, 350.00, 'closed', '2024-06-18 15:57:18'),
(25, 10, 'Ramen', 1, 350.00, 'rejected', '2024-06-19 04:53:57'),
(27, 11, 'susi', 1, 450.00, 'closed', '2024-07-15 13:56:24'),
(28, 11, 'Veg Momo', 1, 120.00, 'closed', '2024-07-15 14:38:06'),
(29, 11, 'Grill Chicken', 1, 650.00, 'closed', '2024-07-16 01:07:08'),
(30, 11, 'Chowmin', 2, 120.00, 'closed', '2024-07-16 16:42:49'),
(31, 11, 'Grill Chicken', 1, 650.00, 'closed', '2024-11-17 11:06:03'),
(32, 11, 'Chowmin', 1, 120.00, 'closed', '2024-11-22 02:14:48'),
(33, 11, 'Ramen', 1, 350.00, 'closed', '2024-11-22 06:20:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `o_id` (`o_id`),
  ADD KEY `u_id` (`u_id`),
  ADD KEY `d_id` (`d_id`);

--
-- Indexes for table `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indexes for table `res_category`
--
ALTER TABLE `res_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `remark`
--
ALTER TABLE `remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `res_category`
--
ALTER TABLE `res_category`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`o_id`) REFERENCES `users_orders` (`o_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`d_id`) REFERENCES `dishes` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

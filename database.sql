-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2017 at 05:55 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_moki2`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brand_name` varchar(50) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `indexbrand` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brand_name`, `category_id`, `indexbrand`) VALUES
(1, 'Sony', 1, 1),
(2, 'Sam Sung', 2, 2),
(3, 'Apple', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `has_brand` int(11) DEFAULT NULL,
  `has_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `has_brand`, `has_name`) VALUES
(1, 'Điện Thoại', NULL, NULL),
(2, 'Máy tính bảng', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment_products`
--

CREATE TABLE `comment_products` (
  `id` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `created` date NOT NULL,
  `poster_id` int(11) NOT NULL,
  `indexcmt` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment_products`
--

INSERT INTO `comment_products` (`id`, `id_products`, `comment`, `created`, `poster_id`, `indexcmt`) VALUES
(1, 1, 'sản phẩm không tốt', '2017-11-05', 2, 7),
(2, 1, 'sản phẩm không tốt', '2017-11-05', 1, 6),
(3, 1, 'sản phẩm không tốt', '2017-11-05', 1, 5),
(4, 1, 'sản phẩm rất tốt', '2017-11-05', 1, 4),
(5, 1, 'sản phẩm tốt', '2017-11-05', 1, 3),
(6, 1, 'sản phẩm khá tốt', '2017-11-05', 1, 2),
(7, 1, 'sản phẩm khá tốt', '2017-11-05', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE `conversation` (
  `conver_id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `conversation`
--

INSERT INTO `conversation` (`conver_id`, `userID`, `partner_id`) VALUES
(1, 1, 2),
(2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `default_address`
--

CREATE TABLE `default_address` (
  `id` int(11) NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pick_support` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `default_address`
--

INSERT INTO `default_address` (`id`, `address`, `pick_support`) VALUES
(1, 'Số 1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội', 1),
(2, 'Hai Bà Trưng, Hà Nội', 0);

-- --------------------------------------------------------

--
-- Table structure for table `devtoken`
--

CREATE TABLE `devtoken` (
  `id` int(11) NOT NULL,
  `token` varchar(50) CHARACTER SET utf8 NOT NULL,
  `devtype` tinyint(1) NOT NULL DEFAULT '1',
  `devtoken` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `devtoken`
--

INSERT INTO `devtoken` (`id`, `token`, `devtype`, `devtoken`) VALUES
(1, 'CI5hUdQ9n9Uh2GNKkEhV/', 1, 'CI5hUdQ9n9Uh2GNKkEhV/');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `url` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `id_products`, `url`) VALUES
(1, 2, 'C:/xampp/htdocs/MokiAPI1/images/011c51949cb85a201f'),
(2, 3, 'C:/xampp/htdocs/MokiAPI1/images/011c51949cb85a201f'),
(3, 4, 'C:/xampp/htdocs/MokiAPI1/images/011c51949cb85a201f'),
(4, 5, 'C:/xampp/htdocs/MokiAPI1/images/a76d85f9264720e205'),
(5, 6, 'C:/xampp/htdocs/MokiAPI1/images/a76d85f9264720e205'),
(7, 8, 'C:/xampp/htdocs/MokiAPI1/images/a76d85f9264720e205'),
(8, 1, 'C:/xampp/htdocs/MokiAPI1/images/a76d85f9264720e205'),
(9, 9, 'C:/xampp/htdocs/MokiAPI1/images/a1089f3e33d8738a95'),
(10, 10, 'C:/xampp/htdocs/MokiAPI1/images/7fdc1a630c238af081'),
(11, 11, 'C:/xampp/htdocs/MokiAPI1/images/bbac79eac79c76422c');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `content` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `conver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `partner_id`, `product_id`, `userID`, `content`, `status`, `created`, `conver_id`) VALUES
(1, 2, 1, 1, 'qưetregédf á a', 1, '2017-12-02 08:23:40', 1),
(2, 2, 1, 1, 'API           conversation', 1, '2017-12-02 08:24:32', 1),
(18, 1, 1, 2, 'Api 1 2 3 4', 1, '2017-12-02 11:15:02', 1),
(19, 1, 1, 3, 'Api 1 2 3 4', 0, '2017-12-02 11:16:05', 2),
(20, 2, 1, 1, 'Đõ văn chiến', 0, '2017-12-02 12:30:19', 1),
(21, 1, 1, 2, 'Bùi Anh Hào', 1, '2017-12-02 13:02:17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `product_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `offers` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`product_id`, `buyer_id`, `user_id`, `offers`, `state`, `id`) VALUES
(1, 2, 1, 3000000, 0, 1),
(1, 3, 1, 2500000, 1, 2),
(1, 4, 1, 4000000, 1, 3),
(1, 2, 1, 3500000, 0, 4),
(1, 4, 1, 20000000, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `poster`
--

CREATE TABLE `poster` (
  `id` int(11) NOT NULL,
  `id_comment` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  `video` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `price_percent` int(11) DEFAULT '0',
  `brand` int(11) DEFAULT NULL,
  `described` varchar(50) DEFAULT NULL,
  `ships_from` varchar(50) DEFAULT NULL,
  `ships_from_id` int(11) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `solike` int(50) DEFAULT '0',
  `comment` int(11) DEFAULT '0',
  `is_liked` int(11) DEFAULT '0',
  `is_blocked` int(11) DEFAULT '0',
  `can_edit` int(11) DEFAULT '0',
  `banned` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `seller` int(11) DEFAULT NULL,
  `url` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL,
  `dimension` varchar(50) NOT NULL,
  `is_sold` int(11) NOT NULL DEFAULT '0',
  `indexpr` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `video`, `size`, `category`, `price`, `price_percent`, `brand`, `described`, `ships_from`, `ships_from_id`, `created`, `solike`, `comment`, `is_liked`, `is_blocked`, `can_edit`, `banned`, `state`, `seller`, `url`, `weight`, `dimension`, `is_sold`, `indexpr`) VALUES
(1, 'Sony z3', 1, 0, 1, 1, 20000000, 200000, 1, '', '', NULL, '2017-10-10', 16, 7, 1, 0, 0, '', '', 1, 'http://localhost:8080/products/id=1', 1, '', 0, 4),
(2, 'Bphone', 2, 0, 1, 1, 9000000, 0, 1, '', '', 0, '2017-11-19', 0, 0, 0, 0, 0, NULL, NULL, 2, 'http://localhost:8080/products/id=2', 0, '', 0, 5),
(3, 'Bphone', 3, 0, 1, 1, 9000000, 0, 1, '', '', 0, '2017-11-19', 0, 0, 0, 0, 0, NULL, NULL, 1, 'http://localhost:8080/products/id=3', 0, '', 0, 6),
(4, 'Bphone', 4, 0, 1, 1, 9000000, 0, 1, '', '', 0, '2017-11-19', 0, 0, 0, 0, 0, NULL, NULL, 2, 'http://localhost:8080/products/id=4', 0, '', 0, 7),
(5, 'Sam Sung', 5, 0, 1, 1, 9000000, 0, 1, '', '', 0, '2017-11-19', 0, 0, 0, 0, 0, NULL, NULL, 1, 'http://localhost:8080/products/id=5', 0, '', 0, 8),
(6, 'Sam Sung', 6, 0, 1, 1, 9000000, 0, 1, '', '', 0, '2017-11-19', 0, 0, 0, 0, 0, NULL, NULL, 2, 'http://localhost:8080/products/id=6', 0, '', 0, 9),
(8, 'Sam Sung', 8, 0, 1, 1, 9000000, 0, 1, '', '', 0, '2017-11-19', 0, 0, 0, 0, 0, NULL, NULL, 1, 'http://localhost:8080/products/id=8', 0, '', 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `report_products`
--

CREATE TABLE `report_products` (
  `id` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `id_reporter` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `details` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `report_products`
--

INSERT INTO `report_products` (`id`, `id_products`, `id_reporter`, `subject`, `details`) VALUES
(1, 1, 1, '1', 'Sản phẩm không đúng'),
(2, 1, 2, '1', 'text');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `listing` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `id_products`, `username`, `avatar`, `score`, `listing`) VALUES
(1, 1, 'Đỗ Văn Chiến', '-1', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `size_name` varchar(50) NOT NULL,
  `indexsize` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `category_id`, `size_name`, `indexsize`) VALUES
(1, 1, 'Nhỏ', 1),
(2, 1, 'Vừa', 2),
(3, 2, 'Nhỏ', 3);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `subject_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `subject_name`) VALUES
(1, 'Không đúng danh mục'),
(2, 'Người bán lừa đảo'),
(3, 'Vi phạm pháp luật'),
(4, 'Khác');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phonenumber` int(11) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` varchar(50) DEFAULT '-1',
  `score` int(11) NOT NULL,
  `listing` varchar(50) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `firtname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `active` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phonenumber`, `password`, `avatar`, `score`, `listing`, `address`, `url`, `firtname`, `lastname`, `city`, `token`, `active`) VALUES
(1, 'Đỗ Văn Chiến', '20148025@student.hust.edu.vn', 1659910843, '1db7ce8763ebd62b306afb8364a9352c', '-1', 0, '', 'Hà nội', 'http://localhost:8080/users/id=1', 'Chiến', 'Đõ Văn', 'Bắc Ninh', 'CI5hUdQ9n9Uh2GNKkEhV/', 1),
(2, 'Bùi Anh Hào', '20131192@student.hust.edu.vn', 1234567899, '1db7ce8763ebd62b306afb8364a9352c', '-1', 0, '', 'Hà nội', 'http://localhost:8080/users/id=2', 'Hào', 'Bùi Anh', 'Hà Nội', 'rDnMpHuoIVKC8bePqr0W/', 1),
(3, 'Hà Như Bách', '20148011@student.hust.edu.vn', 1234567888, '1db7ce8763ebd62b306afb8364a9352c', '-1', 0, '', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(4, 'Hck', 'ABC@gmail.com', 975318642, '81dc9bdb52d04dc20036dbd8313ed055', '-1', 0, '   ', NULL, NULL, NULL, NULL, NULL, 'uUjaGqLlW6ZlJtdnvE3Z/', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `created` date DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `cover_image` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `cover_image_web` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `balance` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pending_balance` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `rates_lv1` int(11) DEFAULT NULL,
  `rates_lv2` int(11) DEFAULT NULL,
  `rates_lv3` int(11) DEFAULT NULL,
  `listing` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `followed` int(11) DEFAULT NULL,
  `is_blocked` tinyint(1) NOT NULL,
  `default_address_id` int(11) DEFAULT NULL,
  `online` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `created`, `status`, `cover_image`, `cover_image_web`, `balance`, `pending_balance`, `rates_lv1`, `rates_lv2`, `rates_lv3`, `listing`, `followed`, `is_blocked`, `default_address_id`, `online`) VALUES
(1, '2017-11-01', '1', '-1', '-1', '1', '1', 3, 1, 2, '1', 0, 0, 1, 1),
(2, '2017-11-01', '1', '-1', '-1', '4', '4', 23, 4, 5, '3', 0, 0, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `auto_with_draw` tinyint(1) NOT NULL,
  `vacation_mode` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user_setting`
--

INSERT INTO `user_setting` (`id`, `userid`, `auto_with_draw`, `vacation_mode`) VALUES
(1, 1, 1, 0),
(2, 2, 1, 1),
(3, 3, 1, 1),
(4, 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `url` varchar(50) NOT NULL,
  `thumb` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `id_products`, `url`, `thumb`) VALUES
(3, 0, 'C:/xampp/htdocs/MokiAPI1/videos/d41d8cd98f00b204e9', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_products`
--
ALTER TABLE `comment_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `poster_id` (`poster_id`),
  ADD KEY `id_products` (`id_products`);

--
-- Indexes for table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`conver_id`);

--
-- Indexes for table `default_address`
--
ALTER TABLE `default_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `devtoken`
--
ALTER TABLE `devtoken`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_products` (`id_products`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poster`
--
ALTER TABLE `poster`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_comment` (`id_comment`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller` (`seller`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `report_products`
--
ALTER TABLE `report_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_products` (`id_products`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id_products`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `comment_products`
--
ALTER TABLE `comment_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `conver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `default_address`
--
ALTER TABLE `default_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `devtoken`
--
ALTER TABLE `devtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `poster`
--
ALTER TABLE `poster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `report_products`
--
ALTER TABLE `report_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_setting`
--
ALTER TABLE `user_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

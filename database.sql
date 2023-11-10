-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: bsscrqdutkirshemk4bs-mysql.services.clever-cloud.com:3306
-- Generation Time: Nov 10, 2023 at 07:50 AM
-- Server version: 8.0.22-13
-- PHP Version: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bsscrqdutkirshemk4bs`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryID` int NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryID`, `name`) VALUES
(1, 'Appetizer'),
(2, 'Main Course'),
(3, 'Beverages'),
(4, 'Dessert');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `orderID` int NOT NULL,
  `customerID` int DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `orderID` int DEFAULT NULL,
  `productID` int DEFAULT NULL,
  `amount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `invoiceID` int NOT NULL,
  `paymentDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` float NOT NULL DEFAULT '0',
  `paymentMethod` varchar(50) NOT NULL,
  `orderID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int NOT NULL,
  `name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stock` varchar(50) NOT NULL DEFAULT '',
  `categoryID` int NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `imageURL` varchar(200) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `name`, `stock`, `categoryID`, `description`, `imageURL`, `price`) VALUES
(1, 'Mushroom Soup', 'true', 1, 'Mushroom soup is a savory and comforting dish made from a blend of mushrooms, typically sautéed with onions and garlic, then simmered in broth and often enriched with cream or other dairy products.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 25000),
(2, 'Mushroom Fritters', 'true', 1, 'Mushroom fritters are delectable bites made by coating sliced or chopped mushrooms in a seasoned batter and then frying them until golden and crispy. ', 'https://primefaces.org/cdn/primeng/images/usercard.png', 20000),
(3, 'Potato Skin', 'true', 1, 'Potato skins are crispy, golden shells that result from baking or frying potatoes.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 25000),
(4, 'Bacon Bites', 'true', 1, 'Bacon bites are small, bite-sized pieces of crispy and flavorful bacon, often enjoyed as a tasty snack or used to enhance the taste of various dishes.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 30000),
(5, 'Tenderloin Steak', 'true', 2, 'Tenderloin steak is a premium cut of beef known for its exceptional tenderness and lean, succulent texture, making it a sought-after choice for a delicious and upscale dining experience.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 100000),
(6, 'Seared Scallops With Brown Butter and Lemon Pan Sauce', 'true', 2, 'Seared scallops with brown butter and lemon pan sauce is a gourmet dish featuring perfectly caramelized scallops, drizzled with a rich brown butter and lemon sauce.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 89000),
(7, 'Spaghetti Carbonara', 'true', 2, 'Spaghetti carbonara is a classic Italian pasta dish characterized by a creamy sauce made with eggs, grated Pecorino Romano cheese, pancetta, and black pepper.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 64000),
(8, 'Cheeseburger', 'true', 2, 'A cheeseburger is a classic American sandwich consisting of a grilled or fried beef patty, topped with melted cheese, and typically served in a bun.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 60000),
(9, 'Potato Gnocchi', 'true', 2, 'Potato gnocchi are soft, pillowy pasta dumplings made with a combination of potatoes and flour.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 49000),
(10, 'Sparkling Water', 'true', 3, 'Sparkling water is a carbonated beverage, often referred to as seltzer or carbonated water, containing bubbles that provide a fizzy and refreshing quality. ', 'https://primefaces.org/cdn/primeng/images/usercard.png', 15000),
(11, 'Lemon Tea', 'true', 3, 'Lemon tea is a refreshing beverage made by combining tea, typically black or green, with the zesty flavor of freshly squeezed lemon juice. ', 'https://primefaces.org/cdn/primeng/images/usercard.png', 15000),
(12, 'Green Tea Latte', 'true', 3, 'A green tea latte is a comforting beverage made by blending green tea with steamed milk, creating a smooth and frothy texture.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 25000),
(13, 'Taro Latte', 'true', 3, 'A taro latte is a sweet and creamy beverage made by blending taro root flavoring with steamed milk.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 25000),
(14, 'Choco Lava Cake', 'true', 4, 'Choco lava cake is a decadent dessert known for its rich and gooey chocolate center.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 20000),
(15, 'Soft Caramel Pudding', 'true', 4, 'Soft caramel pudding is a luscious dessert with a smooth and velvety texture.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 14000),
(16, 'Strawberry Ice Cream', 'true', 4, 'Strawberry ice cream is a sweet frozen treat with a creamy texture, featuring the luscious flavor of ripe strawberries.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 8000),
(17, 'Chocolate Waffle', 'true', 4, 'A chocolate waffle is a delicious variation of the traditional waffle, infused with cocoa or chocolate chips.', 'https://primefaces.org/cdn/primeng/images/usercard.png', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(1, 'johndoe', 'john.doe@mail.com', '123456'),
(2, 'janedoe', 'jane.doe@mail.com', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `FK_order_user` (`customerID`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD KEY `FK__order` (`orderID`),
  ADD KEY `FK__products` (`productID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`invoiceID`) USING BTREE,
  ADD KEY `FK_payment_order` (`orderID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `FK_products_category` (`categoryID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `orderID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `invoiceID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_order_user` FOREIGN KEY (`customerID`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK__order` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`),
  ADD CONSTRAINT `FK__products` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_payment_order` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products_category` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2021 at 06:54 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerceapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(1, 'vignesh','vignesh123@gmail.com','$2y$10$YKSDtra7v2wH6ORYfry8Ue9t49pk1AvQvdJGuq4lDvFLEcx.kP6Mq','1'),
(2, 'mounika','mounika123@gmail.com','$2y$10$YKSDtra7v2wH6ORYfry8Ue9t49pk1AvQvdJGuq4lDvFLEcx.kP6Mq','1'),
(3, 'neeraja','neeraja123@gmail.com','$2y$10$YKSDtra7v2wH6ORYfry8Ue9t49pk1AvQvdJGuq4lDvFLEcx.kP6Mq','1'),
(4, 'henry','henry123@gmail.com','$2y$10$YKSDtra7v2wH6ORYfry8Ue9t49pk1AvQvdJGuq4lDvFLEcx.kP6Mq','1');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Nike'),
(2, 'Zara'),
(3, 'Apple'),
(4, 'Samsung'),
(5, 'MAC'),
(6, 'L Oréal+'),
(7, 'Ikea'),
(8, 'KitchenAid'),
(9, 'The North Face'),
(10, 'Columbia'),
(11,'LEGO'),
(12,'Nintendo'),
(13,'National Geographic'),
(14,'Amazon Kindle'),
(15,'Tiffany & Co'),
(16,'Pandora'),
(17,'Ford'),
(18,'BMW'),
(19,'Fitbit'),
(20,'Lululemon');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(1, 4, '::1', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Fashion and Apparel'),
(2, 'Electronics'),
(3, 'Beauty and Cosmetics'),
(4, 'Home and Kitchen'),
(5, 'Sports and Outdoors'),
(6, 'Toys and Games'),
(7, 'Books and Media'),
(8, 'Jewelry and Accessories'),
(9,'Automotive'),
(10,'Health and Fitness');


-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 1, 1, '9L434522M7706801A', 'Completed'),
(2, 1, 2, 1, '9L434522M7706801A', 'Completed'),
(3, 1, 3, 1, '9L434522M7706801A', 'Completed'),
(4, 1, 1, 1, '8AT7125245323433N', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 1, 'Running Shoes', 100, 50, 'High-performance running shoes', 'nike_running_shoes.jpg', 'running, shoes, Nike'),
(2, 1, 2, 'Slim Fit Jeans', 50, 30, 'Stylish slim-fit jeans', 'zara_jeans.jpg', 'jeans, fashion, Zara'),
(3, 2, 3, 'iPhone 13', 1000, 20, 'Latest iPhone with advanced features', 'iphone_13.jpg', 'iPhone, Apple, smartphone'),
(4, 2, 4, '4K Smart TV', 800, 15, 'Immersive 4K Smart TV', 'samsung_tv.jpg', 'TV, Samsung, 4K'),
(5, 2, 3, 'MACBook Pro', 1300, 10, 'Powerful and sleek MACBook Pro', 'macbook_pro.jpg', 'MACBook, Apple, laptop'),
(6, 3, 6, 'Anti-Aging Cream', 40, 40, 'Effective anti-aging cream', 'loreal_anti_aging.jpg', 'skincare, beauty, L Oréal+'),
(7, 4, 7, 'Coffee Table', 80, 25, 'Modern and functional coffee table', 'ikea_coffee_table.jpg', 'furniture, home, Ikea'),
(8, 4, 8, 'Stand Mixer', 250, 12, 'Versatile stand mixer for baking enthusiasts', 'kitchenaid_mixer.jpg', 'kitchen, appliance, KitchenAid'),
(9, 5, 9, 'Waterproof Jacket', 130, 35, 'Durable and waterproof jacket for outdoor activities', 'north_face_jacket.jpg', 'outdoor, jacket, The North Face'),
(10, 5, 10, 'Hiking Boots', 90, 28, 'Comfortable and rugged hiking boots', 'columbia_boots.jpg', 'hiking, boots, Columbia'),
(11, 6, 11, 'Star Wars Millennium Falcon', 150, 18, 'Iconic Star Wars Millennium Falcon LEGO set', 'lego_millennium_falcon.jpg', 'LEGO, Star Wars, toy'),
(12, 6, 12, 'Nintendo Switch Console', 300, 22, 'Popular gaming console', 'nintendo_switch.jpg', 'Nintendo, gaming, console'),
(13, 7, 13, 'National Geographic Encyclopedia', 30, 50, 'Comprehensive encyclopedia', 'nat_geo_encyclopedia.jpg', 'book, encyclopedia, National Geographic'),
(14, 7, 14, 'Amazon Kindle Paperwhite', 120, 15, 'High-resolution e-reader for book lovers', 'kindle_paperwhite.jpg', 'e-reader, Kindle, Amazon'),
(15, 8, 15, 'Diamond Necklace', 1000, 8, 'Elegant diamond necklace', 'tiffany_diamond_necklace.jpg', 'jewelry, necklace, Tiffany & Co'),
(16, 8, 16, 'Charm Bracelet', 80, 20, 'Charm bracelet for a personalized style', 'pandora_bracelet.jpg', 'jewelry, bracelet, Pandora'),
(17, 9, 17, 'Mustang GT', 50000, 5, 'Iconic sports car - Ford Mustang GT', 'ford_mustang_gt.jpg', 'car, Ford, Mustang'),
(18, 9, 18, 'X5 SUV', 60000, 7, 'Luxurious SUV - BMW X5', 'bmw_x5.jpg', 'car, BMW, SUV'),
(19, 10, 19, 'Charge 5 Fitness Tracker', 130, 30, 'Advanced fitness tracker', 'fitbit_charge_5.jpg', 'fitness, tracker, Fitbit'),
(20, 10, 20, 'Yoga Mat', 50, 40, 'High-quality yoga mat', 'lululemon_yoga_mat.jpg', 'yoga, mat, Lululemon'),
(21, 1, 1, 'Running Shorts', 35, 25, 'Comfortable running shorts for active wear', 'nike_running_shorts.jpg', 'running, shorts, Nike'),
(22, 1, 2, 'Floral Print Dress', 50, 20, 'Elegant floral print dress for a stylish look', 'zara_floral_dress.jpg', 'dress, fashion, Zara'),
(23, 2, 3, 'AirPods Pro', 200, 15, 'Premium wireless earbuds with active noise cancellation', 'apple_airpods_pro.jpg', 'AirPods, Apple, earbuds'),
(24, 2, 4, 'Galaxy Tab S7', 500, 10, 'High-performance Android tablet with vibrant display', 'samsung_galaxy_tab_s7.jpg', 'tablet, Samsung, Android'),
(25, 2, 3, 'MACBook Air', 900, 8, 'Thin and lightweight laptop for on-the-go use', 'macbook_air.jpg', 'MACBook, Apple, laptop'),
(26, 3, 6, 'Hydrating Moisturizer', 30, 30, 'Moisturizing cream for smooth and radiant skin', 'loreal_hydrating_moisturizer.jpg', 'skincare, beauty, L Oréal+'),
(27, 4, 7, 'Bookshelf', 130, 20, 'Sturdy and stylish bookshelf for home organization', 'ikea_bookshelf.jpg', 'furniture, home, Ikea'),
(28, 4, 8, 'Coffee Grinder', 80, 15, 'Durable coffee grinder for fresh coffee at home', 'kitchenaid_coffee_grinder.jpg', 'kitchen, appliance, KitchenAid'),
(29, 5, 9, 'Backpack', 80, 25, 'Versatile and durable backpack for outdoor adventures', 'north_face_backpack.jpg', 'outdoor, backpack, The North Face'),
(30, 5, 10, 'Fleece Jacket', 70, 22, 'Warm and comfortable fleece jacket for outdoor activities', 'columbia_fleece_jacket.jpg', 'fleece, jacket, Columbia'),
(31, 6, 11, 'Technic Excavator', 90, 15, 'Detailed Technic Excavator LEGO set for builders', 'lego_technic_excavator.jpg', 'LEGO, Technic, toy'),
(32, 6, 12, 'Nintendo Switch Games Bundle', 80, 18, 'Bundle of popular games for Nintendo Switch', 'nintendo_switch_games_bundle.jpg', 'Nintendo, gaming, games'),
(33, 7, 13, 'Travel Guide', 20, 40, 'Informative travel guide from National Geographic', 'nat_geo_travel_guide.jpg', 'book, travel, National Geographic'),
(34, 7, 14, 'Echo Dot Smart Speaker', 40, 30, 'Compact and smart speaker with Alexa voice control', 'amazon_echo_dot.jpg', 'smart speaker, Alexa, Amazon'),
(35, 8, 15, 'Pearl Earrings', 300, 12, 'Elegant pearl earrings from Tiffany & Co', 'tiffany_pearl_earrings.jpg', 'jewelry, earrings, Tiffany & Co'),
(36, 8, 16, 'Silver Ring', 50, 20, 'Stylish silver ring with intricate design from Pandora', 'pandora_silver_ring.jpg', 'jewelry, ring, Pandora'),
(37, 9, 17, 'Explorer SUV', 46000, 8, 'Spacious and versatile SUV - Ford Explorer', 'ford_explorer.jpg', 'car, Ford, Explorer'),
(38, 9, 18, '3 Series Sedan', 50000, 10, 'Luxurious and sporty sedan - BMW 3 Series', 'bmw_3_series_sedan.jpg', 'car, BMW, sedan'),
(39, 10, 19, 'Inspire 2 Fitness Tracker', 80, 25, 'Slim and lightweight fitness tracker from Fitbit', 'fitbit_inspire_2_fitness_tracker.jpg', 'fitness, tracker, Fitbit'),
(40, 10, 20, 'Yoga Block Set', 20, 50, 'Set of yoga blocks for enhanced practice', 'lululemon_yoga_block_set.jpg', 'yoga, block, Lululemon'),
(41, 1, 1, 'Running Gloves', 25, 30, 'Warm and moisture-wicking running gloves from Nike', 'nike_running_gloves.jpg', 'running, gloves, Nike'),
(42, 1, 2, 'Leather Jacket', 90, 20, 'Stylish leather jacket for a trendy look from Zara', 'zara_leather_jacket.jpg', 'jacket, fashion, Zara'),
(43, 2, 3, 'Apple Watch SE', 300, 15, 'Advanced smartwatch with fitness features from Apple', 'apple_watch_se.jpg', 'Apple Watch, Apple, smartwatch'),
(44, 2, 4, 'Samsung 32-inch Smart Monitor', 350, 12, 'Smart monitor with vibrant display from Samsung', 'samsung_smart_monitor.jpg', 'monitor, Samsung, display'),
(45, 3, 5, 'MAC Velvet Teddy Lipstick', 20, 25, 'Velvet Teddy lipstick shade from MAC Cosmetics', 'mac_velvet_teddy_lipstick.jpg', 'lipstick, beauty, MAC'),
(46, 3, 6, 'L Oréal+ Anti-Wrinkle Serum', 55, 20, 'Anti-wrinkle serum for youthful skin', 'loreal_anti_wrinkle_serum.jpg', 'skincare, beauty, L Oréal+'),
(47, 4, 7, 'Ikea Dining Table Set', 400, 18, 'Modern dining table set for stylish interiors from Ikea', 'ikea_dining_table_set.jpg', 'furniture, home, Ikea'),
(48, 4, 8, 'KitchenAid Coffee Maker', 130, 10, 'Coffee maker for brewing the perfect cup from KitchenAid', 'kitchenaid_coffee_maker.jpg', 'kitchen, appliance, KitchenAid'),
(49, 5, 9, 'The North Face Rain Jacket', 60, 22, 'Lightweight and waterproof rain jacket for outdoor use', 'north_face_rain_jacket.jpg', 'outdoor, jacket, The North Face'),
(50, 5, 10, 'Columbia Trail Shoes', 80, 20, 'Trail shoes for comfortable hiking and walking from Columbia', 'columbia_trail_shoes.jpg', 'outdoor, shoes, Columbia'),
(51, 6, 11, 'LEGO Star Wars Imperial Star Destroyer', 250, 15, 'Iconic LEGO Star Wars set for collectors', 'lego_star_destroyer.jpg', 'LEGO, Star Wars, toy'),
(52, 6, 12, 'Nintendo Joy-Con Controller Set', 80, 18, 'Additional Joy-Con controllers for Nintendo Switch', 'nintendo_joycon_controllers.jpg', 'Nintendo, gaming, controller'),
(53, 7, 13, 'National Geographic Adventure Book', 30, 25, 'Exciting adventure stories from National Geographic', 'nat_geo_adventure_book.jpg', 'book, adventure, National Geographic'),
(54, 7, 14, 'Amazon Echo Spot Smart Clock', 100, 20, 'Compact smart clock with Alexa voice control from Amazon', 'echo_spot.jpg', 'smart clock, Alexa, Amazon'),
(55, 8, 15, 'Tiffany & Co Diamond Stud Earrings', 1500, 8, 'Classic diamond stud earrings from Tiffany & Co', 'tiffany_diamond_stud_earrings.jpg', 'jewelry, earrings, Tiffany & Co'),
(56, 8, 16, 'Pandora Silver Charm Bracelet', 60, 15, 'Silver charm bracelet for a personalized style from Pandora', 'pandora_silver_charm_bracelet.jpg', 'jewelry, bracelet, Pandora'),
(57, 9, 17, 'Ford Explorer Sport Edition', 55000, 5, 'Sporty edition of the versatile Ford Explorer SUV', 'ford_explorer_sport.jpg', 'car, Ford, Explorer'),
(58, 9, 18, 'BMW iX3 Electric SUV', 75000, 7, 'Electric SUV with BMW iX3 technology', 'bmw_ix3.jpg', 'car, BMW, electric'),
(59, 10, 19, 'Fitbit Sense Smartwatch', 250, 20, 'Advanced smartwatch with health monitoring from Fitbit', 'fitbit_sense.jpg', 'smartwatch, Fitbit, health'),
(60, 10, 20, 'Lululemon Gym Bag', 50, 30, 'Stylish and spacious gym bag from Lululemon', 'lululemon_gym_bag.jpg', 'gym bag, Lululemon, fitness'),
(61, 1, 1, 'Running Jacket', 70, 25, 'Breathable and water-resistant running jacket from Nike', 'nike_running_jacket.jpg', 'running, jacket, Nike'),
(62, 1, 2, 'Denim Skirt', 40, 18, 'Stylish denim skirt for a casual and trendy look from Zara', 'zara_denim_skirt.jpg', 'skirt, fashion, Zara'),
(63, 2, 3, 'AirPods Max', 550, 12, 'High-fidelity over-ear headphones with active noise cancellation from Apple', 'apple_airpods_max.jpg', 'AirPods Max, Apple, headphones'),
(64, 2, 4, 'Samsung Galaxy Tab A7 Lite', 150, 15, 'Compact and affordable Android tablet from Samsung', 'samsung_galaxy_tab_a7_lite.jpg', 'tablet, Samsung, Android'),
(65, 3, 5, 'MAC Blush Palette', 30, 25, 'Versatile blush palette with various shades from MAC', 'mac_blush_palette.jpg', 'blush, beauty, MAC'),
(66, 3, 6, 'L Oréal+ Revitalizing Face Mask', 20, 20, 'Revitalizing face mask for a refreshed complexion', 'loreal_revitalizing_face_mask.jpg', 'skincare, beauty, L Oréal+'),
(67, 4, 7, 'Ikea Desk Chair', 90, 18, 'Comfortable and adjustable desk chair for home office from Ikea', 'ikea_desk_chair.jpg', 'furniture, home, Ikea'),
(68, 4, 8, 'KitchenAid Blender', 130, 10, 'Powerful blender for smoothies and food preparation from KitchenAid', 'kitchenaid_blender.jpg', 'kitchen, appliance, KitchenAid'),
(69, 5, 9, 'The North Face Sleeping Bag', 100, 22, 'Warm and compact sleeping bag for camping from The North Face', 'north_face_sleeping_bag.jpg', 'outdoor, camping, The North Face'),
(70, 5, 10, 'Columbia Fishing Hat', 25, 20, 'Functional and sun-protective fishing hat from Columbia', 'columbia_fishing_hat.jpg', 'fishing, hat, Columbia'),
(71, 6, 11, 'LEGO Technic Crane Truck', 200, 15, 'Detailed Technic Crane Truck LEGO set for construction enthusiasts', 'lego_technic_crane_truck.jpg', 'LEGO, Technic, toy'),
(72, 6, 12, 'Nintendo Switch Lite Games Bundle', 150, 18, 'Bundle of popular games for Nintendo Switch Lite', 'nintendo_switch_lite_games_bundle.jpg', 'Nintendo, gaming, games'),
(73, 7, 13, 'National Geographic Photography Book', 35, 25, 'Inspiring photography book from National Geographic', 'nat_geo_photography_book.jpg', 'book, photography, National Geographic'),
(74, 7, 14, 'Amazon Fire TV Stick', 50, 20, 'Streaming device for a smart TV experience from Amazon', 'fire_tv_stick.jpg', 'streaming, Amazon, TV'),
(75, 8, 15, 'Tiffany & Co Diamond Pendant', 800, 8, 'Elegant diamond pendant with sterling silver chain from Tiffany & Co', 'tiffany_diamond_pendant.jpg', 'jewelry, pendant, Tiffany & Co'),
(76, 8, 16, 'Pandora Gold Hoop Earrings', 130, 15, 'Stylish gold hoop earrings from Pandora', 'pandora_gold_hoop_earrings.jpg', 'jewelry, earrings, Pandora'),
(77, 9, 17, 'Ford Ranger Pickup Truck', 43000, 5, 'Versatile and compact pickup truck - Ford Ranger', 'ford_ranger.jpg', 'car, Ford, Ranger'),
(78, 9, 18, 'BMW i4 Electric Sedan', 70000, 7, 'Electric sedan with BMW i4 technology', 'bmw_i4.jpg', 'car, BMW, electric'),
(79, 10, 19, 'Fitbit Versa 3 Smartwatch', 230, 25, 'Versatile smartwatch with health and fitness features from Fitbit', 'fitbit_versa_3.jpg', 'smartwatch, Fitbit, health'),
(80, 10, 20, 'Lululemon Yoga Towel', 30, 30, 'Quick-drying and absorbent yoga towel for a comfortable and hygienic practice. Ideal for yoga enthusiasts who value quality and functionality in their accessories', 'lululemon_yoga_towel.jpg', 'yoga, towel, Lululemon'),
(81, 1, 1, 'Running Socks Set', 15, 40, 'Comfortable and moisture-wicking running socks set from Nike', 'nike_running_socks_set.jpg', 'running, socks, Nike'),
(82, 1, 2, 'Knit Sweater', 60, 25, 'Warm and stylish knit sweater for a cozy look from Zara', 'zara_knit_sweater.jpg', 'sweater, fashion, Zara'),
(83, 2, 3, 'Apple iPad Pro', 1100, 15, 'Powerful iPad Pro with stunning Liquid Retina display from Apple', 'apple_ipad_pro.jpg', 'iPad Pro, Apple, tablet'),
(84, 2, 4, 'Samsung Soundbar', 250, 10, 'Immersive soundbar for enhanced audio experience from Samsung', 'samsung_soundbar.jpg', 'soundbar, Samsung, audio'),
(85, 3, 5, 'MAC Lip Gloss Set', 35, 30, 'Set of MAC lip glosses for a glossy and vibrant look', 'mac_lip_gloss_set.jpg', 'lip gloss, beauty, MAC'),
(86, 3, 6, 'L Oréal+ Night Cream', 50, 20, 'Hydrating night cream for skin repair and regeneration', 'loreal_night_cream.jpg', 'skincare, beauty, L Oréal+'),
(87, 4, 7, 'Ikea Lounge Chair', 130, 18, 'Comfortable lounge chair for relaxation and leisure from Ikea', 'ikea_lounge_chair.jpg', 'furniture, home, Ikea'),
(88, 4, 8, 'KitchenAid Toaster', 70, 15, 'Stylish toaster for perfectly toasted bread and bagels from KitchenAid', 'kitchenaid_toaster.jpg', 'kitchen, appliance, KitchenAid'),
(89, 5, 9, 'The North Face Backpacking Tent', 180, 22, 'Spacious backpacking tent for outdoor adventures from The North Face', 'north_face_backpacking_tent.jpg', 'outdoor, camping, The North Face'),
(90, 5, 10, 'Columbia Insulated Parka', 120, 20, 'Insulated parka for warmth and comfort in cold weather from Columbia', 'columbia_insulated_parka.jpg', 'outdoor, jacket, Columbia'),
(91, 6, 11, 'LEGO Architecture Statue of Liberty', 100, 15, 'Detailed LEGO Architecture set of the Statue of Liberty', 'lego_architecture_statue_of_liberty.jpg', 'LEGO, Architecture, toy'),
(92, 6, 12, 'Nintendo Switch Game Storage Case', 20, 18, 'Protective storage case for Nintendo Switch games', 'nintendo_switch_game_storage_case.jpg', 'Nintendo, gaming, storage'),
(93, 7, 13, 'Travel Photography Book', 40, 25, 'Inspiring travel photography book from National Geographic', 'nat_geo_travel_photography_book.jpg', 'book, photography, National Geographic'),
(94, 7, 14, 'Amazon Kindle Kids Edition', 80, 20, 'Kid-friendly Kindle for young readers from Amazon', 'kindle_kids_edition.jpg', 'e-reader, Kindle, Amazon'),
(95, 8, 15, 'Tiffany & Co Silver Cuff Bracelet', 400, 8, 'Elegant silver cuff bracelet with intricate design from Tiffany & Co', 'tiffany_silver_cuff_bracelet.jpg', 'jewelry, bracelet, Tiffany & Co'),
(96, 8, 16, 'Pandora Rose Gold Necklace', 90, 15, 'Chic rose gold necklace with Pandora s signature style', 'pandora_rose_gold_necklace.jpg', 'jewelry, necklace, Pandora'),
(97, 9, 17, 'Ford Bronco Off-Road Edition', 50000, 5, 'Off-road edition of the iconic Ford Bronco SUV', 'ford_bronco_offroad.jpg', 'car, Ford, Bronco'),
(98, 9, 18, 'BMW X7 Luxury SUV', 90000, 7, 'Luxurious and spacious SUV - BMW X7', 'bmw_x7.jpg', 'car, BMW, SUV'),
(99, 10, 19, 'Fitbit Luxe Fitness Tracker', 150, 25, 'Elegant and slim fitness tracker with advanced features from Fitbit', 'fitbit_luxe.jpg', 'fitness, tracker, Fitbit'),
(100, 10, 20, 'Lululemon Resistance Bands Set', 30, 30, 'Set of resistance bands for effective strength training from Lululemon', 'lululemon_resistance_bands_set.jpg', 'fitness, resistance bands, Lululemon'),
(101, 1, 1, 'Running Hat', 20, 40, 'Breathable and moisture-wicking running hat from Nike', 'nike_running_hat.jpg', 'running, hat, Nike'),
(102, 1, 2, 'Casual T-Shirt', 25, 25, 'Comfortable and casual t-shirt for everyday wear from Zara', 'zara_casual_tshirt.jpg', 't-shirt, fashion, Zara'),
(103, 2, 3, 'Apple AirTag', 30, 30, 'Compact and versatile AirTag for item tracking from Apple', 'apple_airtag.jpg', 'AirTag, Apple, tracking'),
(104, 2, 4, 'Samsung 55-inch QLED TV', 1000, 15, 'Immersive QLED TV with vibrant colors and smart features from Samsung', 'samsung_qled_tv.jpg', 'TV, Samsung, QLED'),
(105, 3, 5, 'MAC Eyeshadow Palette', 40, 25, 'Versatile eyeshadow palette with a variety of shades from MAC', 'mac_eyeshadow_palette.jpg', 'eyeshadow, beauty, MAC'),
(106, 3, 6, 'L Oréal+ Sunscreen SPF 50', 15, 50, 'High SPF sunscreen for effective sun protection from L Oréal+', 'loreal_sunscreen.jpg', 'skincare, sunscreen, L Oréal+'),
(107, 4, 7, 'Ikea Wardrobe Organizer', 80, 18, 'Functional wardrobe organizer for efficient storage from Ikea', 'ikea_wardrobe_organizer.jpg', 'furniture, home, Ikea'),
(108, 4, 8, 'KitchenAid Food Processor', 180, 12, 'Powerful food processor for chopping, slicing, and shredding from KitchenAid', 'kitchenaid_food_processor.jpg', 'kitchen, appliance, KitchenAid'),
(109, 5, 9, 'The North Face Winter Gloves', 50, 22, 'Insulated winter gloves for warmth and comfort from The North Face', 'north_face_winter_gloves.jpg', 'outdoor, gloves, The North Face'),
(110, 5, 10, 'Columbia Snow Pants', 90, 20, 'Waterproof and insulated snow pants for cold weather from Columbia', 'columbia_snow_pants.jpg', 'outdoor, pants, Columbia'),
(111, 6, 11, 'LEGO Ideas Tree House', 150, 15, 'Creative LEGO Ideas set featuring a detailed treehouse', 'lego_ideas_tree_house.jpg', 'LEGO, Ideas, toy'),
(112, 6, 12, 'Nintendo Switch Pro Controller', 70, 18, 'Pro controller for enhanced gaming experience on Nintendo Switch', 'nintendo_switch_pro_controller.jpg', 'Nintendo, gaming, controller'),
(113, 7, 13, 'National Geographic Wildlife Calendar', 13, 25, 'Stunning wildlife calendar with images from National Geographic', 'nat_geo_wildlife_calendar1.jpg', 'calendar, wildlife, National Geographic'),
(114, 7, 14, 'Amazon Echo Show 8', 130, 20, 'Smart display with Alexa for video calls, entertainment, and more from Amazon', 'echo_show_8.jpg', 'smart display, Alexa, Amazon'),
(115, 8, 15, 'Tiffany & Co Pearl Bracelet', 500, 8, 'Elegant pearl bracelet with sterling silver accents from Tiffany & Co', 'tiffany_pearl_bracelet1.jpg', 'jewelry, bracelet, Tiffany & Co'),
(116, 8, 16, 'Pandora Rose Gold Charm Set', 80, 15, 'Set of rose gold charms for a personalized Pandora bracelet', 'pandora_rose_gold_charm_set1.jpg', 'jewelry, charms, Pandora'),
(117, 9, 17, 'Ford F-150 Lightning Electric Truck', 770000, 5, 'Electric version of the iconic Ford F-150 Lightning truck', 'ford_f150_lightning1.jpg', 'car, Ford, F-150 Lightning'),
(118, 9, 18, 'BMW M5 Performance Sedan', 710000, 7, 'High-performance sedan - BMW M5', 'bmw_m6.jpg', 'car, BMW, sedan'),
(119, 10, 19, 'Fitbit Charge 4 Fitness Tracker', 120, 25, 'Advanced fitness tracker with built-in GPS from Fitbit', 'fitbit_charge_4.jpg', 'fitness tracker, Fitbit, GPS'),
(120, 10, 20, 'Lululemon Running Belt', 30, 30, 'Lightweight and adjustable running belt for carrying essentials from Lululemon', 'lululemon_running_belt.jpg', 'running, belt, Lululemon'),
(121, 1, 1, 'Dri-FIT Running Jacket', 80, 25, 'Dri-FIT technology keeps you dry during your run. Lightweight and breathable design for optimal comfort.', 'nike_dri_fit_running_jacket.jpg', 'running, jacket, technology'),
(122, 1, 2, 'Striped Shirt', 35, 20, 'Casual and trendy striped shirt for a stylish look. Perfect for various occasions.', 'zara_striped_shirt.jpg', 'shirt, fashion, trendy'),
(123, 2, 3, 'Series 7 Smartwatch', 400, 15, 'The latest smartwatch with a larger, always-on Retina display. Packed with advanced health and fitness features.', 'apple_watch_series_7.jpg', 'smartwatch, advanced features'),
(124, 2, 4, 'Galaxy Buds Pro', 150, 10, 'Premium wireless earbuds with active noise cancellation for an immersive audio experience.', 'samsung_galaxy_buds_pro.jpg', 'earbuds, audio, premium'),
(125, 2, 5, 'Studio Fix Powder Foundation', 30, 25, 'Studio Fix Powder Foundation for a matte finish and buildable coverage. Long-lasting and suitable for all skin types.', 'mac_studio_fix_powder_foundation.jpg', 'makeup, beauty, foundation'),
(126, 3, 6, 'Vitamin C Serum', 40, 20, 'Vitamin C serum for brightening and evening out the skin tone. Antioxidant-rich formula for a radiant complexion.', 'loreal_vitamin_c_serum.jpg', 'skincare, serum, radiant'),
(127, 4, 7, 'Standing Desk', 200, 18, 'Adjustable standing desk for a flexible and ergonomic workspace. Enhance productivity and reduce sedentary time.', 'ikea_standing_desk.jpg', 'furniture, desk, adjustable'),
(128, 4, 8, 'Stand Mixer', 300, 15, 'Iconic stand mixer for effortless baking and cooking. Durable and versatile kitchen appliance.', 'kitchenaid_stand_mixer.jpg', 'kitchen, appliance, versatile'),
(129, 5, 9, 'Insulated Vest', 90, 22, 'Insulated vest for core warmth during chilly days. Perfect for layering in various outdoor activities.', 'north_face_insulated_vest.jpg', 'outdoor, vest, layering'),
(130, 5, 10, 'Waterproof Boots', 130, 20, 'Waterproof boots for comfortable and dry feet in wet conditions. Ideal for hiking and outdoor adventures.', 'columbia_waterproof_boots.jpg', 'outdoor, boots, waterproof'),
(131, 6, 11, 'Creator Expert Taj Mahal', 300, 15, 'Highly detailed LEGO set of the iconic Taj Mahal. A challenging and rewarding build for enthusiasts.', 'lego_creator_expert_taj_mahal.jpg', 'LEGO, Taj Mahal, detailed'),
(132, 6, 12, 'Nintendo Switch Carrying Case', 20, 18, 'Protective carrying case for Nintendo Switch and accessories. Compact and durable design for on-the-go gaming.', 'nintendo_switch_carrying_case.jpg', 'Nintendo, gaming, accessories'),
(133, 7, 13, 'Wildlife Calendar', 13, 25, 'Stunning wildlife calendar with images capturing the beauty of nature. Perfect for animal lovers and nature enthusiasts.', 'nat_geo_wildlife_calendar.jpg', 'calendar, wildlife, nature'),
(134, 7, 14, 'Echo Show 8', 130, 20, 'Smart display with Alexa for video calls, entertainment, and more. Enhance your smart home experience with voice control.', 'echo_show_9.jpg', 'smart display, Alexa, entertainment'),
(135, 8, 15, 'Pearl Bracelet', 500, 8, 'Elegant pearl bracelet with sterling silver accents. A timeless piece suitable for special occasions and everyday wear.', 'tiffany_pearl_bracelet.jpg', 'jewelry, bracelet, elegant'),
(136, 8, 16, 'Rose Gold Charm Set', 80, 15, 'Set of rose gold charms for a personalized bracelet. Add a touch of charm and elegance to your jewelry collection.', 'pandora_rose_gold_charm_set.jpg', 'jewelry, charms, personalized'),
(137, 9, 17, 'F-150 Lightning Electric Truck', 70000, 5, 'Electric version of the iconic F-150 Lightning truck. A powerful and eco-friendly choice for truck enthusiasts.', 'ford_f150_lightning.jpg', 'car, F-150 Lightning, electric'),
(138, 9, 18, 'M5 Performance Sedan', 110000, 7, 'High-performance sedan - M5. Experience the thrill of driving with advanced performance features.', 'bmw_m5.jpg', 'car, M5, high-performance'),
(139, 10, 19, 'Charge 4 Fitness Tracker', 120, 25, 'Advanced fitness tracker with built-in GPS. Monitor your health and fitness activities with precision.', 'fitbit_charge_40.jpg', 'fitness tracker, GPS, health'),
(140, 10, 20, 'Running Belt', 30, 30, 'Lightweight and adjustable running belt for carrying essentials. Stay hands-free during your runs and workouts.', 'lululemon_running_belt1.jpg', 'running, belt, essentials'),
(141, 1, 1, 'Running Shorts', 30, 30, 'Breathable and moisture-wicking running shorts for optimal comfort during workouts.', 'nike_running_shorts1.jpg', 'running, shorts, breathable'),
(142, 1, 2, 'Printed Maxi Dress', 50, 20, 'Stylish and comfortable printed maxi dress for a chic and trendy look.', 'zara_printed_maxi_dress.jpg', 'dress, fashion, trendy'),
(143, 2, 3, 'iPad Air', 500, 20, 'Powerful and portable iPad Air with a stunning Retina display. Ideal for work, entertainment, and creativity.', 'apple_ipad_air.jpg', 'iPad Air, Apple, tablet'),
(144, 2, 4, 'Wireless Charging Pad', 40, 15, 'Convenient wireless charging pad for Qi-enabled devices. Simplify your charging routine.', 'samsung_wireless_charging_pad.jpg', 'charging pad, Samsung, wireless'),
(145, 3, 5, 'MAC Velvet Teddy Lipstick', 23, 25, 'MAC Velvet Teddy lipstick for a matte and velvety finish. Achieve a classic and sophisticated look.', 'mac_velvet_teddy_lipstick.jpg', 'lipstick, beauty, MAC'),
(146, 3, 6, 'L Oréal+ Hyaluronic Acid Serum', 35, 18, 'Hyaluronic acid serum for intense hydration and plump-looking skin. A must-have in your skincare routine.', 'loreal_hyaluronic_acid_serum.jpg', 'skincare, serum, hyaluronic acid'),
(147, 4, 7, 'Ikea Coffee Table', 90, 20, 'Stylish and functional coffee table for your living room. Elevate your home decor with this versatile piece.', 'ikea_coffee_table.jpg', 'furniture, home, coffee table'),
(148, 4, 8, 'KitchenAid Hand Mixer', 50, 15, 'Hand mixer for effortless mixing and blending in the kitchen. Compact and easy to use for various recipes.', 'kitchenaid_hand_mixer.jpg', 'kitchen, appliance, mixer'),
(149, 5, 9, 'The North Face Fleece Jacket', 80, 22, 'Warm and cozy fleece jacket for cool weather. Perfect for outdoor activities and layering.', 'north_face_fleece_jacket.jpg', 'outdoor, jacket, fleece'),
(150, 5, 10, 'Columbia Hiking Shoes', 110, 18, 'Durable and supportive hiking shoes for outdoor adventures. Tackle various terrains with confidence.', 'columbia_hiking_shoes.jpg', 'outdoor, shoes, hiking'),
(151, 6, 11, 'LEGO Star Wars Millennium Falcon', 300, 12, 'Iconic LEGO Star Wars set featuring the Millennium Falcon. Perfect for fans and collectors.', 'lego_star_wars_millennium_falcon.jpg', 'LEGO, Star Wars, Millennium Falcon'),
(152, 6, 12, 'Nintendo Switch Joy-Con Controller', 70, 20, 'Additional Joy-Con controller for Nintendo Switch. Enhance your multiplayer gaming experience.', 'nintendo_switch_joycon_controller.jpg', 'Nintendo, gaming, controller'),
(153, 7, 13, 'National Geographic History Book', 30, 25, 'Engaging history book from National Geographic. Explore fascinating historical events and stories.', 'nat_geo_history_book.jpg', 'book, history, National Geographic'),
(154, 7, 14, 'Amazon Echo Dot', 40, 30, 'Compact smart speaker with Alexa for voice control and smart home integration. Perfect for any room.', 'echo_dot.jpg', 'smart speaker, Alexa, Amazon'),
(155, 8, 15, 'Tiffany & Co Diamond Stud Earrings', 700, 10, 'Classic diamond stud earrings with a timeless and elegant design. A symbol of sophistication.', 'tiffany_diamond_stud_earrings.jpg', 'jewelry, earrings, Tiffany & Co'),
(156, 8, 16, 'Pandora Silver Bracelet', 60, 15, 'Simple and versatile silver bracelet from Pandora. Create your own charm story with this bracelet.', 'pandora_silver_bracelet.jpg', 'jewelry, bracelet, Pandora'),
(157, 9, 17, 'Ford Mustang GT', 55000, 5, 'Powerful and iconic Ford Mustang GT. Experience the thrill of driving with this classic American muscle car.', 'ford_mustang_gt.jpg', 'car, Ford, Mustang GT'),
(158, 9, 18, 'BMW iX3 Electric SUV', 80000, 7, 'Electric SUV with BMW iX3 technology. Combines sustainability with luxury and performance.', 'bmw_ix3.jpg', 'car, BMW, electric SUV'),
(159, 10, 19, 'Fitbit Inspire 2 Fitness Tracker', 100, 25, 'Slim and stylish fitness tracker with advanced health and fitness features from Fitbit.', 'fitbit_inspire_1.jpg', 'fitness tracker, Fitbit, health'),
(160, 10, 20, 'Lululemon Crossbody Bag', 50, 30, 'Versatile crossbody bag for your essentials. Perfect for workouts, travel, and everyday use.', 'lululemon_crossbody_bag.jpg', 'crossbody bag, essentials, Lululemon'),
(181, 1, 1, 'Compression Leggings', 40, 30, 'High-performance compression leggings for active workouts and sports. Enhance your fitness routine with comfort and support.', 'nike_compression_leggings.jpg', 'leggings, activewear, compression'),
(182, 1, 2, 'Embroidered Denim Jacket', 60, 20, 'Stylish denim jacket with intricate embroidery for a trendy and personalized look. Elevate your casual outfits.', 'zara_embroidered_denim_jacket.jpg', 'denim jacket, fashion, embroidery'),
(183, 2, 3, 'MacBook Pro 14-inch', 1800, 15, 'Powerful and compact MacBook Pro with a 14-inch Retina display. Ideal for professionals and creatives.', 'apple_macbook_pro_14inch.jpg', 'MacBook Pro, Apple, laptop'),
(184, 2, 4, 'Samsung Galaxy Watch 4', 300, 15, 'Feature-packed Galaxy Watch 4 with health monitoring and fitness tracking. Stay connected in style.', 'samsung_galaxy_watch_4.jpg', 'Galaxy Watch 4, Samsung, smartwatch'),
(185, 3, 5, 'MAC Retro Matte Lipstick', 25, 25, 'MAC Retro Matte lipstick for a bold and long-lasting lip color. Achieve a classic and vibrant lip look.', 'mac_retro_matte_lipstick.jpg', 'lipstick, beauty, MAC'),
(186, 3, 6, 'L Oréal+ Retinol Night Cream', 50, 18, 'Retinol-infused night cream for advanced skin renewal. Wake up to smoother and revitalized skin.', 'loreal_retinol_night_cream.jpg', 'skincare, night cream, L Oréal+'),
(187, 4, 7, 'Ikea Bookshelf', 130, 20, 'Modern and versatile bookshelf for organizing and displaying your favorite books and decor items.', 'ikea_bookshelf.jpg', 'furniture, home, bookshelf'),
(188, 4, 8, 'KitchenAid Coffee Maker', 90, 15, 'Stylish coffee maker with programmable features for brewing the perfect cup of coffee. Elevate your morning routine.', 'kitchenaid_coffee_maker.jpg', 'kitchen, appliance, coffee maker'),
(189, 5, 9, 'The North Face Windbreaker', 70, 22, 'Lightweight and wind-resistant jacket for protection in breezy conditions. Ideal for outdoor activities.', 'north_face_windbreaker.jpg', 'outdoor, jacket, windbreaker'),
(190, 5, 10, 'Columbia Trail Running Shoes', 80, 18, 'Trail running shoes with advanced traction for stability on various terrains. Enhance your trail running experience.', 'columbia_trail_running_shoes.jpg', 'outdoor, shoes, trail running'),
(191, 6, 11, 'LEGO Technic Excavator', 130, 12, 'Detailed LEGO Technic set featuring a working excavator. Perfect for engineering enthusiasts.', 'lego_technic_excavator.jpg', 'LEGO, Technic, excavator'),
(192, 6, 12, 'Nintendo Switch Game Console', 300, 20, 'Versatile game console for gaming on the go or at home. Enjoy a wide range of Nintendo games.', 'nintendo_switch_game_console.jpg', 'Nintendo, gaming, console'),
(193, 7, 13, ' Space Exploration Book', 35, 25, 'Explore the wonders of space with this captivating book from National Geographic. Learn about space exploration.', 'nat_geo_space_exploration_book.jpg', 'book, space, National Geographic'),
(194, 7, 14, 'Amazon Kindle Paperwhite', 130, 20, 'High-resolution Kindle Paperwhite for immersive reading experiences. Perfect for avid readers.', 'kindle_paperwhite.jpg', 'e-reader, Kindle, Amazon'),
(195, 8, 15, 'Tiffany & Co Silver Pendant Necklace', 300, 10, 'Elegant silver pendant necklace with a timeless design from Tiffany & Co. Perfect for special occasions.', 'tiffany_silver_pendant_necklace.jpg', 'jewelry, necklace, Tiffany & Co'),
(196, 8, 16, 'Pandora Essence Collection Charm Set', 60, 15, 'Set of charms from the Pandora Essence Collection for a meaningful and personalized charm bracelet.', 'pandora_essence_charm_set.jpg', 'jewelry, charms, Pandora');






-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Christine', 'Randolph', 'randolphc@gmail.com', '25f9e794323b453885f5181f1b624d0b', '8389080183', '2133  Hill Haven Drive', 'Terra Stree'),
(2, 'Will', 'Willams', 'willainswill@gmail.com', '25f9e794323b453885f5181f1b624d0b', '8389080183', '4567  Orphan Road', 'WI'),
(3, 'Demo', 'Name', 'demo@gmail.com', 'password', '9876543210', 'demo ad1', 'ademo ad2'),
(5, 'Steeve', 'Rogers', 'steeve1@gmail.com', '305e4f55ce823e111a46a9d500bcb86c', '9876547770', '573  Pinewood Avenue', 'MN'),
(6, 'Melissa', 'Gilbert', 'gilbert@gmail.com', '305e4f55ce823e111a46a9d500bcb86c', '7845554582', '1711  McKinley Avenue', 'MA');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

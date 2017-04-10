

CREATE TABLE `books` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `categoryId` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `author`, `price`, `path`, `filename`, `des`, `categoryId`) VALUES
('1', 'ketab shomare1', 'man hastam', 3200.00, NULL, 'book6.jpg', 'nadarad', '1'),
('2', 'Programming Java', 'Deitel', 10000.00, 'ندارد', 'book5.jpg', 'ندارد', '2'),
('3', 'my Lemon', 'joe jiki', 234200.00, '-', 'book1.png', NULL, '2'),
('4', 'One Java Prgrammer!', 'Ghaseminya', 2300.00, NULL, 'book2.jpg', NULL, '2'),
('5', 'What is my God?', 'Bodi nabodi', 1200.00, NULL, 'book3.jpg', NULL, '2'),
('6', 'A J2EE Man', 'ghasmeinya', 100.00, NULL, 'book4.png', NULL, '2'),
('72c7186c-af65-45a1-8c01-f0c147e29a64', 'my noo', 'asd', 123.00, '2017-04-10', '9ff5af46-1f65-4225-bd1b-1dd6c78b1ec5.png', 'asd', '2');

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `des` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `name`, `des`) VALUES
('1', 'ketab1', 'salam'),
('2', 'Programming', 'programming');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(200) DEFAULT NULL,
  `actived` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `username`, `password`, `phone`, `address`, `email`, `code`, `actived`) VALUES
('cdec70fe-bb02-4642-a031-738d5c2be192', 'hasan', '123123', '9879879', 'laksjlkadfa', 'mohammad.ghasemy@gmail.com', '000dd706-c30f-46f8-af22-04a9279012b8', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `functions`
--

CREATE TABLE `functions` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `uri` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `functions`
--

INSERT INTO `functions` (`id`, `name`, `uri`) VALUES
('1', 'dashboard', '/manage/index.jsp'),
('2', 'message', '/manage/message.jsp'),
('3', 'new cat', '/manage/addCategory.jsp'),
('4', 'list categ', '/servlet/ManageServlet?op=listCategories'),
('5', 'new book', '/servlet/ManageServlet?op=addBookUI'),
('6', 'list books', '/servlet/ManageServlet?op=listBooks');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` varchar(100) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `ordernum` varchar(100) DEFAULT NULL,
  `bookid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `number`, `price`, `ordernum`, `bookid`) VALUES
('b1e0aa24-2dcf-4739-8511-44d5143dd1ee', 1, 3200.00, '2017040400000000001', '1');

-- --------------------------------------------------------

--
-- Table structure for table `ordernum`
--

CREATE TABLE `ordernum` (
  `prefix` date DEFAULT NULL,
  `num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ordernum`
--

INSERT INTO `ordernum` (`prefix`, `num`) VALUES
('2017-04-04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ordernum` varchar(100) NOT NULL,
  `price` float(8,2) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `customerId` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ordernum`, `price`, `number`, `status`, `customerId`) VALUES
('2017040400000000001', 3200.00, 1, 0, 'cdec70fe-bb02-4642-a031-738d5c2be192');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `des` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `des`) VALUES
('1', 'superadmin', 'دسترسی به همه جا'),
('2', 'admin', 'بخش کتاب');

-- --------------------------------------------------------

--
-- Table structure for table `role_function`
--

CREATE TABLE `role_function` (
  `r_id` varchar(100) NOT NULL DEFAULT '',
  `f_id` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_function`
--

INSERT INTO `role_function` (`r_id`, `f_id`) VALUES
('1', '1'),
('2', '1'),
('1', '2'),
('2', '2'),
('1', '3'),
('1', '4'),
('1', '5'),
('2', '5'),
('1', '6'),
('2', '6');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
('1', 'admin', '123'),
('2', 'aa', '123');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `u_id` varchar(100) NOT NULL DEFAULT '',
  `r_id` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`u_id`, `r_id`) VALUES
('1', '1'),
('2', '2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id_fk` (`categoryId`);

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `photo` (`phone`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `functions`
--
ALTER TABLE `functions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ordernum_fk` (`ordernum`),
  ADD KEY `bookid_fk` (`bookid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ordernum`),
  ADD KEY `customerId_fk` (`customerId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `role_function`
--
ALTER TABLE `role_function`
  ADD PRIMARY KEY (`r_id`,`f_id`),
  ADD KEY `function_id_fk` (`f_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`u_id`,`r_id`),
  ADD KEY `role_id_fk2` (`r_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `category_id_fk` FOREIGN KEY (`categoryId`) REFERENCES `categorys` (`id`);

--
-- Constraints for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `bookid_fk` FOREIGN KEY (`bookid`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `ordernum_fk` FOREIGN KEY (`ordernum`) REFERENCES `orders` (`ordernum`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `customerId_fk` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`);

--
-- Constraints for table `role_function`
--
ALTER TABLE `role_function`
  ADD CONSTRAINT `function_id_fk` FOREIGN KEY (`f_id`) REFERENCES `functions` (`id`),
  ADD CONSTRAINT `role_id_fk1` FOREIGN KEY (`r_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `role_id_fk2` FOREIGN KEY (`r_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

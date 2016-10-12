-- phpMyAdmin SQL Dump
-- version 4.4.15.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 12, 2016 at 01:37 PM
-- Server version: 5.5.47-MariaDB
-- PHP Version: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `slim3-eloquent-skeleton`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(10) unsigned NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `group_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Administrator', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(2, 'Moderator', 'Moderator', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(3, 'User', 'User', '2016-10-08 10:05:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
('20151221231934'),
('20151222115832'),
('20151222221225'),
('20151223205740');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE IF NOT EXISTS `routes` (
  `id` int(10) unsigned NOT NULL,
  `route` varchar(255) NOT NULL,
  `page` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`id`, `route`, `page`, `action`, `address`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'user', 'index', 'App\\Action\\Admin:index', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(2, 'user', 'user', 'index', 'App\\Action\\Admin:users', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(3, 'useredit', 'user', 'edit', 'App\\Action\\Admin:userEdit', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(4, 'userdelete', 'user', 'delete', 'App\\Action\\Admin:userDelete', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(5, 'group', 'group', 'index', 'App\\Action\\Admin:groups', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(6, 'groupedit', 'group', 'edit', 'App\\Action\\Admin:groupEdit', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(7, 'groupdelete', 'group', 'delete', 'App\\Action\\Admin:groupDelete', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(8, 'permission', 'permission', 'index', 'App\\Action\\Admin:permissions', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(9, 'permissionedit', 'permission', 'edit', 'App\\Action\\Admin:permissionEdit', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(10, 'permissiondelete', 'permission', 'delete', 'App\\Action\\Admin:permissionDelete', '2016-10-08 10:05:38', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `group_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@slim.dev', '$2y$10$ElXh/aFKLN1Vf4t2G0DTnupWcEpS2/2OP8fIsQXjHp7KXE3bjcUke', 1, 1, '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(2, 'moderator', 'moderator@slim.dev', '$2y$10$ElXh/aFKLN1Vf4t2G0DTnupWcEpS2/2OP8fIsQXjHp7KXE3bjcUke', 2, 1, '2016-10-08 10:14:46', '0000-00-00 00:00:00'),
(3, 'user', 'user@slim.dev', '$2y$10$ElXh/aFKLN1Vf4t2G0DTnupWcEpS2/2OP8fIsQXjHp7KXE3bjcUke', 3, 1, '2016-10-08 10:14:49', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users_permission`
--

CREATE TABLE IF NOT EXISTS `users_permission` (
  `id` int(10) unsigned NOT NULL,
  `group_id` int(11) NOT NULL,
  `page` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_permission`
--

INSERT INTO `users_permission` (`id`, `group_id`, `page`, `action`, `created_at`, `updated_at`) VALUES
(1, 1, 'user', 'index', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(2, 1, 'user', 'edit', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(3, 1, 'user', 'delete', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(4, 1, 'group', 'index', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(5, 1, 'group', 'edit', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(6, 1, 'group', 'delete', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(7, 1, 'permission', 'index', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(8, 1, 'permission', 'edit', '2016-10-08 10:05:38', '0000-00-00 00:00:00'),
(9, 1, 'permission', 'delete', '2016-10-08 10:05:38', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users_permission`
--
ALTER TABLE `users_permission`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users_permission`
--
ALTER TABLE `users_permission`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2016 at 01:23 PM
-- Server version: 5.7.10
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hgn`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(31) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) UNSIGNED NOT NULL,
  `taskId` int(11) UNSIGNED NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `dateCreated` bigint(20) DEFAULT NULL,
  `comment` text,
  `reference` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `communities`
--

CREATE TABLE `communities` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ownerId` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `communities`
--

INSERT INTO `communities` (`id`, `title`, `description`, `ownerId`) VALUES
(1, 'One Community', 'Use for all OC related work', 1);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creatorId` int(11) UNSIGNED DEFAULT NULL,
  `ownerId` int(11) UNSIGNED DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `external_links`
--

CREATE TABLE `external_links` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `taskId` int(11) UNSIGNED NOT NULL,
  `creatorId` int(11) UNSIGNED DEFAULT '0',
  `linkType` varchar(100) NOT NULL,
  `dependency` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `dateCreated` int(11) NOT NULL,
  `dateModified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `taskId` int(11) UNSIGNED NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `image` tinyint(1) DEFAULT '0',
  `date` bigint(20) DEFAULT NULL,
  `size` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lookups`
--

CREATE TABLE `lookups` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `lookupType` tinyint(2) UNSIGNED NOT NULL,
  `lookupTable` varchar(64) NOT NULL,
  `valueColumn` varchar(64) NOT NULL,
  `titleColumn` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lookups`
--

INSERT INTO `lookups` (`id`, `title`, `description`, `lookupType`, `lookupTable`, `valueColumn`, `titleColumn`) VALUES
(1, 'Lookup Type', 'Lookup Types Lookups', 1, '', '', ''),
(2, 'Lookup Table', 'Lookup table', 2, 'system_tables', 'id', 'title'),
(3, 'Value Column', 'Lookup value column', 2, '', '', ''),
(4, 'Title Column', 'Lookup title column', 2, '', '', ''),
(5, 'User Role', 'User Role', 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `lookup_values`
--

CREATE TABLE `lookup_values` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `lookupId` int(11) UNSIGNED NOT NULL,
  `value` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lookup_values`
--

INSERT INTO `lookup_values` (`id`, `title`, `description`, `lookupId`, `value`) VALUES
(1, 'Lookup Table', 'Lookup values in the lookup table', 1, 1),
(2, 'System Table', 'Lookup values in system table', 1, 2),
(3, 'User ', 'User Role ', 5, 1),
(4, 'Manager ', 'Manager Role ', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) UNSIGNED NOT NULL,
  `projectId` int(11) UNSIGNED NOT NULL,
  `notificationType` varchar(50) NOT NULL,
  `message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `communityId` int(11) UNSIGNED NOT NULL,
  `ownerId` int(11) UNSIGNED DEFAULT '0',
  `type` tinyint(2) DEFAULT NULL,
  `priority` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT NULL,
  `startDateEstimate` date NOT NULL,
  `startDateActual` date NOT NULL,
  `endDateEstimate` date NOT NULL,
  `endDateActual` date NOT NULL,
  `timeRequiredEstimate` decimal(8,2) DEFAULT NULL,
  `timeRequiredActual` decimal(8,2) DEFAULT NULL,
  `percentComplete` decimal(6,2) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `description`, `communityId`, `ownerId`, `type`, `priority`, `status`, `startDateEstimate`, `startDateActual`, `endDateEstimate`, `endDateActual`, `timeRequiredEstimate`, `timeRequiredActual`, `percentComplete`, `active`) VALUES
(1, 'Project1', 'Project 1', 1, 1, 1, 1, 1, '2016-04-01', '2016-04-01', '2016-04-01', '2016-04-01', '10.00', '15.00', '50.00', 1),
(2, 'Project2', 'Project 2', 1, 1, 1, 1, 1, '2016-04-01', '2016-04-01', '2016-04-01', '2016-04-01', '10.00', '15.00', '50.00', 1),
(3, 'Project3', 'Project 3', 1, 1, 1, 1, 1, '2016-04-01', '2016-04-01', '2016-04-01', '2016-04-01', '10.00', '15.00', '50.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_acl`
--

CREATE TABLE `project_acl` (
  `projectId` int(11) UNSIGNED NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL,
  `access` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_to_files`
--

CREATE TABLE `project_to_files` (
  `id` int(11) UNSIGNED NOT NULL,
  `projectId` int(11) UNSIGNED NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `image` tinyint(1) DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `dateCreated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_to_team`
--

CREATE TABLE `project_to_team` (
  `projectId` int(11) UNSIGNED NOT NULL,
  `teamId` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project_to_user`
--

CREATE TABLE `project_to_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL,
  `role` tinyint(2) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `system_tables`
--

CREATE TABLE `system_tables` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_tables`
--

INSERT INTO `system_tables` (`id`, `title`, `description`) VALUES
(1, 'users', 'User Table'),
(2, 'lookups', 'Lookup Table'),
(3, 'lookup_values', 'Lookup Values Table');

-- --------------------------------------------------------

--
-- Table structure for table `system_table_columns`
--

CREATE TABLE `system_table_columns` (
  `id` int(11) UNSIGNED NOT NULL,
  `systemTableId` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `position` tinyint(2) UNSIGNED NOT NULL,
  `label` varchar(30) NOT NULL,
  `keyType` tinyint(1) NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `lookupId` tinyint(4) UNSIGNED NOT NULL,
  `dataType` tinyint(2) NOT NULL,
  `defaultValue` varchar(255) DEFAULT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_table_columns`
--

INSERT INTO `system_table_columns` (`id`, `systemTableId`, `title`, `position`, `label`, `keyType`, `visible`, `lookupId`, `dataType`, `defaultValue`, `type`) VALUES
(1, 1, 'id', 1, 'ID', 1, 0, 0, 1, '', 'int(11)'),
(2, 1, 'title', 2, 'Title', 0, 1, 0, 5, '', 'varchar(30)'),
(3, 1, 'description', 3, 'Description', 0, 1, 0, 5, '', 'varchar(255)'),
(4, 1, 'userName', 4, 'User Name', 0, 1, 0, 5, '', 'varchar(16)'),
(5, 1, 'password', 5, 'Password', 0, 1, 0, 5, '', 'varchar(16)'),
(6, 1, 'type', 6, 'Type', 0, 1, 0, 1, '3', 'tinyint(2)'),
(7, 1, 'firstName', 7, 'First Name', 0, 1, 0, 5, '', 'varchar(30)'),
(8, 1, 'lastName', 8, 'Last Name', 0, 1, 0, 5, '', 'varchar(30)'),
(9, 1, 'email', 9, 'Email', 0, 1, 0, 5, '', 'varchar(30)'),
(10, 1, 'phoneHome', 10, 'Home Phone', 0, 1, 0, 4, '', 'varchar(15)'),
(11, 1, 'phoneMobile', 11, 'Mobile Phone', 0, 1, 0, 4, '', 'varchar(15)'),
(12, 1, 'language', 12, 'Language', 0, 1, 0, 1, '1', 'tinyint(1)'),
(13, 1, 'timeZone', 13, 'Time Zone', 0, 1, 0, 1, '1', 'tinyint(1)'),
(14, 1, 'role', 14, 'Role', 0, 1, 5, 1, '1', 'tinyint(1)'),
(15, 1, 'disableNotifications', 15, 'Disable Notifications', 0, 1, 0, 7, '0', 'tinyint(1)'),
(16, 1, 'disableLogin', 16, 'Disable Login', 0, 1, 0, 7, '0', 'tinyint(1)'),
(17, 1, 'admin', 17, 'Admin', 0, 1, 0, 7, '0', 'tinyint(1)'),
(18, 1, 'active', 18, 'Active', 0, 1, 0, 7, '1', 'tinyint(1)'),
(19, 1, 'photoProfile', 19, 'Large Photo Path', 0, 1, 0, 5, '', 'varchar(64)'),
(20, 1, 'photoThumb', 20, 'Thumb Photo Path', 0, 1, 0, 5, '', 'varchar(64)'),
(21, 1, 'avatar', 21, 'Avatar Path', 0, 1, 0, 5, '', 'varchar(64)'),
(22, 2, 'id', 1, 'ID', 1, 0, 0, 1, '', 'int(11)'),
(23, 2, 'title', 2, 'Title', 0, 1, 0, 1, '', 'varchar(30)'),
(24, 2, 'description', 3, 'Description', 0, 1, 0, 1, '', 'varchar(255)'),
(25, 2, 'lookupType', 4, 'Lookup Type', 0, 1, 1, 1, '', 'tinyint(2)'),
(26, 2, 'lookupTable', 5, 'Lookup Table', 0, 1, 2, 1, '', 'varchar(64)'),
(27, 2, 'valueColumn', 6, 'Value Column', 0, 1, 3, 1, '', 'varchar(64)'),
(28, 2, 'Title Column', 7, 'Title Column', 0, 1, 4, 1, '', 'varchar(64)'),
(29, 3, 'id', 1, 'ID', 1, 0, 0, 1, '', 'int(11)'),
(30, 3, 'title', 2, 'Title', 0, 1, 0, 1, '', 'varchar(30)'),
(31, 3, 'description', 3, 'Description', 0, 1, 0, 1, '', 'varchar(255)'),
(32, 3, 'lookupId', 4, 'Lookup Id', 3, 1, 0, 1, '', 'int(11)'),
(33, 3, 'characterValue', 5, 'Character Value', 0, 1, 0, 1, '', 'varchar(255)'),
(34, 3, 'integerValue', 6, 'Integer Value', 0, 1, 0, 1, '', 'int(10)'),
(35, 3, 'decimalValue', 7, 'Decimal Value', 0, 1, 0, 1, '', 'decimal(12,2)'),
(36, 3, 'booleanValue', 8, 'Boolean Value', 0, 1, 0, 1, '', 'tinyint(1)');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `projectId` int(11) UNSIGNED NOT NULL,
  `creatorId` int(11) UNSIGNED DEFAULT '0',
  `ownerId` int(11) UNSIGNED DEFAULT '0',
  `parentId` int(11) UNSIGNED NOT NULL,
  `position` tinyint(3) UNSIGNED DEFAULT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `categoryId` int(11) UNSIGNED DEFAULT NULL,
  `priority` int(11) UNSIGNED DEFAULT '0',
  `startDateEstimate` date DEFAULT NULL,
  `startDateActual` date DEFAULT NULL,
  `endDateEstimate` date DEFAULT NULL,
  `endDateActual` date DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `status` tinyint(2) UNSIGNED NOT NULL,
  `active` tinyint(4) UNSIGNED DEFAULT '1',
  `timeRequiredEstimate` decimal(7,2) DEFAULT '0.00',
  `timeRequiredActual` decimal(7,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `projectId`, `creatorId`, `ownerId`, `parentId`, `position`, `type`, `categoryId`, `priority`, `startDateEstimate`, `startDateActual`, `endDateEstimate`, `endDateActual`, `dueDate`, `status`, `active`, `timeRequiredEstimate`, `timeRequiredActual`) VALUES
(1, 'TaskHeader1', 'TH1', 1, 1, 1, 0, 1, 1, 1, 1, '2016-01-01', '2016-01-01', '2016-01-10', '2016-01-10', '2016-01-10', 1, 0, '10.00', '10.00'),
(2, 'SubTask1', 'ST1', 1, 1, 1, 1, 1, 1, 1, 1, '2016-01-01', '2016-01-01', '2016-01-10', '2016-01-10', '2016-01-10', 1, 0, '10.00', '10.00'),
(3, 'SubTask2', 'ST2', 1, 1, 1, 1, 2, 1, 1, 1, '2016-01-01', '2016-01-01', '2016-01-10', '2016-01-10', '2016-01-10', 1, 0, '10.00', '10.00'),
(4, 'TaskHeader2', 'TH2', 1, 1, 1, 0, 2, 1, 1, 1, '2016-01-01', '2016-01-01', '2016-01-10', '2016-01-10', '2016-01-10', 1, 0, '10.00', '10.00'),
(5, 'SubTask3', 'ST3', 1, 1, 1, 4, 1, 1, 1, 1, '2016-01-01', '2016-01-01', '2016-01-10', '2016-01-10', '2016-01-10', 1, 0, '10.00', '10.00'),
(6, 'SubTask4', 'ST4', 1, 1, 1, 4, 2, 1, 1, 1, '2016-01-01', '2016-01-01', '2016-01-10', '2016-01-10', '2016-01-10', 1, 0, '10.00', '10.00');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `team_to_user`
--

CREATE TABLE `team_to_user` (
  `userId` int(11) UNSIGNED NOT NULL,
  `teamId` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `texts`
--

CREATE TABLE `texts` (
  `id` int(11) UNSIGNED NOT NULL,
  `language` tinyint(3) UNSIGNED DEFAULT NULL,
  `textShort` varchar(32) DEFAULT NULL,
  `textMedium` varchar(64) DEFAULT NULL,
  `textLong` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timesheets`
--

CREATE TABLE `timesheets` (
  `id` int(11) UNSIGNED NOT NULL,
  `subtaskId` int(11) UNSIGNED NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL,
  `startDate` date DEFAULT NULL,
  `hoursSpent` decimal(6,2) DEFAULT '0.00',
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `userName` varchar(16) NOT NULL,
  `password` varchar(16) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phoneHome` varchar(15) DEFAULT NULL,
  `phoneMobile` varchar(15) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `timeZone` varchar(20) DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT '0',
  `disableNotifications` tinyint(1) DEFAULT '0',
  `disableLogin` tinyint(1) DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `photoProfile` varchar(64) DEFAULT NULL,
  `photoThumb` varchar(64) DEFAULT NULL,
  `avatar` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `title`, `description`, `userName`, `password`, `type`, `firstName`, `lastName`, `email`, `phoneHome`, `phoneMobile`, `language`, `timeZone`, `role`, `disableNotifications`, `disableLogin`, `admin`, `active`, `photoProfile`, `photoThumb`, `avatar`) VALUES
(1, 'Joe Admin', 'Admin user', 'admin', 'admin', 1, 'Admin', 'User', 'admin@oc.org', '415555-1212', '415555-1213', '1', '1', 1, 1, 1, 1, 1, '1_profile.jpg', '1_thumb.jpg', 'halloween-1.jpg'),
(2, 'Fred User', 'Std User', 'user', 'user', 2, 'User', 'User', 'user@oc.org', '415555-1212', '415555-1213', '1', '1', 1, 0, 1, 0, 1, '2_profile.jpg', '2_thumb.jpg', 'halloween-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `userId` int(11) UNSIGNED DEFAULT NULL,
  `valueType` tinyint(2) UNSIGNED DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `comments_reference_idx` (`reference`),
  ADD KEY `comments_task_idx` (`taskId`);

--
-- Indexes for table `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`);

--
-- Indexes for table `external_links`
--
ALTER TABLE `external_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`),
  ADD KEY `task_id` (`taskId`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`),
  ADD KEY `files_task_idx` (`taskId`);

--
-- Indexes for table `lookups`
--
ALTER TABLE `lookups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lookup_values`
--
ALTER TABLE `lookup_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_id` (`projectId`,`notificationType`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`),
  ADD KEY `fk_projects_communities1_idx` (`communityId`);

--
-- Indexes for table `project_acl`
--
ALTER TABLE `project_acl`
  ADD PRIMARY KEY (`userId`,`projectId`),
  ADD KEY `fk_project_acl_projects1_idx` (`projectId`);

--
-- Indexes for table `project_to_files`
--
ALTER TABLE `project_to_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`projectId`);

--
-- Indexes for table `project_to_team`
--
ALTER TABLE `project_to_team`
  ADD PRIMARY KEY (`projectId`,`teamId`),
  ADD UNIQUE KEY `group_id` (`teamId`,`projectId`),
  ADD KEY `project_id` (`projectId`);

--
-- Indexes for table `project_to_user`
--
ALTER TABLE `project_to_user`
  ADD PRIMARY KEY (`id`,`userId`),
  ADD UNIQUE KEY `idx_project_user` (`id`,`userId`),
  ADD KEY `user_id` (`userId`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_tables`
--
ALTER TABLE `system_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_table_columns`
--
ALTER TABLE `system_table_columns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_task_active` (`active`),
  ADD KEY `fk_tasks_projects1_idx` (`projectId`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_UNIQUE` (`title`);

--
-- Indexes for table `team_to_user`
--
ALTER TABLE `team_to_user`
  ADD PRIMARY KEY (`userId`,`teamId`),
  ADD UNIQUE KEY `group_id` (`userId`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `fk_team_to_user_teams1_idx` (`teamId`);

--
-- Indexes for table `texts`
--
ALTER TABLE `texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timesheets`
--
ALTER TABLE `timesheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`userId`),
  ADD KEY `fk_timesheets_subtasks1_idx` (`subtaskId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_idx` (`title`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_preferences_users1_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `communities`
--
ALTER TABLE `communities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `external_links`
--
ALTER TABLE `external_links`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lookups`
--
ALTER TABLE `lookups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `lookup_values`
--
ALTER TABLE `lookup_values`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `project_to_files`
--
ALTER TABLE `project_to_files`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `system_tables`
--
ALTER TABLE `system_tables`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `system_table_columns`
--
ALTER TABLE `system_table_columns`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timesheets`
--
ALTER TABLE `timesheets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `fk_projects_communities1` FOREIGN KEY (`communityId`) REFERENCES `communities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_acl`
--
ALTER TABLE `project_acl`
  ADD CONSTRAINT `fk_project_acl_projects1` FOREIGN KEY (`projectId`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_project_acl_users1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_to_team`
--
ALTER TABLE `project_to_team`
  ADD CONSTRAINT `fk_project_to_team_teams1` FOREIGN KEY (`teamId`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_project_to_teams_projects1` FOREIGN KEY (`projectId`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_to_user`
--
ALTER TABLE `project_to_user`
  ADD CONSTRAINT `fk_project_to_users_projects` FOREIGN KEY (`id`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_project_to_users_users1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `fk_tasks_projects1` FOREIGN KEY (`projectId`) REFERENCES `projects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `team_to_user`
--
ALTER TABLE `team_to_user`
  ADD CONSTRAINT `fk_team_to_user_teams1` FOREIGN KEY (`teamId`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_team_to_user_users1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `timesheets`
--
ALTER TABLE `timesheets`
  ADD CONSTRAINT `fk_timesheets_subtasks1` FOREIGN KEY (`subtaskId`) REFERENCES `subtasks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_timesheets_users1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD CONSTRAINT `fk_user_preferences_users1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
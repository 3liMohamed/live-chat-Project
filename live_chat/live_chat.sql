-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2020 at 05:43 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `live_chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `chat_message_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_message`
--

INSERT INTO `chat_message` (`chat_message_id`, `to_user_id`, `from_user_id`, `chat_message`, `timestamp`, `status`) VALUES
(113, 5, 4, 'asd', '2020-04-10 04:19:03', 2),
(116, 5, 4, 'asdasdasd😅🙃🤪🤪😉', '2020-04-10 04:43:10', 2),
(117, 5, 4, 'asdasdasdawdwdqwdqwxdxasc🤪🙂🙂😆😌😇', '2020-04-10 04:44:57', 2),
(118, 5, 4, 'asd', '2020-04-30 10:02:38', 0),
(119, 6, 4, 'asd', '2020-05-05 20:39:49', 1),
(120, 6, 4, 'asd', '2020-05-05 20:39:52', 1),
(121, 6, 4, 'asd', '2020-05-05 20:39:53', 1),
(122, 6, 4, 'asd', '2020-05-05 20:39:54', 1),
(123, 6, 4, 'asd', '2020-05-05 20:39:54', 1),
(124, 5, 4, 'asd', '2020-05-08 14:49:27', 0),
(125, 4, 5, 'حبيبي عامل ايه', '2020-05-08 14:49:43', 0),
(126, 5, 4, 'تمام انت 😃', '2020-05-08 14:58:16', 0),
(127, 4, 5, 'الحمد الله☺', '2020-05-08 14:58:48', 0),
(128, 5, 4, 'و ايه اخبار الدنيا😊', '2020-05-08 14:59:34', 0),
(129, 4, 5, 'شسي', '2020-05-08 14:59:46', 0),
(130, 4, 5, 'السلام عليكم😉', '2020-05-08 15:07:54', 0),
(131, 5, 4, 'وعليكم السلام😍', '2020-05-08 15:08:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`user_id`, `username`, `password`) VALUES
(1, 'johnsmith', '$2y$10$4REfvTZpxLgkAR/lKG9QiOkSdahOYIR3MeoGJAyiWmRkEFfjH3396'),
(2, 'peterParker', '$2y$10$4REfvTZpxLgkAR/lKG9QiOkSdahOYIR3MeoGJAyiWmRkEFfjH3396'),
(3, 'davidMoore', '$2y$10$4REfvTZpxLgkAR/lKG9QiOkSdahOYIR3MeoGJAyiWmRkEFfjH3396'),
(4, 'Ali', 'Ali'),
(5, 'mohamed', 'mohamed'),
(6, 'eyad', 'eyad');

-- --------------------------------------------------------

--
-- Table structure for table `login_details`
--

CREATE TABLE `login_details` (
  `login_details_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_type` enum('no','yes') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_details`
--

INSERT INTO `login_details` (`login_details_id`, `user_id`, `last_activity`, `is_type`) VALUES
(1, 4, '2020-04-06 19:39:43', 'no'),
(2, 4, '2020-04-06 19:42:37', 'no'),
(3, 4, '2020-04-06 19:43:04', 'no'),
(4, 4, '2020-04-06 19:43:20', 'no'),
(5, 4, '2020-04-06 19:43:42', 'no'),
(6, 4, '2020-04-06 19:44:12', 'no'),
(7, 4, '2020-04-06 19:44:51', 'no'),
(8, 4, '2020-04-06 19:46:21', 'no'),
(9, 4, '2020-04-06 19:46:49', 'no'),
(10, 4, '2020-04-06 19:48:55', 'no'),
(11, 4, '2020-04-06 19:50:38', 'no'),
(12, 4, '2020-04-06 19:51:41', 'no'),
(13, 4, '2020-04-06 19:52:33', 'no'),
(14, 4, '2020-04-06 19:54:07', 'no'),
(15, 4, '2020-04-06 19:54:11', 'no'),
(16, 4, '2020-04-06 19:54:36', 'no'),
(17, 4, '2020-04-06 19:54:48', 'no'),
(18, 4, '2020-04-06 19:55:21', 'no'),
(19, 4, '2020-04-06 19:55:26', 'no'),
(20, 4, '2020-04-06 19:56:20', 'no'),
(21, 4, '2020-04-06 20:00:10', 'no'),
(22, 4, '2020-04-06 20:42:37', 'no'),
(23, 5, '2020-04-06 21:04:39', 'no'),
(24, 5, '2020-04-07 03:48:28', 'no'),
(25, 4, '2020-04-07 15:03:22', 'no'),
(26, 5, '2020-04-07 04:43:12', 'no'),
(27, 5, '2020-04-07 15:03:21', 'no'),
(28, 4, '2020-04-07 21:42:19', 'no'),
(29, 5, '2020-04-07 15:11:50', 'no'),
(30, 4, '2020-04-07 21:48:13', 'no'),
(31, 4, '2020-04-07 21:48:53', 'no'),
(32, 4, '2020-04-07 21:51:41', 'no'),
(33, 4, '2020-04-07 21:54:36', 'no'),
(34, 4, '2020-04-07 21:59:00', 'no'),
(35, 4, '2020-04-07 21:59:35', 'no'),
(36, 4, '2020-04-07 21:59:37', 'no'),
(37, 4, '2020-04-07 22:00:08', 'no'),
(38, 4, '2020-04-07 22:00:14', 'no'),
(39, 4, '2020-04-07 22:09:36', 'no'),
(40, 4, '2020-04-10 04:52:30', 'no'),
(41, 4, '2020-04-30 13:58:11', 'no'),
(42, 4, '2020-05-05 20:35:28', 'no'),
(43, 6, '2020-05-05 20:38:14', 'no'),
(44, 4, '2020-05-05 20:40:03', 'no'),
(45, 6, '2020-05-05 20:38:55', 'no'),
(46, 6, '2020-05-05 20:39:29', 'no'),
(47, 4, '2020-05-08 14:44:46', 'no'),
(48, 4, '2020-05-08 14:45:20', 'no'),
(49, 5, '2020-05-08 15:43:45', 'no'),
(50, 4, '2020-05-08 15:43:44', 'no'),
(51, 4, '2020-05-08 14:58:59', 'no');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `login_details`
--
ALTER TABLE `login_details`
  ADD PRIMARY KEY (`login_details_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login_details`
--
ALTER TABLE `login_details`
  MODIFY `login_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2023 at 04:07 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socialgram`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `body`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(2, 'tessss', 1, 6, '2023-06-09 18:03:12', '2023-06-09 18:03:12'),
(3, 'tes editt', 1, 6, '2023-06-09 18:15:17', '2023-06-09 19:08:24'),
(4, 'keren bang', 7, 8, '2023-06-11 07:58:24', '2023-06-11 07:58:24'),
(7, 'halo bang', 1, 7, '2023-06-13 06:54:25', '2023-06-13 06:54:25'),
(8, 'keren bang', 1, 7, '2023-06-13 18:17:24', '2023-06-13 18:17:24'),
(9, 'idola kuuu', 8, 7, '2023-06-13 18:24:23', '2023-06-13 18:24:23'),
(11, 'mantapp', 1, 8, '2023-06-13 18:36:00', '2023-06-13 18:36:00'),
(14, 'aaaaa', 8, 19, '2023-06-14 08:36:36', '2023-06-14 08:36:36'),
(15, 'hoki aja itu', 8, 8, '2023-06-14 08:37:18', '2023-06-14 08:37:18'),
(17, 'DBD SELESAIIII', 8, 23, '2023-06-15 08:34:32', '2023-06-15 08:34:32'),
(18, 'dad', 1, 23, '2023-12-06 18:08:05', '2023-12-06 18:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `following_id` bigint(20) UNSIGNED NOT NULL,
  `follower_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`id`, `following_id`, `follower_id`, `created_at`, `updated_at`) VALUES
(30, 5, 1, NULL, NULL),
(31, 1, 5, NULL, NULL),
(32, 1, 6, NULL, NULL),
(33, 5, 6, NULL, NULL),
(34, 6, 1, NULL, NULL),
(35, 1, 7, NULL, NULL),
(36, 5, 7, NULL, NULL),
(37, 6, 7, NULL, NULL),
(39, 5, 8, NULL, NULL),
(40, 6, 8, NULL, NULL),
(41, 8, 1, NULL, NULL),
(42, 1, 8, NULL, NULL),
(43, 1, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `likeable_id` bigint(20) UNSIGNED NOT NULL,
  `likeable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `likeable_id`, `likeable_type`, `created_at`, `updated_at`) VALUES
(3, 1, 12, 'App\\Models\\Comment', '2023-06-14 04:56:55', '2023-06-14 04:56:55'),
(6, 1, 7, 'App\\Models\\post', '2023-06-14 04:57:01', '2023-06-14 04:57:01'),
(9, 1, 6, 'App\\Models\\post', '2023-06-14 07:41:43', '2023-06-14 07:41:43'),
(10, 1, 17, 'App\\Models\\post', '2023-06-14 08:09:30', '2023-06-14 08:09:30'),
(11, 8, 19, 'App\\Models\\post', '2023-06-14 08:35:40', '2023-06-14 08:35:40'),
(12, 8, 14, 'App\\Models\\Comment', '2023-06-14 08:36:39', '2023-06-14 08:36:39'),
(13, 8, 7, 'App\\Models\\post', '2023-06-14 08:37:05', '2023-06-14 08:37:05'),
(14, 8, 11, 'App\\Models\\Comment', '2023-06-14 08:37:23', '2023-06-14 08:37:23'),
(17, 8, 7, 'App\\Models\\Comment', '2023-06-14 09:02:14', '2023-06-14 09:02:14'),
(18, 8, 21, 'App\\Models\\post', '2023-06-14 09:02:47', '2023-06-14 09:02:47'),
(19, 8, 20, 'App\\Models\\post', '2023-06-14 09:02:48', '2023-06-14 09:02:48'),
(22, 1, 21, 'App\\Models\\post', '2023-06-14 18:35:07', '2023-06-14 18:35:07'),
(23, 1, 20, 'App\\Models\\post', '2023-06-14 18:35:27', '2023-06-14 18:35:27'),
(24, 1, 19, 'App\\Models\\post', '2023-06-14 18:35:28', '2023-06-14 18:35:28'),
(25, 1, 22, 'App\\Models\\post', '2023-06-14 18:41:57', '2023-06-14 18:41:57'),
(26, 1, 8, 'App\\Models\\Comment', '2023-06-14 18:49:36', '2023-06-14 18:49:36'),
(34, 1, 8, 'App\\Models\\post', '2023-06-15 06:13:36', '2023-06-15 06:13:36'),
(35, 1, 15, 'App\\Models\\Comment', '2023-06-15 06:32:49', '2023-06-15 06:32:49'),
(36, 1, 11, 'App\\Models\\Comment', '2023-06-15 06:32:50', '2023-06-15 06:32:50'),
(37, 1, 4, 'App\\Models\\Comment', '2023-06-15 06:32:51', '2023-06-15 06:32:51'),
(38, 8, 23, 'App\\Models\\post', '2023-06-15 08:34:18', '2023-06-15 08:34:18'),
(39, 8, 17, 'App\\Models\\Comment', '2023-06-15 08:34:36', '2023-06-15 08:34:36'),
(40, 1, 23, 'App\\Models\\post', '2023-11-27 12:51:23', '2023-11-27 12:51:23'),
(41, 10, 24, 'App\\Models\\post', '2023-12-09 06:20:18', '2023-12-09 06:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_06_09_071627_create_posts_table', 2),
(7, '2023_06_09_115139_create_follows_table', 3),
(9, '2023_06_09_201501_create_comments_table', 5),
(21, '2023_06_09_153137_create_likes_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `image`, `caption`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 'zydd-1686307791.jpg', 'halo gais', 5, '2023-06-09 03:49:51', '2023-06-09 03:49:51'),
(7, 'maguire12-1686338449.jpg', 'Mikirr dongg', 6, '2023-06-09 12:20:49', '2023-06-09 12:20:49'),
(8, 'amlullngrhh-1686483104.png', 'BTWWW CITYY TREBLE WINNER\r\nCUAKKK', 1, '2023-06-11 04:31:44', '2023-06-11 04:31:44'),
(9, 'tri-1686496089.png', 'sayangkuu', 7, '2023-06-11 08:08:10', '2023-06-11 08:08:10'),
(19, 'jiskyy-1686756938.png', 'Daijin, kawaii', 8, '2023-06-14 08:35:38', '2023-06-14 08:35:52'),
(20, 'jiskyy-1686757139.png', 'Sebagus itu kah laravel?', 8, '2023-06-14 08:38:59', '2023-06-14 08:38:59'),
(21, 'jiskyy-1686757206.png', 'Laravel vs Symfony, bagusan mana yaa?', 8, '2023-06-14 08:40:06', '2023-06-14 08:40:06'),
(22, 'amlullngrhh-1686792969.png', 'Mana Bisa?', 1, '2023-06-14 18:36:09', '2023-06-14 18:36:09'),
(23, 'amlullngrhh-1686803802.png', 'Turu dulu gasii', 1, '2023-06-14 21:36:42', '2023-06-14 21:36:42'),
(24, 'vivancentrino-1702127981.png', 'MU menang lagii guysss', 10, '2023-12-09 06:19:41', '2023-12-09 06:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `bio`, `avatar`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'amlullngrhh', 'amalul anugrah amin', 'apakek', 'amlullngrhh-1686794353.png', 'amalul.anugrah@social.com', NULL, '$2y$10$opayTH5TF73gvxgmhmW1xOywGGEbSiLCgqXYd0QI27CsFGlLzvyKu', 'Hgx3zfqFEHvZzfAYs8w9C92JwRcNXJBrr695OorsRScwqzufPIAfcTq5ITtF', '2023-06-08 10:53:31', '2023-06-14 18:59:13'),
(2, 'amal', NULL, NULL, NULL, 'amalul@talksapce.com', NULL, '$2y$10$ZGeg0upj8wQYbo7Fj0YV6.HjyXQw4WWSsEwPr4XdlEF7Xi0U9B9Uy', NULL, '2023-06-08 18:40:05', '2023-06-08 18:40:05'),
(5, 'zydd', 'Fadel Muhammad', 'inpo maseh', 'zydd-1686338238.png', 'padel@social.com', NULL, '$2y$10$M5CSsL8Idy3q/9Lm/NWC7.q2n84LemrgWrBR45nBc1TtXT9j6klJW', NULL, '2023-06-08 21:43:44', '2023-06-09 12:17:18'),
(6, 'maguire12', NULL, NULL, NULL, 'meguire12@social.com', NULL, '$2y$10$vmQ1LnCDgTJoMOM2mOiya.iVu9BWA8FSaZzbNg/Bb3YZwmhtQqE02', NULL, '2023-06-09 12:20:17', '2023-06-09 12:20:17'),
(7, 'tri', 'Trimulia', 'coblos saya', 'tri-1686496168.png', 'tri@gamil.com', NULL, '$2y$10$ZiFr5KCdBNdmEDv0JkTFpemJMPNr3IZ4n.4VoiudR2DISzzsPgIle', NULL, '2023-06-11 07:57:24', '2023-06-11 08:09:28'),
(8, 'jiskyy', 'Ajiskyrine', 'P, balap. Aku bocil Reality Club.', 'jiskyy-1686756742.png', 'aji@social.com', NULL, '$2y$10$s6YpX9AjjSaXPOGLqYt2XuW9orAXSr0pkfifMPdWWX3Tph/bMV276', NULL, '2023-06-13 18:22:51', '2023-06-14 08:40:33'),
(9, 'maluull', NULL, NULL, NULL, 'amalul.anugrah29@gmail.com', NULL, '$2y$10$037wsakaWtHfc3BGCGUj.us4wP3So8gH0F8E2k1VqOn7gz/oopEPK', NULL, '2023-11-27 12:52:15', '2023-11-27 12:52:15'),
(10, 'vivancentrino', 'vivan centrino', 'Welcome Guys', 'vivancentrino-1702127874.png', 'vivan@social.com', NULL, '$2y$10$38HZ6S6rjYlW1qVOi34CPe09caUw8d5PdeyJ2BYuoP3ANXMvZRitK', NULL, '2023-12-09 06:07:02', '2023-12-09 06:17:54');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `format_increment_id` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
  DECLARE new_id VARCHAR(10);
  SET new_id = CONCAT('USR', LPAD((SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'users'), 3, '0'));
  SET NEW.id= new_id;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follows_following_id_foreign` (`following_id`),
  ADD KEY `follows_follower_id_foreign` (`follower_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `follows_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `follows_following_id_foreign` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

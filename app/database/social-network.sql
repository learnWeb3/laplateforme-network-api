-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 04, 2021 at 10:22 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social-network`
--
CREATE DATABASE IF NOT EXISTS `social-network` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `social-network`;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `created_at`, `updated_at`) VALUES
(1, '2020-12-31 18:45:30', '0000-00-00 00:00:00'),
(2, '2020-12-31 18:47:50', '0000-00-00 00:00:00'),
(3, '2020-12-31 20:05:37', '0000-00-00 00:00:00'),
(4, '2020-12-31 20:11:18', '0000-00-00 00:00:00'),
(5, '2021-01-03 13:01:11', '0000-00-00 00:00:00'),
(6, '2021-01-03 13:11:13', '0000-00-00 00:00:00'),
(7, '2021-01-03 13:21:51', '0000-00-00 00:00:00'),
(8, '2021-01-03 13:23:17', '0000-00-00 00:00:00'),
(9, '2021-01-03 13:25:06', '0000-00-00 00:00:00'),
(10, '2021-01-03 13:46:44', '0000-00-00 00:00:00'),
(11, '2021-01-03 13:48:55', '0000-00-00 00:00:00'),
(12, '2021-01-04 08:59:22', '0000-00-00 00:00:00'),
(13, '2021-01-04 11:55:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `chat_users`
--

CREATE TABLE `chat_users` (
  `id` int(11) NOT NULL,
  `id_chat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat_users`
--

INSERT INTO `chat_users` (`id`, `id_chat`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-12-31 18:45:02', '0000-00-00 00:00:00'),
(2, 1, 2, '2020-12-31 18:45:15', '0000-00-00 00:00:00'),
(3, 2, 51, '2020-12-31 18:48:07', '0000-00-00 00:00:00'),
(4, 3, 2, '2020-12-31 20:05:37', '0000-00-00 00:00:00'),
(5, 3, 1, '2020-12-31 20:05:37', '0000-00-00 00:00:00'),
(6, 4, 2, '2020-12-31 20:11:18', '0000-00-00 00:00:00'),
(7, 4, 1, '2020-12-31 20:11:18', '0000-00-00 00:00:00'),
(8, 4, 51, '2020-12-31 20:11:18', '0000-00-00 00:00:00'),
(9, 5, 6, '2021-01-03 13:01:11', '0000-00-00 00:00:00'),
(10, 5, 20, '2021-01-03 13:01:11', '0000-00-00 00:00:00'),
(11, 5, 51, '2021-01-03 13:01:11', '0000-00-00 00:00:00'),
(12, 6, 2, '2021-01-03 13:11:13', '0000-00-00 00:00:00'),
(13, 6, 9, '2021-01-03 13:11:13', '0000-00-00 00:00:00'),
(14, 6, 51, '2021-01-03 13:11:13', '0000-00-00 00:00:00'),
(15, 7, 6, '2021-01-03 13:21:51', '0000-00-00 00:00:00'),
(16, 7, 51, '2021-01-03 13:21:51', '0000-00-00 00:00:00'),
(17, 8, 4, '2021-01-03 13:23:17', '0000-00-00 00:00:00'),
(18, 8, 51, '2021-01-03 13:23:17', '0000-00-00 00:00:00'),
(19, 9, 3, '2021-01-03 13:25:06', '0000-00-00 00:00:00'),
(20, 9, 51, '2021-01-03 13:25:06', '0000-00-00 00:00:00'),
(21, 10, 5, '2021-01-03 13:46:44', '0000-00-00 00:00:00'),
(22, 10, 10, '2021-01-03 13:46:44', '0000-00-00 00:00:00'),
(23, 10, 51, '2021-01-03 13:46:44', '0000-00-00 00:00:00'),
(24, 11, 51, '2021-01-03 13:48:55', '0000-00-00 00:00:00'),
(25, 11, 1, '2021-01-03 13:48:55', '0000-00-00 00:00:00'),
(26, 11, 3, '2021-01-03 13:48:55', '0000-00-00 00:00:00'),
(27, 11, 2, '2021-01-03 13:48:55', '0000-00-00 00:00:00'),
(28, 11, 20, '2021-01-03 13:48:55', '0000-00-00 00:00:00'),
(29, 11, 51, '2021-01-03 13:48:55', '0000-00-00 00:00:00'),
(30, 12, 4, '2021-01-04 08:59:22', '0000-00-00 00:00:00'),
(31, 12, 12, '2021-01-04 08:59:22', '0000-00-00 00:00:00'),
(32, 12, 51, '2021-01-04 08:59:22', '0000-00-00 00:00:00'),
(33, 13, 1, '2021-01-04 11:55:15', '0000-00-00 00:00:00'),
(34, 13, 8, '2021-01-04 11:55:15', '0000-00-00 00:00:00'),
(35, 13, 9, '2021-01-04 11:55:15', '0000-00-00 00:00:00'),
(36, 13, 6, '2021-01-04 11:55:15', '0000-00-00 00:00:00'),
(37, 13, 11, '2021-01-04 11:55:15', '0000-00-00 00:00:00'),
(38, 13, 51, '2021-01-04 11:55:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 KEY_BLOCK_SIZE=2;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `id_post`, `id_user`, `content`, `created_at`, `updated_at`) VALUES
(1, 97, 2, 'Consectetur minus vitae et excepturi. Dolores rerum nam accusantium fugit cum. Repellat aliquid voluptate in ad libero ipsa.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(2, 4, 2, 'Doloribus quia voluptas est dolore quod. Veniam aut ea enim consectetur odio iste.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(3, 23, 2, 'Harum dolores ratione fugit autem. Nesciunt quas facere recusandae nesciunt itaque velit officiis nostrum. Eum quos quis distinctio.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(4, 72, 2, 'Est error ad perspiciatis repellendus. Voluptatibus ut quaerat est et minus repudiandae id. Cumque dignissimos quos sunt enim.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(5, 57, 2, 'Unde consequatur ut sequi quam. Aut debitis autem inventore molestiae ea ea non. Eaque recusandae ratione sit odio voluptatem eligendi numquam.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(6, 93, 2, 'Nostrum sunt possimus nihil occaecati rem voluptatem nihil. Consequuntur molestias consequatur sit. Corrupti nihil eum facere est eum labore voluptatibus.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(7, 59, 2, 'Necessitatibus sed porro culpa. Reiciendis repellat cupiditate quasi qui et repellat fugiat. Accusamus quas voluptate ut rerum cum totam. Esse sequi temporibus reprehenderit sapiente.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(8, 13, 2, 'Eos quam ullam quo dolores sunt perspiciatis. Non dolorum dolorem officiis. Earum iste autem molestiae.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(9, 20, 2, 'Accusamus soluta voluptas ipsum nihil consectetur et. Id quasi et enim nemo quidem consequuntur quasi. Voluptate occaecati est voluptatem corrupti cum.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(10, 43, 2, 'Quo ipsum recusandae distinctio minus totam asperiores est ratione. Dolor velit quidem sint sit repellat. Tempore cumque libero quos voluptas omnis quam. Ratione facilis veniam atque ea.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(11, 68, 2, 'Aut ex sit et ipsum. Sequi et aperiam consequatur.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(12, 82, 2, 'Veritatis dolor laboriosam tempore maxime aspernatur aut. Tempora facilis porro cumque quo fugiat tempora iusto. Blanditiis rerum quis delectus in unde nihil sint.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(13, 68, 2, 'Optio est nobis eligendi delectus. Quam et consequatur omnis eos eius consequatur iste. Fugit et voluptatem necessitatibus. Repellendus quo voluptatem sequi deserunt.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(14, 28, 2, 'Excepturi et sunt rerum sit et aspernatur qui. Ducimus eos vero ducimus quia et. Nisi perferendis aliquam aut ab nihil. Quas quo soluta ipsam minima est quis.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(15, 64, 2, 'Voluptatem eos iste ut. Rerum architecto aut vero ratione. Quas dolorum quo ad aperiam quo officiis enim incidunt.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(16, 62, 2, 'Et assumenda dicta est in dolores doloremque non. Velit est et illum qui soluta accusamus. Delectus dolores consequatur aut sit. Illo sint rem esse vero quo.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(17, 100, 2, 'Quisquam voluptates modi officiis tempore. Consequatur qui ut dolorem adipisci quod sapiente pariatur. Quos et quae illo consectetur officiis tempore dolorem eveniet.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(18, 3, 2, 'Ad est et blanditiis officia vitae dolorum non. Tenetur a omnis repellendus magni similique nemo assumenda. Autem natus fugiat officiis unde cum. Illum sequi quaerat ut omnis deleniti porro.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(19, 83, 2, 'Veritatis quisquam voluptas odio aut sit est sint. Fugit non et autem. Asperiores nesciunt rerum quasi cum commodi corrupti.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(20, 82, 2, 'Id voluptates minima et quis quo repellendus non. Praesentium illum sit autem id accusantium. Velit accusamus nulla omnis est accusantium dolorum. A incidunt nisi ipsa qui quaerat ea.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(21, 85, 2, 'Aliquam atque ut ipsam perferendis consequatur aut sed. Eum porro odio incidunt. Et ab ea cum autem temporibus. Repellat harum ullam perferendis natus aut rem ipsam.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(22, 62, 2, 'Illum aut aut inventore sed nostrum. Et cupiditate ut iure quos amet necessitatibus. Qui qui saepe nihil dolores tenetur.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(23, 16, 2, 'Aut animi placeat et quos aut impedit illum. Harum consectetur praesentium rerum voluptas odit. Reiciendis nesciunt velit ut facere quod aspernatur vitae.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(24, 35, 2, 'Autem voluptas praesentium nisi quia. Minus maiores sapiente ullam error minus sunt. Ex molestiae voluptatem repellendus tempora.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(25, 79, 2, 'Deleniti sint rerum optio cum. Tempora reiciendis quo eos nesciunt mollitia. Voluptatem qui inventore sed pariatur est eius officia.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(26, 64, 2, 'Autem natus ducimus hic culpa ad placeat voluptatum sunt. Voluptas voluptatibus dolorum minus. Non vel facere earum.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(27, 87, 2, 'Ratione totam adipisci recusandae in dolorem et. Molestiae alias quis explicabo commodi.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(28, 10, 2, 'Iure aut quia ea in dolorem qui eum. Sit tempore laborum id. Et autem magnam saepe repellat dolore. Provident et at deleniti aliquid ipsum. Ipsum veritatis dolor nemo voluptatem.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(29, 2, 2, 'Ea alias et consequatur inventore voluptas a. Ut ut qui magnam eos ut laborum sunt quae. Unde ipsa cumque placeat aut. Dicta voluptas id animi sed maxime harum.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(30, 14, 2, 'Animi exercitationem doloribus aut omnis at aut velit temporibus. Laudantium enim ut ratione est quaerat. Voluptatem dicta inventore ut ducimus at.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(31, 4, 2, 'Totam minima iste esse reiciendis qui omnis. Iure quam ex placeat consequatur. Nostrum rerum veritatis minus perspiciatis voluptatem. Aperiam non qui aut et.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(32, 47, 2, 'Quos voluptatibus dignissimos architecto cumque. Ut qui molestias velit aut omnis. Autem non facere deleniti error quia voluptas itaque. Distinctio incidunt accusamus saepe quidem at sit id.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(33, 28, 2, 'Reprehenderit placeat fugiat eos dolorum. Qui magnam consequatur enim. Voluptas veritatis ducimus accusamus ullam neque repellat optio. Nulla quod sed sapiente repellat inventore.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(34, 14, 2, 'Nulla impedit eum fugiat aliquid voluptas. Omnis repudiandae ipsa beatae quibusdam et architecto dolores nemo. Natus aut illo iusto perferendis accusantium.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(35, 65, 2, 'Nesciunt reiciendis vero a. Hic praesentium qui nemo aut natus. Qui maiores quia debitis voluptate. Tempore ducimus velit laudantium voluptatem nobis consequatur consequuntur.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(36, 4, 2, 'Cumque cum illum similique sit perspiciatis. Ea ex assumenda ullam. Deserunt molestias officia cumque itaque ut eligendi quod ut.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(37, 27, 2, 'Optio laboriosam tempora sint deserunt quo voluptates assumenda repellendus. Non qui sunt maiores ut facere est laborum veritatis. Nesciunt tempore ipsa modi et laboriosam et. Et eius ipsam est.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(38, 50, 2, 'Sunt illum corporis veritatis autem iste est amet. Velit aut fuga repellendus id accusantium. Accusantium temporibus doloribus ipsam id aut.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(39, 36, 2, 'Saepe deserunt nihil aliquam nesciunt. Non et quo blanditiis voluptatem error error. Voluptatum alias est nobis non ducimus. Placeat totam vel debitis excepturi quia distinctio aliquid.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(40, 12, 2, 'In dolores deserunt architecto a aut minus quo. A architecto quis qui facere neque sunt. Aspernatur qui qui iusto sed enim voluptate repudiandae.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(41, 92, 2, 'Facilis quis aut sunt commodi perferendis. Quisquam dolorem ad eveniet ut ut tempora. Earum explicabo laudantium eligendi quo.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(42, 39, 2, 'Vitae quis ut cumque necessitatibus enim dolor velit. Tempore corporis nihil ut corporis. Molestiae est officiis quas eos nihil ipsa reiciendis.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(43, 39, 2, 'Occaecati voluptas dolor natus et blanditiis impedit voluptate. Distinctio qui rem nisi quaerat qui. Exercitationem aliquam fuga voluptas consectetur.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(44, 83, 2, 'Laboriosam distinctio qui aut dicta aliquam. Laborum est atque ut tempore. Natus quisquam totam labore consequuntur nulla iste quis. Laboriosam illum aut dolor.', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(45, 57, 2, 'Minus recusandae voluptatem unde. Maxime asperiores enim nemo ut et. Recusandae pariatur omnis non magnam et. Eius aut quo asperiores sed quibusdam incidunt ipsam.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(46, 86, 2, 'Labore suscipit quos blanditiis nisi impedit minus quia corporis. Dolore facere et commodi mollitia quod id quia. Quibusdam nam enim qui nihil dicta eaque veritatis.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(47, 91, 2, 'Quis ea et vel molestiae id. Id ea sed nesciunt. Voluptas provident veritatis rerum quas.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(48, 8, 2, 'Occaecati voluptas eligendi aut vitae blanditiis non repudiandae. Doloremque omnis et delectus voluptate velit.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(49, 70, 2, 'Et et quidem debitis voluptatibus in. Voluptas vel vel fugiat sed esse deserunt dicta. Placeat eum et maiores iusto itaque qui eius. In beatae recusandae eum cumque.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(50, 29, 2, 'Fugiat culpa sed voluptatum sint molestias odio doloremque. Hic quos non saepe amet. Nobis eveniet id cumque.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(51, 42, 2, 'Laboriosam excepturi nulla culpa qui sint quo laborum. Dolor voluptas dolorem nobis qui ea quisquam possimus repellat. Illo incidunt non illum libero eveniet dolorem sunt.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(52, 100, 2, 'Neque sit explicabo ea ipsum. Ut adipisci quisquam inventore non dicta maiores sunt. Minima accusamus dicta vero inventore. Repudiandae quas dicta labore repellendus autem voluptatibus consequatur.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(53, 50, 2, 'Voluptatibus porro quia non voluptatem rem rerum velit. Sed fugit blanditiis adipisci voluptatem voluptas velit.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(54, 37, 2, 'Est doloribus incidunt explicabo consequuntur nobis accusamus labore. Perspiciatis nulla hic cum blanditiis ut.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(55, 42, 2, 'Odit qui similique eos beatae consequatur perspiciatis maxime. Laboriosam nesciunt nihil blanditiis.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(56, 65, 2, 'Ullam consequatur reprehenderit vel consectetur ab et nisi. Incidunt dolore non laborum aperiam rem. Fugiat fugiat est velit tempora inventore beatae.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(57, 95, 2, 'Quia velit dolor aliquam nihil enim laboriosam. Cumque qui neque non voluptatem eius.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(58, 62, 2, 'Quasi aut accusantium nesciunt quia expedita. Voluptas in laudantium eius est delectus est et. Consequatur veritatis odio nobis alias dolores ut magnam.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(59, 85, 2, 'Vel ut sunt sapiente esse. Dolore error quia quidem.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(60, 79, 2, 'Sed enim quos ea et. Et ab veniam enim architecto exercitationem voluptatem. Hic quo ipsa esse expedita tempore incidunt consequatur.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(61, 44, 2, 'Ut dolor nulla dignissimos quaerat doloremque officia. Quo quis explicabo est. Aut nam dolor sint iure voluptates et sed beatae.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(62, 21, 2, 'Sequi et voluptas quod modi. Animi dolor quod libero. Aut quo nemo mollitia odio beatae expedita et ea.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(63, 21, 2, 'Cum numquam omnis et pariatur. Quidem veniam quas tempora quo eaque nam. Quia et quia dolorum est. Doloribus quia laborum corporis eligendi et ea.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(64, 33, 2, 'Temporibus aut veniam ut et ipsa et. Qui ut neque molestiae. Et quos sit laudantium fugiat impedit cumque. Quisquam porro sint voluptatem.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(65, 60, 2, 'Non praesentium ex natus laboriosam. Expedita odit qui ullam qui sint nostrum et.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(66, 92, 2, 'Velit omnis quia voluptate similique consectetur iusto. Quia delectus autem sunt velit in quia. Eaque eos perspiciatis cum voluptatem.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(67, 70, 2, 'Nisi laudantium aspernatur at at velit porro. Explicabo assumenda et rerum quo modi sunt culpa. Sit impedit praesentium debitis.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(68, 18, 2, 'Voluptatum eos ad blanditiis non velit. Repellendus provident nesciunt deleniti illo repellat. Eius perspiciatis dolor ea.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(69, 69, 2, 'Enim nostrum reiciendis quis nulla corporis exercitationem in. Libero sed porro sit voluptate iste unde dolor. Ipsam dolores ab repudiandae qui. Aut maxime qui maxime rerum beatae.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(70, 68, 2, 'Consequatur natus quos provident culpa sunt dolores. Nihil qui repellendus maxime sint fugiat qui. Assumenda animi velit quidem dolor. Architecto explicabo illum iste sit.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(71, 91, 2, 'Debitis in minus fugit modi ducimus eos voluptas. Quo voluptatem exercitationem aut dolorem nam praesentium eligendi minus. Quam dolor consequatur doloribus natus.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(72, 41, 2, 'Officiis voluptatem debitis reprehenderit exercitationem. Qui optio ut amet quo voluptates est. Alias impedit atque veniam ut necessitatibus fugit et quia.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(73, 95, 2, 'Et error modi similique laborum. Iusto cumque sint saepe natus amet similique ut. Sunt ipsam ut ipsa corporis voluptatem quo aperiam. Molestiae veniam repellendus id nobis nemo.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(74, 70, 2, 'Id vel qui quis sunt sint sed. Officiis est omnis aut fuga quia et rerum. Omnis earum eos aut quas.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(75, 67, 2, 'Commodi magni nam quidem. Aut modi voluptate dolorem aspernatur quos saepe velit. Aut voluptatibus nihil corporis illum exercitationem.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(76, 66, 2, 'Molestiae perspiciatis quis consequuntur ducimus eum vel. Blanditiis molestiae pariatur ea illo.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(77, 71, 2, 'Molestias aliquid numquam maxime ducimus quis tempora. Corrupti accusantium officiis nostrum. Et asperiores cum autem iste perferendis adipisci. Consequatur iure optio ex culpa est.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(78, 2, 2, 'Velit dolores officiis minima. Quasi est qui omnis. Est cumque aliquid consequatur eos odit perspiciatis.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(79, 33, 2, 'Labore qui est adipisci autem aut ex. Illo sint quasi quas omnis. Et ullam tempore asperiores ea voluptas. Eligendi autem mollitia numquam.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(80, 71, 2, 'Sunt enim illo hic dolorem ipsa. Qui animi omnis eligendi explicabo odit placeat. Est magni consequatur debitis accusamus. Fugiat velit aspernatur rerum sunt reiciendis accusantium.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(81, 53, 2, 'Aut aut sint dolorem eveniet mollitia inventore quia distinctio. Atque illum repudiandae et explicabo. Ut facere nobis quia exercitationem.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(82, 84, 2, 'Quam voluptatem corrupti consectetur deserunt aut totam. Optio earum facilis dicta consectetur et soluta sint doloribus. Et eos voluptatem harum eligendi laboriosam.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(83, 86, 2, 'Mollitia maxime eos reiciendis deserunt. Nulla eos praesentium omnis dolor reprehenderit sit et. Atque similique amet eveniet error. Esse sit corporis enim a.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(84, 69, 2, 'Officiis ea corrupti deserunt ratione. Quod ut voluptatem molestias laudantium. Qui quas eveniet laudantium quia cum ad.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(85, 38, 2, 'Eos tenetur totam ullam consequuntur. Assumenda nesciunt aspernatur adipisci sequi nihil. Iste recusandae qui nesciunt consequuntur ut.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(86, 71, 2, 'Quis odit recusandae dolores sed alias dolores. In culpa tempora qui eius officiis aut. Cum autem et esse nihil.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(87, 60, 2, 'Nemo omnis cum ea temporibus error beatae. Quisquam eos et aspernatur consequuntur vel. Aut architecto voluptatum error.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(88, 29, 2, 'Rerum praesentium rem aspernatur aut omnis sed temporibus. Illum similique vel et occaecati. Explicabo quisquam et et inventore sapiente. Nesciunt harum consequatur voluptatem qui.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(89, 43, 2, 'Voluptatem minima quibusdam velit architecto laudantium odit. Vel minima aperiam impedit. Velit laboriosam est officia.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(90, 74, 2, 'Ut enim quod aut quaerat. Voluptatem molestiae rerum quia laudantium. Voluptas cupiditate ad aliquid excepturi quo delectus modi. Et nesciunt odio voluptas repudiandae accusamus.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(91, 75, 2, 'Dicta id minima sit molestiae. Nam ducimus incidunt sit dolores quibusdam. Odio atque culpa est ullam quas praesentium nihil molestiae.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(92, 40, 2, 'Et magni omnis doloremque itaque debitis corporis impedit. Consequatur id neque sunt pariatur consectetur aliquid ea. Rerum consequatur aut voluptas quia. Quis et impedit omnis error ducimus tempora.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(93, 37, 2, 'Dolore quidem ut iste at voluptatem fugit. In cum aliquid consequatur recusandae tempore nam. Rerum ut rerum omnis harum autem amet molestias.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(94, 54, 2, 'Dolorem architecto officia est quo animi. Autem esse reprehenderit voluptatem qui qui voluptatem nesciunt.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(95, 26, 2, 'Dolores totam est voluptas aspernatur. Delectus sed eius consequatur voluptas corporis qui omnis. Laborum eveniet odit modi ipsum. Deserunt at distinctio quas voluptas iure sed inventore.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(96, 94, 2, 'Sapiente est fugiat voluptate perferendis. Saepe nam quo voluptatem quas quo iste. Rerum velit qui similique nulla voluptas.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(97, 18, 2, 'Perspiciatis quod consequuntur voluptates est vel suscipit aut. Dolores nam ut nesciunt qui eligendi vitae eius. Eum qui expedita aut eos facilis qui vel deserunt. Id eum et cupiditate id itaque.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(98, 95, 2, 'Accusamus quo omnis qui aut ullam maxime omnis officia. Praesentium aut ipsam et quasi unde totam eius. Dolorum blanditiis magni non eum cumque. Et optio harum ipsa dolore delectus.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(99, 84, 2, 'Fuga dicta facere ut suscipit. Non quibusdam exercitationem amet dolorem corrupti sunt nostrum. Fuga voluptatem eaque quaerat dicta architecto libero. Rem ipsa vero sunt non.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(100, 80, 2, 'Consequatur ipsum facere ut qui enim officiis qui. Quo voluptatibus ipsa et. Placeat corrupti accusantium voluptatem enim consequatur quasi ut minima. Quos voluptatem officia amet repellat.', '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(101, 102, 51, 'hello world', '2020-12-31 17:04:21', '0000-00-00 00:00:00'),
(105, 1, 52, 'hello', '2021-01-04 20:12:23', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `job_name` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `id_user`, `start_date`, `end_date`, `job_name`, `company`, `city`, `country`, `created_at`, `updated_at`) VALUES
(1, 41, '2021-01-02', '2021-01-01', 'Highway Patrol Pilot', 'Botsford-Shanahan', 'Strosinburgh', 'Austria', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(2, 33, '2021-01-01', '2021-01-02', 'Appliance Repairer', 'Gibson-Lowe', 'Norrisland', 'Bangladesh', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(3, 42, '2021-01-02', '2021-01-01', 'Occupational Therapist', 'Frami-Pouros', 'South Patriciashire', 'Lebanon', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(4, 27, '2021-01-02', '2021-01-01', 'Physical Therapist', 'Blanda PLC', 'Ethelynside', 'Greenland', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(5, 33, '2020-12-31', '2021-01-03', 'Prepress Technician', 'Hintz-Blick', 'Amirport', 'Bouvet Island (Bouvetoya)', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(6, 25, '2021-01-01', '2021-01-01', 'Marriage and Family Therapist', 'Quigley, Torp and Gusikowski', 'Port Mikelburgh', 'United States Minor Outlying Islands', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(7, 6, '2021-01-03', '2021-01-02', 'Mathematician', 'Fay-Metz', 'New Gabemouth', 'Saint Lucia', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(8, 2, '2021-01-01', '2021-01-03', 'Recreation and Fitness Studies Teacher', 'Olson, Lubowitz and Gibson', 'Bodestad', 'Grenada', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(9, 46, '2021-01-03', '2021-01-01', 'Ship Carpenter and Joiner', 'Christiansen, Schmidt and Kautzer', 'West Nathanial', 'Mauritius', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(10, 42, '2021-01-01', '2021-01-02', 'Freight Inspector', 'Waters, Emard and Murphy', 'New Gordonberg', 'India', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(11, 38, '2021-01-01', '2021-01-01', 'Train Crew', 'Monahan-Hegmann', 'Port Abigayle', 'Equatorial Guinea', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(12, 19, '2021-01-03', '2020-12-31', 'Materials Inspector', 'Murazik, Labadie and Pfannerstill', 'North Frederique', 'Morocco', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(13, 11, '2021-01-02', '2021-01-03', 'Career Counselor', 'Senger, Kuhic and Weissnat', 'North Zachary', 'Cayman Islands', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(14, 33, '2021-01-02', '2021-01-01', 'Solderer', 'Barton Inc', 'Jastside', 'Austria', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(15, 37, '2021-01-02', '2021-01-03', 'Supervisor of Police', 'Reichert, McClure and Gutmann', 'Lake Elva', 'San Marino', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(16, 23, '2021-01-03', '2020-12-31', 'Fire Fighter', 'Anderson, Funk and Nicolas', 'Murphyshire', 'Netherlands Antilles', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(17, 45, '2021-01-01', '2021-01-02', 'CEO', 'O\'Kon, Haag and Monahan', 'Billieshire', 'Reunion', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(18, 39, '2021-01-01', '2021-01-01', 'Postsecondary Teacher', 'Wiegand and Sons', 'Port Amani', 'Mauritania', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(19, 11, '2021-01-02', '2021-01-01', 'Stone Cutter', 'Botsford and Sons', 'Port Margarette', 'Philippines', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(20, 46, '2021-01-02', '2021-01-02', 'Postsecondary Education Administrators', 'Sporer and Sons', 'South Magali', 'Ghana', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(21, 27, '2021-01-02', '2020-12-31', 'Bicycle Repairer', 'Armstrong, Homenick and Will', 'Powlowskiburgh', 'Paraguay', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(22, 47, '2021-01-03', '2021-01-02', 'Mathematical Science Teacher', 'Hoppe Group', 'North Dorthyborough', 'Slovenia', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(23, 6, '2021-01-02', '2021-01-02', 'Computer Operator', 'Bahringer-Thompson', 'Mitchellhaven', 'Ghana', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(24, 16, '2021-01-02', '2021-01-03', 'Communications Teacher', 'Konopelski-Gutmann', 'New Cheyennestad', 'Mexico', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(25, 39, '2021-01-01', '2021-01-02', 'HR Specialist', 'Heller-Reichel', 'Port Ludiebury', 'Saint Kitts and Nevis', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(26, 46, '2021-01-03', '2021-01-03', 'City', 'Bernier and Sons', 'New Danial', 'Monaco', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(27, 17, '2021-01-01', '2021-01-03', 'Statement Clerk', 'Hayes, Douglas and Nikolaus', 'Treutelshire', 'Seychelles', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(28, 43, '2021-01-01', '2021-01-03', 'Press Machine Setter, Operator', 'Stokes, Labadie and O\'Keefe', 'Mullerburgh', 'British Indian Ocean Territory (Chagos Archipelago)', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(29, 37, '2020-12-31', '2021-01-03', 'Gas Plant Operator', 'Ankunding Group', 'East Javonte', 'Guernsey', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(30, 17, '2020-12-31', '2021-01-03', 'Production Helper', 'Runolfsdottir, Connelly and Schulist', 'New Skylamouth', 'French Polynesia', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(31, 7, '2021-01-03', '2021-01-01', 'Stonemason', 'Torphy, Anderson and Wiegand', 'West Baileymouth', 'United States Virgin Islands', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(32, 38, '2021-01-03', '2020-12-31', 'Maintenance Equipment Operator', 'Orn-Schumm', 'Pourosstad', 'Wallis and Futuna', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(33, 34, '2021-01-03', '2021-01-02', 'Supervisor of Police', 'Leffler, Durgan and Hettinger', 'South Richmondchester', 'French Guiana', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(34, 13, '2021-01-01', '2021-01-02', 'Political Scientist', 'Schaden, Smitham and Sawayn', 'Julianastad', 'American Samoa', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(35, 23, '2021-01-02', '2021-01-03', 'Veterinary Technician', 'Torphy-Nikolaus', 'Katlynnchester', 'Gabon', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(36, 12, '2021-01-01', '2021-01-03', 'Floral Designer', 'Watsica-Rolfson', 'South Mathiasville', 'Tuvalu', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(37, 23, '2021-01-01', '2021-01-02', 'Instrument Sales Representative', 'Nienow, Schultz and Jones', 'Okunevabury', 'Chile', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(38, 36, '2020-12-31', '2021-01-01', 'Printing Press Machine Operator', 'Miller, Jones and Batz', 'New Melynaport', 'Denmark', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(39, 42, '2021-01-02', '2020-12-31', 'Social Work Teacher', 'Bartell Ltd', 'Port Gennaromouth', 'Saint Helena', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(40, 14, '2021-01-03', '2021-01-02', 'Air Crew Member', 'Friesen, Paucek and Parisian', 'Mullerview', 'Spain', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(41, 14, '2021-01-02', '2021-01-01', 'Chef', 'Price-Fisher', 'West Xzavier', 'Somalia', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(42, 41, '2021-01-01', '2021-01-01', 'Packer and Packager', 'Muller, Muller and Russel', 'Port Malvina', 'Tajikistan', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(43, 31, '2021-01-02', '2021-01-03', 'Financial Services Sales Agent', 'Thiel Ltd', 'North Lempi', 'Benin', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(44, 24, '2021-01-01', '2021-01-02', 'Letterpress Setters Operator', 'Daugherty Inc', 'Vedashire', 'Marshall Islands', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(45, 44, '2021-01-01', '2021-01-03', 'Transportation Attendant', 'McCullough-Daugherty', 'Botsfordton', 'Cambodia', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(46, 45, '2021-01-03', '2021-01-01', 'Waste Treatment Plant Operator', 'Hauck, Jacobs and Goldner', 'Lake Wilfredo', 'Cambodia', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(47, 17, '2021-01-01', '2021-01-01', 'Aircraft Rigging Assembler', 'Marks, Block and Cole', 'Emmittmouth', 'Saint Kitts and Nevis', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(48, 8, '2021-01-02', '2021-01-03', 'Pipelayer', 'Graham LLC', 'South Estellmouth', 'Ecuador', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(49, 20, '2021-01-01', '2021-01-03', 'Ceiling Tile Installer', 'Jerde, Quigley and Mueller', 'Erdmanfurt', 'Greece', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(50, 27, '2021-01-02', '2021-01-03', 'Electric Meter Installer', 'Barrows-Parker', 'Morissetteberg', 'Iraq', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(51, 41, '2020-12-31', '2021-01-01', 'Segmental Paver', 'Koepp-Terry', 'West Ara', 'Czech Republic', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(52, 23, '2021-01-02', '2020-12-31', 'Heating and Air Conditioning Mechanic', 'Gottlieb, Flatley and Herman', 'South Raeganport', 'Portugal', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(53, 32, '2021-01-01', '2021-01-02', 'Camera Repairer', 'Sipes and Sons', 'Geraldside', 'Namibia', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(54, 1, '2021-01-01', '2021-01-02', 'Geological Sample Test Technician', 'Ryan Inc', 'West Madisenberg', 'Central African Republic', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(55, 10, '2020-12-31', '2020-12-31', 'License Clerk', 'Hane-Bosco', 'Leuschkemouth', 'Cote d\'Ivoire', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(56, 11, '2021-01-01', '2020-12-31', 'Milling Machine Operator', 'Conroy, Mohr and Pfeffer', 'South Soniachester', 'Bouvet Island (Bouvetoya)', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(57, 47, '2021-01-02', '2021-01-02', 'Chemical Technician', 'Gibson PLC', 'North Vita', 'Ethiopia', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(58, 9, '2021-01-01', '2021-01-02', 'Network Admin OR Computer Systems Administrator', 'Gutkowski LLC', 'Metamouth', 'Pitcairn Islands', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(59, 38, '2021-01-03', '2021-01-02', 'Economics Teacher', 'Reilly, Cole and Howe', 'Camrynstad', 'Montserrat', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(60, 25, '2021-01-02', '2020-12-31', 'Cabinetmaker', 'Dibbert, Cormier and Okuneva', 'West Dustinmouth', 'Singapore', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(61, 6, '2020-12-31', '2021-01-02', 'Waitress', 'Stark-Stanton', 'Haagshire', 'Libyan Arab Jamahiriya', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(62, 43, '2021-01-02', '2020-12-31', 'Business Teacher', 'Hackett Ltd', 'Jalentown', 'New Zealand', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(63, 12, '2021-01-02', '2021-01-03', 'Court Clerk', 'Kautzer, Keebler and Torphy', 'Sipesmouth', 'Lao People\'s Democratic Republic', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(64, 29, '2021-01-02', '2020-12-31', 'Hoist and Winch Operator', 'O\'Hara Inc', 'South Joannyfurt', 'Cook Islands', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(65, 34, '2021-01-02', '2020-12-31', 'Sawing Machine Setter', 'Gottlieb-Johns', 'Lake Alden', 'American Samoa', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(66, 18, '2021-01-01', '2021-01-02', 'Administrative Law Judge', 'Stamm, Crooks and Bashirian', 'Robelburgh', 'Cape Verde', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(67, 5, '2021-01-02', '2021-01-01', 'Bulldozer Operator', 'Weber-Balistreri', 'North Abigale', 'Oman', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(68, 18, '2021-01-03', '2021-01-02', 'Arbitrator', 'Kassulke-Crist', 'Lake Patsyville', 'Cyprus', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(69, 40, '2021-01-03', '2021-01-02', 'Microbiologist', 'VonRueden Ltd', 'Elmiraburgh', 'Singapore', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(70, 34, '2021-01-03', '2021-01-01', 'Human Resources Assistant', 'Luettgen Ltd', 'Port Armando', 'Norway', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(71, 14, '2021-01-01', '2020-12-31', 'Technical Director', 'Johnson, Schulist and Gulgowski', 'South Tierraborough', 'Denmark', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(72, 20, '2021-01-01', '2020-12-31', 'Real Estate Sales Agent', 'Leffler, Schumm and Ziemann', 'Wolfberg', 'Israel', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(73, 18, '2021-01-01', '2021-01-02', 'Airfield Operations Specialist', 'Barrows Inc', 'East Caryland', 'Falkland Islands (Malvinas)', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(74, 25, '2021-01-02', '2021-01-01', 'Electronic Masking System Operator', 'Moore-Huels', 'Deckowton', 'China', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(75, 40, '2021-01-01', '2021-01-01', 'Automotive Mechanic', 'Dickens, Stehr and Borer', 'Dominicview', 'Tokelau', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(76, 40, '2021-01-01', '2021-01-01', 'Stonemason', 'Stamm and Sons', 'Funkchester', 'Georgia', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(77, 13, '2021-01-02', '2021-01-02', 'Compensation and Benefits Manager', 'Bauch Inc', 'Hamillberg', 'Moldova', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(78, 22, '2021-01-02', '2021-01-02', 'Instructional Coordinator', 'Connelly Ltd', 'East Daija', 'Liechtenstein', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(79, 31, '2021-01-01', '2021-01-01', 'Public Health Social Worker', 'Dach, Schiller and Gulgowski', 'Kochmouth', 'Isle of Man', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(80, 46, '2021-01-01', '2021-01-01', 'Insurance Appraiser', 'Roob Group', 'North Mosheborough', 'Svalbard & Jan Mayen Islands', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(81, 16, '2021-01-02', '2021-01-03', 'Postsecondary Teacher', 'Bailey, Waelchi and Reynolds', 'South Shayleetown', 'Eritrea', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(82, 18, '2021-01-02', '2020-12-31', 'Milling Machine Operator', 'Yundt, Tremblay and Konopelski', 'Blandaville', 'Germany', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(83, 33, '2020-12-31', '2021-01-01', 'Cost Estimator', 'Mohr PLC', 'Creminview', 'French Polynesia', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(84, 27, '2021-01-02', '2021-01-02', 'Wind Instrument Repairer', 'Lang-Bayer', 'Collierfort', 'Bermuda', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(85, 19, '2021-01-01', '2021-01-02', 'Government Property Inspector', 'Wisozk, Keebler and Reichert', 'East Samirport', 'Belarus', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(86, 48, '2021-01-02', '2021-01-03', 'Physical Scientist', 'Towne-Rau', 'New Allenefort', 'Afghanistan', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(87, 18, '2021-01-01', '2021-01-02', 'Commercial Diver', 'Erdman-Dicki', 'Raynorfort', 'Ghana', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(88, 44, '2021-01-03', '2021-01-03', 'Staff Psychologist', 'Koelpin, Fay and Ortiz', 'South Jackieland', 'Puerto Rico', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(89, 43, '2021-01-01', '2021-01-03', 'Installation and Repair Technician', 'Bailey, Kulas and Mayer', 'Mosciskifort', 'Kuwait', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(90, 43, '2020-12-31', '2021-01-01', 'Logging Worker', 'Hermiston, Labadie and Wisoky', 'Bonitaborough', 'Anguilla', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(91, 20, '2021-01-02', '2021-01-01', 'Agricultural Technician', 'Wilkinson-Huels', 'Rodgermouth', 'Portugal', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(92, 42, '2021-01-02', '2021-01-03', 'Transportation Attendant', 'Strosin, Hill and Weissnat', 'New Edgar', 'French Guiana', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(93, 8, '2021-01-03', '2020-12-31', 'Community Service Manager', 'Hudson Ltd', 'South Lonzoview', 'Ireland', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(94, 33, '2021-01-03', '2021-01-02', 'Molding and Casting Worker', 'Padberg-Ledner', 'Justinabury', 'Grenada', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(95, 13, '2021-01-01', '2021-01-01', 'Bartender Helper', 'Williamson and Sons', 'South Alyciaberg', 'Oman', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(96, 40, '2021-01-02', '2021-01-02', 'Deburring Machine Operator', 'Leffler-Steuber', 'East Joycechester', 'Taiwan', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(97, 43, '2021-01-02', '2021-01-03', 'Forming Machine Operator', 'Flatley Group', 'East Loraine', 'Bolivia', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(98, 43, '2021-01-02', '2021-01-02', 'Special Education Teacher', 'Rippin PLC', 'Welchland', 'Cocos (Keeling) Islands', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(99, 1, '2021-01-02', '2021-01-02', 'Mixing and Blending Machine Operator', 'Lubowitz LLC', 'Andersonborough', 'Kiribati', '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(100, 27, '2021-01-02', '2021-01-01', 'Tool and Die Maker', 'Lowe Inc', 'East Nella', 'Tunisia', '2020-12-31 15:05:18', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE `follows` (
  `id` int(11) NOT NULL,
  `id_follower` int(11) NOT NULL,
  `id_followed` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `follows`
--

INSERT INTO `follows` (`id`, `id_follower`, `id_followed`, `created_at`, `updated_at`) VALUES
(1, 15, 89, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(2, 11, 13, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(3, 8, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(4, 49, 82, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(5, 43, 32, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(6, 37, 32, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(7, 3, 9, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(8, 8, 38, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(9, 38, 52, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(10, 3, 51, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(11, 39, 60, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(12, 11, 12, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(13, 38, 84, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(14, 6, 35, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(15, 17, 81, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(16, 27, 59, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(17, 17, 8, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(18, 19, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(19, 46, 11, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(20, 20, 27, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(21, 29, 83, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(22, 17, 19, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(23, 43, 10, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(24, 42, 80, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(25, 48, 23, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(26, 37, 84, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(27, 32, 82, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(28, 27, 68, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(29, 6, 54, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(30, 19, 42, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(31, 17, 83, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(32, 24, 22, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(33, 50, 16, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(34, 26, 14, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(35, 44, 80, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(36, 6, 57, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(37, 43, 51, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(38, 4, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(39, 34, 74, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(40, 43, 32, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(41, 22, 85, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(42, 9, 48, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(43, 41, 41, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(44, 33, 100, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(45, 41, 71, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(46, 36, 93, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(47, 40, 22, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(48, 37, 80, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(49, 22, 16, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(50, 45, 31, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(51, 27, 11, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(52, 33, 72, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(53, 34, 63, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(54, 43, 32, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(55, 24, 56, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(56, 8, 5, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(57, 21, 74, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(58, 43, 17, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(59, 17, 30, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(60, 1, 91, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(61, 33, 92, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(62, 20, 80, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(63, 38, 78, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(64, 37, 79, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(65, 3, 51, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(66, 45, 83, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(67, 34, 1, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(68, 18, 97, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(69, 42, 12, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(70, 44, 25, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(71, 16, 44, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(72, 39, 34, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(73, 17, 97, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(74, 1, 4, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(75, 50, 55, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(76, 23, 50, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(77, 25, 91, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(78, 17, 42, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(79, 45, 39, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(80, 4, 3, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(81, 40, 80, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(82, 3, 48, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(83, 40, 98, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(84, 45, 67, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(85, 8, 93, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(86, 29, 65, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(87, 32, 92, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(88, 9, 42, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(89, 41, 66, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(90, 43, 29, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(91, 6, 47, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(92, 13, 35, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(93, 40, 81, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(94, 45, 56, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(95, 50, 30, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(96, 45, 18, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(97, 29, 1, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(98, 8, 79, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(99, 47, 5, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(100, 35, 56, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(101, 6, 51, '2020-12-31 16:17:15', '0000-00-00 00:00:00'),
(102, 1, 51, '2020-12-31 16:18:04', '0000-00-00 00:00:00'),
(103, 1, 51, '2020-12-31 16:18:27', '0000-00-00 00:00:00'),
(104, 1, 51, '2020-12-31 16:19:21', '0000-00-00 00:00:00'),
(105, 7, 51, '2020-12-31 16:27:28', '0000-00-00 00:00:00'),
(106, 7, 51, '2020-12-31 16:30:15', '0000-00-00 00:00:00'),
(112, 51, 2, '2020-12-31 16:37:44', '0000-00-00 00:00:00'),
(113, 51, 3, '2020-12-31 16:38:35', '0000-00-00 00:00:00'),
(116, 51, 1, '2020-12-31 17:51:15', '0000-00-00 00:00:00'),
(117, 51, 6, '2021-01-01 15:26:57', '0000-00-00 00:00:00'),
(118, 51, 10, '2021-01-01 15:27:11', '0000-00-00 00:00:00'),
(119, 51, 7, '2021-01-03 15:41:50', '0000-00-00 00:00:00'),
(121, 51, 5, '2021-01-04 08:53:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hobbies`
--

CREATE TABLE `hobbies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hobbies`
--

INSERT INTO `hobbies` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'sport', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(2, 'cinema', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(3, 'lecture', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(4, 'danse', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(5, 'musique', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(6, 'jeux videos', '2020-12-31 15:05:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `id_post`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 40, 46, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(2, 64, 40, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(3, 14, 34, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(4, 18, 22, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(5, 46, 29, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(6, 5, 37, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(7, 96, 22, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(8, 76, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(9, 91, 24, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(10, 74, 45, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(11, 1, 31, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(12, 61, 26, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(13, 17, 23, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(14, 20, 37, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(15, 69, 18, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(16, 1, 29, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(17, 54, 25, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(18, 67, 21, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(19, 33, 16, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(20, 39, 14, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(21, 66, 31, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(22, 39, 43, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(23, 29, 19, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(24, 100, 44, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(25, 92, 36, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(26, 81, 26, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(27, 30, 22, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(28, 55, 43, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(29, 69, 24, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(30, 50, 30, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(31, 77, 27, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(32, 19, 17, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(33, 14, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(34, 15, 22, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(35, 46, 35, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(36, 71, 8, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(37, 29, 34, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(38, 66, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(39, 62, 12, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(40, 12, 22, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(41, 87, 24, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(42, 41, 29, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(43, 23, 12, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(44, 39, 48, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(45, 6, 9, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(46, 92, 7, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(47, 39, 18, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(48, 23, 9, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(49, 21, 19, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(50, 5, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(51, 28, 30, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(52, 40, 46, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(53, 6, 22, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(54, 98, 36, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(55, 4, 49, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(56, 64, 20, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(57, 60, 16, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(58, 50, 48, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(59, 77, 24, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(60, 12, 16, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(61, 9, 14, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(62, 45, 9, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(63, 52, 48, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(64, 8, 29, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(65, 96, 40, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(66, 8, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(67, 76, 18, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(68, 74, 33, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(69, 24, 22, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(70, 14, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(71, 8, 24, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(72, 21, 10, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(73, 14, 38, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(74, 58, 23, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(75, 93, 35, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(76, 46, 25, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(77, 61, 42, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(78, 98, 11, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(79, 10, 19, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(80, 45, 37, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(81, 6, 11, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(82, 50, 23, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(83, 50, 13, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(84, 52, 27, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(85, 37, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(86, 23, 50, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(87, 74, 18, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(88, 94, 47, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(89, 23, 46, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(90, 26, 24, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(91, 70, 16, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(92, 74, 28, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(93, 69, 8, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(94, 3, 47, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(95, 9, 50, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(96, 94, 47, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(97, 25, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(98, 35, 16, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(99, 46, 41, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(100, 87, 48, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(106, 103, 51, '2021-01-03 15:41:40', '0000-00-00 00:00:00'),
(107, 2, 51, '2021-01-03 15:41:45', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_chat` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `id_user`, `id_chat`, `content`, `created_at`, `updated_at`) VALUES
(1, 51, 3, 'salut mec', '2020-12-31 20:05:37', '0000-00-00 00:00:00'),
(2, 51, 3, 'salut dude', '2020-12-31 20:10:13', '0000-00-00 00:00:00'),
(3, 51, 3, 'salut mecton', '2020-12-31 20:10:21', '0000-00-00 00:00:00'),
(4, 51, 4, 'salut mecton', '2020-12-31 20:11:18', '0000-00-00 00:00:00'),
(5, 51, 4, 'salut putin', '2020-12-31 20:11:28', '0000-00-00 00:00:00'),
(6, 51, 4, 'salut putin', '2021-01-01 16:13:42', '0000-00-00 00:00:00'),
(7, 51, 4, 'hello world', '2021-01-01 17:19:27', '0000-00-00 00:00:00'),
(8, 51, 4, 'hello world', '2021-01-01 17:21:07', '0000-00-00 00:00:00'),
(9, 51, 4, 'yo mec', '2021-01-01 17:21:46', '0000-00-00 00:00:00'),
(10, 51, 4, 'hehehe', '2021-01-01 17:22:32', '0000-00-00 00:00:00'),
(11, 51, 4, 'yo mec', '2021-01-01 17:25:54', '0000-00-00 00:00:00'),
(12, 51, 4, 'hahahhhahhah', '2021-01-01 17:27:22', '0000-00-00 00:00:00'),
(13, 51, 4, 'hahahhhahhah', '2021-01-01 17:28:02', '0000-00-00 00:00:00'),
(14, 51, 4, 'hhiigiigigi', '2021-01-01 17:28:13', '0000-00-00 00:00:00'),
(15, 51, 4, 'hehehehheheh', '2021-01-01 17:28:53', '0000-00-00 00:00:00'),
(16, 51, 4, 'cacaaac', '2021-01-01 17:29:35', '0000-00-00 00:00:00'),
(17, 51, 4, 'pipipu', '2021-01-01 17:31:48', '0000-00-00 00:00:00'),
(18, 51, 4, 'yo mec ', '2021-01-01 17:32:16', '0000-00-00 00:00:00'),
(19, 51, 4, 'yo mec', '2021-01-01 17:33:00', '0000-00-00 00:00:00'),
(20, 51, 2, 'heheeeh', '2021-01-01 17:34:49', '0000-00-00 00:00:00'),
(21, 51, 4, 'hahaha', '2021-01-01 17:43:18', '0000-00-00 00:00:00'),
(22, 51, 4, 'lololo', '2021-01-01 17:44:15', '0000-00-00 00:00:00'),
(23, 51, 4, 'hhihihih', '2021-01-01 17:45:10', '0000-00-00 00:00:00'),
(24, 51, 4, 'hahahah', '2021-01-01 17:45:58', '0000-00-00 00:00:00'),
(25, 51, 4, 'yoyoyoy', '2021-01-01 17:50:52', '0000-00-00 00:00:00'),
(26, 51, 4, 'shit', '2021-01-01 17:52:27', '0000-00-00 00:00:00'),
(27, 51, 4, 'djdjjdj', '2021-01-01 17:53:09', '0000-00-00 00:00:00'),
(28, 51, 4, 'djdjjdj', '2021-01-01 17:54:50', '0000-00-00 00:00:00'),
(29, 51, 4, 'ususuuusuu', '2021-01-01 17:55:54', '0000-00-00 00:00:00'),
(30, 51, 4, 'ususuuusuu', '2021-01-01 17:57:05', '0000-00-00 00:00:00'),
(31, 51, 4, 'ususuuusuu', '2021-01-01 17:58:04', '0000-00-00 00:00:00'),
(32, 51, 4, 'lalalalal', '2021-01-01 17:58:52', '0000-00-00 00:00:00'),
(33, 51, 4, 'lalalalal', '2021-01-01 17:59:39', '0000-00-00 00:00:00'),
(34, 51, 2, 'toto', '2021-01-01 18:00:01', '0000-00-00 00:00:00'),
(35, 51, 2, 'toto', '2021-01-01 18:00:39', '0000-00-00 00:00:00'),
(36, 51, 2, 'toto', '2021-01-01 18:01:16', '0000-00-00 00:00:00'),
(37, 51, 2, 'toto', '2021-01-01 18:01:41', '0000-00-00 00:00:00'),
(38, 51, 2, 'haha', '2021-01-01 18:02:25', '0000-00-00 00:00:00'),
(39, 51, 2, 'hihih', '2021-01-01 18:02:41', '0000-00-00 00:00:00'),
(40, 51, 2, 'zoozozozo', '2021-01-01 18:03:05', '0000-00-00 00:00:00'),
(41, 51, 2, 'rahan', '2021-01-01 18:04:01', '0000-00-00 00:00:00'),
(42, 51, 4, 'lol', '2021-01-01 18:06:20', '0000-00-00 00:00:00'),
(43, 51, 2, 'hahahaha', '2021-01-01 18:06:41', '0000-00-00 00:00:00'),
(44, 51, 2, 'razolan', '2021-01-01 18:13:12', '0000-00-00 00:00:00'),
(45, 51, 4, 'razolan', '2021-01-01 18:14:46', '0000-00-00 00:00:00'),
(46, 51, 4, 'ralouf', '2021-01-01 18:14:53', '0000-00-00 00:00:00'),
(47, 51, 2, 'ralouf', '2021-01-01 18:15:19', '0000-00-00 00:00:00'),
(48, 51, 2, 'rrarararrarra', '2021-01-01 18:15:25', '0000-00-00 00:00:00'),
(49, 51, 2, 'hhihihi', '2021-01-01 18:15:41', '0000-00-00 00:00:00'),
(50, 51, 4, 'heeh', '2021-01-01 18:25:38', '0000-00-00 00:00:00'),
(51, 51, 4, 'yo', '2021-01-01 18:25:43', '0000-00-00 00:00:00'),
(52, 51, 2, 'salut c\'est cool', '2021-01-01 18:25:58', '0000-00-00 00:00:00'),
(53, 51, 2, 'salut c\'est cool', '2021-01-01 18:26:00', '0000-00-00 00:00:00'),
(54, 51, 2, 'salut c\'est cool', '2021-01-01 18:26:05', '0000-00-00 00:00:00'),
(55, 51, 2, 'yai', '2021-01-03 09:57:45', '0000-00-00 00:00:00'),
(56, 51, 4, 'salut les keys', '2021-01-03 10:34:49', '0000-00-00 00:00:00'),
(57, 51, 4, 'slaut les keys', '2021-01-03 10:35:07', '0000-00-00 00:00:00'),
(58, 51, 4, 'slaut les keys', '2021-01-03 10:35:51', '0000-00-00 00:00:00'),
(59, 51, 4, 'heheh', '2021-01-03 10:36:05', '0000-00-00 00:00:00'),
(60, 51, 2, 'heai', '2021-01-03 10:42:01', '0000-00-00 00:00:00'),
(61, 51, 2, 'heai', '2021-01-03 10:42:50', '0000-00-00 00:00:00'),
(62, 51, 2, 'heai', '2021-01-03 10:43:08', '0000-00-00 00:00:00'),
(63, 51, 2, 'heai', '2021-01-03 10:43:39', '0000-00-00 00:00:00'),
(64, 51, 2, 'yo', '2021-01-03 10:45:12', '0000-00-00 00:00:00'),
(65, 51, 5, 'Votre message commence ici...', '2021-01-03 13:01:11', '0000-00-00 00:00:00'),
(66, 51, 4, 'salut putin', '2021-01-03 13:06:47', '0000-00-00 00:00:00'),
(67, 51, 6, 'heheheh', '2021-01-03 13:11:13', '0000-00-00 00:00:00'),
(68, 51, 7, 'hello', '2021-01-03 13:21:51', '0000-00-00 00:00:00'),
(69, 51, 8, 'toto', '2021-01-03 13:23:17', '0000-00-00 00:00:00'),
(70, 51, 9, 'funkie lol', '2021-01-03 13:25:06', '0000-00-00 00:00:00'),
(71, 51, 7, 'toto', '2021-01-03 13:26:02', '0000-00-00 00:00:00'),
(72, 51, 10, 'hhihih', '2021-01-03 13:46:44', '0000-00-00 00:00:00'),
(73, 51, 11, 'hohohohoh', '2021-01-03 13:48:55', '0000-00-00 00:00:00'),
(74, 51, 11, 'yo mec', '2021-01-03 14:00:37', '0000-00-00 00:00:00'),
(75, 51, 11, 'he dude', '2021-01-03 14:10:28', '0000-00-00 00:00:00'),
(76, 51, 11, 'dont let me go', '2021-01-03 14:11:09', '0000-00-00 00:00:00'),
(77, 51, 11, 'salut c\'est vraiment cool de discuter ici', '2021-01-03 14:11:40', '0000-00-00 00:00:00'),
(78, 51, 7, 'heheh', '2021-01-03 15:42:03', '0000-00-00 00:00:00'),
(79, 51, 11, 'hello', '2021-01-03 18:18:47', '0000-00-00 00:00:00'),
(80, 51, 11, 'yo men', '2021-01-03 18:18:57', '0000-00-00 00:00:00'),
(81, 51, 11, 'hahaha', '2021-01-03 18:19:47', '0000-00-00 00:00:00'),
(82, 51, 2, 'hello', '2021-01-04 08:55:55', '0000-00-00 00:00:00'),
(83, 51, 11, 'hello', '2021-01-04 08:57:48', '0000-00-00 00:00:00'),
(84, 51, 12, 'Votre message commence ici...', '2021-01-04 08:59:22', '0000-00-00 00:00:00'),
(85, 51, 4, 'salut putin', '2021-01-04 09:24:15', '0000-00-00 00:00:00'),
(86, 51, 2, 'yo mec', '2021-01-04 11:42:10', '0000-00-00 00:00:00'),
(87, 51, 7, 'hello', '2021-01-04 11:43:42', '0000-00-00 00:00:00'),
(88, 51, 7, 'haiahai', '2021-01-04 11:45:37', '0000-00-00 00:00:00'),
(89, 51, 7, 'haiahai', '2021-01-04 11:46:04', '0000-00-00 00:00:00'),
(90, 51, 13, 'hello world', '2021-01-04 11:55:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `content` text NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `id_user`, `content`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ipsum quod blanditiis vero consectetur. Sit dolorem non molestias. Debitis dolores sit voluptatibus consectetur autem fugit.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(2, 1, 'Ducimus corporis quis sed et consectetur dolor. Iure est consequatur rem beatae ipsum inventore. Nostrum sunt tenetur et ullam corrupti. Officia quibusdam sint assumenda aliquam.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(3, 1, 'Et in nihil rerum neque rerum ut. Adipisci autem labore non sed.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(4, 1, 'Officia ut quod voluptatem quo quos laboriosam. Porro non saepe officiis vel assumenda non debitis ut. Illum harum reprehenderit sunt sed similique.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(5, 1, 'Quisquam ut aut non fuga. Sint omnis non consectetur est qui. Optio veniam dolorum vel rerum iusto odit. Ut mollitia eum laudantium quia ut.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(6, 1, 'Illo non quia eum. Et voluptas qui alias ut quia officia. Assumenda sit ab quod et ex. Dolor qui perspiciatis dolorem aperiam.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(7, 1, 'Non nobis sequi dolorem voluptas nobis ab. Delectus omnis inventore nihil veritatis similique voluptatem. Aliquid consequuntur dolorem vel hic illo incidunt qui.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(8, 1, 'Est repellendus ut quaerat et. Et aut provident minima quibusdam vitae. Cum sed quibusdam doloribus sint odit fuga suscipit. Tempore sed tempore laborum atque.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(9, 1, 'Praesentium est neque et dolor quia excepturi. Mollitia illum sint deleniti dicta eum nobis occaecati. Et enim quia alias voluptas quos facere.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(10, 1, 'Repudiandae esse et et temporibus incidunt esse velit. Et nam voluptatem esse aliquam. Quis et maxime odio labore id iusto. Sed natus provident culpa.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(11, 1, 'Reiciendis officiis autem ea et dolores. Ullam sed cum nulla laborum fugit repellendus. Temporibus porro laboriosam nemo.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(12, 1, 'Temporibus sequi sed assumenda dolorem porro fugiat. Quo cupiditate laboriosam totam et ut rem. Et delectus autem quisquam doloribus. Quia eaque eum vel quos odit.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(13, 1, 'Dolor sit iste tenetur quia nisi tempore molestiae sunt. Sunt laudantium voluptas et. Nisi quia rerum voluptas ratione sit. Dignissimos aut iure et rerum.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(14, 1, 'Omnis mollitia eaque dolorem dicta. Adipisci amet qui cumque dolore autem. Inventore perspiciatis aut molestiae molestiae. Iure maiores et officiis esse excepturi velit quibusdam.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(15, 1, 'Blanditiis ut voluptatum soluta tempora nemo voluptates autem. Est dolorum asperiores eaque at. Eligendi ducimus rem non doloribus voluptatum voluptatibus. Voluptatibus laborum in harum quia non ut.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(16, 1, 'Quis labore quod similique autem est. Dolore ut ipsam blanditiis aperiam. Dolores et nemo nam.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(17, 1, 'Dolor id neque voluptatem inventore nostrum deleniti facere. Nobis eum eveniet atque maiores omnis harum. Et qui occaecati sit et at officiis nesciunt. Distinctio optio sint explicabo nulla.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(18, 1, 'Voluptates ea eum maiores dolorem sunt incidunt. Dolorem nihil tempore fuga qui quisquam itaque est. Ea qui occaecati ad tempore in recusandae aliquam.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(19, 1, 'Minus ducimus reprehenderit dolor modi aspernatur voluptatibus necessitatibus. Quo distinctio voluptas voluptas ut.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(20, 29, 'Dolore eos repudiandae consequatur. Illo et repellendus tempore et labore cum repellendus. Aut deserunt voluptates sequi delectus quia est animi. Quaerat dolor dicta iusto nemo a laborum id.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(21, 3, 'Quidem est inventore modi. Voluptatem at qui iusto magnam. Sed necessitatibus aut exercitationem saepe quae nesciunt. Voluptatum voluptatem nisi dolorem repellat placeat quia saepe.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(22, 40, 'Iste natus cum accusamus debitis qui veritatis. Ullam ut cum perspiciatis vero facere est. Repudiandae odio modi itaque aut soluta.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(23, 32, 'Nam dolor nihil maiores. Non non laudantium ut esse reiciendis deleniti asperiores. Non illo qui molestiae sed. Illo voluptas ad id harum.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(24, 48, 'Iure error veritatis aperiam doloremque neque dolor. Voluptatem temporibus optio quis ex in ducimus ex. Aut sunt nemo nihil est nihil consequatur nihil.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(25, 11, 'Iste nesciunt reiciendis omnis porro et id. Dicta pariatur consequuntur sit dolor. Sint ipsam eos quaerat nisi rem facere necessitatibus quia.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(26, 45, 'Maxime deserunt fugit aut hic voluptas et aspernatur. Non maxime praesentium aut hic. Earum cupiditate ducimus rerum rerum aperiam dolor sit. Inventore est hic porro sapiente autem.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(27, 36, 'Doloribus sit soluta qui fugiat vitae error. Molestias rerum dolores et sequi eligendi dolorem. Ut totam ut quam accusantium. Assumenda ut omnis in error rerum commodi officiis sit.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(28, 41, 'Sint dolorem maiores quae ut. Sed et sed possimus aspernatur. Dolor neque in doloribus molestiae voluptates sapiente debitis.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(29, 32, 'Atque quia omnis voluptatum quia voluptatem expedita voluptatem aut. Veritatis aut dolorem adipisci quos distinctio odio rerum. Ut quo vero in. Non qui impedit quam eum necessitatibus deleniti.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(30, 15, 'Ad consequatur ducimus ut ea et sunt voluptates. Atque officia et reiciendis enim sint. Et sequi eos vitae rerum.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(31, 34, 'Corrupti est laudantium sit sed. Est sit inventore sed enim quos fuga excepturi. Corrupti quis fugiat similique autem autem velit vel aut. Et delectus sunt quibusdam voluptatem aut.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(32, 15, 'Reiciendis cumque dolorum sed voluptatem aspernatur suscipit eos sint. Saepe qui illo ut magni. Nihil repellat et omnis qui nemo veritatis est.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(33, 4, 'Sapiente fugiat dolorum nostrum. Exercitationem ipsum repellat voluptas ut at saepe. Sapiente ullam rerum voluptatum et. Vel nam eos mollitia sunt aspernatur voluptas.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(34, 45, 'Quia cumque dignissimos molestiae aliquid a quis nihil. Similique quisquam neque consequuntur libero fuga saepe quos. Sequi ut occaecati dolor error numquam sed quod.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(35, 25, 'Quibusdam rerum dolor recusandae est. Et ipsa sunt fugit vel nemo. Magni pariatur laborum voluptatem et est. Harum ut molestiae voluptatem iusto odio maxime ea. Magni qui soluta vel sit cum possimus.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(36, 46, 'Odio voluptates non voluptas et voluptatum. Architecto molestiae qui itaque nobis. Ut rerum eaque quo nostrum praesentium. Repellendus blanditiis debitis qui id iure.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(37, 34, 'Labore itaque perferendis rem aliquid alias eos fuga. Dolores eum consectetur totam qui. Nulla sequi soluta aliquid quia doloremque et minima. Et quam porro temporibus.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(38, 16, 'Aut tempora dolores est velit consequatur ipsam. Dolore eos soluta provident dolorum ut. Odit ex praesentium optio distinctio facere officia. Cum ad placeat asperiores minus hic.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(39, 37, 'Dolor voluptas repellendus iure quis laudantium. Soluta rerum sint quam eveniet qui aperiam vel et. Fuga iste vel quia. Eaque quos rerum vero quia.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(40, 23, 'Quo perferendis ex atque adipisci nulla nulla. Aut vel soluta aliquid consequatur. Suscipit qui est nihil sapiente est provident eos officiis. Et odio voluptas sit nisi quisquam voluptatem.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(41, 45, 'Sapiente vel repellat voluptatem laborum sint modi fugit. Alias ab voluptate officia provident aut distinctio. Qui vitae omnis dolor officiis modi. Enim illum dolores eligendi beatae dolores.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(42, 23, 'Unde omnis itaque sint aspernatur labore dolorem quaerat dolorum. Ut et veniam sint. Reiciendis accusantium tempore ex commodi et iste. Dignissimos ad dolor et fugit et.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(43, 17, 'Officiis autem sed deleniti qui provident et in. Debitis necessitatibus ea cumque hic eligendi. Minima unde sint et vel eligendi nam.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(44, 1, 'Nisi culpa velit quod aut inventore adipisci iste. Voluptas id sunt sed neque. Labore ut et illum eveniet officia praesentium. Culpa esse ab quisquam est.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(45, 41, 'Accusantium earum ut sapiente. Fuga qui quo ipsa maiores. Beatae placeat autem voluptatum. Reiciendis aperiam magni nesciunt et suscipit quae.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(46, 19, 'Sapiente et eos error voluptatem molestiae est est. Corrupti in ducimus voluptas quasi qui nihil voluptatem.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(47, 12, 'Libero vel cum et modi minima minus sit. Voluptatem alias cupiditate rerum et quasi. Et sit dignissimos harum consequatur debitis ducimus ut aut. Culpa officia temporibus et.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(48, 16, 'Delectus omnis adipisci qui ut omnis incidunt alias. Consequatur expedita recusandae et culpa. Esse non deleniti facilis dolore vero omnis quae. Voluptas et ex unde hic sint labore voluptatibus.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(49, 38, 'Expedita magnam rerum cumque ad aut beatae. Nobis et est vel voluptas ea fugiat. Voluptas ipsam praesentium quo rerum ut libero. Ut error magni ratione laudantium.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(50, 8, 'Non similique quis et dolorem. Aperiam qui dolorem ea quia tempore quas. Aut alias minus illo iste consectetur dicta maxime. In sed cum sit officiis similique qui.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(51, 49, 'Ab facilis culpa enim id amet molestiae. Ipsa fugit ut velit. Id est ab exercitationem optio quod. Facilis earum quo autem eveniet velit alias consectetur.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(52, 37, 'Et quo voluptates illum. Sunt ipsam ad qui voluptas explicabo dolores. Laboriosam id odit quaerat recusandae commodi sunt. Id aut quibusdam voluptas architecto.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(53, 44, 'Ea saepe laudantium omnis numquam beatae vel eaque dolore. Sed magnam quam rerum quia et.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(54, 9, 'Dignissimos rem ducimus et saepe. Aut dolorum animi ea voluptates quae illo est. Praesentium consectetur voluptas odit sit debitis consectetur labore.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(55, 29, 'Beatae alias qui harum quas. Quaerat maxime est pariatur ea quo. Natus reprehenderit sunt aperiam praesentium. Esse veniam voluptatum quibusdam nam possimus dolor voluptatum.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(56, 17, 'Et velit et consectetur omnis ut. Vel suscipit dignissimos et laborum sed tenetur. Placeat rerum nobis quos ducimus et hic sit nemo. Accusamus quam atque maiores aspernatur saepe ut.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(57, 30, 'Eum magni ea culpa molestiae dolores et dolores et. Doloremque sunt ut debitis et ut. Perferendis ea voluptatem quis magnam aliquam. Autem quibusdam laudantium delectus qui iusto excepturi.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(58, 35, 'Veritatis repellendus dolor quia neque aut eligendi aut. Officiis dicta temporibus sequi consequatur delectus sit reprehenderit. Laudantium et nemo enim quia ut ducimus et.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(59, 12, 'Optio vero ex ad autem beatae consequatur. Deleniti voluptas reprehenderit rerum amet dolorem. Eius voluptatem eum temporibus voluptas quia assumenda sapiente.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(60, 20, 'Iure pariatur odio ipsum et deserunt quibusdam sit. Explicabo minima consequatur ipsam accusamus consectetur nesciunt repellendus. Error suscipit ratione ut vel illo ea eveniet rerum.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(61, 12, 'Eos ut ea laboriosam reiciendis. Quia ut ipsum odit beatae ut amet modi harum. Fugiat eum nisi hic in nemo asperiores. Repellendus maiores vero repudiandae numquam quo.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(62, 45, 'Natus perspiciatis quia ea enim. Amet est quia nam. Nemo id eum pariatur doloribus quisquam placeat ipsa.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(63, 15, 'Nobis unde omnis ut quae et omnis quia laborum. Ea illum rerum sequi aut consectetur pariatur impedit. Esse quam dolorem aut quasi qui quos.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(64, 25, 'Labore dicta ipsam natus incidunt natus voluptatibus in. Quod excepturi aut quaerat qui. Qui mollitia ut quia repellendus voluptatem nihil beatae.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(65, 6, 'Maxime necessitatibus aspernatur voluptates fuga. Ratione velit accusamus dolore ut vel. Dignissimos et ipsam soluta pariatur eveniet et.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(66, 32, 'Eum aut aut ipsum quibusdam mollitia quibusdam. Sunt autem consequatur error eum quo nostrum dolor. Facere tenetur accusantium dignissimos.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(67, 6, 'Incidunt voluptates perferendis nobis. Distinctio voluptatem est in et aut magnam quaerat. Sunt odio culpa ea voluptas et nisi. Et officiis facilis neque quia consequuntur.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(68, 45, 'Velit qui modi ullam a facilis maxime. A itaque corporis voluptas quia ipsum enim. Hic molestiae ratione ut quia eveniet. Et suscipit officia nobis.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(69, 44, 'Aspernatur explicabo repudiandae numquam laborum. Tempore vitae quia repellat sint et. Est assumenda voluptas eligendi ducimus commodi. Ipsam ad mollitia non et fuga et.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(70, 34, 'Dolor ut voluptas et ratione. Accusamus non explicabo consequatur optio nobis aut consequatur. Natus non sit ipsa repellat.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(71, 49, 'Eius quibusdam vero consequuntur dicta. Distinctio nostrum nihil ratione ad aut ut vitae voluptate. Qui et minus sint. Ea vitae nihil incidunt expedita vel a.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(72, 17, 'Tempora non quibusdam culpa nemo dolorem. Libero consectetur et quae dolor ut non. Eligendi aspernatur corporis odit distinctio consequatur quas. Reiciendis similique rem atque nobis.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(73, 33, 'Ut sed et doloribus aut totam ipsa. Sint perspiciatis voluptas molestias animi maiores porro occaecati. Est ut voluptatem culpa at.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(74, 5, 'Aut voluptatem ut ducimus temporibus impedit numquam culpa. Enim quia rem unde itaque. Quae perferendis aliquam voluptatem eum ut culpa at qui.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(75, 23, 'Odio eum veniam molestiae ut omnis necessitatibus. Sint officiis dignissimos voluptatem est. Voluptas ea consequuntur vel esse. Et illum deserunt rem.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(76, 47, 'Et eum autem possimus vel. Voluptas excepturi labore minima asperiores optio optio.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(77, 5, 'Quod esse et repellat in. Ducimus eius nostrum magni ad aut. Minus quisquam dolorum mollitia quod ullam. Nemo et libero in dolorem in aperiam.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(78, 39, 'Aut non quibusdam temporibus et ullam in. Magni sunt minus quia. Tenetur blanditiis cum eligendi aut. Sit dolor cumque dolor qui quo libero.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(79, 11, 'Soluta ratione ipsa consectetur odio laboriosam. Enim sed natus consequatur doloremque. Eos quis voluptatem sapiente impedit iusto maiores possimus. Sed quia praesentium vel autem et in.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(80, 31, 'Blanditiis iusto nam dolorem optio autem sunt. Vitae eum ut autem qui odio quis aut. Hic dolorem quibusdam voluptas numquam sapiente consectetur.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(81, 47, 'Culpa inventore praesentium hic quaerat sint cum nam. Consequatur saepe voluptas sed architecto et consequatur. Doloribus autem omnis aut nihil perferendis nihil et.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(82, 22, 'Dolores rerum possimus ipsa vitae eos laudantium reprehenderit. Animi iure reiciendis ut expedita quia. Omnis aut iusto architecto quo. Sint iure pariatur fugit qui ipsam.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(83, 49, 'Id aliquam eos enim dolorem voluptas dolorem ipsam. Sit sed culpa voluptatibus tenetur consequatur. Eaque qui saepe tempora rem dicta voluptates enim ab.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(84, 28, 'Temporibus autem in dolorem sit rerum. Quia asperiores magni nulla sapiente dolorem a. Rerum mollitia fuga a voluptatem et laborum.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(85, 45, 'Libero omnis sapiente similique totam enim doloribus. Tenetur eveniet tempore dolorum fuga iusto accusamus nam. Tenetur maxime enim omnis corrupti assumenda veritatis fugit.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(86, 36, 'Ut laborum velit ut repellendus facilis laborum quam. Facere magni perferendis blanditiis ad et. Impedit veritatis voluptatum odio.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(87, 11, 'Omnis molestias corporis ex non incidunt nihil sapiente. Excepturi eligendi illum architecto eius sequi sint. Temporibus incidunt perspiciatis nesciunt ad est.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(88, 26, 'Sed aut at quo voluptas. Excepturi quia molestias nobis qui quibusdam vel. Necessitatibus delectus molestiae dignissimos corrupti omnis. Ipsam nam rerum natus et tempora excepturi facilis.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(89, 12, 'Ullam non quis inventore ad. Laboriosam asperiores nisi aut error. Recusandae laborum totam et.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(90, 47, 'Quia magnam maxime et et et dolores iusto. Aut veniam distinctio neque. Porro eligendi rerum et sint modi ipsum esse. Perspiciatis aut ut eos quod et numquam.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(91, 15, 'Voluptatem eligendi praesentium deleniti ducimus. Animi perspiciatis quia enim consequatur rem molestias. Sunt voluptates dolores rem soluta odio et.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(92, 50, 'Nesciunt officia excepturi molestiae nihil possimus. Magni fugit magnam libero maiores illo dolor est voluptatem. Quia expedita similique ea et ad voluptatem fugit.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(93, 7, 'Assumenda fugit fugiat beatae labore placeat voluptatem. Error animi minima officia quo. Magni ea omnis dolorem qui voluptatem voluptatem quo soluta.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(94, 50, 'Et dignissimos assumenda quibusdam cumque. Perferendis ipsam qui est et sequi et. Maxime suscipit molestiae et corrupti sit. In dolorem dolorem saepe nisi natus quidem.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(95, 44, 'Nemo aut cum quis recusandae quos aut. Eos ipsam sint iusto optio asperiores atque. Totam libero accusantium unde sunt nobis. Autem aperiam consequuntur in.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(96, 41, 'Est fugit rerum debitis sed minus omnis sit. Sit vel velit mollitia sit. Dolores aperiam eligendi beatae ducimus tenetur aspernatur.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(97, 5, 'Nisi fuga sapiente neque doloribus fugit ut. Quod ut rerum voluptas ut maxime dignissimos amet. Vitae rerum quo quo fugiat quisquam corporis qui.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(98, 50, 'Tempora harum quis eligendi corrupti nulla ad. Eum debitis voluptate a nulla libero. Ipsam a molestias qui praesentium eligendi.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(99, 13, 'Similique consequatur vel et omnis. Et omnis nobis cupiditate veritatis. Corrupti mollitia quidem optio consequatur corrupti possimus. Omnis maxime autem asperiores tempore est fuga.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(100, 2, 'Ad corporis explicabo molestias ut sunt itaque voluptatem. Et commodi similique tempora ut commodi non velit. Omnis minima illum cupiditate ut veritatis qui.', '1609014573-cover.jpg', '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(101, 51, 'Un tips à partager, besoin d\'un peu d\'aide, n\'hesites pas c\'est ici est maintenant !', NULL, '2020-12-31 16:44:26', '0000-00-00 00:00:00'),
(102, 51, 'Hello world', '[{\"image_url\":\"1609433110-cover.jpg\"},{\"image_url\":\"1609433110-avatar.jpg\"}]', '2020-12-31 16:45:10', '0000-00-00 00:00:00'),
(103, 51, 'Super deal https://www.ebay.fr/itm/Xiaomi-POCO-X3-6Go-64Go-732G-5160mAh-33W-NFC-Global-Version-Smartphone/143736274806?_trkparms=pageci%3Ab3fae1fb-4c45-11eb-99d0-96d60e80a242%7Cparentrq%3Abe8e8d371760a0f119bb5226fffe7222%7Ciid%3A1', '[{\"image_url\":\"1609514795-cover.jpg\"}]', '2021-01-01 15:26:35', '0000-00-00 00:00:00'),
(104, 51, 'Super post test', '[{\"image_url\":\"1609688469-cover.jpg\"}]', '2021-01-03 15:41:09', '0000-00-00 00:00:00'),
(105, 51, 'hello', '[{\"image_url\":\"1609750134-cover.jpg\"}]', '2021-01-04 08:48:54', '0000-00-00 00:00:00'),
(106, 51, 'Super news https://news.google.com/articles/CAIiEF4fJeLTxjSbWMhSJ1Q5RUwqFwgEKg8IACoHCAow0OGxATD59Qkwu8Mk?hl=fr&gl=FR&ceid=FR%3Afr', '[{\"image_url\":\"1609750203-cover.jpg\"}]', '2021-01-04 08:50:03', '0000-00-00 00:00:00'),
(107, 201, 'hello world nouveau', 'http://picture_test.png', '2021-01-04 09:38:45', '0000-00-00 00:00:00'),
(108, 201, 'hello world nouveau', 'http://picture_test.png', '2021-01-04 11:16:02', '0000-00-00 00:00:00'),
(109, 51, 'Un tips à partager, besoin d\'un peu d\'aide, n\'hesites pas c\'est ici est maintenant !', '[{\"image_url\":\"1609759600-cover.jpg\"}]', '2021-01-04 11:26:40', '0000-00-00 00:00:00'),
(110, 51, 'Un tips à partager, besoin d\'un peu d\'aide, n\'hesites pas c\'est ici est maintenant !', NULL, '2021-01-04 11:28:17', '0000-00-00 00:00:00'),
(111, 51, 'Un tips à partager, besoin d\'un peu d\'aide, n\'hesites pas c\'est ici est maintenant !', NULL, '2021-01-04 11:29:22', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `post_reactions`
--

CREATE TABLE `post_reactions` (
  `id` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_reaction` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_reactions`
--

INSERT INTO `post_reactions` (`id`, `id_post`, `id_reaction`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(2, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(3, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(4, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(5, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(6, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(7, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(8, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(9, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(10, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(11, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(12, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(13, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(14, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(15, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(16, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(17, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(18, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(19, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(20, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(21, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(22, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(23, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(24, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(25, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(26, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(27, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(28, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(29, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(30, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(31, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(32, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(33, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(34, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(35, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(36, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(37, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(38, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(39, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(40, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(41, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(42, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(43, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(44, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(45, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(46, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(47, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(48, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(49, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(50, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(51, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(52, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(53, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(54, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(55, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(56, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(57, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(58, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(59, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(60, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(61, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(62, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(63, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(64, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(65, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(66, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(67, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(68, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(69, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(70, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(71, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(72, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(73, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(74, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(75, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(76, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(77, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(78, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(79, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(80, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(81, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(82, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(83, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(84, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(85, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(86, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(87, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(88, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(89, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(90, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(91, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(92, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(93, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(94, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(95, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(96, 80, 4, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(97, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(98, 80, 3, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(99, 80, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(100, 80, 1, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(101, 1, 1, 51, '2020-12-31 16:08:39', '0000-00-00 00:00:00'),
(102, 1, 2, 51, '2020-12-31 16:08:40', '0000-00-00 00:00:00'),
(103, 102, 4, 51, '2020-12-31 16:45:49', '0000-00-00 00:00:00'),
(104, 102, 4, 51, '2020-12-31 16:45:50', '0000-00-00 00:00:00'),
(105, 102, 2, 51, '2020-12-31 16:45:51', '0000-00-00 00:00:00'),
(106, 103, 2, 51, '2021-01-03 15:41:39', '0000-00-00 00:00:00'),
(107, 103, 2, 51, '2021-01-03 15:41:39', '0000-00-00 00:00:00'),
(108, 106, 4, 51, '2021-01-04 08:52:48', '0000-00-00 00:00:00'),
(109, 106, 4, 51, '2021-01-04 08:52:49', '0000-00-00 00:00:00'),
(110, 106, 1, 51, '2021-01-04 08:52:52', '0000-00-00 00:00:00'),
(111, 106, 1, 51, '2021-01-04 08:52:52', '0000-00-00 00:00:00'),
(112, 106, 2, 51, '2021-01-04 08:52:53', '0000-00-00 00:00:00'),
(113, 106, 2, 51, '2021-01-04 08:52:54', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `id_tag`, `id_post`, `created_at`, `updated_at`) VALUES
(1, 1, 59, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(2, 4, 86, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(3, 1, 67, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(4, 3, 96, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(5, 1, 100, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(6, 2, 52, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(7, 1, 80, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(8, 1, 23, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(9, 3, 40, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(10, 3, 33, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(11, 1, 28, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(12, 2, 23, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(13, 2, 68, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(14, 3, 24, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(15, 1, 64, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(16, 3, 7, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(17, 4, 10, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(18, 1, 77, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(19, 4, 20, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(20, 4, 29, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(21, 4, 94, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(22, 3, 2, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(23, 3, 73, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(24, 1, 95, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(25, 4, 20, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(26, 4, 67, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(27, 4, 13, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(28, 3, 47, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(29, 1, 40, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(30, 4, 75, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(31, 4, 11, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(32, 3, 73, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(33, 1, 19, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(34, 2, 7, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(35, 3, 63, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(36, 3, 53, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(37, 2, 64, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(38, 2, 6, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(39, 2, 4, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(40, 3, 74, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(41, 2, 48, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(42, 4, 1, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(43, 4, 66, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(44, 1, 36, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(45, 4, 41, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(46, 1, 58, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(47, 4, 56, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(48, 2, 6, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(49, 2, 9, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(50, 1, 26, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(51, 4, 49, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(52, 2, 73, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(53, 1, 32, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(54, 2, 96, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(55, 1, 44, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(56, 2, 28, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(57, 3, 21, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(58, 2, 98, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(59, 3, 11, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(60, 1, 58, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(61, 3, 36, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(62, 3, 95, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(63, 4, 65, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(64, 1, 2, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(65, 2, 49, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(66, 4, 28, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(67, 2, 91, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(68, 4, 75, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(69, 1, 45, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(70, 4, 31, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(71, 3, 91, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(72, 1, 36, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(73, 2, 57, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(74, 1, 43, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(75, 3, 83, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(76, 1, 86, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(77, 1, 96, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(78, 4, 21, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(79, 2, 97, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(80, 1, 25, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(81, 1, 27, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(82, 1, 10, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(83, 2, 93, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(84, 3, 78, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(85, 2, 90, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(86, 1, 49, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(87, 3, 95, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(88, 2, 4, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(89, 1, 41, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(90, 4, 1, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(91, 1, 61, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(92, 2, 83, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(93, 3, 67, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(94, 4, 67, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(95, 2, 70, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(96, 2, 83, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(97, 2, 12, '2020-12-31 15:05:18', '0000-00-00 00:00:00'),
(98, 4, 93, '2020-12-31 15:05:19', '0000-00-00 00:00:00'),
(99, 2, 12, '2020-12-31 15:05:19', '0000-00-00 00:00:00'),
(100, 1, 28, '2020-12-31 15:05:19', '0000-00-00 00:00:00'),
(101, 2, 109, '2021-01-04 11:26:40', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `promos`
--

CREATE TABLE `promos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promos`
--

INSERT INTO `promos` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'coding-school 2020-1', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(2, 'coding-school 2020-2', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(3, 'coding-school 2021-1', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(4, 'coding-school 2021-2', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(5, 'secu-web 2020-1', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(6, 'secu-web 2020-2', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(7, 'secu-web 2021-1', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(8, 'secu-web 2021-2', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(9, 'ai-school 2020-1', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(10, 'ai-school 2020-2', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(11, 'ai-school 2021-1', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(12, 'ai-school 2021-2', '2020-12-31 15:05:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reactions`
--

CREATE TABLE `reactions` (
  `id` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reactions`
--

INSERT INTO `reactions` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, '😂', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(2, '😃', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(3, '😅', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(4, '😟', '2020-12-31 15:05:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'php', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(2, 'mysql', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(3, 'javascript', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(4, 'python', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(5, 'ruby', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(6, 'team work', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(7, 'figma', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(8, 'design', '2020-12-31 15:05:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'actualité', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(2, 'important', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(3, 'urgent', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(4, 'bonne affaire', '2020-12-31 15:05:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `trainings`
--

CREATE TABLE `trainings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trainings`
--

INSERT INTO `trainings` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'secu-web', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(2, 'ai-school', '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(3, 'coding-school', '2020-12-31 15:05:11', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `id_promo` int(11) DEFAULT NULL,
  `id_training` int(11) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `birthdate`, `avatar`, `cover`, `linkedin`, `github`, `website`, `description`, `id_promo`, `id_training`, `admin`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'sydney.glover@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(2, NULL, NULL, 'samara.eichmann@bogisich.info', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:11', '0000-00-00 00:00:00'),
(3, NULL, NULL, 'mayer.constance@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(4, NULL, NULL, 'funk.brannon@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(5, NULL, NULL, 'elliott52@balistreri.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(6, NULL, NULL, 'richmond.rutherford@mosciski.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(7, NULL, NULL, 'johns.delia@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(8, NULL, NULL, 'reid.prohaska@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(9, NULL, NULL, 'mohamed.kshlerin@jacobson.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(10, NULL, NULL, 'powlowski.katharina@schoen.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(11, NULL, NULL, 'schuster.amy@ortiz.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(12, NULL, NULL, 'kutch.terrell@bashirian.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(13, NULL, NULL, 'belle58@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(14, NULL, NULL, 'zboncak.lester@marvin.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(15, NULL, NULL, 'kaylin13@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(16, NULL, NULL, 'qharvey@mann.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:12', '0000-00-00 00:00:00'),
(17, NULL, NULL, 'dleannon@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(18, NULL, NULL, 'joanne.barton@beatty.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(19, NULL, NULL, 'runte.joana@kuphal.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(20, NULL, NULL, 'hermina.kihn@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(21, NULL, NULL, 'maybelle59@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(22, NULL, NULL, 'huels.henriette@russel.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(23, NULL, NULL, 'ward52@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(24, NULL, NULL, 'lromaguera@nicolas.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(25, NULL, NULL, 'jamey.schumm@mccullough.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(26, NULL, NULL, 'golden.kunze@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(27, NULL, NULL, 'evelyn68@bruen.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(28, NULL, NULL, 'chermiston@huels.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(29, NULL, NULL, 'wolff.alvina@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(30, NULL, NULL, 'kristina.conn@wunsch.net', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:13', '0000-00-00 00:00:00'),
(31, NULL, NULL, 'ugreenholt@connelly.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(32, NULL, NULL, 'lbosco@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(33, NULL, NULL, 'evan17@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(34, NULL, NULL, 'dasia43@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(35, NULL, NULL, 'stracke.kyle@mueller.info', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(36, NULL, NULL, 'bcorwin@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(37, NULL, NULL, 'zlittle@bailey.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(38, NULL, NULL, 'alivia90@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(39, NULL, NULL, 'stroman.emilie@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(40, NULL, NULL, 'maggio.amely@quigley.info', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(41, NULL, NULL, 'leatha.sporer@schinner.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(42, NULL, NULL, 'skylar.purdy@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(43, NULL, NULL, 'jaren80@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(44, NULL, NULL, 'lila28@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(45, NULL, NULL, 'krista76@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:14', '0000-00-00 00:00:00'),
(46, NULL, NULL, 'beverly84@yahoo.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(47, NULL, NULL, 'dwaters@schiller.biz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(48, NULL, NULL, 'fwilderman@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(49, NULL, NULL, 'goldner.kitty@wintheiser.org', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(50, NULL, NULL, 'klocko.alessia@brakus.biz', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2020-12-31 15:05:15', '0000-00-00 00:00:00'),
(51, 'Zara', 'Bellaoui', 'zoltan@yopmail.com', '1994-09-14', '1609757448-avatar.jpg', '1609757456-cover.jpg', 'http://linkedin/zara.bellaoui', 'http://github/zara.bellaoui', 'http://site-perso/zara.bellaoui', 'Je m\'appelle Zara et je suis a la recherche d\'un poste dans lequel je pourrais m\'épanouir et apporter mes compétences surnaturelles en cartomancie appliquées', NULL, NULL, 0, '2020-12-31 15:19:35', '2021-01-04 10:50:56'),
(52, NULL, NULL, 'antoine.le-guillou@laplateforme.io', NULL, '1609791435-avatar.jpg', '1609791434-cover.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2021-01-04 19:29:49', '2021-01-04 20:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_hobbies`
--

CREATE TABLE `user_hobbies` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_hobby` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_hobbies`
--

INSERT INTO `user_hobbies` (`id`, `id_user`, `id_hobby`, `created_at`, `updated_at`) VALUES
(1, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(2, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(3, 2, 2, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(4, 2, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(5, 2, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(6, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(7, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(8, 2, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(9, 2, 2, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(10, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(11, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(12, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(13, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(14, 2, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(15, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(16, 2, 2, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(17, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(18, 2, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(19, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(20, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(21, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(22, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(23, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(24, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(25, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(26, 2, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(27, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(28, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(29, 2, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(30, 2, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(31, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(32, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(33, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(34, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(35, 2, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(36, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(37, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(38, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(39, 2, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(40, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(41, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(42, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(43, 2, 2, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(44, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(45, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(46, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(47, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(48, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(49, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(50, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(51, 2, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(52, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(53, 2, 2, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(54, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(55, 2, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(56, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(57, 2, 2, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(58, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(59, 2, 2, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(60, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(61, 2, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(62, 2, 2, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(63, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(64, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(65, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(66, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(67, 2, 2, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(68, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(69, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(70, 2, 2, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(71, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(72, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(73, 2, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(74, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(75, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(76, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(77, 2, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(78, 2, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(79, 2, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(80, 2, 2, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(81, 2, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(82, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(83, 2, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(84, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(85, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(86, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(87, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(88, 2, 1, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(89, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(90, 2, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(91, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(92, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(93, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(94, 2, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(95, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(96, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(97, 2, 6, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(98, 2, 5, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(99, 2, 3, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(100, 2, 2, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(101, 51, 3, '2020-12-31 16:24:35', '0000-00-00 00:00:00'),
(103, 51, 2, '2020-12-31 17:28:19', '0000-00-00 00:00:00'),
(104, 51, 5, '2021-01-01 15:27:35', '0000-00-00 00:00:00'),
(105, 51, 3, '2021-01-04 08:53:47', '0000-00-00 00:00:00'),
(106, 52, 3, '2021-01-04 20:17:25', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_skills`
--

CREATE TABLE `user_skills` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_skill` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_skills`
--

INSERT INTO `user_skills` (`id`, `id_user`, `id_skill`, `created_at`, `updated_at`) VALUES
(1, 2, 4, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(2, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(3, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(4, 2, 4, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(5, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(6, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(7, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(8, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(9, 2, 3, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(10, 2, 4, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(11, 2, 4, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(12, 2, 4, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(13, 2, 3, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(14, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(15, 2, 4, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(16, 2, 1, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(17, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(18, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(19, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(20, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(21, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(22, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(23, 2, 4, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(24, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(25, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(26, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(27, 2, 4, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(28, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(29, 2, 3, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(30, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(31, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(32, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(33, 2, 3, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(34, 2, 3, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(35, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(36, 2, 4, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(37, 2, 1, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(38, 2, 1, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(39, 2, 3, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(40, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(41, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(42, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(43, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(44, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(45, 2, 1, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(46, 2, 3, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(47, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(48, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(49, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(50, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(51, 2, 1, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(52, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(53, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(54, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(55, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(56, 2, 4, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(57, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(58, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(59, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(60, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(61, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(62, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(63, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(64, 2, 1, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(65, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(66, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(67, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(68, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(69, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(70, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(71, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(72, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(73, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(74, 2, 3, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(75, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(76, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(77, 2, 1, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(78, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(79, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(80, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(81, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(82, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(83, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(84, 2, 5, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(85, 2, 6, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(86, 2, 1, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(87, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(88, 2, 3, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(89, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(90, 2, 1, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(91, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(92, 2, 3, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(93, 2, 3, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(94, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(95, 2, 3, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(96, 2, 7, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(97, 2, 8, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(98, 2, 2, '2020-12-31 15:05:16', '0000-00-00 00:00:00'),
(99, 2, 4, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(100, 2, 7, '2020-12-31 15:05:17', '0000-00-00 00:00:00'),
(103, 51, 6, '2020-12-31 16:24:29', '0000-00-00 00:00:00'),
(104, 51, 1, '2020-12-31 17:11:53', '0000-00-00 00:00:00'),
(105, 51, 3, '2020-12-31 17:28:22', '0000-00-00 00:00:00'),
(108, 51, 3, '2021-01-04 08:53:42', '0000-00-00 00:00:00'),
(109, 52, 4, '2021-01-04 20:17:21', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_users`
--
ALTER TABLE `chat_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_ibfk_1` (`id_post`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_folllower` (`id_follower`,`id_followed`);

--
-- Indexes for table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`,`id_chat`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `post_reactions`
--
ALTER TABLE `post_reactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `id_reaction` (`id_reaction`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_post` (`id_post`),
  ADD KEY `post_tag_ibfk_2` (`id_tag`);

--
-- Indexes for table `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reactions`
--
ALTER TABLE `reactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainings`
--
ALTER TABLE `trainings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cursus` (`id_training`),
  ADD KEY `id_promo` (`id_promo`);

--
-- Indexes for table `user_hobbies`
--
ALTER TABLE `user_hobbies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hobby` (`id_hobby`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `user_skills`
--
ALTER TABLE `user_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_skills` (`id_skill`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `chat_users`
--
ALTER TABLE `chat_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `post_reactions`
--
ALTER TABLE `post_reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `promos`
--
ALTER TABLE `promos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `reactions`
--
ALTER TABLE `reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trainings`
--
ALTER TABLE `trainings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `user_hobbies`
--
ALTER TABLE `user_hobbies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `user_skills`
--
ALTER TABLE `user_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

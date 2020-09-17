/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

DROP DATABASE IF EXISTS `aplikacija`;
CREATE DATABASE IF NOT EXISTS `aplikacija` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `aplikacija`;

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE IF NOT EXISTS `administrator` (
  `administrator_id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '0',
  `password_hash` varchar(128) NOT NULL DEFAULT '0',
  PRIMARY KEY (`administrator_id`),
  UNIQUE KEY `uq_administrator_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `administrator`;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` (`administrator_id`, `username`, `password_hash`) VALUES
	(1, 'nazg', 'EC83DA3B30F38F9B54F4A2FF5D83FDA1365F06B895465EA2F36428F4337E6D17A719AF0730B3F0F503745FD0161FA383AA7A73B9BF79D900B179911893B791CC'),
	(2, 'kenzinho', '1EABE9CD6371F557D4952CFA907045466ECA5BEECE5B4203136269992A7618304D84B67AF3F83065ECB4470BE9EDB385E597670D4F20DC8A4BA40996F5670203'),
	(3, 'pperic', '6A4C0DC4FCC43BDEA28963DF73E4F8351BCDAE08FDA1516234E8D764AF8178A610BCCA2813D204DFF92A43F0511EB0016C7682CCF7B343D99E01739FC26EF104'),
	(6, 'ppperic', '6A4C0DC4FCC43BDEA28963DF73E4F8351BCDAE08FDA1516234E8D764AF8178A610BCCA2813D204DFF92A43F0511EB0016C7682CCF7B343D99E01739FC26EF104'),
	(8, 'mmilic', '6A4C0DC4FCC43BDEA28963DF73E4F8351BCDAE08FDA1516234E8D764AF8178A610BCCA2813D204DFF92A43F0511EB0016C7682CCF7B343D99E01739FC26EF104'),
	(10, 'admin', '7FCF4BA391C48784EDDE599889D6E3F1E47A27DB36ECC050CC92F259BFAC38AFAD2C68A1AE804D77075E8FB722503F3ECA2B2C1006EE6F6C7B7628CB45FFFD1D'),
	(11, 'test5', '64C26FFE3B35C65DFB93A8FD9A91828C57ED76D3809D06B03E17128125B48E5D01B37BB605A0A0305EFF8341FBD56096664597F5CD091BF036E4CA31B304A9CC');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;

DROP TABLE IF EXISTS `administrator_token`;
CREATE TABLE IF NOT EXISTS `administrator_token` (
  `administrator_token_id` int unsigned NOT NULL AUTO_INCREMENT,
  `administrator_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` text NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`administrator_token_id`),
  KEY `fk_administrator_token_administrator_id` (`administrator_id`),
  CONSTRAINT `fk_administrator_token_administrator_id` FOREIGN KEY (`administrator_id`) REFERENCES `administrator` (`administrator_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `administrator_token`;
/*!40000 ALTER TABLE `administrator_token` DISABLE KEYS */;
INSERT INTO `administrator_token` (`administrator_token_id`, `administrator_id`, `created_at`, `token`, `expires_at`, `is_valid`) VALUES
	(1, 2, '2020-09-10 16:09:02', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNDI1MzQyLjEyMSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk3NDY5NDJ9.5Yy6VUYS0mIyfRXdplIxhTWZOcHaOx7lCai1Op8QE5Y', '2020-10-11 14:09:02', 1),
	(2, 2, '2020-09-10 16:13:32', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNDI1NjEyLjU0NiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk3NDcyMTJ9.pO4Ju1Zth5TlFbF1IkIfEE_-tGsE5sbeE8q3m5BMr4A', '2020-10-11 14:13:32', 1),
	(3, 2, '2020-09-10 18:57:26', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNDM1NDQ2LjUyNSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk3NTcwNDZ9.b_bGaXz10AzbMF82Mq69OdwxmFzfHUKbETA33Wvc3EY', '2020-10-11 16:57:26', 1),
	(4, 2, '2020-09-10 20:58:45', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNDQyNzI1LjE5NSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk3NjQzMjV9.MJ3OBuyepJNnMaJITWjJyhwzcx1922IuNaH3d6n-T4A', '2020-10-11 18:58:45', 1),
	(5, 2, '2020-09-10 22:01:46', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNDQ2NTA2LjM4MiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk3NjgxMDZ9.b8iUBRaDMRVRey0UWGuKwGDp9ZIQYcs50rB_lNQfbtk', '2020-10-11 20:01:46', 1),
	(6, 2, '2020-09-10 22:12:16', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNDQ3MTM2Ljg3NywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk3Njg3MzZ9.uuiKFP78i0CsGIVty_k_haHAI1-MGJnVvQKI4-y2iZ4', '2020-10-11 20:12:16', 1),
	(7, 2, '2020-09-10 22:58:43', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNDQ5OTIzLjMzMSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk3NzE1MjN9.ALJIjHTq0K8_xh7fPxXRaZFHKSKJmerEe_mryy87KC8', '2020-10-11 20:58:43', 1),
	(8, 2, '2020-09-11 14:34:33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTA2MDczLjgzNSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4Mjc2NzN9.1_wklZ1I2PQPVi4YTDN8FxTKehDdbqhNyc2HE8-KH3U', '2020-10-12 12:34:33', 1),
	(9, 2, '2020-09-11 14:46:46', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTA2ODA2LjEyNiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4Mjg0MDZ9.yRcyGlmwxqbIth3ov6TkXfcrDZ9GqHUQHf_1zHyBJro', '2020-10-12 12:46:46', 1),
	(10, 2, '2020-09-11 15:13:07', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTA4Mzg3Ljg1MywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4Mjk5ODd9.7QNgiFPSo_hMx7a93bGeDUjNSP6HYSa95PPBsF-Pk0I', '2020-10-12 13:13:07', 1),
	(11, 2, '2020-09-11 15:13:43', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTA4NDIzLjQ1OCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4MzAwMjN9.f5vHzCvmM4GRKUvwL-iyv8TFjZGzWZrvTGbNU68wrnw', '2020-10-12 13:13:43', 1),
	(12, 2, '2020-09-11 15:20:48', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTA4ODQ4LjIyMSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4MzA0NDh9.LWQZY9e0ZtJuvz98cfwj-Xf3rb_YX9xnD26jzxpdD-U', '2020-10-12 13:20:48', 1),
	(13, 2, '2020-09-11 15:28:35', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTA5MzE1Ljk2OSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4MzA5MTV9.-EjB91kS0gaJTkKRdzIKBo1aRz7tlOV6UYI-Jryk2GU', '2020-10-12 13:28:35', 1),
	(14, 2, '2020-09-11 15:41:36', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTEwMDk2LjY0OSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4MzE2OTZ9.zOa-EaBdzL6K4KjWS0riGx2hwnP3FWCiuFvED1CImQQ', '2020-10-12 13:41:36', 1),
	(15, 2, '2020-09-11 15:41:55', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTEwMTE1LjE3MiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4MzE3MTV9.9_FNK4TvwgxPVi8dNbBDpmqTTJUrKRr_z9VwTAk_PsM', '2020-10-12 13:41:55', 1),
	(16, 2, '2020-09-11 16:04:25', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTExNDY1LjQ1MiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4MzMwNjV9.5NR-IBjegpeQnfBQ739W20EYblNDZkaqcdvVs2O1vLU', '2020-10-12 14:04:25', 1),
	(17, 10, '2020-09-11 16:39:54', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxMCwiaWRlbnRpdHkiOiJhZG1pbiIsImV4cCI6MTYwMjUxMzU5NC42NjYsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjUiLCJpYXQiOjE1OTk4MzUxOTR9.Kc6f8raxm9Wfu-1p5t2Qdf3R3O6zXZoI_OqJMM2OZa0', '2020-10-12 14:39:54', 1),
	(18, 10, '2020-09-11 16:46:07', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxMCwiaWRlbnRpdHkiOiJhZG1pbiIsImV4cCI6MTYwMjUxMzk2Ny40MzcsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjUiLCJpYXQiOjE1OTk4MzU1Njd9.tOqsUlo2hdE9ezre5AkD6I2g8BjFFuQMXhdG8XJinr0', '2020-10-12 14:46:07', 1),
	(19, 2, '2020-09-11 16:48:16', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTE0MDk2LjM5LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg1LjAuNDE4My4xMDIgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTgzNTY5Nn0.js0YmqpwElLDpEV2nQGa6mjg3Ud3m3dw49iaCMSS0jI', '2020-10-12 14:48:16', 1),
	(20, 2, '2020-09-11 17:13:49', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTE1NjI5Ljk3NiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4MzcyMjl9.tkDpmAcJlT85q_acQXO0Ryzfxq-WdIA3m_QGUI_EXV0', '2020-10-12 15:13:49', 1),
	(21, 2, '2020-09-11 17:16:17', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTE1Nzc3LjI3OSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4MzczNzd9.q3ImHh9jnhysswi_Ucr0kfJQs_ithgfDADmc8aZlsBc', '2020-10-12 15:16:17', 1),
	(22, 2, '2020-09-11 17:50:14', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTE3ODE0LjkzMSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4Mzk0MTR9.4ZutdtTh31rSyFtZOMJvyqx7QtYehQsQVXwEOCxiVcA', '2020-10-12 15:50:14', 1),
	(23, 2, '2020-09-11 18:23:24', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTE5ODA0LjQ1OSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4NDE0MDR9.Ih6IIQ_6NBdmlJhHd3kmGPG2maIurtUDMwZ5LAZVNrI', '2020-10-12 16:23:24', 1),
	(24, 2, '2020-09-11 18:55:59', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNTIxNzU5LjI4NywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk4NDMzNTl9.tNgg0GzurgMt8ERPCXNGmhje9n79kD0zyrc694alryA', '2020-10-12 16:55:59', 1),
	(25, 2, '2020-09-13 16:29:07', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNjg1NzQ3Ljg3MSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAwMDczNDd9.QOslTsc7UXNV6Z9vAPtOtIUYi_a1dK6rZknwnWvU-90', '2020-10-14 14:29:07', 1),
	(26, 2, '2020-09-13 17:30:31', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNjg5NDMxLjQwOSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAwMTEwMzF9.X3-NPkbEQ50Ql5UiFClDN97l91N1_SEhlrkR-cWMzXs', '2020-10-14 15:30:31', 1),
	(27, 10, '2020-09-13 19:25:27', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxMCwiaWRlbnRpdHkiOiJhZG1pbiIsImV4cCI6MTYwMjY5NjMyNy4xMDksImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjUiLCJpYXQiOjE2MDAwMTc5Mjd9.Bh24y8pDw-iN019OWa1xAG5G-noL8FWgqK_G-zRgmfU', '2020-10-14 17:25:27', 1),
	(28, 2, '2020-09-13 19:38:30', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNjk3MTEwLjE4NiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAwMTg3MTB9.zS07L0VZfjFDdt_H0PQ0P7hIkV1PGpLgtNQulx8JstU', '2020-10-14 17:38:30', 1),
	(29, 2, '2020-09-14 14:24:18', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNzY0NjU4LjQyMywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAwODYyNTh9.AHfTkkWeFetNPEr8DkYERwu_MoM74jUHZZGPYpvdjW0', '2020-10-15 12:24:18', 1),
	(30, 2, '2020-09-14 14:48:46', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNzY2MTI2LjE5OCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAwODc3MjZ9.p8RtcpT0DX5OkNBiJTKfl6FLFLuT1mcGroyA0sNIpTg', '2020-10-15 12:48:46', 1),
	(31, 2, '2020-09-14 16:52:47', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNzczNTY3LjMxLCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg1LjAuNDE4My4xMDIgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTYwMDA5NTE2N30.S4zOmMJHjaBiHIITD9vy-M4gV_2oaX2aNkm5WJlqZuk', '2020-10-15 14:52:47', 1),
	(32, 2, '2020-09-14 17:02:15', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyNzc0MTM1Ljc5MywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAwOTU3MzV9.tc28YVDcwYRUHoY6zDF-h3hJTLoB1JUaz0bqgFyRoR0', '2020-10-15 15:02:15', 1),
	(33, 2, '2020-09-15 13:40:27', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyODQ4NDI3LjE3MywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAxNzAwMjd9.CMjMY7l7tSrpzaYPGT-IuY4J1XtHzA7nBtgxxEzNqSE', '2020-10-16 11:40:27', 1),
	(34, 2, '2020-09-15 13:48:28', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyODQ4OTA4LjkyOSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAxNzA1MDh9.aJRNMUELaVp09krHpC_8yzf7JGdDDa-5hp3y9dRb90M', '2020-10-16 11:48:28', 1),
	(35, 2, '2020-09-15 14:05:18', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyODQ5OTE4LjU0NCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAxNzE1MTh9.Yc9fPC0uFuoIm4qkzxV1juvY1KN5U9PuDGknGHP20AM', '2020-10-16 12:05:18', 1),
	(36, 2, '2020-09-15 14:06:15', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyODQ5OTc1LjQzNiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAxNzE1NzV9.m4rVUorUCYEoEWhqxz_D0FMpr_2IeGG2Q7P3qSuQg-E', '2020-10-16 12:06:15', 1),
	(37, 2, '2020-09-15 14:10:41', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyODUwMjQxLjkxNiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAxNzE4NDF9.PSieO_DwImQHj9pPAPBDTjy6KBvNRbOUXZ7QHfQ9K8Q', '2020-10-16 12:10:41', 1),
	(38, 10, '2020-09-15 14:13:32', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxMCwiaWRlbnRpdHkiOiJhZG1pbiIsImV4cCI6MTYwMjg1MDQxMi40NjgsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjUiLCJpYXQiOjE2MDAxNzIwMTJ9.FtT-qn8y6uzQzoaOB9x6g5ojJovbOa38j7vYWBgGLIc', '2020-10-16 12:13:32', 1),
	(39, 2, '2020-09-15 14:15:00', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyODUwNTAwLjM4NCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAxNzIxMDB9.OFxY-YfRPeGbgmFhcA2RBxvMxIpuJgekevPUeoyhAtM', '2020-10-16 12:15:00', 1),
	(40, 2, '2020-09-15 14:55:16', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyODUyOTE2LjQyNywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAxNzQ1MTZ9.Dq7oj8IW9BfTih4Wt1tgUpFADlxMgltCjaEVk01dAvU', '2020-10-16 12:55:16', 1),
	(41, 2, '2020-09-15 15:41:35', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyODU1Njk1LjU1NywiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAxNzcyOTV9.eJIy1jcz5qfG9t39XWvZB9Qul60xfyJaje4VXtv4L5E', '2020-10-16 13:41:35', 1),
	(42, 2, '2020-09-15 15:46:35', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyODU1OTk1LjcwNSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAxNzc1OTV9.KiFcXLDAY8yTzMc9SZnSAL4zbmrRmXhsFdXx0Drzlkg', '2020-10-16 13:46:35', 1),
	(43, 10, '2020-09-15 16:18:36', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxMCwiaWRlbnRpdHkiOiJhZG1pbiIsImV4cCI6MTYwMjg1NzkxNi4yNjksImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjUiLCJpYXQiOjE2MDAxNzk1MTZ9.a9_Ba0N_H6pl3VEFNvK07qBPXndZcZe5xv9wH4PKIcg', '2020-10-16 14:18:36', 1),
	(44, 2, '2020-09-15 16:24:25', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyODU4MjY1LjA5NCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAxNzk4NjV9.ZzvJZ1sZwPcEJDWhiavP2x9SFw0dQrvq5uta6y39jZU', '2020-10-16 14:24:25', 1),
	(45, 10, '2020-09-15 16:29:37', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxMCwiaWRlbnRpdHkiOiJhZG1pbiIsImV4cCI6MTYwMjg1ODU3Ny44NjgsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjUiLCJpYXQiOjE2MDAxODAxNzd9.8n8h5AfEL1F65-LmB5pIfE5U5uOtewyzFwA4oEzQ2tY', '2020-10-16 14:29:37', 1),
	(46, 2, '2020-09-16 18:21:36', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAyOTUxNjk2LjY2OSwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAyNzMyOTZ9.nMloOza6pt1HoWNVclWMamG_NV0PFNRMUlJCM4G__bs', '2020-10-17 16:21:36', 1),
	(47, 10, '2020-09-17 16:38:37', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxMCwiaWRlbnRpdHkiOiJhZG1pbiIsImV4cCI6MTYwMzAzMTkxNy43MDUsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjUiLCJpYXQiOjE2MDAzNTM1MTd9.P8LcM9SLfPQoWVYdhNMU3A1r4wYoc5uHKpbtdtC2K-8', '2020-10-18 14:38:37', 1),
	(48, 2, '2020-09-17 16:43:21', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoyLCJpZGVudGl0eSI6ImtlbnppbmhvIiwiZXhwIjoxNjAzMDMyMjAxLjk1NiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAzNTM4MDF9.bbYw1sKj3JR-zoNCoAQvK5VhGGKw2QGZQpeljKb4R-c', '2020-10-18 14:43:21', 1),
	(49, 10, '2020-09-17 17:16:33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYWRtaW5pc3RyYXRvciIsImlkIjoxMCwiaWRlbnRpdHkiOiJhZG1pbiIsImV4cCI6MTYwMzAzNDE5My45NDYsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjUiLCJpYXQiOjE2MDAzNTU3OTN9.Y7V8V8oS7YshGxAQcPrasSJCVG6KOY7Bl1_wqDejLyQ', '2020-10-18 15:16:33', 1);
/*!40000 ALTER TABLE `administrator_token` ENABLE KEYS */;

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '0',
  `category_id` int unsigned NOT NULL DEFAULT '0',
  `excerpt` varchar(255) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `status` enum('available','visible','hidden') NOT NULL DEFAULT 'available',
  `is_promoted` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_id`),
  KEY `fk_article_category_id` (`category_id`),
  CONSTRAINT `fk_article_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `article`;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`article_id`, `name`, `category_id`, `excerpt`, `description`, `status`, `is_promoted`, `created_at`) VALUES
	(1, 'WHIRLPOOL Mašina za pranje veša FWL61252W', 4, 'Šifra: FWL61252W FRESH CARE ID: 127678', 'Energetski razred: A++ \r\nKapacitet pranja: 6kg\r\nBroj obrtaja centrifuge:1200 obr/min\r\nNivo buke:63 dB', 'available', 1, '2020-08-20 22:14:19'),
	(2, 'VOX Kombinovani frižider KS 2510', 5, 'Šifra: KS 2510 ID: 108095', 'Kombinovani frižider sa zapreminom od 222 l\nZapremina frižidera iznosi 205 l\nZamrzivač u gornjem delu tapremine 14 l\nFrižider sadrži 4 staklene police, 1 fioku, 5 polica na vratima\nKlimatska klasa: ST', 'visible', 1, '2020-08-21 19:54:03'),
	(3, 'MIDEA Frižider sa jednim vratima HS 121LN, Ručno otapanje', 5, 'Šifra: HS 121LN ID: 107255', 'Energetska klasa: A+\nKapacitet frižidera: 93 l\nDimenzije (ŠxVxD): 47.2 x 85 x 45 cm\nRashladno sredstvo (Gas): R600a\nMehanička kontrola temperature', 'visible', 1, '2020-08-21 19:56:39'),
	(4, 'Tesla Side by side frižider RM6400FMX, Total No Frost', 5, 'Šifra: RM6400FMX ID: 140291', 'Energetska klasa: A\nZapremina frižidera: 455 l\nDimenzije: 90,5 cm x 193,5 cm x 77,5 cm\nTehnologija hlađenja: Total No Frost\nZapremina zamrzivača: 92 l\nNivo buke: 43 dB', 'available', 0, '2020-08-21 19:56:45'),
	(5, 'GORENJE Električni šporet E 5121 WH, Konvencionalna rerna', 13, 'Šifra: E 5121 WH ID: 128772', 'Energetska klasa: A\nElektrični šporet sa 4 ringle\nZapremina rerne: 68 l\nDimenzije: 50 × 85 × 59,4 cm\nČišćenje sa AquaClean funkcijom\n1 ekspres električna ploča', 'visible', 0, '2020-09-01 16:33:12'),
	(8, 'VOX Pegla DBL 5071', 6, 'Šifra: DBL 5071 ID: 104839', 'Odlična pegla sa varijabilno podesivom parom\nKeramička grejna ploča - omogućava peglanje bez lepljenja tkanine\nProzirni rezervoar za lako punjenje od 300 ml\nMogućnost suvog peglanja bez pare sa snagom od 2400 W', 'available', 0, '2020-09-11 18:24:25'),
	(9, 'GORENJE Frižider sa jednim vratima R 6295 W, Samootapajući', 5, 'Šifra: R 6295 W ID: 110064', 'Energetska klasa: A\nKapacitet frižidera: 284 l\nDimenzije (ŠxVxD): 60 × 143,5 × 62,5 cm\nNivo buke: 40 dB\nRashladno sredstvo (Gas): R600a', 'available', 0, '2020-09-15 13:45:08'),
	(10, 'SAMSUNG Mašina za pranje veša WW 70K5210UX', 4, 'Šifra: WW 70K5210UX ID: 112904', 'Energetski razred: A+++\nKapacitet pranja: 7 kg\nBroj obrtaja centrifuge: 1200 obr/min\nNivo buke: 54 dB(A)', 'available', 0, '2020-09-15 13:49:29'),
	(11, 'LG Mašina za pranje veša F0J5WN3W', 4, 'Šifra: F0J5WN3W ID: 126506', 'Energetski razred: A+++\nKapacitet pranja: 6.5 kg\nBroj obrtaja centrifuge: 1000 obr/min\nNivo buke: 55 dB(A)', 'available', 0, '2020-09-15 14:04:50'),
	(12, 'INDESIT Mašina za pranje veša EWSD 61051 W EU', 4, 'Šifra: EWSD 61051 W EU ID: 105814', 'Energetski razred: A+\nKapacitet pranja: 6kg\nBroj obrtaja centrifuge: 1000 obr/min\nNivo buke: 60dB(A)', 'available', 0, '2020-09-15 14:17:29'),
	(13, 'BEKO Električni šporet FSE 67310 GX, Ventilatorska rerna', 13, 'Šifra: FSE 67310 GX ID: 121526', 'Energetska klasa: A\nElektrični šporet sa staklokeramičkom pločom\nZapremina rerne: 66 l\nDimenzije: (ŠxVxD) 60 x 85 x 60 cm\nElektrični gril\nLED ekran', 'available', 0, '2020-09-15 15:31:58'),
	(14, 'Gorenje Pegla SIH 2200GC', 6, 'Šifra: SIH 2200 GC ID: 110846', 'Snaga grejača 2200 W\nSistem protiv skupljanja kamenca\nFunkcija samočišćenja\nVertikalni ispust pare\nMogućnost dolivanja vode tokom peglanja', 'available', 0, '2020-09-15 15:40:53'),
	(15, 'Bosch multipraktik MUM 44R1', 7, 'Šifra: MUM 44R1 ID: 109241', 'Priključna snaga 500 W\n"Multi-motion-drive" mutilica – specijalno prilagođeni kružni pokreti mutilica sa dodatnom rotacijom oko svoje ose daju odlične i ujednačene rezultate mućenja testa, šlaga ili fila za tortu', 'available', 0, '2020-09-15 15:52:39'),
	(16, 'Gorenje Kuhinjski robot MMC700LBW', 7, 'Šifra: MMC 700 LBW ID: 151474', 'Izuzetno snažan motor od 800 W tihog rada\nOdlični rezultati mešanja i precizan nadzor u svakom trenutku\n6 različitih brzina za vrhunsku pripremu hrane\nGumirane nogice garantujustabilnost aparata tokom rada\nZapremina posude za mešanje od 4 l', 'available', 0, '2020-09-15 15:55:30'),
	(17, 'Tefal mikser HT 615138', 7, 'Šifra: HT 615138 ID: 107316', 'Pet brzina + turbo\nMetalne žice za mućenje i žice za testo\nLopatica\nPlastična posuda kapaciteta 3,3l\nDodaci se mogu prati u mašini za pranje sudova\nTaster za izbacivanje', 'available', 0, '2020-09-15 15:56:33'),
	(18, 'VOX toster TO-8218', 8, 'Šifra: TO 8218 ID: 111905', 'Toster\n750 W\n2 kriške hleba\nElektronska kontrola pečenja (6 nivoa), taster za prekid operacije, prostor za skladištenje kabla, automatsko izbacivanje hleba i automatsko gašenje, pleh za mrvice za lakše čišćenje, svetlosni indikator, višefunkcionalan', 'available', 0, '2020-09-15 15:58:23'),
	(19, 'BOSCH Toster TAT 3A014', 8, 'Šifra: TAT 3A014 ID: 111655', 'Priključna snaga: najviše 825-980 W\nZa 2 kriške tosta\nPljosnati grejni elementi\nAutomatsko centriranje hleba za jednakomerno pečenje\nUgrađen nastavak za žemljice od nerđajućeg čelika', 'available', 0, '2020-09-15 16:00:18'),
	(20, 'FIRST Aparat za sendviče 5337 3', 8, 'Šifra: 5337 3 ID: 102895', 'Za 2 sendviča\nNelepljiva površina\nSvetlosni indikator\nIndikator temperature\nTermostat za kontrolu temperature\nNapajanje: 220-240V, 50Hz, 700-800W', 'available', 0, '2020-09-15 16:01:21'),
	(21, 'VOX Standardna klima VSA7 24BE', 9, 'Šifra: VSA7 24BE ID: 112584', 'Tehnologija motora: On/Off\nGas: R410A\nKapacitet hlađenja: 24000 BTU\nWi-Fi: Ready\nGarancija: 5 godina bezuslovno', 'available', 0, '2020-09-15 16:07:32'),
	(22, 'VIVAX Standardna klima ACP 12CH35AEV', 9, 'Šifra: ACP 12CH35AEV ID: 131639', 'Tehnologija motora: On/Off\nGas: R410A\nKapacitet hlađenja: 12000 BTU\nWi-Fi: Ne\nGarancija: Zakonska saobraznost', 'available', 0, '2020-09-15 16:08:32'),
	(23, 'GREE Standardna klima GWH24ACD K3NNA1A', 9, 'Šifra: GWH24ACD K3NNA1A ID: 132609', 'Tehnologija motora: On/Off\nGas: R410A\nKapacitet hlađenja: 24000 BTU\nWi-Fi: Ne\nGarancija: 2 + 3 godine', 'available', 0, '2020-09-15 16:09:38'),
	(24, 'Milan Blagojević peć na čvrsto gorivo HIT CRVENI', 10, 'Šifra: HIT CRVENI ID: 107049', 'Šestougaona kaminska peć, sa evropskim sertifikatima i veoma pristupačnom cenom.\nNazivna toplotna snaga\ndrvo 11 kW\nugalj 13 kW\nStepen iskorišćenja\ndrvo 82%', 'available', 0, '2020-09-15 16:12:00'),
	(25, 'ALFA PLAM Kamin RUSTIKAL', 10, 'Šifra: RUSTIKAL ID: 110373', 'Snaga peći 11 kW\nPrečnik dimovodnog nastavka 120 mm\nVisina dimovodnog nastavka 650 mm\nPotrebna promaja dimnjaka 12 Pa\nZapremina zagrevanja 183 m³\nPovršina zagrevanja 70 m2', 'available', 0, '2020-09-15 16:18:14'),
	(26, 'Tim Sistem Kamin TS-S', 10, 'Šifra: TS-S ID: 147556', 'Odličan kamin sa vatrootpornim staklom pruža osećaj sigurnosti i topline\nIzrađen od čeličnog lima sa ložištem obloženim vermikulitom i šamotom\nŠtedi prostor zahvaljujući dimodovnoj cevi na gornjoj ploči\nLako prenosiv i jednostavan za rukovanje', 'available', 0, '2020-09-15 16:21:31'),
	(27, 'Canon Kompaktni foto-aparat SX620HS - Crni', 12, 'Šifra: SX620HS BK ID: 130941', '\nTip: Kompaktni\nEfektivni pikseli: 20.2 Mpix\nVeličina ekrana: 3"\nSenzor slike: CMOS\nOptički zum: 25x\nDigitalni zum: 4x', 'available', 0, '2020-09-15 16:25:16'),
	(28, 'Sony Foto-aparat Cyber-shot DSC-W810S - Srebrni', 12, 'Šifra: DSCW 810S ID: 104999', 'Senzor\nTip senzora 1/2,3-inčni Super HAD CCD (7,76 mm)\nEfektivni pikseli Približno 20,1 megapiksela\nObjektiv\nTip objektiva Sony G objektiv\nF-broj F3,5 (Š) – 6,5 (T)', 'available', 0, '2020-09-15 16:28:26'),
	(29, 'Nikon Kompaktni foto-aparat sa torbicom i SD karticom COOLPIX B600 - Crni', 12, 'Šifra: NIKON COOLPIX B600C ID: 153898', 'Kompaktni digitalni foto-aparat sa CMOS senzorom\nRezolucija foto-aparata 16 MP\nEkran dijagonale od 7,6 cm\nNIKKOR objektiv sa optičkim zumom od 60x\nKonstrukcija objektiva 16 elemenata u 11 grupa - 4 ED elementa i 1 super ED element objektiva', 'available', 0, '2020-09-15 16:29:26');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

DROP TABLE IF EXISTS `article_feature`;
CREATE TABLE IF NOT EXISTS `article_feature` (
  `article_feature_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `feature_id` int unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_feature_id`),
  UNIQUE KEY `uq_article_feature_article_id_feature_id` (`article_id`,`feature_id`),
  KEY `fk_article_feature_feature_id` (`feature_id`),
  CONSTRAINT `fk_article_feature_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_article_feature_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `article_feature`;
/*!40000 ALTER TABLE `article_feature` DISABLE KEYS */;
INSERT INTO `article_feature` (`article_feature_id`, `article_id`, `feature_id`, `value`) VALUES
	(18, 10, 8, 'SAMSUNG'),
	(19, 10, 9, '7kg'),
	(20, 11, 8, 'LG'),
	(21, 11, 9, '6,5'),
	(22, 12, 8, 'INDESIT'),
	(23, 12, 9, '6kg'),
	(26, 2, 7, 'VOX'),
	(27, 2, 11, 'A+'),
	(32, 3, 7, 'MIDEA'),
	(33, 3, 11, 'A+'),
	(34, 4, 7, 'Tesla'),
	(41, 1, 8, 'WHIRLPOOL'),
	(42, 1, 9, '6kg'),
	(43, 9, 7, 'GORENJE'),
	(44, 9, 11, 'A'),
	(45, 13, 12, 'Beko'),
	(46, 13, 13, 'A'),
	(47, 5, 12, 'GORENJE'),
	(48, 5, 13, 'A'),
	(50, 15, 17, 'Bosch'),
	(51, 15, 18, '500W'),
	(52, 16, 17, 'Gorenje'),
	(53, 16, 18, '800W'),
	(54, 17, 17, 'Tefal'),
	(55, 17, 18, '650W'),
	(56, 18, 19, 'VOX'),
	(57, 18, 20, '750W'),
	(58, 19, 19, 'BOSCH'),
	(59, 19, 20, '980W'),
	(60, 20, 19, 'FIRST'),
	(61, 20, 20, '800W'),
	(64, 22, 21, 'VIVAX'),
	(65, 22, 22, '12000 BTU'),
	(66, 21, 21, 'VOX'),
	(67, 21, 22, '24000 BTU'),
	(68, 23, 21, 'GREE'),
	(69, 23, 22, '24000 BTU'),
	(70, 24, 23, 'Milan Blagojević'),
	(71, 24, 24, '80kg'),
	(72, 25, 23, 'ALFA PLAM'),
	(73, 25, 24, '125'),
	(74, 26, 23, 'Tim'),
	(75, 26, 24, '98'),
	(76, 27, 25, 'Canon'),
	(77, 27, 26, '20'),
	(78, 28, 25, 'Sony'),
	(79, 28, 26, '16'),
	(80, 29, 25, 'Nikon'),
	(81, 29, 26, '56');
/*!40000 ALTER TABLE `article_feature` ENABLE KEYS */;

DROP TABLE IF EXISTS `article_price`;
CREATE TABLE IF NOT EXISTS `article_price` (
  `article_price_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`article_price_id`),
  KEY `fk_article_price_article_id` (`article_id`),
  CONSTRAINT `fk_article_price_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `article_price`;
/*!40000 ALTER TABLE `article_price` DISABLE KEYS */;
INSERT INTO `article_price` (`article_price_id`, `article_id`, `price`, `created_at`) VALUES
	(1, 1, 45.00, '2020-08-20 23:20:01'),
	(2, 1, 43.00, '2020-08-20 23:20:15'),
	(3, 2, 56.77, '2020-08-21 19:54:04'),
	(4, 3, 56.77, '2020-08-21 19:56:39'),
	(5, 4, 56.77, '2020-08-21 19:56:45'),
	(6, 2, 57.11, '2020-08-28 00:38:17'),
	(8, 5, 45.00, '2020-09-01 16:36:28'),
	(9, 8, 0.01, '2020-09-11 18:24:25'),
	(10, 9, 240.00, '2020-09-15 13:45:08'),
	(11, 10, 640.00, '2020-09-15 13:49:29'),
	(12, 11, 400.00, '2020-09-15 14:15:51'),
	(13, 12, 230.00, '2020-09-15 14:17:30'),
	(14, 2, 210.00, '2020-09-15 14:43:07'),
	(15, 4, 1100.00, '2020-09-15 14:55:55'),
	(16, 3, 140.00, '2020-09-15 14:57:34'),
	(17, 1, 265.00, '2020-09-15 15:17:49'),
	(18, 13, 365.00, '2020-09-15 15:31:58'),
	(19, 5, 162.00, '2020-09-15 15:34:11'),
	(20, 14, 21.00, '2020-09-15 15:40:53'),
	(21, 8, 24.00, '2020-09-15 15:45:06'),
	(22, 15, 94.00, '2020-09-15 15:52:39'),
	(23, 16, 101.00, '2020-09-15 15:55:30'),
	(24, 17, 97.00, '2020-09-15 15:56:33'),
	(25, 18, 18.00, '2020-09-15 15:58:23'),
	(26, 19, 51.00, '2020-09-15 16:00:18'),
	(27, 20, 15.00, '2020-09-15 16:01:21'),
	(28, 21, 0.01, '2020-09-15 16:07:32'),
	(29, 22, 250.00, '2020-09-15 16:08:32'),
	(30, 21, 500.00, '2020-09-15 16:08:42'),
	(31, 23, 700.00, '2020-09-15 16:09:38'),
	(32, 24, 210.00, '2020-09-15 16:12:00'),
	(33, 25, 445.00, '2020-09-15 16:18:14'),
	(34, 26, 354.00, '2020-09-15 16:21:31'),
	(35, 27, 235.00, '2020-09-15 16:25:16'),
	(36, 28, 112.00, '2020-09-15 16:28:26'),
	(37, 29, 330.00, '2020-09-15 16:29:26');
/*!40000 ALTER TABLE `article_price` ENABLE KEYS */;

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `fk_cart_user_id` (`user_id`),
  CONSTRAINT `fk_cart_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`cart_id`, `user_id`, `created_at`) VALUES
	(1, 1, '2020-08-31 19:31:56'),
	(2, 1, '2020-08-31 20:16:43'),
	(3, 1, '2020-08-31 22:12:24'),
	(4, 1, '2020-08-31 22:13:52'),
	(5, 1, '2020-09-09 01:40:29'),
	(6, 1, '2020-09-09 14:53:32'),
	(7, 1, '2020-09-09 16:40:57'),
	(8, 1, '2020-09-13 17:31:07'),
	(9, 1, '2020-09-13 17:31:18');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

DROP TABLE IF EXISTS `cart_article`;
CREATE TABLE IF NOT EXISTS `cart_article` (
  `cart_article_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cart_id` int unsigned NOT NULL DEFAULT '0',
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cart_article_id`),
  UNIQUE KEY `uq_cart_article_cart_id_article_id` (`cart_id`,`article_id`),
  KEY `fk_cart_article_article_id` (`article_id`),
  CONSTRAINT `fk_cart_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cart_article_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `cart_article`;
/*!40000 ALTER TABLE `cart_article` DISABLE KEYS */;
INSERT INTO `cart_article` (`cart_article_id`, `cart_id`, `article_id`, `quantity`) VALUES
	(1, 1, 1, 5),
	(2, 1, 2, 2),
	(4, 2, 2, 2),
	(5, 3, 2, 2),
	(6, 4, 1, 1),
	(7, 5, 1, 1),
	(8, 5, 5, 6),
	(9, 6, 5, 3),
	(10, 6, 2, 3),
	(11, 7, 5, 5),
	(12, 8, 3, 4),
	(13, 8, 2, 1),
	(15, 9, 12, 1);
/*!40000 ALTER TABLE `cart_article` ENABLE KEYS */;

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '0',
  `image_path` varchar(128) NOT NULL DEFAULT '0',
  `parent__category_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uq_category_name` (`name`),
  UNIQUE KEY `uq_category_image_path` (`image_path`),
  KEY `fk_category_parent__category_id` (`parent__category_id`),
  CONSTRAINT `fk_category_parent__category_id` FOREIGN KEY (`parent__category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `category`;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category_id`, `name`, `image_path`, `parent__category_id`) VALUES
	(1, 'Bela Tehnika', '../storage/photos/2020915-1245287509-dz.jpg', NULL),
	(2, 'Mali Kucni Aparati', '0tee', NULL),
	(3, 'Klima Uredjaji i Grejanje', '0', NULL),
	(4, 'Ves Masine', '0test', 1),
	(5, 'Frizideri', 'Frizideri', 1),
	(6, 'Pegle', 'eef', 2),
	(7, 'Mikseri', 'fewfwe', 2),
	(8, 'Tosteri', 'fwerds', 2),
	(9, 'Klima Uredjaji', 'cdscsd', 3),
	(10, 'Grejanje', 'fvreg', 3),
	(12, 'Foto-aparati i Kamere', 'RandomLink', NULL),
	(13, 'Sporeti', 'https://www.svetlostnis.rs/wp-content/uploads/2014/03/S_140_55_13.png', 1);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

DROP TABLE IF EXISTS `feature`;
CREATE TABLE IF NOT EXISTS `feature` (
  `feature_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '0',
  `category_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`feature_id`),
  UNIQUE KEY `uq_feature_name_category_id` (`name`,`category_id`),
  KEY `fk_feature_category_id` (`category_id`),
  CONSTRAINT `fk_feature_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `feature`;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
INSERT INTO `feature` (`feature_id`, `name`, `category_id`) VALUES
	(26, 'Efektivni pikseli', 12),
	(11, 'Energetska klasa', 5),
	(13, 'Energetska klasa', 13),
	(10, 'Energetski razred', 4),
	(1, 'Kapacitet', 3),
	(9, 'Kapacitet', 4),
	(22, 'Kapacitet hlađenja', 9),
	(18, 'Priključna snaga', 7),
	(8, 'Robna marka', 4),
	(7, 'Robna marka', 5),
	(14, 'Robna marka', 6),
	(17, 'Robna marka', 7),
	(19, 'Robna marka', 8),
	(21, 'Robna marka', 9),
	(23, 'Robna marka', 10),
	(25, 'Robna marka', 12),
	(12, 'Robna marka', 13),
	(16, 'Snaga', 6),
	(20, 'Snaga', 8),
	(24, 'Tezina', 10);
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cart_id` int unsigned NOT NULL DEFAULT '0',
  `status` enum('rejected','accepted','shipped','pending') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `uq_order_cart_id` (`cart_id`),
  CONSTRAINT `fk_order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `order`;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`order_id`, `created_at`, `cart_id`, `status`) VALUES
	(1, '2020-08-31 20:13:22', 1, 'pending'),
	(3, '2020-08-31 22:12:19', 2, 'accepted'),
	(4, '2020-08-31 22:13:07', 3, 'accepted'),
	(5, '2020-08-31 22:14:47', 4, 'rejected'),
	(6, '2020-09-09 14:53:29', 5, 'pending'),
	(7, '2020-09-09 15:26:42', 6, 'pending'),
	(8, '2020-09-09 16:41:05', 7, 'pending'),
	(9, '2020-09-13 17:31:06', 8, 'pending');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `photo_id` int unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int unsigned NOT NULL DEFAULT '0',
  `image_path` varchar(128) NOT NULL DEFAULT '0',
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `uq_photo_image_path` (`image_path`),
  KEY `fk_photo_article_id` (`article_id`),
  CONSTRAINT `fk_photo_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `photo`;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` (`photo_id`, `article_id`, `image_path`) VALUES
	(27, 9, '2020915-1650344831-frizider1.jpg'),
	(28, 10, '2020915-8810107766-vesmasina1.jpg'),
	(29, 10, '2020915-7690572326-vesmasina2.jpg'),
	(32, 11, '2020915-1286561336-vesmasina3.jpg'),
	(33, 11, '2020915-8187017245-vesmasina4.jpg'),
	(34, 12, '2020915-6067706007-vesmasina5.jpg'),
	(35, 2, '2020915-1576887185-frizider2.jpg'),
	(36, 3, '2020915-2124463128-frizider3.jpg'),
	(37, 4, '2020915-0834798230-frizider4.jpg'),
	(38, 4, '2020915-1462885755-frizider5.jpg'),
	(39, 1, '2020915-2119367575-33.jpg'),
	(40, 13, '2020915-4292168827-sporet1.jpg'),
	(41, 5, '2020915-6256157914-124.jpg'),
	(42, 14, '2020915-3166664381-peg.jpg'),
	(43, 14, '2020915-2554461873-peg2.jpg'),
	(44, 8, '2020915-2783389514-pegl3.jpg'),
	(45, 15, '2020915-0225451192-mix1.jpg'),
	(46, 16, '2020915-5532315893-mix2.jpg'),
	(47, 16, '2020915-2712743286-mix22.jpg'),
	(48, 17, '2020915-7382948384-mix3.jpg'),
	(49, 18, '2020915-4332866444-tos1.jpg'),
	(50, 19, '2020915-2485169440-w2.jpg'),
	(51, 20, '2020915-3282238433-w3.jpg'),
	(52, 21, '2020915-0287751132-kl.jpg'),
	(53, 22, '2020915-9255873812-kl2.jpg'),
	(54, 23, '2020915-2383751357-kl3.jpg'),
	(55, 24, '2020915-2327713017-gre.jpg'),
	(56, 25, '2020915-9900853546-grejz.jpg'),
	(57, 26, '2020915-4768393368-fgr.jpg'),
	(58, 27, '2020915-9687635364-fo.jpg'),
	(59, 28, '2020915-7293112971-sn.jpg'),
	(60, 29, '2020915-1245287509-dz.jpg');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '0',
  `password_hash` varchar(128) NOT NULL DEFAULT '0',
  `forename` varchar(64) NOT NULL DEFAULT '0',
  `surname` varchar(64) NOT NULL DEFAULT '0',
  `phone_number` varchar(24) NOT NULL DEFAULT '0',
  `postal_address` text NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_user_email` (`email`),
  UNIQUE KEY `uq_user_phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `email`, `password_hash`, `forename`, `surname`, `phone_number`, `postal_address`) VALUES
	(1, 'test@test.rs', '8D2F4D9C7F87141F0810F1ACD6C0462FF0319BB049AA88EA4E310649628091DE316CF1392E19AF4F0A327826545F63E4E969838F5E7D572A475DE3255B738ACA', 'Pera', '0', '+381631458753', 'Random adresa bb, Glavna Luka, Nedodjija'),
	(3, 'test123@test.rs', '9E7CEF6F71EBA3349AEDD9E9E8BDF34F0604F65837488B690AB543CAA3CD7BCA26FB2D845AFFA64DF3879BB68F1BD60239BE397055FF5C8E53201155BE8A40CE', 'Nikola', '0', '+381657654875', 'Test adresa bb, Glavna Luka, Nedodjija'),
	(4, 'rupkenzmvm1g@gmail.com', '56EE45CA22906E2333FFC7B2CF8836D0EAE0A8DEF5A193B2415DCCFDE68EE736ECA49C70F25ADFDC77B4090846CFABF731FF6BB9DEF3531A457A95D3766A4107', 'Nemanja', '0', '+381621887045', 'Jovijanova 7a\nfwerfwefwe\nfwefwefwe'),
	(5, 'fewfewfwe@live.com', '8733D379F9F47610FD25A69DCB274B0FE7F3688867F91497A92977815459C08B5E99DCF89E1FA7B73DDFD0EF9D19CB33D7E490B5A18E639ACC36B4A6F0FA6C59', 'Jfewfwe', '0', '+381621843556', 'Jovijanova 7a\n11000\nBeogradd\n');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

DROP TABLE IF EXISTS `user_token`;
CREATE TABLE IF NOT EXISTS `user_token` (
  `user_token_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token` text NOT NULL,
  `expires_at` datetime NOT NULL,
  `is_valid` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_token_id`),
  KEY `fk_user_token_user_id` (`user_id`),
  CONSTRAINT `fk_user_token_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DELETE FROM `user_token`;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
INSERT INTO `user_token` (`user_token_id`, `user_id`, `created_at`, `token`, `expires_at`, `is_valid`) VALUES
	(1, 1, '2020-09-02 15:14:59', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMTczMDg5OS41NDcsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjMiLCJpYXQiOjE1OTkwNTI0OTl9.w0E-QavWQ59j4YiynQdBbyM787aoOYLUOd7huj9VjLs', '2020-10-03 13:14:59', 1),
	(4, 1, '2020-09-07 13:06:10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE1NTE3MC4wNCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTQ3Njc3MH0.P6yXbDksx-b4p8tWMrUdgGNJFuFLpli9Y5mnrWQ2VCk', '2020-10-08 11:06:10', 1),
	(5, 1, '2020-09-07 13:45:34', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE1NzUzNC43MjQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk0NzkxMzR9.1J4uvaxhyM9QtIGuRpSP7uB6mo3bb7V8O9Pm_JzAYBA', '2020-10-08 11:45:34', 1),
	(6, 1, '2020-09-07 19:11:51', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE3NzExMS4wNjcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk0OTg3MTF9.7LM3vktGI7CIPw5shqaQ_xO3pXJR8Ovc_oSQhN1Lrew', '2020-10-08 17:11:51', 1),
	(7, 1, '2020-09-07 20:14:14', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE4MDg1NC4zMDcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MDI0NTR9.9oFQ6qsigXhuisNVfZFDb5ujh63tw1PvcOTqDpFiNww', '2020-10-08 18:14:14', 1),
	(8, 1, '2020-09-07 20:28:50', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE4MTczMC4yMzYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MDMzMzB9.66xWIjl1skWBdsM994uoG7OdcJXJQ2OKhRQq1PXt_RM', '2020-10-08 18:28:50', 1),
	(9, 1, '2020-09-07 20:35:58', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE4MjE1OC4wNTUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MDM3NTh9.6Ca-vVbDmdX2FDJoYWgFavBN3leZc46deZAxxuLPkY4', '2020-10-08 18:35:58', 1),
	(10, 1, '2020-09-07 20:46:39', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE4Mjc5OS4zMzUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MDQzOTl9.lc3NBlgrF-UP7XYtNQ4uOtzULCwWxCFAQ-8gzSj34o0', '2020-10-08 18:46:39', 1),
	(11, 1, '2020-09-07 21:28:23', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE4NTMwMy4wNDEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MDY5MDN9.qk3EywPQoRrJwMZ2AWXQkeq8UWnpPa-cpht3UIKIXIA', '2020-10-08 19:28:23', 1),
	(12, 1, '2020-09-07 22:17:45', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE4ODI2NS4xMTcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MDk4NjV9.IlH6-j3QqggD4Sosm4EA5y1-10ZM0_-2GtVBr4LOmQs', '2020-10-08 20:17:45', 1),
	(13, 1, '2020-09-07 22:24:14', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE4ODY1NC45NzUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MTAyNTR9.YiBDQ1JMnwm06Zs9SgbvM2v9Y-_31TIKczGUC_0q1UI', '2020-10-08 20:24:14', 1),
	(14, 1, '2020-09-07 23:43:41', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE5MzQyMS41MjMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MTUwMjF9.mkTm9RFBnGnZ-M98iYp_SWPxIg_GITEN3gcp_BexBiM', '2020-10-08 21:43:41', 1),
	(15, 1, '2020-09-07 23:48:51', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE5MzczMS44MDEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MTUzMzF9.rzFgynhhhUNWkoufomXqYUgOmeRa3ryk-pcjY16oV48', '2020-10-08 21:48:51', 1),
	(16, 1, '2020-09-08 00:00:11', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE5NDQxMS4yMzIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MTYwMTF9.kIINLF1L7VnSTQST5tjG5ijvH-EqMT5y8ywgvDbYYKc', '2020-10-08 22:00:11', 1),
	(17, 1, '2020-09-08 00:07:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE5NDg3Ny4yNzUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MTY0Nzd9.6EFQwWZirV6suhPKCWouzh_rPyaC7FbtPWI_umna1Iw', '2020-10-08 22:07:57', 1),
	(18, 1, '2020-09-08 00:15:35', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjE5NTMzNS4yMDYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MTY5MzV9.VdUW5uAviBU8CIsbSF_rfc2pW_akoDCXAxmjjYT2pAQ', '2020-10-08 22:15:35', 1),
	(19, 1, '2020-09-08 01:46:54', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjIwMDgxNC44MTcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MjI0MTR9.flBnl3UZkFrIePsiZVTsCWSRuyi8g05_mJ4eACRQaBg', '2020-10-08 23:46:54', 1),
	(20, 1, '2020-09-08 02:00:55', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjIwMTY1NS4wNzMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MjMyNTV9.Ky5vr9VmHu4nzp0UMwKIooDHX2Icz4z9m63DyMXoTDQ', '2020-10-09 00:00:55', 1),
	(21, 1, '2020-09-08 02:16:13', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjIwMjU3My43MzksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MjQxNzN9.LA06_0HbaTHWeONMdFn3LEYSVTUk4uQsjPEe2xW7Qno', '2020-10-09 00:16:13', 1),
	(22, 1, '2020-09-08 02:33:34', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjIwMzYxNC45LCJpcCI6Ijo6MSIsInVhIjoiTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgMTAuMDsgV2luNjQ7IHg2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzg1LjAuNDE4My44MyBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NTI1MjE0fQ.uOouy9bYSgc6izVqwGv14JaBaYtuD5KcormG_0s0XBA', '2020-10-09 00:33:34', 1),
	(23, 1, '2020-09-08 02:38:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjIwMzkzNy4xNzEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MjU1Mzd9.zPyB5FPuMcr_0nPh0y7qS--qK3TR8v2pfehIJKdDjFI', '2020-10-09 00:38:57', 1),
	(24, 1, '2020-09-08 02:50:25', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjIwNDYyNS4wNTIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MjYyMjV9.aCHybKoCwWsgUi_4abZYDkttNeNi2UXjLnDg7OUwSpg', '2020-10-09 00:50:25', 1),
	(25, 1, '2020-09-08 03:01:56', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjIwNTMxNi44NDgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1MjY5MTZ9.Ww1cgvQJavpFykWOoJgeG4TH_Rx2PT-ONHHlooHVyH0', '2020-10-09 01:01:56', 1),
	(26, 1, '2020-09-08 12:36:51', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjIzOTgxMS41NDgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1NjE0MTF9.VXrb3dlUv40l7xlG_eXk5jaOP-E-rk1VD0guRdmxDVk', '2020-10-09 10:36:51', 1),
	(27, 1, '2020-09-08 12:37:01', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjIzOTgyMS44MjYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1NjE0MjF9.oJYTFO585EY_wmIknWWIhC17x6AkfhWFA4WOAmDTo8Y', '2020-10-09 10:37:01', 1),
	(28, 1, '2020-09-08 14:22:45', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI0NjE2NS43ODYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1Njc3NjV9.DtfMqPTkRlwUNrvAAWM7TeV14qU7k_cwEcXqcbbYQ7g', '2020-10-09 12:22:45', 1),
	(29, 1, '2020-09-08 14:31:29', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI0NjY4OS40OTcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1NjgyODl9.cDKtS63F9OJ8Pficr0-Ley2LtFArk3HZumcMy3fVEw4', '2020-10-09 12:31:29', 1),
	(30, 1, '2020-09-08 14:41:24', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI0NzI4NC45MiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuODMgU2FmYXJpLzUzNy4zNiIsImlhdCI6MTU5OTU2ODg4NH0.5_qHQ1dEHEDWbSFusUM37jvcLc3anyY0J-EnQGl8HEE', '2020-10-09 12:41:24', 1),
	(31, 1, '2020-09-08 14:49:19', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI0Nzc1OS4wMjIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1NjkzNTl9.45vlsMB_McvUqAjVqm90xJgxNBwvZccIdIRYIC_Eypg', '2020-10-09 12:49:19', 1),
	(32, 1, '2020-09-08 14:54:22', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI0ODA2Mi43NzIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1Njk2NjJ9.IQo3hnjgdC7hNiQGeg4pBRjcFBGeeEKwNF8ZahHYdA4', '2020-10-09 12:54:22', 1),
	(33, 1, '2020-09-08 15:06:48', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI0ODgwOC41NDEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1NzA0MDh9.kpLs9FwcMvw6VGHiDXLNAgEMLudjO9Cd8J7lPQ85YXs', '2020-10-09 13:06:48', 1),
	(34, 1, '2020-09-08 15:14:25', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI0OTI2NS44ODQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1NzA4NjV9.0WE7VbE64IwQlvhXr6OAVkB7WlfZ12zC4DJxyflvRZE', '2020-10-09 13:14:25', 1),
	(35, 1, '2020-09-08 17:52:17', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI1ODczNy4zMTEsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjMiLCJpYXQiOjE1OTk1ODAzMzd9.6rU7FWeF3sR_m8XCFRGvJr5_QzEZvb5VkVzQS9BhB_Q', '2020-10-09 15:52:17', 1),
	(36, 1, '2020-09-08 18:38:12', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI2MTQ5Mi4xOTYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1ODMwOTJ9.LIDHTci4Dry-dNwq2znf4QI-YKM9E2-Mu_uHEVH6TL4', '2020-10-09 16:38:12', 1),
	(37, 1, '2020-09-08 18:55:33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI2MjUzMy44MzIsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1ODQxMzN9.FZsHRPXkaMe1MlfKqRRZ0fAeARSlYBMDo8q5NtMkL5A', '2020-10-09 16:55:33', 1),
	(38, 1, '2020-09-08 20:27:54', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI2ODA3NC4zNDMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1ODk2NzR9.Ta2zLX4wS9o_Y91F3sha0F2Y0zGYgXNCYkddY-lwueY', '2020-10-09 18:27:54', 1),
	(39, 1, '2020-09-08 20:43:36', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI2OTAxNi40MTUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk1OTA2MTZ9.2Ic50GJHdb8bAu6rS0NUNStNi1ejMnmk51DkaEAZ1pU', '2020-10-09 18:43:36', 1),
	(40, 1, '2020-09-09 00:55:08', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI4NDEwOC4yNTUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk2MDU3MDh9.2MKCthoiNTKWFbhLsYolJNfHH1rhuhWbinLShWS4EsI', '2020-10-09 22:55:08', 1),
	(41, 1, '2020-09-09 01:01:53', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI4NDUxMy45NjgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk2MDYxMTN9.9EC5QDUEv0wK6C-LhrL-c69QoL7KW1iQHkX_VmRLiDo', '2020-10-09 23:01:53', 1),
	(42, 1, '2020-09-09 01:08:03', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI4NDg4My4wNTEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk2MDY0ODN9.sLid6fAS-218i8OjYSNsveOXgtykl72TcPEzuXGuzUY', '2020-10-09 23:08:03', 1),
	(43, 1, '2020-09-09 01:22:22', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI4NTc0Mi4yOTYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjgzIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk2MDczNDJ9.f_ChZC08mzPP4pQ8FPkeSMdBRCSlaSUKAOa1DeZYgL4', '2020-10-09 23:22:22', 1),
	(44, 1, '2020-09-09 01:38:41', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjI4NjcyMS4yMTgsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjMiLCJpYXQiOjE1OTk2MDgzMjF9.OZwvHxenZW2zKy87CIed693h1xgd-5tIId0wznfft_M', '2020-10-09 23:38:41', 1),
	(45, 1, '2020-09-09 14:53:19', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjMzNDM5OS4wNzcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NjU1OTk5fQ.-tSR4wc52XoL-BDILIix-ebF8bOkBwSzM2pLaA2K498', '2020-10-10 12:53:19', 1),
	(46, 1, '2020-09-09 15:26:31', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjMzNjM5MS40ODUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NjU3OTkxfQ.Bgq3bOQ8E7DgzZZSuECmNIn5o9_edhUxNOXF2M1N8j4', '2020-10-10 13:26:31', 1),
	(47, 1, '2020-09-09 16:40:49', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjM0MDg0OS4wNjUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NjYyNDQ5fQ.kYbhcto-1VJlbXRpUfal4SBNJhc36KlRev8Qb_sNldo', '2020-10-10 14:40:49', 1),
	(48, 1, '2020-09-09 17:35:35', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjM0NDEzNS4xMjksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NjY1NzM1fQ.3wwHGdlEPC6Z9y33SXLiFC75k3nr08Qqw47XqaHZgW4', '2020-10-10 15:35:35', 1),
	(49, 1, '2020-09-09 17:51:31', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjM0NTA5MS4zMTksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NjY2NjkxfQ.fTQLNYd9nmsH-MhS4cXS8NVlXpIzlayF9a43yh_8m4I', '2020-10-10 15:51:31', 1),
	(50, 1, '2020-09-09 18:00:11', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjM0NTYxMS4yMTcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NjY3MjExfQ.uEGtoNb1wSzBWC9_2_kcRpeCrQfkY8dPQMQQqT0FGpg', '2020-10-10 16:00:11', 1),
	(51, 1, '2020-09-09 18:16:06', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjM0NjU2Ni40NDMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NjY4MTY2fQ.Lv5XFRAUeAVFesgsxRiN6elwqc1Z_ck-hYeCI3Jtk4c', '2020-10-10 16:16:06', 1),
	(52, 1, '2020-09-10 15:18:27', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjQyMjMwNy42MDEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NzQzOTA3fQ.NV4i99ncDm_VfHDi4xmotT1gThlGURdRbgsUat51xSY', '2020-10-11 13:18:27', 1),
	(53, 1, '2020-09-10 15:18:37', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjQyMjMxNy42ODcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NzQzOTE3fQ.ZiLN7sg73NVkhc8QdcN9n1u_LN5goAejlBwRhp8NSQI', '2020-10-11 13:18:37', 1),
	(54, 1, '2020-09-10 15:36:09', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjQyMzM2OS43NCwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE1OTk3NDQ5Njl9.peKtlc_vaIt56qvVmphXig9tSSU0mjLAcE6ehdfUBUY', '2020-10-11 13:36:09', 1),
	(55, 1, '2020-09-10 15:43:46', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjQyMzgyNi4zNjEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NzQ1NDI2fQ.mxupMBDvgjhlcxtftSmARK6-dE15zQIhGNIX4JyusqA', '2020-10-11 13:43:46', 1),
	(56, 1, '2020-09-10 20:49:13', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjQ0MjE1My4wMzksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NzYzNzUzfQ.TXR7fY6e99UbR6omhUO-b8O8_E9qVu6lJAIKycf0TTM', '2020-10-11 18:49:13', 1),
	(57, 1, '2020-09-10 22:14:55', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjQ0NzI5NS41NTMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NzY4ODk1fQ.8NOhjNqY036WrVBdNOHVbkIRlwndkQhOj1gbvnNDi8A', '2020-10-11 20:14:55', 1),
	(58, 1, '2020-09-10 22:46:02', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjQ0OTE2Mi4zMzUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NzcwNzYyfQ.Vk7sWlb4Y7zjkDy2-rNuCZeg2W6Pvje2MdU9hsPPVsc', '2020-10-11 20:46:02', 1),
	(59, 1, '2020-09-11 02:25:07', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjQ2MjMwNy4zNjcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5NzgzOTA3fQ.fsKuyVyU6QxU7VA6-_d6FniqlPni0UEaXRXm5VW_hhk', '2020-10-12 00:25:07', 1),
	(60, 1, '2020-09-11 16:09:39', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjUxMTc3OS4yNDcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNTk5ODMzMzc5fQ.Se7pGj4HhVXI0UeiNoT2w3nYq0xll77t0548cU6l6HY', '2020-10-12 14:09:39', 1),
	(61, 1, '2020-09-13 15:23:53', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjY4MTgzMy4wMzMsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMDAzNDMzfQ.rAicvfqJVQ0dDcr5QLCj0B1ruPf0rcuLFfZsfhlzTVI', '2020-10-14 13:23:53', 1),
	(62, 1, '2020-09-13 15:30:09', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjY4MjIwOS44NjQsImlwIjoiOjoxIiwidWEiOiJQb3N0bWFuUnVudGltZS83LjI2LjUiLCJpYXQiOjE2MDAwMDM4MDl9.nu-szFryRdfhwXCJQ5zCEzxZl8UenHBj3cW-9CO5lLY', '2020-10-14 13:30:09', 1),
	(63, 1, '2020-09-13 16:51:07', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjY4NzA2Ny42NzQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMDA4NjY3fQ.2-6FnrPIEnc9noyEnvbgFMilUjp3fp3UoliPel9lZBk', '2020-10-14 14:51:07', 1),
	(64, 1, '2020-09-13 17:30:58', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjY4OTQ1OC41NzksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMDExMDU4fQ.cTVcB7G3qchObK9wb-84Mt-TT_n0WM93WEKnZYlEfb4', '2020-10-14 15:30:58', 1),
	(65, 1, '2020-09-13 19:40:54', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjY5NzI1NC41NzYsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMDE4ODU0fQ.DszAEUkOk-s16wKOKK3hnrQb9YXi5KCgI6M6HhHNmos', '2020-10-14 17:40:54', 1),
	(66, 1, '2020-09-14 14:19:43', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjc2NDM4My42MzksImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMDg1OTgzfQ.4n798WBzgKhwbXhsA_6YdpBbBgtJFgz5xIP33m423fE', '2020-10-15 12:19:43', 1),
	(67, 1, '2020-09-14 14:27:38', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjc2NDg1OC4zNDgsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMDg2NDU4fQ.3Nzm4M4HWv3Ax-BwKkPBlXDrrPeJRS4N7kkkf6CmDtk', '2020-10-15 12:27:38', 1),
	(68, 1, '2020-09-14 14:33:16', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjc2NTE5Ni43MiwiaXAiOiI6OjEiLCJ1YSI6Ik1vemlsbGEvNS4wIChXaW5kb3dzIE5UIDEwLjA7IFdpbjY0OyB4NjQpIEFwcGxlV2ViS2l0LzUzNy4zNiAoS0hUTUwsIGxpa2UgR2Vja28pIENocm9tZS84NS4wLjQxODMuMTAyIFNhZmFyaS81MzcuMzYiLCJpYXQiOjE2MDAwODY3OTZ9.7wqkN-gGg0mMCTzd2fHr7hTyR4oPOGinVWgdFHUU3e4', '2020-10-15 12:33:16', 1),
	(69, 1, '2020-09-14 14:51:15', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjc2NjI3NS4xODUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMDg3ODc1fQ.lsjW0_pqErgdcqcyQOk-8g1XY2_KPZLaK34a8n4j_mU', '2020-10-15 12:51:15', 1),
	(70, 1, '2020-09-14 16:48:57', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjc3MzMzNy4yNzcsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMDk0OTM3fQ.4IjTS8VNzAuGV-dq7A_YiOS-STPTmsF03ZV9GRsk23U', '2020-10-15 14:48:57', 1),
	(71, 1, '2020-09-14 17:02:06', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjc3NDEyNi41MjQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMDk1NzI2fQ.QxJ_KdFSI14Amytt48nZLPnB42q6sN9JI2sK9_xL96k', '2020-10-15 15:02:06', 1),
	(72, 1, '2020-09-15 13:45:27', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjg0ODcyNy42MzQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMTcwMzI3fQ.TokM4CSHgWKlSaVOoXFGknofvJclhZ_vcFGyVhRnyLc', '2020-10-16 11:45:27', 1),
	(73, 1, '2020-09-15 14:05:33', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMjg0OTkzMy41NTQsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMTcxNTMzfQ.hueocrHMKrsXeGz5ExLVIcE4-RNRRXJ8r2nrMJIc4dM', '2020-10-16 12:05:33', 1),
	(74, 1, '2020-09-17 16:46:59', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMzAzMjQxOS42MzEsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMzU0MDE5fQ.tUDbcSaVOgv8zySvnrm-eEk7MObIzr3GZjCJO18CMfM', '2020-10-18 14:46:59', 1),
	(75, 1, '2020-09-17 16:52:14', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoxLCJpZGVudGl0eSI6InRlc3RAdGVzdC5ycyIsImV4cCI6MTYwMzAzMjczNC40MjUsImlwIjoiOjoxIiwidWEiOiJNb3ppbGxhLzUuMCAoV2luZG93cyBOVCAxMC4wOyBXaW42NDsgeDY0KSBBcHBsZVdlYktpdC81MzcuMzYgKEtIVE1MLCBsaWtlIEdlY2tvKSBDaHJvbWUvODUuMC40MTgzLjEwMiBTYWZhcmkvNTM3LjM2IiwiaWF0IjoxNjAwMzU0MzM0fQ.DnkAIROPYoboPKXyzSnim_yRL4h57G3RcYNccRpeBvQ', '2020-10-18 14:52:14', 1);
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

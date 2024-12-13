-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 13 Des 2024 pada 09.42
-- Versi server: 8.0.30
-- Versi PHP: 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poli`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activities`
--

CREATE TABLE `activities` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `activities`
--

INSERT INTO `activities` (`id`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, 'dokter', 'Dokter didi ditambahkan', '2024-12-10 23:14:12', '2024-12-10 23:14:12'),
(2, 'poli', 'Poli poli anak ditambahkan', '2024-12-10 23:24:55', '2024-12-10 23:24:55'),
(3, 'poli', 'Poli poli dewasa ditambahkan', '2024-12-11 04:19:21', '2024-12-11 04:19:21'),
(4, 'dokter', 'Dokter dewan ditambahkan', '2024-12-12 01:15:57', '2024-12-12 01:15:57'),
(5, 'pasien', 'Pasien mahe terdaftar', '2024-12-12 01:17:02', '2024-12-12 01:17:02'),
(6, 'poli', 'Poli poli umumm ditambahkan', '2024-12-12 01:18:24', '2024-12-12 01:18:24'),
(7, 'obat', 'Obat ACT (Artesunate tablet 100mg + Amodiaquine anhydrida tablet 200 mg) ditambahkan', '2024-12-12 01:19:27', '2024-12-12 01:19:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_polis`
--

CREATE TABLE `daftar_polis` (
  `id` bigint UNSIGNED NOT NULL,
  `id_pasien` bigint UNSIGNED NOT NULL,
  `id_jadwal` bigint UNSIGNED NOT NULL,
  `keluhan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_antrian` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_periksas`
--

CREATE TABLE `detail_periksas` (
  `id` bigint UNSIGNED NOT NULL,
  `id_periksa` bigint UNSIGNED NOT NULL,
  `id_obat` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokters`
--

CREATE TABLE `dokters` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_hp` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_poli` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `dokters`
--

INSERT INTO `dokters` (`id`, `nama`, `alamat`, `no_hp`, `id_poli`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 'dr.gullam', 'Jalan blok D4 semarang indah blok D2 no 08, tawangmas semarang barat', '0827262528', 1, 13, '2024-12-10 05:11:29', '2024-12-10 05:11:29'),
(5, 'didi', 'sukamara', '02828292', 2, 15, '2024-12-10 23:14:12', '2024-12-10 23:14:12'),
(6, 'heruu', 'genuk', '082163738', 1, 18, '2024-12-12 01:15:57', '2024-12-12 01:16:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_periksas`
--

CREATE TABLE `jadwal_periksas` (
  `id` bigint UNSIGNED NOT NULL,
  `id_dokter` bigint UNSIGNED NOT NULL,
  `hari` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_04_202523_create_polis_table', 1),
(5, '2024_12_04_202529_create_obats_table', 1),
(6, '2024_12_04_202534_create_dokters_table', 1),
(7, '2024_12_04_202558_create_pasiens_table', 1),
(8, '2024_12_04_202619_create_jadwal_periksas_table', 1),
(9, '2024_12_04_202643_create_daftar_polis_table', 1),
(10, '2024_12_04_202657_create_perikasas_table', 1),
(11, '2024_12_04_202719_create_detail_periksas_table', 1),
(12, '2024_12_09_140612_add_role_to_users_table', 2),
(13, '2024_12_10_100858_add_user_id_to_dokters_table', 3),
(14, '2024_12_10_111439_add_user_id_to_pasiens_table', 4),
(15, '2024_12_10_114850_add_on_delete_cascade_to_dokters_table', 5),
(16, '2024_12_10_115029_add_on_delete_cascade_to_pasiens_table', 6),
(17, '2024_12_11_060754_create_activities_table', 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `obats`
--

CREATE TABLE `obats` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_obat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kemasan` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `obats`
--

INSERT INTO `obats` (`id`, `nama_obat`, `kemasan`, `harga`, `created_at`, `updated_at`) VALUES
(1, 'ACT (Artesunate tablet 50 mg + Amodiaquine anhydrida tablet 200 mg)', '2 blister @ 12 tablet / kotak', 50000, '2024-12-10 05:03:06', '2024-12-10 05:03:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasiens`
--

CREATE TABLE `pasiens` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_ktp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rm` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pasiens`
--

INSERT INTO `pasiens` (`id`, `nama`, `alamat`, `no_ktp`, `no_hp`, `no_rm`, `created_at`, `updated_at`, `user_id`) VALUES
(7, 'nanda', 'genuk', '7292929', '222222', '202412-001', '2024-12-10 05:11:01', '2024-12-10 05:11:01', 12),
(8, 'dewandra', 'poncowolo', '82929292', '0821334', '202412-002', '2024-12-10 08:18:32', '2024-12-10 08:18:32', 14),
(9, 'zalfa', 'Cirebon', '019192829292', '082148484', '202412-003', '2024-12-11 23:49:52', '2024-12-11 23:49:52', 16),
(10, 'babeh', 'tawangmas', '82927', '0821683737', '202412-004', '2024-12-12 01:14:11', '2024-12-12 01:14:11', 17),
(11, 'pere', 'genukk', '8269227', '082126392', '202412-005', '2024-12-12 01:17:02', '2024-12-12 01:17:15', 19);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `periksas`
--

CREATE TABLE `periksas` (
  `id` bigint UNSIGNED NOT NULL,
  `id_daftar_poli` bigint UNSIGNED NOT NULL,
  `tgl_periksa` date NOT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `biaya_periksa` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `polis`
--

CREATE TABLE `polis` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_poli` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `polis`
--

INSERT INTO `polis` (`id`, `nama_poli`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'umum', 'poli umum', '2024-12-10 09:48:30', '2024-12-10 04:00:23'),
(2, 'gigi', 'poli gigi', '2024-12-10 04:00:03', '2024-12-10 04:00:03'),
(3, 'poli anak', 'poli anak', '2024-12-10 23:24:55', '2024-12-10 23:24:55'),
(4, 'poli dewasa', 'poli ini blalblalbla', '2024-12-11 04:19:21', '2024-12-11 04:19:21'),
(5, 'poli umumm', 'kosongg', '2024-12-12 01:18:24', '2024-12-12 01:18:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Em8Y03uZgbEeuHe38dml4pyEXgAFcyyeJBEwNHAR', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRGNsanVnd0dIcGppUFQ0WmdLUGFhTTg1TFVGRUVDUmU5dFR2QjFIYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9tYW5hZ2Utb2JhdCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1733991572),
('wAgUlvieYb3W4OtrZYlELM1O4XC0Z3tOzaKQX6PV', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTHJqT21WSFk5ZktQR3liMmwxWmNkMGZrMVB6cmhVYzBXZG1tQkxrTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1734081329);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','dokter','pasien') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pasien'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'admin', 'admin@gmail.com', '2024-12-09 14:32:42', '$2y$12$UrIRhTKDhVkMUkkL4c05B.JALTaU0fNSGFsopGKb8bF7LvI9fczpu', NULL, '2024-12-09 14:32:42', '2024-12-09 07:39:01', 'admin'),
(2, 'dokter', 'doc@gmail', '2024-12-09 14:33:24', '$2y$12$5egZunSx7t1BDnGfbcG3s.OwKk.xlEm5VW2u.6FZ20/CgQVBy7p8e', NULL, '2024-12-09 14:33:24', '2024-12-09 12:19:39', 'dokter'),
(3, 'pasien', 'pasien@gmail.com', '2024-12-09 14:34:20', '$2y$12$5sxox.U271EEG0lW0ajDLeULxbQpvHxZGXw0qwFzLtS1C7Enj142S', NULL, '2024-12-09 14:34:20', '2024-12-09 12:20:26', 'pasien'),
(12, 'nanda', 'nanda@gmail.com', NULL, '$2y$12$pBy734rThS1lSOG7BcxUnOCa8kXKudMQBslz.YgOhTbfFG7W5vniq', NULL, '2024-12-10 05:11:01', '2024-12-10 05:11:01', 'pasien'),
(13, 'dr.gullam', 'gullam@gmail.com', NULL, '$2y$12$YgyoQuVKYv8xAZUZoOP1R.7/XNUysGHHuZ.0iiX51HWiy.UKLxvf.', NULL, '2024-12-10 05:11:29', '2024-12-10 05:11:29', 'dokter'),
(14, 'dewandra', 'andra@gmail.com', NULL, '$2y$12$FKf6b8AJ9IJ4UZlrlLVppeWfF2BgtZgUodWTsUBFYHmgc2.b3YqNa', NULL, '2024-12-10 08:18:32', '2024-12-10 08:18:32', 'pasien'),
(15, 'didi', 'didi@gmail.com', NULL, '$2y$12$74nbPGsmdaGYsfamXKb7GeFydYms7H/8IXuGboHBTFjS1TM8UrS5a', NULL, '2024-12-10 23:14:12', '2024-12-10 23:14:12', 'dokter'),
(16, 'zalfa', 'zalfa@gmail.com', NULL, '$2y$12$HncKcAdZvaX/hi2UbveXSu/8p6ZA5hD15WoIO.pgCz6dQs.fnalD2', NULL, '2024-12-11 23:49:52', '2024-12-11 23:49:52', 'pasien'),
(17, 'babeh', 'babeh@gmail.com', NULL, '$2y$12$98ZNKX0HdomyM9D7Z4is0.ObFn6wQN1PyvaqDF13c5/d31P0RCNZ.', NULL, '2024-12-12 01:14:11', '2024-12-12 01:14:11', 'pasien'),
(18, 'heruu', 'dewan@gmail.com', NULL, '$2y$12$m7nRcbF43RI9sg3JcpjJ0e.iE1auxQsVd9IWLkUd6ZDURvs9CKOmm', NULL, '2024-12-12 01:15:57', '2024-12-12 01:16:26', 'dokter'),
(19, 'pere', 'mahe@gmail.com', NULL, '$2y$12$5BY30FH61.3JOL6cTmwBhuF8EkvX7crTAop5FACMpk6c785M5NPh6', NULL, '2024-12-12 01:17:02', '2024-12-12 01:17:15', 'pasien');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `daftar_polis`
--
ALTER TABLE `daftar_polis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daftar_polis_id_pasien_foreign` (`id_pasien`),
  ADD KEY `daftar_polis_id_jadwal_foreign` (`id_jadwal`);

--
-- Indeks untuk tabel `detail_periksas`
--
ALTER TABLE `detail_periksas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_periksas_id_periksa_foreign` (`id_periksa`),
  ADD KEY `detail_periksas_id_obat_foreign` (`id_obat`);

--
-- Indeks untuk tabel `dokters`
--
ALTER TABLE `dokters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokters_id_poli_foreign` (`id_poli`),
  ADD KEY `dokters_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jadwal_periksas`
--
ALTER TABLE `jadwal_periksas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwal_periksas_id_dokter_foreign` (`id_dokter`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `obats`
--
ALTER TABLE `obats`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasiens`
--
ALTER TABLE `pasiens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasiens_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `periksas`
--
ALTER TABLE `periksas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periksas_id_daftar_poli_foreign` (`id_daftar_poli`);

--
-- Indeks untuk tabel `polis`
--
ALTER TABLE `polis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `daftar_polis`
--
ALTER TABLE `daftar_polis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `detail_periksas`
--
ALTER TABLE `detail_periksas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dokters`
--
ALTER TABLE `dokters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jadwal_periksas`
--
ALTER TABLE `jadwal_periksas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `obats`
--
ALTER TABLE `obats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pasiens`
--
ALTER TABLE `pasiens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `periksas`
--
ALTER TABLE `periksas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `polis`
--
ALTER TABLE `polis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `daftar_polis`
--
ALTER TABLE `daftar_polis`
  ADD CONSTRAINT `daftar_polis_id_jadwal_foreign` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksas` (`id`),
  ADD CONSTRAINT `daftar_polis_id_pasien_foreign` FOREIGN KEY (`id_pasien`) REFERENCES `pasiens` (`id`);

--
-- Ketidakleluasaan untuk tabel `detail_periksas`
--
ALTER TABLE `detail_periksas`
  ADD CONSTRAINT `detail_periksas_id_obat_foreign` FOREIGN KEY (`id_obat`) REFERENCES `obats` (`id`),
  ADD CONSTRAINT `detail_periksas_id_periksa_foreign` FOREIGN KEY (`id_periksa`) REFERENCES `periksas` (`id`);

--
-- Ketidakleluasaan untuk tabel `dokters`
--
ALTER TABLE `dokters`
  ADD CONSTRAINT `dokters_id_poli_foreign` FOREIGN KEY (`id_poli`) REFERENCES `polis` (`id`),
  ADD CONSTRAINT `dokters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jadwal_periksas`
--
ALTER TABLE `jadwal_periksas`
  ADD CONSTRAINT `jadwal_periksas_id_dokter_foreign` FOREIGN KEY (`id_dokter`) REFERENCES `dokters` (`id`);

--
-- Ketidakleluasaan untuk tabel `pasiens`
--
ALTER TABLE `pasiens`
  ADD CONSTRAINT `pasiens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `periksas`
--
ALTER TABLE `periksas`
  ADD CONSTRAINT `periksas_id_daftar_poli_foreign` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_polis` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

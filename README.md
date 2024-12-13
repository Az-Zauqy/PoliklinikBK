PoliklinikBK Laravel Project

Proyek ini adalah sistem manajemen poliklinik yang dikembangkan menggunakan Laravel 11. Berikut adalah langkah-langkah untuk menginstal dan mengkonfigurasi proyek ini.

Persyaratan Sistem

Pastikan sistem Anda memenuhi persyaratan berikut:

PHP 8.1 atau lebih baru

Composer

MySQL atau MariaDB

Node.js dan npm (untuk mengelola aset front-end)

Web server seperti Apache atau Nginx

Langkah Instalasi

Clone Repository
Clone repository ini ke direktori lokal Anda:

git clone https://github.com/Az-Zauqy/PoliklinikBK-A11.2021.13346.git
cd PoliklinikBK-A11.2021.13346

Install Dependencies
Jalankan perintah berikut untuk menginstal semua dependensi PHP dan front-end:

composer install
npm install

Konfigurasi File .env

Salin file .env.example menjadi .env:

cp .env.example .env

Buka file .env dan sesuaikan konfigurasi berikut:

APP_NAME=PoliklinikBK
APP_ENV=local
APP_KEY=base64:generate-with-command-below
APP_DEBUG=true
APP_URL=http://localhost

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=poliklinik
DB_USERNAME=root
DB_PASSWORD=yourpassword

Generate Application Key
Jalankan perintah berikut untuk menghasilkan application key:

php artisan key:generate

Migrasi Database
Buat tabel di database dengan menjalankan migrasi:

php artisan migrate

Seed Database
(Opsional) Isi database dengan data awal:

php artisan db:seed

Kompilasi Aset Front-End
Kompilasi aset front-end dengan perintah:

npm run dev

Menjalankan Aplikasi
Jalankan server pengembangan Laravel:

php artisan serve

Akses aplikasi di browser Anda: http://localhost:8000


# 🏥 PoliklinikBK - Laravel Clinic Management System

## 📋 Project Overview
PoliklinikBK is a comprehensive clinic management system developed using Laravel 11, designed to streamline healthcare administration and patient management.

## 🖥️ System Requirements

### Prerequisites
- **PHP** `8.1+`
- **Composer** 
- **MySQL/MariaDB**
- **Node.js & npm**
- **Web Server** (Apache/Nginx)

## 🚀 Installation Guide

### 1. Clone the Repository
```bash
git clone https://github.com/Az-Zauqy/PoliklinikBK.git
cd PoliklinikBK
```

### 2. Install Dependencies
```bash
# Install PHP dependencies
composer install

# Install front-end dependencies
npm install
```

### 3. Environment Configuration
Copy the environment file and generate application key:
```bash
# Create .env file
cp .env.example .env

# Generate application key
php artisan key:generate
```

### 4. Database Setup
Edit `.env` file with your database credentials:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=poli
DB_USERNAME=root
DB_PASSWORD=yourpassword
```

### 5. Database Migration
```bash
# Run database migrations
php artisan migrate

# (Optional) Seed initial data
php artisan db:seed
```

### 6. Compile Front-End Assets
```bash
# Compile assets
npm run dev
```

### 7. Launch Application
```bash
# Start development server
php artisan serve
```

🌐 Access the application at: `http://localhost:8000`


---

**Developed by Az-Zauqy** 🚀

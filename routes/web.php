<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\DokterController;
use App\Http\Controllers\PasienController;
use App\Http\Controllers\PoliFrontController;
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/', [PoliFrontController::class, 'index']);

Route::middleware(['auth', 'verified'])->group(function () {
    // Rute untuk dashboard umum dengan pengecekan role
    Route::get('/dashboard', function () {
        if (Auth::check()) {
            if (Auth::user()->role === 'admin') {
                return redirect()->route('admin.dashboard');
            } elseif (Auth::user()->role === 'dokter') {
                return redirect()->route('dokter.dashboard');
            } elseif (Auth::user()->role === 'pasien') {
                return redirect()->route('pasien.dashboard');
            }
        }
        return view('dashboard'); // Dashboard default
    })->name('dashboard');

    // Admin Routes
    Route::prefix('admin')->middleware(['auth', 'role:admin'])->group(function () {
        Route::get('/dashboard', [AdminController::class, 'dashboard'])->name('admin.dashboard');
        //dokter
        Route::get('/manage-dokter', [AdminController::class, 'manageDokter'])->name('admin.dokter');
        Route::post('/manage-dokter', [AdminController::class, 'storeDokter'])->name('admin.dokter.store');
        Route::get('/admin/dokter/{id}/edit', [AdminController::class, 'edit'])->name('admin.dokter.edit');
        Route::put('/admin/dokter/{id}', [AdminController::class, 'update'])->name('admin.dokter.update');
        Route::delete('/admin/dokter/{id}', [AdminController::class, 'destroy'])->name('admin.dokter.destroy');
        //pasien
        Route::get('/manage-pasien', [AdminController::class, 'managePasien'])->name('admin.pasien');
        Route::post('/admin/pasien', [AdminController::class, 'storePasien'])->name('admin.pasien.store');
        Route::get('/admin/pasien/{id}/edit', [AdminController::class, 'editPasien'])->name('admin.pasien.edit');
        Route::put('/admin/pasien/{id}', [AdminController::class, 'updatePasien'])->name('admin.pasien.update');
        Route::delete('/admin/pasien/{id}', [AdminController::class, 'destroyPasien'])->name('admin.pasien.destroy');
        // poli
        Route::get('/manage-poli', [AdminController::class, 'managePoli'])->name('admin.poli');
        Route::post('/admin/poli', [AdminController::class, 'storePoli'])->name('admin.poli.store');
        Route::get('/admin/poli/{id}/edit', [AdminController::class, 'editPoli'])->name('admin.poli.edit');
        Route::put('/admin/poli/{id}', [AdminController::class, 'updatePoli'])->name('admin.poli.update');
        Route::delete('/admin/poli/{id}', [AdminController::class, 'destroyPoli'])->name('admin.poli.destroy');
        // obat
        Route::get('/manage-obat', [AdminController::class, 'manageObat'])->name('admin.obat');
        Route::post('/admin/obat', [AdminController::class, 'storeObat'])->name('admin.obat.store');
        Route::get('/admin/obat/{id}/edit', [AdminController::class, 'editObat'])->name('admin.obat.edit');
        Route::put('/admin/obat/{id}', [AdminController::class, 'updateObat'])->name('admin.obat.update');
        Route::delete('/admin/obat/{id}', [AdminController::class, 'destroyObat'])->name('admin.obat.destroy');
    });
    

    // Dokter Routes
    Route::prefix('dokter')->middleware(['auth', 'role:dokter'])->group(function () {
        Route::get('/dashboard', [DokterController::class, 'dashboard'])->name('dokter.dashboard');
        // Tambahkan route dokter lainnya di sini
        Route::get('/jadwal', [DokterController::class, 'jadwal'])->name('dokter.jadwal');
        Route::get('/periksa', [DokterController::class, 'periksa'])->name('dokter.periksa');
        Route::get('/riwayat', [DokterController::class, 'riwayat'])->name('dokter.riwayat');
    });

    // Pasien Routes
    Route::prefix('pasien')->middleware(['auth', 'role:pasien'])->group(function () {
        Route::get('/dashboard', [PasienController::class, 'dashboard'])->name('pasien.dashboard');
        // Tambahkan route pasien lainnya di sini
        Route::get('/daftar-poli', [PasienController::class, 'daftarPoli'])->name('pasien.daftar.poli');
        Route::get('/riwayat-periksa', [PasienController::class, 'riwayatPeriksa'])->name('pasien.riwayat');
    });

    // Profile Routes
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
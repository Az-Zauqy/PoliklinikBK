<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Obat extends Model
{
    protected $table = 'obats';
    
    protected $fillable = [
        'nama_obat',
        'kemasan',
        'harga'
    ];

    // Relasi dengan Detail Periksa
    public function detailPeriksa()
    {
        return $this->hasMany(DetailPeriksa::class, 'id_obat');
    }
}
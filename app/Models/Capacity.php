<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Capacity extends Model
{
    use HasFactory;
    protected $table='capacity';
    public function cart()
    {
        return $this->hasMany(Cart::class);
    }
}

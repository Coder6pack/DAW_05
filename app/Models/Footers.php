<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Footers extends Model
{
    use HasFactory;
    protected $table = "footers";
    protected $fillable = [
        'address',
        'description',
        'social_link',
        'contact'
    ];
}

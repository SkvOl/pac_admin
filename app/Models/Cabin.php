<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\CabinCategories;

class Cabin extends Model{
    public $table = 'pac.cabins';
    public $timestamps = false;
    protected $guarded = []; 

    public function CabinCategories()
    {
        return $this->belongsTo(CabinCategories::class, 'category_id', 'id');
    }
}
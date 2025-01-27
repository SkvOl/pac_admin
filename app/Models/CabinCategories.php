<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\ShipsGallery;
use App\Models\Cabin;

class CabinCategories extends Model{
    public $table = 'pac.cabin_categories';
    public $timestamps = false;
    protected $guarded = []; 

    public function ShipsGallery()
    {
        return $this->hasMany(ShipsGallery::class, 'ship_id', 'id')->orderBy('ordering', 'asc');
    }

    public function Cabin()
    {
        return $this->hasMany(Cabin::class, 'category_id', 'id')->orderBy('number', 'asc');
    }
}
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\CabinCategories;
use App\Models\ShipsGallery;

class Ship extends Model{
    public $table = 'pac.ships';
    public $timestamps = false;
    protected $guarded = ['title', 'description', 'spec']; 

    public function ShipsGallery()
    {
        return $this->hasMany(ShipsGallery::class, 'ship_id', 'id')->orderBy('ordering', 'asc');
    }

    public function CabinCategories()
    {
        return $this->hasMany(CabinCategories::class, 'ship_id', 'id')->orderBy('ordering', 'asc');
    }
}
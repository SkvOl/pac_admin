<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Ship;

class ShipsGallery extends Model{
    public $table = 'pac.ships_gallery';
    public $timestamps = false;
    protected $guarded = []; 


    public function Ship()
    {
        return $this->belongsTo(Ship::class, 'ship_id', 'id');
    }
}
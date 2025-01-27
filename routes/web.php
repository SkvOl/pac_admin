<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\CabinController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\ShipController;
use Illuminate\Support\Facades\Route;

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');



Route::match(['get', 'post'], '/ships', [ShipController::class, 'list'])->middleware(['auth', 'verified'])->name('ships');

Route::get('/shipPreview/{id}', [ShipController::class, 'preview'])->middleware(['auth', 'verified'])->name('shipPreview');
Route::patch('/editShip/{id}', [ShipController::class, 'edit'])->middleware(['auth', 'verified'])->name('shipEdit');
Route::delete('/shipDelete/{id}', [ShipController::class, 'delete'])->middleware(['auth', 'verified'])->name('shipDelete');

Route::get('/cabinPreview/{id}', [CabinController::class, 'preview'])->middleware(['auth', 'verified'])->name('cabinPreview');
Route::patch('/editCabin/{id}', [CabinController::class, 'edit'])->middleware(['auth', 'verified'])->name('editEdit');
Route::delete('/cabinDelete/{id}', [CabinController::class, 'delete'])->middleware(['auth', 'verified'])->name('cabinDelete');

Route::get('/editImage/{id}', [ImageController::class, 'preview'])->middleware(['auth', 'verified'])->name('editImage');
Route::post('/saveEditImage/{id}', [ImageController::class, 'edit'])->middleware(['auth', 'verified'])->name('saveEditImage');



Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';

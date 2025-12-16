<?php

use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\SiteController;
use Illuminate\Support\Facades\Route;

Route::get('/', [SiteController::class,'index'])->name('index');
Route::get('/about', [SiteController::class,'about'])->name('about');
Route::get('/shop', [SiteController::class,'shop'])->name('shop');
Route::get('/contact', [SiteController::class,'contact'])->name('contact');
Route::get('/cart', [SiteController::class,'cart'])->name('cart');

Route::middleware('auth')->name('admin.')->group(function () {
    Route::get('/products', [ProductController::class,'index'])->name('products.index');
    Route::get('/products/create', [ProductController::class,'create'])->name('products.create');
    Route::post('/products', [ProductController::class,'store'])->name('products.store');
});
Route::middleware('auth')->group(function () {

    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';

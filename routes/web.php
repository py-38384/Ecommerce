<?php

use App\Models\Product;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SiteController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\CategoryController;

Route::get('/', [SiteController::class,'index'])->name('index');
Route::get('/about', [SiteController::class,'about'])->name('about');
Route::get('/shop', [SiteController::class,'shop'])->name('shop');
Route::get('/contact', [SiteController::class,'contact'])->name('contact');
Route::get('/cart', [SiteController::class,'cart'])->name('cart');
Route::get('/show/{product}', [SiteController::class,'show'])->name('show');

Route::middleware('auth')->name('admin.')->group(function () {
    Route::get('/products', [ProductController::class,'index'])->name('products.index');
    Route::get('/products/create', [ProductController::class,'create'])->name('products.create');
    Route::get('/products/edit/{product}', [ProductController::class,'edit'])->name('products.edit');
    Route::post('/products', [ProductController::class,'store'])->name('products.store');
    Route::PUT('/products/{product}', [ProductController::class,'store'])->name('products.update');
    Route::delete('/products/{product}', [ProductController::class,'delete'])->name('products.delete');

    Route::get('/categories', [CategoryController::class,'index'])->name('categories.index');
    Route::get('/categories/create', [CategoryController::class,'create'])->name('categories.create');
    Route::get('/categories/edit/{category}', [CategoryController::class,'edit'])->name('categories.edit');
    Route::post('/categories', [CategoryController::class,'store'])->name('categories.store');
    Route::PUT('/categories/{category}', [CategoryController::class,'store'])->name('categories.update');
    Route::delete('/categories/{category}', [CategoryController::class,'delete'])->name('categories.delete');
});
Route::middleware('auth')->group(function () {

    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';

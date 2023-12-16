<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('auth/login', [AuthController::class, 'login'])->name('api.login');
Route::post('auth/register', [AuthController::class, 'register'])->name('api.register');

Route::get('products', [ProductController::class, 'get_products'])->name('api.products.list');
Route::get('product/{product_id}', [ProductController::class, 'get_product'])->name('api.products.get');

Route::group([
    'middleware' => 'auth:api'
], function(){
    Route::get('auth/get-user', [AuthController::class, 'get_user'])->name('api.auth.get_user');
    Route::get('auth/logout', [AuthController::class, 'logout'])->name('api.auth.logout');
    Route::post('products/create', [ProductController::class, 'create_product'])->name('api.products.create');
});

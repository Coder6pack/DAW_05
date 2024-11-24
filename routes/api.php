<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\APIAuthController;
use App\Http\Controllers\APIProductController;
use App\Http\Controllers\APIBrandController;
use App\Http\Controllers\APICartController;
use App\Http\Controllers\APIInvoiceController;
use App\Http\Controllers\APINewsController;
use App\Http\Controllers\APISlidesController;

Route::post('login', 'APIAuthController@login');
Route::post('logout', [APIAuthController::class, 'logout']);
Route::post('/refresh', [APIAuthController::class], 'refreshToken');
Route::get('me', [APIAuthController::class, 'me']);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/login', [APIAuthController::class, "loGin"]);

Route::get('/product', [APIProductController::class, "listProduct"]);
Route::get('/product/{slug}', [APIProductController::class, "getProductDetail"]);
Route::get('/search-products', [APIProductController::class, 'search']);

Route::get('/brand', [APIBrandController::class, "listBrand"]);
Route::get('/brand/{id}', [APIBrandController::class, "getBrandDetail"]);

Route::post('/add-cart', [APICartController::class, "addCart"]);
Route::post('/update-cart', [APICartController::class, "updateCart"]);
Route::get('/get-cart/{id}', [APICartController::class, "getCart"]);
Route::post('/update-quantity', [APICartController::class, 'updateQuantity']);
Route::middleware('auth:api')->delete('/delete-cart/{id}', [APICartController::class, 'deleteCart']);

Route::post('/register', [APIAuthController::class, "reGister"]);
Route::post('/update-info', [APIAuthController::class, "updateInfo"]);
Route::post('/reset-password', [APIAuthController::class, "resetPassword"]);
Route::post('/send-email', [APIAuthController::class, "sendEmail"]);

Route::post('/evaluate', [APIInvoiceController::class, "evaLuate"]);
Route::post('/comment', [APIInvoiceController::class, "comMent"]);
Route::post('/new-invoice', [APIInvoiceController::class, 'newInvoice']);
Route::post('/status-invoice/{userId}', [APIInvoiceController::class, 'statusInvoice']);
Route::post('/status-cancel', [APIInvoiceController::class, "statusCancel"]);
Route::post('/refund-order', [APIInvoiceController::class, "refundOrder"]);

Route::get('/get-news', [APINewsController::class, "listNews"]);
Route::get('/get-news/{title}', [APINewsController::class, "listNewDetail"]);

Route::get('/slides', [APISlidesController::class, "listSlides"]);


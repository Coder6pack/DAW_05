<?php

use App\Http\Controllers\APIAuthController;
use App\Http\Controllers\APIBrandController;
use App\Http\Controllers\APICartController;
use App\Http\Controllers\APIInvoiceController;
use App\Http\Controllers\APINewsController;
use App\Http\Controllers\APIProductController;
use App\Http\Controllers\APISlidesController;
use App\Http\Controllers\NewsController;
use App\Http\Controllers\VNPayController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::post('/new-invoice', [APIInvoiceController::class, 'newInvoice']);
Route::post('/status-invoice/{userId}', [APIInvoiceController::class, 'statusInvoice']);
Route::post('/status-cancel', [APIInvoiceController::class, "statusCancel"]);
Route::post('/refund-order', [APIInvoiceController::class, "refundOrder"]);

Route::post('/evaluate', [APIInvoiceController::class, "evaLuate"]);
Route::post('/comment', [APIInvoiceController::class, "comMent"]);
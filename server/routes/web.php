<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\InvoiceController;



Route::prefix('comment')->middleware('role:1,2')->group(function(){
    Route::name('comment.')->group(function(){
        Route::get('search', [SlideShowController::class, 'search'])->name('search');
        Route::get('list', [CommentController::class, 'getList'])->name('list');
        Route::get('rep/{id}',[CommentController::class, 'Rep'])->name('rep');
        Route::post('rep',[CommentController::class, 'hdRep'])->name('hd-rep');
    });
});

Route::prefix('invoice')->middleware('role:1,2')->group(function(){
    Route::name('invoice.')->group(function(){
        Route::get('search', [InvoiceController::class, 'search'])->name('search');
        Route::get('list', [InvoiceController::class, 'getList'])->name('list');
        // Route::get('add-new',[InvoiceController::class, 'addNew'])->name('add-new');
        Route::get('detail/{id}', [InvoiceController::class, 'invoiceDetail'])->name('detail');
        Route::get('get-product',[InvoiceController::class, 'getProduct'])->name('get-product-ajax');
        // Route::post('add-new',[InvoiceController::class, 'hdAddNew'])->name('hd-add-new');
        Route::get('update-status-cancel/{id}', [InvoiceController::class, 'updateStatusCancel'])->name('update-status-cancel');
        Route::get('update-status-approved/{id}', [InvoiceController::class, 'updateStatusApproved'])->name('update-status-approved');
        Route::get('update-status-delivering/{id}', [InvoiceController::class, 'updateStatusDelivering'])->name('update-status-delivering');
        Route::get('update-status-complete/{id}', [InvoiceController::class, 'updateStatusComplete'])->name('update-status-complete');
        Route::get('export/{id}',[PDFController::class, 'exportInvoice'])->name('export');
    });
});

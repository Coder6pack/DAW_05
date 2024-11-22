<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CommentController;


Route::prefix('comment')->middleware('role:1,2')->group(function(){
    Route::name('comment.')->group(function(){
        Route::get('search', [SlideShowController::class, 'search'])->name('search');
        Route::get('list', [CommentController::class, 'getList'])->name('list');
        Route::get('rep/{id}',[CommentController::class, 'Rep'])->name('rep');
        Route::post('rep',[CommentController::class, 'hdRep'])->name('hd-rep');
    });
});

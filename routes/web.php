<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return 'Hello, World!';
})->name('root');

Route::get('about', function() {
    return view('about');
})->name('about');

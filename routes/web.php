
<?php

use App\Http\Controllers\CommentController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\LikeController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Disini Rute dari web atur
|--------------------------------------------------------------------------
| 10121202 - Vivan Centrino - IF5
|--------------------------------------------------------------------------
*/
Route::get('/', function () {
    return view('auth.login');
});

Auth::routes();
Route::get('@{username}', [UserController::class,'show']);

Route::get('/search', [UserController::class, 'searchByUsername'])->name('searchByUsername');
Route::get('/profile/{username}', [UserController::class, 'showProfileByUsername'])->name('profileByUsername');






Route::middleware('auth')->group(function(){
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
    Route::get('user/edit', [UserController::class,'edit']);
    Route::put('user/edit', [UserController::class,'update']);
    Route::get('post/{post_id}/delete',[PostController::class,'delete']);
    Route::resource('post', PostController::class);
    
    Route::get('/follow/{user_id}', [UserController::class,'follow']);
    Route::get('/like/{type}/{post_id}', [LikeController::class,'toggle']);
    
    Route::post('comment/{post_id}',[CommentController::class,'store']);
    Route::get('comment/{comment_id}/edit',[CommentController::class,'edit']);
    Route::put('comment/{comment_id}',[CommentController::class,'update']);
    Route::get('comment/{comment_id}/delete',[CommentController::class,'delete']);

});


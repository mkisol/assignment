<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{
    UserController,
    ProfileController,
    RoleAndPermissionController
};

Route::middleware(['auth', 'web'])->group(function () {
    Route::get('/', fn () => view('dashboard'));
    Route::get('/dashboard', fn () => view('dashboard'));

    Route::get('/profile', ProfileController::class)->name('profile');

    Route::resource('users', UserController::class);
    Route::resource('roles', RoleAndPermissionController::class);
});

Route::middleware(['auth', 'permission:test view'])->get('/tests', function () {
    dd('This is just a test and an example for permission and sidebar menu. You can remove this line on web.php, config/permission.php and config/generator.php');
})->name('tests.index');

Route::resource('tasks', App\Http\Controllers\TaskController::class)->middleware('auth');
Route::get('tasks/assign/{assignment_id}', [App\Http\Controllers\TaskController::class,'assign'])->name('task.assign')->middleware('auth');
Route::resource('assign-tasks', App\Http\Controllers\AssignTaskController::class)
    ->middleware('auth')
    ->names([
        'index' => 'assign-tasks.index',
        'create' => 'assign-tasks.create',
        'store' => 'assign-tasks.store',
        'show' => 'assign-tasks.show',
        'edit' => 'assign-tasks.edit',
        'update' => 'assign-tasks.update',
        'destroy' => 'assign-tasks.destroy',
    ]);
Route::post('savecomments/file', [App\Http\Controllers\CommentController::class,'savecommentsFile'])->name('savecommentsFile')->middleware('auth');
Route::post('savecomments', [App\Http\Controllers\CommentController::class,'SaveComment'])->name('savecomments')->middleware('auth');
Route::get('commentdelete/{id}', [App\Http\Controllers\CommentController::class,'DeleteComment'])->name('commentDelete')->middleware('auth');
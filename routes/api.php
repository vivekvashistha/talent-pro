<?php

use Illuminate\Http\Request;
use App\Http\Controllers\Api\V1\CandidatesController;
use App\Http\Controllers\Api\ComController;
use App\Http\Controllers\Auth\{ForgotPasswordController,ResetPasswordController,VerificationController};


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});*/
// for test 


Route::group(['namespace' => 'Api\V1', 'prefix' => 'v1', 'as' => 'v1.'], function () {
    Route::group(['prefix' => 'auth', 'middleware' => ['guest']], function () {
        Route::post('signup', 'AuthController@signup');

        Route::post('signin', 'AuthController@login');
        // Password Reset
        Route::get('/', [Controller::class, 'unauthorized'])->name('login');

        Route::post('/password/email', [ForgotPasswordController::class, 'sendResetLinkEmail'])->name('password.email');

        Route::post('/password/reset', [ResetPasswordController::class, 'reset'])->name('password.reset');

        Route::get('/email/verify/{id}', [VerificationController::class, 'verify'])->name('verification.verify');

        Route::middleware('auth:api')->get('/email/resend', [VerificationController::class, 'resend'])->name('verification.resend');


    });

    Route::group([], function () {
        Route::group(['prefix' => 'auth'], function () {
            Route::post('logout', 'AuthController@logout');
            Route::get('me', 'AuthController@me');
        });

        // Page
        Route::apiResource('pages', 'PagesController');

        // Faqs
        Route::apiResource('faqs', 'FaqsController');

        // Blog Categories
        Route::apiResource('blog-categories', 'BlogCategoriesController');

        // Blog Tags
        Route::apiResource('blog-tags', 'BlogTagsController');

        // Blogs
        Route::apiResource('blogs', 'BlogsController');

        // Employer
        //Route::apiResource('employers', 'EmployersController');
        //Route::post('emp_update/{id}', 'EmployersController@update');

        Route::post('adminlogin', 'AdminloginsController@login');

        // Route::get('employers', [EmployersController::class, 'index'])->name('lists.index');
        // Route::post('employer', [EmployersController::class, 'store'])->name('lists.store');
        // Route::put('employer/{employer}', [EmployersController::class, 'update'])->name('lists.update');
        // Route::delete('employer/{employer}', [EmployersController::class, 'destroy'])->name('lists.delete');
        
        // Route::get('candidates', [CandidatesController::class, 'index'])->name('clists.index');
        // Route::post('candidate', [CandidatesController::class, 'store'])->name('clists.store');
        // Route::put('candidate/{candidate}', [CandidatesController::class, 'update'])->name('clists.update');
        // Route::delete('candidate/{candidate}', [CandidatesController::class, 'destroy'])->name('clists.delete');

        // Route::get('candidate/profile/{candidate}', [CandidatesController::class, 'show'])->name('candidate.show');
        // Route::get('employer/profile/{employer}', [EmployersController::class, 'show'])->name('employer.show');


        // Route::get('jobpost', [JobpostController::class, 'index'])->name('jobpost.index');
        // Route::post('jobpost', [JobpostController::class, 'store'])->name('jobpost.store');
        // Route::put('jobpost/{jobpost}', [JobpostController::class, 'update'])->name('jobpost.update');
        // Route::delete('jobpost/{jobpost}', [JobpostController::class, 'destroy'])->name('jobpost.delete');
        // Route::get('jobpost/{jobpost}', [JobpostController::class, 'show'])->name('jobpost.details');

        Route::get('getProfile', [ComController::class, 'getProfile'])->name('user.show');
       
        Route::get('employers', [ComController::class, 'listEmployer'])->name('lists.index');
        //Route::post('employer', [ComController::class, 'store'])->name('lists.store');
        Route::put('employer/{employer}', [ComController::class, 'updateEmployer'])->name('lists.update');
        Route::delete('employer/{employer}', [ComController::class, 'deleteEmployer'])->name('lists.delete');
        
        Route::get('candidates', [ComController::class, 'listCandidate'])->name('clists.index');
       // Route::post('candidate', [ComController::class, 'store'])->name('clists.store');
        Route::put('candidate/{candidate}', [ComController::class, 'updateCandidate'])->name('clists.update');
        Route::delete('candidate/{candidate}', [ComController::class, 'deleteCandidate'])->name('clists.delete');

        Route::get('candidate/profile/{candidate}', [ComController::class, 'getCandidate'])->name('candidate.show');
        Route::get('employer/profile/{employer}', [ComController::class, 'getEmployer'])->name('employer.show');


        Route::get('jobpost', [ComController::class, 'listJobpost'])->name('jobpost.index');
        Route::post('jobpost', [ComController::class, 'addJobpost'])->name('jobpost.store');
        Route::put('jobpost/{jobpost}', [ComController::class, 'updateJobpost'])->name('jobpost.update');
        //Route::delete('jobpost/{jobpost}', [ComController::class, 'destroy'])->name('jobpost.delete');
        Route::get('jobpost/{jobpost}', [ComController::class, 'getJobpost'])->name('jobpost.details');
        
    });
});

Route::get('/employer_list', 'Api\V1\EmployersController@list');
Route::get('/employer_details/{Employer}', 'Api\V1\EmployersController@show');
Route::put('/employer_update/{Employer}', 'Api\V1\EmployersController@update');


// http://34.222.103.236/talent/api/v1/jobpost/{id}
// http://34.222.103.236/talent/api/v1/jobpost/
// http://34.222.103.236/talent/api/v1/jobpost/




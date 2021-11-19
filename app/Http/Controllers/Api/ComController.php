<?php 
namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Models\Auth\User;
use App\Models\Candidate;
use App\Models\Employer;
use App\Models\Jobpost;
use App\Http\Resources\GeneralResource;
use App\Http\Resources\GeneralCollectionResource;
use App\Http\Controllers\Controller;
use Validator;
use Illuminate\Support\Facades\Auth;

class ComController extends Controller
{
    public function getProfile(Request $request)
    {
    	$response = Auth::guard('api')->user();
    	return new GeneralResource($response->toArray(), 'Got Profile Successfully!');
    }

    public function getEmployer(Request $request, $id)
    {
    	$user = User::find($id);
        $response = $user->toArray();
        $response['details'] = Employer::where('user_id','=',$user->id)->first();
        return new GeneralResource($response, 'Got Employer Profile Successfully!');
    }


    public function getCandidate(Request $request, $id)
    {
        $user = User::find($id);
        $response = $user->toArray();
        $response['details'] = Candidate::where('user_id','=',$user->id)->first();
        return new GeneralResource($response, 'Got Candidate Profile Successfully!');
    }

    public function updateEmployer(Request $request, $id)
    {
        $user = User::find($id);
        $response = $user->toArray();
        $validation = Validator::make($request->all(), [
            'first_name' => 'required',
            'last_name' => 'required',
        ]);

        if ($validation->fails()) {
            return new GeneralResource($validation->messages(), 'some validation errors!');
        } 
        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->save();
        
        
        //$response['details'] = Employer::where('user_id','=',$request->user()->id)->first();
        return new GeneralResource($response, 'Employer updated Successfully!');
    }

    public function updateCandidate(Request $request, $id)
    {
        $user = User::find($id);
        $response = $user->toArray();
        $validation = Validator::make($request->all(), [
            'first_name' => 'required',
            'last_name' => 'required',
        ]);

        if ($validation->fails()) {
            return new GeneralResource($validation->messages(), 'some validation errors!');
        } 
        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->save();
        return new GeneralResource($response, 'Candidate updated Successfully!');
    }

    public function listEmployer(Request $request)
    {
        $response = User::whereHas('roles', function($q){
    $q->where('roles.id', '=', 2);
})->get()->toArray();
        return new GeneralResource($response, 'Got Employer list Successfully!');
    }

    public function listCandidate(Request $request)
    {
        $response = User::whereHas('roles', function($q){
    $q->where('roles.id', '=', 3);
})->get()->toArray();
        return new GeneralResource($response, 'Got Candidate list Successfully!');
    }


    public function getJobpost(Request $request, $id)
    {
        $response = \App\Models\Jobpost::find($id);
        return new GeneralResource($response->toArray(), 'job retrived Successfully!');
    }

    public function updateJobpost(Request $request, $id)
    {
        $validation = Validator::make($request->all(), [
            'last_date' => 'required',
            'description' => 'required',
            'designation' => 'required',
            'package' => 'required',
            'job_location' => 'required',
        ]);

        if ($validation->fails()) {
            return new GeneralResource($validation->messages(), 'some validation errors!');
    	} 
        $newJob = \App\Models\Jobpost::find($id);
        $newJob->last_date = $request->last_date;
        $newJob->description = $request->description;
        $newJob->designation = $request->designation;
        $newJob->package = $request->package;
        $newJob->job_location = $request->job_location;
        $newJob->save();
        
        return new GeneralResource($newJob->toArray(), 'job updated Successfully!');
    }

    public function addJobpost(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'last_date' => 'required',
            'description' => 'required',
            'designation' => 'required',
            'package' => 'required',
            'job_location' => 'required',
        ]);

        if ($validation->fails()) {
            return new GeneralResource($validation->messages(), 'some validation errors!');
    	} 
        $newJob = new \App\Models\Jobpost;
        $newJob->user_id = 6;
        $newJob->code = rand(10,100);
        $newJob->last_date = $request->last_date;
        $newJob->description = $request->description;
        $newJob->designation = $request->designation;
        $newJob->package = $request->package;
        $newJob->job_location = $request->job_location;
        $newJob->status = 1;
        $newJob->save();
        
        return new GeneralResource($newJob->toArray(), 'Got Candidate Profile Successfully!');
    }

    public function listJobpost(Request $request)
    {
        $response = \App\Models\Jobpost::get();
        return new GeneralResource($response, 'Got list of jobs Successfully!');
    }

    public function deleteCandidate(Request $request, $id)
    {
        $response = User::find($id)->delete();
        return new GeneralResource([], 'Candidate deleted Successfully!');
    }

    public function deleteEmployer(Request $request, $id)
    {
        $response = User::find($id)->delete();
        return new GeneralResource([], 'Employer deleted Successfully!');
    }


    public function getAdv(Request $request, $id)
    {
        $response = \App\Models\Advertisement::find($id);
        return new GeneralResource($response->toArray(), 'Advertisement retrived Successfully!');
    }

    public function updateAdv(Request $request, $id)
    {
        $validation = Validator::make($request->all(), [
            'title' => 'required',
        ]);

        if ($validation->fails()) {
            return new GeneralResource($validation->messages(), 'some validation errors!');
        } 
        $newJob = \App\Models\Advertisement::find($id);
        $newJob->title = $request->title;
        $newJob->description = $request->description;

        $newJob->save();
        
        return new GeneralResource($newJob->toArray(), 'Advertisement updated Successfully!');
    }

    public function addAdv(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'title' => 'required',
        ]);

        if ($validation->fails()) {
            return new GeneralResource($validation->messages(), 'some validation errors!');
        } 
        $newJob = new \App\Models\Advertisement;
        $newJob->user_id = 1;
        $newJob->title = $request->title;
        $newJob->description = $request->description;
        $newJob->save();
        
        return new GeneralResource($newJob->toArray(), 'Advertisement added Successfully!');
    }

    public function listAdv(Request $request)
    {
        $response = \App\Models\Advertisement::get();
        return new GeneralResource($response, 'Got list of advertisement Successfully!');
    }


   
}    
<?php

namespace App\Http\Controllers\API\V1;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Http\Requests\Backend\Auth\SignupRequest;
use App\Http\Controllers\Api\V1\APIController;
use App\Models\Auth\User;
use Illuminate\Support\Facades\Hash;
use App\Http\Resources\GeneralResource;
use App\Http\Resources\GeneralCollectionResource;


/**
 * @group Authentication
 *
 * Class AuthController
 *
 * Fullfills all aspects related to authenticate a user.
 */
class AuthController extends APIController
{
    /**
     * Attempt to login the user.
     *
     * If login is successfull, you get an api_token in response. Use that api_token to authenticate yourself for further api calls.
     *
     * @bodyParam email string required Your email id. Example: "user@test.com"
     * @bodyParam password string required Your Password. Example: "abc@123_4"
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile responses/auth/login.json
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        $validation = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required|min:4',
        ]);

        if ($validation->fails()) {
            return $this->throwValidation($validation->messages()->first());
        }

        $credentials = $request->only(['email', 'password']);

        try {
            if (! Auth::attempt($credentials)) {
                return $this->throwValidation(trans('api.messages.login.failed'));
            }

            $user = $request->user();

            $passportToken = $user->createToken('API Access Token');

            // Save generated token
            $passportToken->token->save();

            $token = $passportToken->accessToken;
        } catch (\Exception $e) {
            return $this->respondInternalError($e->getMessage());
        }

        return $this->respond([
            'message' => trans('api.messages.login.success'),
            'token' => $token,
        ]);
    }

    /**
     * Get the authenticated User.
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile responses/auth/me.json
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json(Auth::guard()->user());
    }

    /**
     * Attempt to logout the user.
     *
     * After successfull logut the token get invalidated and can not be used further.
     *
     * @responseFile status=401 scenario="api_key not provided" responses/unauthenticated.json
     * @responseFile responses/auth/logout.json
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout(Request $request)
    {
        try {
            $request->user()->token()->revoke();
        } catch (\Exception $e) {
            return $this->respondInternalError($e->getMessage());
        }

        return $this->respond([
            'message' => trans('api.messages.logout.success'),
        ]);
    }

    public function signup( SignupRequest $request)
    {
        $req_data = $request->all();
        if(! in_array($req_data['signup_as'],config('talentsystem.normal_roles')) )
        {
            return new GeneralResource([], trans('api.messages.signup.unknownrole'));
        }
        $user = new User;
        $user->email = $req_data['email'];
        $user->password = Hash::make($req_data['password']);
        $user->first_name = $req_data['first_name'];
        $user->last_name = $req_data['last_name'];
        $user->status = 1;
        if ($user->save()) {
            $data['id'] = $user->id;
            $role[] = \App\Models\Auth\Role::where('name','=',$req_data['signup_as'])->where('status','=',1)->where('deleted_at','=',NULL)->first()->toArray();
            
            $user->attachRoles($role);

            return $this->respond([
                'message' => trans('api.messages.signup.success'),
                'data'=> $data,
            ]);
        } else {
            $data['error'] = 'fail';

           // return $this->responseHandler(fales, 500, 'add user operation failed!', $data);
            return $this->respond([
                'message' => trans('api.messages.signup.failed'),
                'data'=> $data,
            ]);
        }
    }
}

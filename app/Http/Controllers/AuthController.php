<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Models\User;

class AuthController extends Controller
{
    public function login(LoginRequest $request)
    {
        $validatedData = $request->validated();

        if (!auth()->attempt($validatedData))
        {
            return response([
                'message'=> 'La autenticación a fallado',
            ]);
        }
        $access_token = auth()->user()->createToken('Auth token')->accessToken;
        return response([
            'user'=>auth()->user(),
            'access_token'=>$access_token,
        ]);
    }

    public function register(RegisterRequest $request)
    {
        $user = User::create($request->all());
        $access_token = $user->createToken('Auth token')->accessToken;

        return response([
            'user'=>$user,
            'access_token'=>$access_token,
        ]);
    }
}

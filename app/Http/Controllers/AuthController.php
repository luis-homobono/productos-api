<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\LoginRequest;

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
}

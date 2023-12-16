<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use Illuminate\Support\Facades\Artisan;
use App\Models\User;

class UserTest extends TestCase
{
    use RefreshDatabase;

    public function authenticate()
    {
        Artisan::call('passport:install');

        $user = User::create([
            'fullname' => 'luis',
            'email' => 'luis@gmail.com',
            'password' => bcrypt('123456')
        ]);

        if (!auth()->attempt([
            'email'=>$user->email,
            'password'=>'123456'
        ])){
            return response([
                'message'=> 'Credenciales de usuario invalido',
            ]);
        }

        return $user->createToken('Auth token')->accessToken;
    }
    public function test_retrive_user()
    {
        $this->withoutExceptionHandling();
        $token = $this->authenticate();
        // echo $token;
        $response = $this->withHeaders([
            'Authorization' => 'Bearer '.$token
        ])->get(route('api.auth.get_user'));

        $response->assertStatus(200);
        $this->assertArrayHasKey('user',$response->json());
    }
    public function test_logout()
    {
        $this->withoutExceptionHandling();
        $token = $this->authenticate();
        $response = $this->withHeaders([
            'Authorization' => 'Bearer '.$token
        ])->get(route('api.auth.logout'));

        $response->assertStatus(200);
        $this->assertArrayHasKey('message',$response->json());
        $this->assertEquals('Ha cerrado sesión satisfactoriamente', $response->json()['message']);
    }
}

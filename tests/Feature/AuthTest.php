<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\User;
use Illuminate\Support\Facades\Artisan;

class AuthTest extends TestCase
{
    use RefreshDatabase;

    public function test_login()
    {
        Artisan::call('passport:install');
        $this->withoutExceptionHandling();
        $user = User::create([
            'fullname'=>'Luis',
            'email'=>'luis@gmail.com',
            'password'=>bcrypt('123456')
        ]);

        $user->createToken('Auth token')->accessToken;

        $response = $this->post(route('api.login'),[
            'email'=>'luis@gmail.com',
            'password'=>'123456'
        ]);

        $response->assertStatus(200);
        $this->assertArrayHasKey('access_token', $response->json());
    }
}

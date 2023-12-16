<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use Illuminate\Support\Facades\Artisan;
use App\Models\Product;
use App\Models\User;

class ProductTest extends TestCase
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

    public function test_retrive_products()
    {
        $this->withoutExceptionHandling();
        $response = $this->get(route('api.products.list'));

        $response->assertStatus(200);
        $this->arrayHasKey('products', $response->json());
    }

    public function test_create_product(){
        $this->withoutExceptionHandling();
        $token=$this->authenticate();
        $response = $this->withHeaders([
            'Authorization'=>'Bearer '.$token,
            'Accept'=>'application/json', 
        ])->post(route('api.products.create'),[
            'nombre'=>'cuchara',
            'descripcion'=>'cuchara sopera',
            'precio'=>'10.5',
            'cantidad'=>50,
            'imagen'=>'/test/route/cuchara.png',
        ]);

        $product = Product::first();

        $this->assertEquals($product->nombre, 'cuchara');
        $this->assertEquals($product->descripcion, 'cuchara sopera');
        $this->assertEquals($product->precio, 10.5);
        $this->assertEquals($product->cantidad, 50);
        $this->assertEquals($product->activo, true);
        $response->assertStatus(200);
        $this->arrayHasKey('product',$response->json());
    }


    public function test_retrive_product()
    {
        $this->withoutExceptionHandling();
        $product = Product::create([
            'nombre'=>'cuchara',
            'descripcion'=>'cuchara sopera',
            'sku'=>'PRO123ARA',
            'precio'=>5,
            'cantidad'=>50,
            'imagen'=>'/test/route/cuchara.png',
            'activo'=>true,
        ]);

        $response = $this->get(route('api.products.get',$product->id));

        $response->assertStatus(200);
        $this->arrayHasKey('product',$response->json());
    }

    public function test_update_product()
    {
        $this->withoutExceptionHandling();
        $token = $this->authenticate();

        $product = Product::create([
            'nombre'=>'cuchara',
            'descripcion'=>'cuchara sopera',
            'sku'=>'PRO123ARA',
            'precio'=>5,
            'cantidad'=>50,
            'imagen'=>'/test/route/cuchara.png',
            'activo'=>true,
        ]);

        $response = $this->withHeaders([
            'Authorization'=>'Bearer '.$token,
            'Accept'=>'application/json', 
        ])->put(route('api.products.update', $product->id), [
            'nombre'=>'tenedor',
            'descripcion'=>'tenedor tridente',
            'precio'=>'10.5',
            'cantidad'=>50,
            'imagen'=>'/test/route/cuchara.png',
        ]);

        $product = Product::first();
        $this->assertEquals($product->nombre, 'tenedor');
        $this->assertEquals($product->descripcion, 'tenedor tridente');

        $response->assertStatus(200);
        $this->arrayHasKey('product', $response->json());
    }
}

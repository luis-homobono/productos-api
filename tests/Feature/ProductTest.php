<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use Illuminate\Support\Facades\Artisan;

class ProductTest extends TestCase
{
    use RefreshDatabase;

    public function test_retrive_products()
    {
        $this->withoutExceptionHandling();
        $response = $this->get(route('api.products.list'));

        $response->assertStatus(200);
        $this->arrayHasKey('products', $response->json());
    }
}

<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name_prod = fake()->word();
        $rest = substr($name_prod, -3);
        $sku = "PRO" . rand(0,9) . rand(0,9) . rand(0,9) . strtoupper($rest);

        return [
            'nombre'=>fake()->word(),
            'descripcion'=>fake()->text(100),
            'sku'=>$sku,
            'precio'=>fake()->randomDigit,
            'cantidad'=>fake()->numberBetween(0,100),
            'imagen'=>fake()->image(null, 640, 480),
            'activo'=>fake()->boolean(),
        ];
    }
}

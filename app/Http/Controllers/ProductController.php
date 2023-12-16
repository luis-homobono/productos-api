<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Resources\ProductResource;

class ProductController extends Controller
{
    public function get_products(){
        return response([
            'products'=>new ProductResource(Product::all()),
        ]);
    }
}

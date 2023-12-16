<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Resources\ProductResource;

class ProductController extends Controller
{
    public function get_products(Request $request){

        $query_builder = Product::where('activo', true);
        
        
        if ($request->has('nombre')) {
            $query_builder->where('nombre', 'LIKE', '%'.$request['nombre'].'%');
        }

        if ($request->has('min')) {
            $query_builder->where('precio', '>', $request['min']);
        }

        if ($request->has('max')) {
            $query_builder->where('precio', '<', $request['max']);
        }

        $products = $query_builder->get();

        return response()->json([
            'products'=>$products
        ]);
    }
}

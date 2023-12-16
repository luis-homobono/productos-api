<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Resources\ProductResource;
use App\Http\Requests\ProductRequest;

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

    public function create_product(ProductRequest $request)
    {
        try {
            $product = Product::create([
                'nombre'=>$request->nombre,
                'descripcion'=>$request->descripcion,
                'sku'=>'PRO' . rand(0,9) . rand(0,9) . rand(0,9) . strtoupper(substr($request->nombre, -3)),
                'precio'=>$request->precio,
                'cantidad'=>$request->cantidad,
                'imagen'=>$request->imagen,
                'activo'=>true,
            ]);
            return response([
                'product'=>new ProductResource($product),
            ]);
        } catch (\Throwable $th) {
            return response([
                'error'=>$th->getMessage()
            ], 500);
        }
    }

    public function get_product(Product $product_id)
    {   
        return response([
            'product'=>new ProductResource($product_id)
        ]);
    }

    public function update_product(ProductRequest $request, Product $product_id)
    {
        try {
            $product_id->nombre = $request->nombre;
            $product_id->descripcion = $request->descripcion;
            $product_id->sku = substr($product_id->sku, 0, -3) . strtoupper(substr($request->nombre,-3));
            $product_id->precio = $request->precio;
            $product_id->cantidad = $request->cantidad;
            $product_id->imagen = $request->imagen;
            $product_id->save();
    
            return response([
                'product'=>$product_id
            ]);
        } catch (\Throwable $th) {
            return response([
                'error'=>$th->getMessage()
            ], 500);
        }
    }

    public function delete_product(Product $product_id)
    {
        try {
            $product_id->activo = false;
            $product_id->save();

            return response([
                'message'=>'Ha borrado el producto satisfactoriamente'
            ]);
        } catch (\Throwable $th) {
            return response([
                'error'=>$th->getMessage()
            ], 500);
        }
    }
}

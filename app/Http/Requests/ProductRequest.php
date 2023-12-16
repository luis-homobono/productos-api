<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'nombre'=>'required',
            'descripcion'=>'required',
            'precio'=>'numeric',
            'cantidad'=>'numeric'
        ];
    }
    public function messages()
    {
        return [
            'nombre.required'=>'El nombre de producto es requerido',
            'descripcion.required'=>'La descripcion de producto es requerido',
            'precio.numeric'=>'El precio es numeric',
            'cantidad.numeric'=>'La cantidad es numeric'
        ];
    }
}

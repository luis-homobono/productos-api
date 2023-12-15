<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
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
            'fullname' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:6'
        ];
    }

    public function messages()
    {
        return [
            'fullname.required'=>'El nombre completo es requerido',
            'email.required'=>'El email es requerido',
            'email.email'=>'El email tiene el formato incorrecto',
            'password'=>'La contraseña es requida',
            'password.min'=>'El minimo de caracteres para a contraseña es 6',
        ];
    }
}

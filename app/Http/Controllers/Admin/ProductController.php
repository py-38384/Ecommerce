<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(){
        $title = "Products";
        return view('admin.products.index', compact('title'));
    }
    public function create(){
        $title = "Create Product";
        $categories = [];
        $cached_product = [];
        return view('admin.products.form', compact('title','categories','cached_product'));
    }
    public function store(Request $request){
        dd($request->all());
    }
}

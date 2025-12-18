<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Facades\EditorJsDataToHtml;

class SiteController extends Controller
{
    public function index(){
        $title = "Welcome To The Biggest Shop Of Bangladesh";
        $featured_products = Product::with('category')->where('is_featured',1)->whereIn('status',['published','out_of_stock'])->latest()->get();
        $categories = Category::where('status',1)->get();
        return view('welcome',compact('title','featured_products','categories'));
    }
    public function about(){
        $title = "About Us";
        $pageTitle = "About Us";
        $pageDesc = "Let's get to know each other";
        return view('about',compact('title','pageTitle','pageDesc'));
    }
    public function shop(){
        $title = "Biggest Online Shop";
        $pageTitle = "Shop";
        $pageDesc = "Discover fashion, jewelry & accessories curated for you";
        $products = Product::with('category')->whereIn('status',['published','out_of_stock'])->latest()->paginate(9);
        $categories = Category::where('status',1)->get();
        return view('shop',compact('title','pageTitle','pageDesc','products','categories'));
    }
    public function contact(){
        $title = "Contact Us";
        $pageTitle = "Contact Us";
        $pageDesc = "We’d love to hear from you";
        return view('contact',compact('title','pageTitle','pageDesc'));
    }
    public function cart(){
        $title = "Cart";
        $products = Product::with('category')->whereIn('status',['published','out_of_stock'])->limit('3')->get();
        return view('cart', compact('products','title'));
    }
    public function show(Product $product){
        $product->descriptionHtml = EditorJsDataToHtml::parse($product->description);
        return view('show',compact('product'));
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SiteController extends Controller
{
    public function index(){
        $title = "Welcome To The Biggest Shop Of Bangladesh";
        return view('welcome',compact('title'));
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
        return view('shop',compact('title','pageTitle','pageDesc'));
    }
    public function contact(){
        $title = "Contact Us";
        $pageTitle = "Contact Us";
        $pageDesc = "We’d love to hear from you";
        return view('contact',compact('title','pageTitle','pageDesc'));
    }
    public function cart(){
        return view('cart');
    }
}

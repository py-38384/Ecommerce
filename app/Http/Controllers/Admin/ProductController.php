<?php

namespace App\Http\Controllers\Admin;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\Http\Controllers\Controller;
use RealRashid\SweetAlert\Facades\Alert;

class ProductController extends Controller
{
    public function index()
    {
        $title = "Products";
        $products = Product::latest()->paginate(10);
        $products_count = Product::count(); 
        return view('admin.products.index', compact('title', 'products','products_count'));
    }
    public function create()
    {
        $title = "Create Product";
        $categories = Category::where('status',1)->get();
        return view('admin.products.form', compact('title', 'categories'));
    }
    public function edit(Product $product)
    {
        $title = "Create Product";
        $categories = Category::where('status',1)->get();
        return view('admin.products.form', compact('title', 'categories', 'product'));
    }

    public function store(Request $request, Product $product = null)
    {
        $is_creating = true;
        $validations = [
            'product_name' => 'required|string|max:255',
            'category' => 'required',
            'sku' => ['nullable', 'string', Rule::unique('products', 'sku')],
            'regular_price' => 'required|numeric',
            'price' => 'required|numeric',
            'quantity' => 'required|integer|min:0',
            'alert_quantity' => 'required|integer|min:0',
            'short_description' => 'required|string',
            'description' => 'required|string',
            'is_featured' => 'required|boolean',
            'status' => 'required',
            'hero_image' => 'required|image|max:2048',
            'gallery_images' => 'required|array',
            'gallery_images.*' => 'image|max:2048',
        ];
        if ($product) {
            $is_creating = false;
            $validations['hero_image'] = 'nullable|image|max:2048';
            $validations['gallery_images'] = 'nullable';
            $validations['sku'] = 'nullable';
        }
        $validated = $request->validate($validations);
        $data = [
            'name' => $validated['product_name'],
            'category_id' => $validated['category'] == -1 ? null : $validated['category'],
            'sku' => $validated['sku'],
            'regular_price' => $validated['regular_price'],
            'price' => $validated['price'],
            'quantity' => $validated['quantity'],
            'tag' => $request->tag,
            'alert_quantity' => $validated['alert_quantity'],
            'short_description' => $validated['short_description'],
            'description' => $validated['description'],
            'is_featured' => $validated['is_featured'],
            'status' => $validated['status'],
        ];
        if ($is_creating) {
            $product = Product::create($data);
        } else {
            $product->update($data);
        }

        if ($request->hasFile('hero_image')) {
            $product
                ->clearMediaCollection('hero_image')
                ->addMediaFromRequest('hero_image')
                ->toMediaCollection('hero_image');
        }

        if ($request->hasFile('gallery_images')) {
            $product->clearMediaCollection('gallery_images');

            foreach ($request->file('gallery_images') as $image) {
                $product
                    ->addMedia($image)
                    ->toMediaCollection('gallery_images');
            }
        }

        $alert_message = $is_creating? 'Product created successfully': 'Product updated successfully'; 
        Alert::toast($alert_message, 'success');
        if($is_creating){
            return redirect()->route('admin.products.index');
        }
        return redirect()->back();
    }
    public function delete(Product $product){
        $product->delete();
        Alert::toast('Product deleted successfully', 'success');

        return redirect()->route('admin.products.index');
    }

}

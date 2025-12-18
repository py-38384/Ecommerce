<?php

namespace App\Http\Controllers\Admin;

use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use RealRashid\SweetAlert\Facades\Alert;

class CategoryController extends Controller
{
    public function index(){
        $title = "Category";
        $categories = Category::latest()->paginate(10);
        $category_count = Category::count();
        return view('admin.category.index', compact('title', 'categories','category_count'));
    }
    public function create(){
        $title = "Create Category";
        $parent_categories = Category::all();
        return view('admin.category.form', compact('title','parent_categories'));
    }
    public function edit(Category $category){
        $title = "Update Category";
        $parent_categories = Category::where('id','!=',$category->id)->get();
        return view('admin.category.form', compact('title','parent_categories','category'));
    }
    public function store(Request $request, Category $category = null){
       $is_creating = true;
       
       $validations = [
            'name' => 'required|string|max:255',
            'parent_category' => 'nullable',
            'status' => 'required',
            'hero_image' => 'required|image|max:2048',
        ];
        if($category){
           $is_creating = false;
           $validations['hero_image'] = 'nullable|image|max:2048';
        }
        $validated = $request->validate($validations);
        $data = [
            'name' => $validated['name'],
            'parent_category' => $validated['parent_category'] == -1 ? null : $validated['parent_category'],
            'status' => $validated['status'],
        ];
        if($is_creating){
            $category = Category::create($data);
        } else {
            $category->update($data);
        }
        if ($request->hasFile('hero_image')) {
            $category
                ->clearMediaCollection()
                ->addMediaFromRequest('hero_image')
                ->toMediaCollection('hero_image');
        }
        $alert_message = $is_creating? 'Category created successfully': 'Category updated successfully'; 
        Alert::toast($alert_message, 'success');
        if($is_creating){
            return redirect()->route('admin.categories.index');
        }
        return redirect()->back();
    }
    public function delete(Category $category){
        $category->delete();
        Alert::toast('Category deleted successfully', 'success');
        return redirect()->route('admin.categories.index');
    }
}

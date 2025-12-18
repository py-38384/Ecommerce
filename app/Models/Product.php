<?php

namespace App\Models;

use Illuminate\Support\Str;
use Spatie\MediaLibrary\HasMedia;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\InteractsWithMedia;

class Product extends Model implements HasMedia
{
    use InteractsWithMedia;
    protected $guarded = ['id', 'created_at', 'updated_at'];
    protected $casts = ['tags' => 'object'];
    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('hero_image')->singleFile();
    }
    static function generate_sku(string $prefix = 'PRD'): string
    {
        $random = strtoupper(substr(bin2hex(random_bytes(4)), 0, 6));
        return $prefix . '-' . $random;
    }
    protected static function booted()
    {
        static::creating(function ($product) {

            if (empty($product->sku)) {
                $product->sku = self::generate_sku('PRD');
            }

            if (empty($product->slug)) {
                $baseSlug = Str::slug($product->name);
                $slug = $baseSlug;
                $index = 1;

                while (Product::where('slug', $slug)->exists()) {
                    $slug = $baseSlug . '-' . $index++;
                }

                $product->slug = $slug;
            }
        });

        static::updating(function ($product) {

            if (empty($product->sku)) {
                $product->sku = self::generate_sku('PRD');
            }

            if (empty($product->slug)) {
                $baseSlug = Str::slug($product->name);
                $slug = $baseSlug;
                $index = 1;

                while (
                    Product::where('slug', $slug)
                        ->where('id', '!=', $product->id)
                        ->exists()
                ) {
                    $slug = $baseSlug . '-' . $index++;
                }

                $product->slug = $slug;
            }
        });
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
    public function getCategory(){
        return $this->category? $this->category->name: "Uncategorized";
    }

}

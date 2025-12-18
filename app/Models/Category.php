<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Category extends Model implements HasMedia
{
    use InteractsWithMedia;
    protected $guarded = ['id','created_at','updated_at'];
    public function registerMediaCollections(): void{
        $this->addMediaCollection('hero_image')->singleFile();
    }
}

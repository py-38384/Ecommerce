@props(['product'])
@php
    use Illuminate\Support\Str;
@endphp
<div class="col-12 col-md-6 col-lg-4 product-card">
    <div class="card h-100" >
        <a href="" class="image">
            <img src="{{ $product->getFirstMedia('hero_image')->getUrl() }}" class="card-img-top">
        </a>
        <div class="card-body">
            <div class="d-flex flex-column justify-content-between" style="gap: 10px;">
                <div>
                    <a href="{{ route('show',$product->id) }}" class="card-title">{{ Str::limit($product->name,30) }}</a>
                    <p class="text-muted">Category: {{ $product->category? $product->category->name: 'Uncategorize' }}</p>
                </div>
                <p>
                    @if($product->regular_price != $product->price) <span class="text-muted" style="font-size: 22px; text-decoration: line-through;">${{ $product->regular_price }}</span> @endif
                    <span class="fw-bold" style="font-size: 22px;">${{ $product->price }}</span>
                </p>
            </div>
            <button class="btn btn-accent main-btn-color w-100 mt-2">
                Add To Cart
            </button>
        </div>
    </div>
</div>
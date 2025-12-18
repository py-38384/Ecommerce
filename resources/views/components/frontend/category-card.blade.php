@props(['category'])
<a href="" class="col-4 col-md-3 col-lg-2" style="text-decoration: none;">
    <div class="card border-0 shadow-sm h-100 category-card">
        <img class="card-img-top"
                src="{{ $category->getFirstMedia('hero_image')->getUrl() }}">
        <div class="card-body py-2">
            <h6 class="fw-semibold mb-0">{{ $category->name }}</h6>
        </div>
    </div>
</a>
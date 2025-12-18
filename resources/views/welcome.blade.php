<x-guest-layout>
    @section('title',$title)
    <div class="container my-5">

        <x-frontend.hero-carousel/>

        <section class="mb-5">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="fw-bold mb-0">Shop by Category</h4>
                <a href="#" class="text-decoration-none text-muted view-all">View all</a>
            </div>

            <div class="row g-3 text-center">
                @foreach ($categories as $category)
                <x-frontend.category-card :category="$category"/>
                @endforeach
            </div>
        </section>

        <section>
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="fw-bold mb-0">Featured Products</h4>
                <a href="#" class="text-decoration-none text-muted view-all">View all</a>
            </div>

            <div class="row g-3">
                @foreach ($featured_products as $product)
                <x-frontend.product-card :product="$product"/>
                @endforeach
            </div>
        </section>

    </div>
</x-guest-layout>
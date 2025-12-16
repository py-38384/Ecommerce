<x-guest-layout>
    @section('title',$title)
    <div class="container my-5">

        <!-- HERO / BANNER -->
        <x-frontend.hero-carousel/>

        <!-- CATEGORIES -->
        <section class="mb-5">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="fw-bold mb-0">Shop by Category</h4>
                <a href="#" class="text-decoration-none text-muted view-all">View all</a>
            </div>

            <div class="row g-3 text-center">
                <x-frontend.category-card/>
                <x-frontend.category-card/>
                <x-frontend.category-card/>
            </div>
        </section>

        <!-- FEATURED PRODUCTS -->
        <section>
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="fw-bold mb-0">Featured Products</h4>
                <a href="#" class="text-decoration-none text-muted view-all">View all</a>
            </div>

            <!-- PRODUCT GRID (UNCHANGED) -->
            <div class="row g-3">
                <x-frontend.product-card/>
                <x-frontend.product-card/>
            </div>
        </section>

    </div>
</x-guest-layout>
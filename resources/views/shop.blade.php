<x-guest-layout>
    @section('title',$title)
    <x-frontend.page-banner :pageTitle=$pageTitle :pageDesc=$pageDesc/>

    <section class="py-5">
        <div class="container">
            <div class="row g-4">

                <div class="col-lg-3">
                    <div class="border rounded p-4 shadow-sm">

                        <h5 class="filter-title mb-3">Categories</h5>

                        <ul class="list-unstyled category-list">
                            @foreach ($categories as $index => $category)
                            <li>
                                <a href="#" class="category-item @if($index == 0) active @endif">
                                    {{ $category->name }}
                                </a>
                            </li>
                            @endforeach
                        </ul>

                        <hr>
                        <h5 class="filter-title mb-3">Price Range</h5>
                        <input type="range" class="form-range" min="0" max="500">

                        <div class="d-flex justify-content-between text-muted small">
                            <span>$0</span>
                            <span>$500</span>
                        </div>

                        <hr>

                        <button class="btn btn-accent w-100">
                            Apply Filters
                        </button>
                    </div>
                </div>

                <div class="col-lg-9">

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <p class="mb-0 text-muted">Showing latest products</p>
                        <select class="form-select w-auto">
                            <option>Sort by latest</option>
                            <option>Price: Low to High</option>
                            <option>Price: High to Low</option>
                        </select>
                    </div>

                    <div class="row g-3">
                        @foreach ($products as $product)
                        <x-frontend.product-card :product="$product" :shop="true"/>
                        @endforeach

                    </div>
                    <div style="margin-top: 12px;">
                        {{ $products->links('pagination::bootstrap-5') }}
                    </div>
                </div>
            </div>
        </div>
    </section>
</x-guest-layout>
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
                            <li>
                                <a href="#" class="category-item active">
                                    Fashion
                                </a>
                            </li>
                            <li>
                                <a href="#" class="category-item">
                                    Jewelry
                                </a>
                            </li>
                            <li>
                                <a href="#" class="category-item">
                                    Accessories
                                </a>
                            </li>
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
                        <x-frontend.product-card/>
                        <x-frontend.product-card/>

                    </div>


                    <div class="d-flex justify-content-center mt-5">
                        <nav>
                            <ul class="pagination">
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                            </ul>
                        </nav>
                    </div>

                </div>
            </div>
        </div>
    </section>
</x-guest-layout>
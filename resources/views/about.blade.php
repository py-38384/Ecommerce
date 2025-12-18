<x-guest-layout>
    @section('title',$title)
    <x-frontend.page-banner :pageTitle=$pageTitle :pageDesc=$pageDesc/>
    <section class="py-5">
        <div class="container">
            <div class="row align-items-center g-4">
                <div class="col-md-6">
                    <h2 class="text-primary-custom fw-bold">Who We Are</h2>
                    <p class="mt-3 text-muted">
                        MyMart is a modern e-commerce platform primarily focused on fashion,
                        bringing you carefully selected clothing, jewelry, and accessories
                        that match today’s trends and everyday lifestyle.
                    </p>
                    <p class="text-muted">
                        We believe style should be accessible, affordable, and effortless.
                        That’s why we curate products that balance quality, design, and value —
                        all in one place.
                    </p>
                </div>
    
                <div class="col-md-6">
                    <img src="{{ asset('assets/images/about.png')}}" class="img-fluid" alt="Fashion products">
                </div>
            </div>
        </div>
    </section>
    
    <section class="bg-light py-5">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold text-primary-custom">What We Offer</h2>
                <p class="text-muted mt-2">
                    A diverse collection designed to complement your lifestyle
                </p>
            </div>
    
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card h-100 text-center p-4 border-0 shadow-sm">
                        <div class="icon-circle mx-auto mb-3">👗</div>
                        <h5 class="fw-bold">Fashion Wear</h5>
                        <p class="text-muted">
                            Trend-driven and timeless clothing for everyday comfort and confidence.
                        </p>
                    </div>
                </div>
    
                <div class="col-md-4">
                    <div class="card h-100 text-center p-4 border-0 shadow-sm">
                        <div class="icon-circle mx-auto mb-3">💍</div>
                        <h5 class="fw-bold">Jewelry</h5>
                        <p class="text-muted">
                            Elegant and stylish jewelry pieces to complete your look.
                        </p>
                    </div>
                </div>
    
                <div class="col-md-4">
                    <div class="card h-100 text-center p-4 border-0 shadow-sm">
                        <div class="icon-circle mx-auto mb-3">👜</div>
                        <h5 class="fw-bold">Accessories</h5>
                        <p class="text-muted">
                            Carefully selected accessories that add personality and charm.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="py-5">
        <div class="container">
            <div class="row g-4 align-items-center">
                <div class="col-md-6">
                    <h2 class="fw-bold text-primary-custom">Why Choose MyMart</h2>
                    <ul class="mt-3 text-muted">
                        <li>Quality-checked products</li>
                        <li>Fashion-first approach</li>
                        <li>Affordable pricing</li>
                        <li>Secure and easy shopping experience</li>
                        <li>Customer-focused service</li>
                    </ul>
                </div>
    
                <div class="col-md-6 text-center d-flex justify-content-start justify-content-md-end ">
                    <a href="{{ route('shop') }}" class="btn btn-accent main-btn-color mt-2" style="width: 200px; height: 50px; display: flex; align-items: center; justify-content: center;">
                        Start Shopping
                    </a>
                </div>
            </div>
        </div>
    </section>
</x-guest-layout>
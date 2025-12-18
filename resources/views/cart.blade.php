<x-guest-layout>
     @section('title',$title)
    <div class="container my-5">

        <div class="mb-4">
            <h3 class="fw-bold">Shopping Cart</h3>
            <p class="text-muted mb-0">Review your items before checkout</p>
        </div>

        <div class="row g-4">

            <div class="col-lg-8">
                @forelse ($products as $product)
                <x-frontend.cart-product-card :product="$product"/>
                    
                @empty
                    
                @endforelse
            </div>

            <div class="col-lg-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="fw-bold mb-3">Order Summary</h5>

                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted">Subtotal</span>
                            <span>$240</span>
                        </div>

                        <div class="d-flex justify-content-between mb-2">
                            <span class="text-muted">Delivery</span>
                            <span>$10</span>
                        </div>

                        <hr>

                        <div class="d-flex justify-content-between fw-bold mb-3">
                            <span>Total</span>
                            <span>$250</span>
                        </div>

                        <button class="btn btn-accent main-btn-color w-100">
                            Proceed to Checkout
                        </button>
                    </div>
                </div>
            </div>

        </div>

    </div>
</x-guest-layout>

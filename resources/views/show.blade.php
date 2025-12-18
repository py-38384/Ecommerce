<x-guest-layout>
    @section('title',$product->name)
    <div class="container my-5">

        <nav aria-label="breadcrumb" class="mb-4">
            <ol class="breadcrumb small">
                <li class="breadcrumb-item"><a href="/" class="text-decoration-none">Home</a></li>
                <li class="breadcrumb-item"><a href="#" class="text-decoration-none">{{ $product->getCategory() }}</a></li>
                <li class="breadcrumb-item active" aria-current="page">{{ $product->name }}</li>
            </ol>
        </nav>

        <div class="row g-5">

            <div class="col-lg-6">
                <div class="border rounded shadow-sm p-3">

                    <img src="{{ $product->getFirstMedia('hero_image')->getUrl() }}"
                         class="img-fluid w-100 rounded mb-3 hero_image"
                         alt="Product image">

                    <div class="d-flex gap-2 gallery-images">
                        <span class="image"><img src="{{ $product->getFirstMedia('hero_image')->getUrl() }}" class="img-thumbnail" style="width: 80px;"></span>

                        @foreach ($product->getMedia('gallery_images') as $image)
                        <span class="image"><img src="{{ $image->getUrl() }}" class="img-thumbnail" style="width: 80px;"></span>
                        @endforeach
                    </div>

                </div>
            </div>


            <div class="col-lg-6">

                <h2 class="fw-bold mb-2">{{ $product->name }}</h2>
                <p class="text-muted mb-2">Category: {{ $product->getCategory() }}</p>

                <div class="mb-3">
                    @if ($product->regular_price != $product->price)
                    <span class="text-muted text-decoration-line-through me-2 fs-5">${{ $product->regular_price }}</span>
                    @endif
                    <span class="fw-bold fs-4">${{ $product->price }}</span>
                </div>

                <p class="text-muted">
                    {{ $product->short_description }}
                </p>

                <div class="mb-3">
                    <label class="fw-semibold mb-2 d-block">Select Size</label>
                    <div class="btn-group" role="group">
                        <input type="radio" class="btn-check" name="size" id="sizeS" checked>
                        <label class="btn btn-outline-secondary" for="sizeS">S</label>

                        <input type="radio" class="btn-check" name="size" id="sizeM">
                        <label class="btn btn-outline-secondary" for="sizeM">M</label>

                        <input type="radio" class="btn-check" name="size" id="sizeL">
                        <label class="btn btn-outline-secondary" for="sizeL">L</label>

                        <input type="radio" class="btn-check" name="size" id="sizeXL">
                        <label class="btn btn-outline-secondary" for="sizeXL">XL</label>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="fw-semibold mb-2 d-block">Select Color</label>
                    <div class="btn-group" style="display: flex; gap: 10px;" role="group">
                        <span class="product-color-picker" style="background: red;"></span>
                        <span class="product-color-picker" style="background: green;"></span>
                        <span class="product-color-picker" style="background: navy;"></span>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="fw-semibold mb-2 d-block">Quantity</label>
                    <input type="number"
                           class="form-control w-25"
                           value="1" min="1">
                </div>

                <div class="d-flex gap-3 mb-4">
                    <button class="btn btn-accent main-btn-color px-4 py-2">
                        Add to Cart
                    </button>
                    <button class="btn btn-outline-secondary px-4 py-2">
                        Add to Wishlist
                    </button>
                </div>

                <ul class="list-unstyled text-muted small">
                    <li>✔ Quality-checked material</li>
                    <li>✔ Comfortable fit</li>
                    <li>✔ Easy return policy</li>
                </ul>

            </div>
        </div>

        <div class="mt-5">
            <h4 class="fw-bold mb-3">Product Description</h4>
            <p class="text-muted">
                {!! $product->descriptionHtml !!}
            </p>
        </div>
        @section('script')
            <script>
                const hero_image = document.querySelector('.hero_image');
                const gallery_images = document.querySelectorAll('.gallery-images .image');
                gallery_images.forEach((image) => {
                    image.addEventListener('click',(e) => {
                        gallery_images.forEach((gallery_image) => {
                            const image =  gallery_image.children[0];
                            image.style.filter = "opacity(1)";
                            image.style.border = "1px solid #dee2e6";
                        })
                        const image =  e.currentTarget.children[0];
                        image.style.filter = "opacity(0.8)";
                        image.style.border = "1px solid var(--accent-color)";
                        const src =  image.src;
                        hero_image.src = src;
                    })
                })
            </script>
        @endsection
    </div>
</x-guest-layout>

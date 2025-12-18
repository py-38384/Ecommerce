@props(['product'])
<div class="card mb-3 shadow-sm">
    <div class="row g-0 align-items-center">
        <div class="col-md-3">
            <img src="{{ $product->getFirstMedia('hero_image')->getUrl() }}"
                class="img-fluid rounded-start" style="width: 100%">
        </div>
        <div class="col-md-9">
            <div class="card-body">
                <div class="d-flex justify-content-between">
                    <div>
                        <h5 class="fw-semibold mb-1">{{ $product->name }}</h5>
                        <p class="text-muted mb-1">Category: {{ $product->category->name }}</p>
                        <span class="fw-bold">${{ $product->price }}</span>
                    </div>

                    <button class="btn btn-danger" style="height: 40px;">
                        Remove
                    </button>
                </div>

                <div class="d-flex align-items-center mt-3">
                    <label class="me-2 text-muted">Qty</label>
                    <input type="number" class="form-control form-control-sm w-25" value="1" min="1">
                </div>
            </div>
        </div>
    </div>
</div>
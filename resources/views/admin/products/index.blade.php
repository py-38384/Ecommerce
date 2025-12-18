@section('style')
    @section('title')
        {{ $title }}
    @endsection
    <style>
        :root {
            --table-color: #384b59;
        }

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td,
        th {
            border: 1px solid var(--table-color);
            text-align: center;
            padding: 8px;

        }

        tr:nth-child(even) {
            background-color: var(--table-color);
        }

        .action-container {
            display: inline-flex;
            gap: 30px;
            font-size: 20px;
        }

        .action-container a:hover {
            color: #000000;
        }
    </style>
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Products') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-4 dark:text-gray-100" style="display: flex; justify-content: end; gap: 10px">
                    <a href="{{ route('admin.products.create')}}" class="btn">Add Product</a>
                </div>
            </div>
        </div>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="pt-6 px-6 dark:text-gray-100" id="product-count">
                        Total Products = {{ $products_count }}
                    </div>
                    <div class="table-card">

                        <table class="product-table">
                            <thead>
                                <tr>
                                    <th>SKU</th>
                                    <th>Image</th>
                                    <th>Name & Description</th>
                                    <th>Regular Price</th>
                                    <th>Price</th>
                                    <th>Quentity</th>
                                    <th>Alert quantity</th>
                                    <th>Status</th>
                                    <th>Is Featured</th>
                                    <th style="position: sticky; right: 0; z-index: 2;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($products as $product)
                                    <tr>
                                        <td style="min-width: 200px; text-wrap: nowrap;">#{{ $product->sku }}</td>
                                        <td >
                                            <div class="" style="min-width: 150px;" >
                                                <img src="{{ $product->getFirstMedia('hero_image')->getUrl() }}"
                                                    alt="Product Image" class="product-img" style="width: 150px; height: 150px" />
                                            </div>
                                        </td>
                                        <td style="min-width: 800px;">
                                            <div class="product-title">
                                                {{ $product->name }}
                                            </div>
                                            <br>
                                            <div class="product-desc">
                                                {{ $product->short_description }}
                                            </div>
                                        </td>
                                        <td style="min-width: 150px; text-wrap: nowrap;">{{ $product->regular_price }}</td>
                                        <td style="min-width: max-content; text-wrap: nowrap;">{{ $product->price }}</td>
                                        <td style="min-width: 100px; text-wrap: nowrap;">{{ $product->quantity }}</td>
                                        <td style="min-width: 150px; text-wrap: nowrap;">{{ $product->alert_quantity }}</td>
                                        @if($product->status == 'published')
                                            <td style="min-width: 150px;"><span class="status active">Published</span></td>
                                        @else
                                            <td style="min-width: 150px;"><span class="status inactive">Pending</span></td>
                                        @endif
                                        @if($product->is_featured)
                                            <td style="min-width: 150px;"><span class="status active">Featured</span></td>
                                        @else
                                            <td style="min-width: 150px;"><span class="status inactive">Not Featured</span></td>
                                        @endif
                                        <td style="position: sticky; right: 0; z-index: 2;">
                                            <div class="actions">
                                                <a href="{{ route('admin.products.edit',$product->id) }}" class="btn edit">Edit</a>
                                                <form action="{{ route('admin.products.delete',$product->id) }}" method="post" onsubmit="deleteRequest(event)">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button class="btn delete">Delete</button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="10" style="text-align: center;">No Product Found</td> 
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <div>
                        {{ $products->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
    @section('scripts')
        <script>
            function deleteRequest(e) {
                e.preventDefault();

                Swal.fire({
                    title: "Are you sure you want to delete this Category?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#F05555",
                    cancelButtonColor: "#183153",
                    confirmButtonText: "Yes, delete it!",
                    // 👇 Popup animation (uses Animate.css)
                    showClass: {
                        popup: 'animate__animated animate__zoomIn animate__faster'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__zoomOut animate__faster'
                    },
                    toast: false, // ensure it's a modal, not a toast
                    position: 'center'
                }).then((result) => {
                    if (result.isConfirmed) {
                        e.target.submit();
                    }
                });
            }
        </script>
    @endsection
</x-app-layout>
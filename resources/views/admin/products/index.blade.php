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
                <div class="p-4 dark:text-gray-100"
                    style="display: flex; justify-content: end; gap: 10px">
                    <a href="{{ route('admin.products.create')}}" class="btn">Add Product</a>
                </div>
            </div>
        </div>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="pt-6 px-6 dark:text-gray-100" id="product-count">
                        Total Blogs = 1
                    </div>
                    <div class="table-card">
                        <table class="project-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Name & Description</th>
                                    <th>Price</th>
                                    <th>Discounted Price</th>
                                    <th>Quentity</th>
                                    <th>Alert quantity</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#3</td>
                                    <td>
                                        <img src="{{ asset('assets/images/product_images/647478c99236e1685354697.jpg') }}"
                                            alt="product Image" class="product-img" />
                                    </td>
                                    <td>
                                        <div class="product-title">
                                            Sun Bycicle
                                        </div>
                                        <div class="product-desc">
                                            Deploying a Laravel application to a live production
                                            server is one of the biggest steps in turning your
                                            project...
                                        </div>
                                    </td>
                                    <td>150</td>
                                    <td>110</td>
                                    <td>30</td>
                                    <td>5</td>
                                    <td><span class="status active">Active</span></td>
                                    <td>
                                        <div class="actions">
                                            <a href="https://pial.hstn.me/blogs/3/edit" class="btn edit">Edit</a>
                                            <form action="https://pial.hstn.me/blogs/3/delete" method="post"
                                                onsubmit="deleteRequest(event)">
                                                <input type="hidden" name="_token"
                                                    value="eNR26uhW0xGbAcU3bbbytFeXxHregxiayyUAFhzt"
                                                    autocomplete="off" />
                                                <input type="hidden" name="_method" value="DELETE" />
                                                <button class="btn delete">Delete</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div></div>
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
                    title: "Are you sure you want to delete this Product?",
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
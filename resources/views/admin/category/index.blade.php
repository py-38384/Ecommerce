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
            {{ __('Category') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-4 dark:text-gray-100" style="display: flex; justify-content: end; gap: 10px">
                    <a href="{{ route('admin.categories.create')}}" class="btn">Add Category</a>
                </div>
            </div>
        </div>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="pt-6 px-6 dark:text-gray-100" id="product-count">
                        Total Blogs = {{ $category_count }}
                    </div>
                    <div class="table-card">

                        <table class="product-table">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    <th>Image</th>
                                    <th>Name</th>
                                    <th>Status</th>
                                    <th style="position: sticky; right: 0; z-index: 2;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($categories as $category)
                                    <tr>
                                        <td style="min-width: 100px; text-wrap: nowrap;">#{{ $category->id }}</td>
                                        <td >
                                            <div class="" style="min-width: 150px;" >
                                                <img src="{{ $category->getFirstMedia('hero_image')->getUrl() }}"
                                                    alt="Category Image" class="product-img" style="width: 150px; height: 150px" />
                                            </div>
                                        </td>
                                        <td style="min-width: 200px;">
                                            {{ $category->name }}
                                        </td>
                                        @if($category->status)
                                            <td style="min-width: 150px;"><span class="status active">Published</span></td>
                                        @else
                                            <td style="min-width: 150px;"><span class="status inactive">Pending</span></td>
                                        @endif
                                        <td style="position: sticky; right: 0; z-index: 2;">
                                            <div class="actions">
                                                <a href="{{ route('admin.categories.edit',$category->id) }}" class="btn edit">Edit</a>
                                                <form action="{{ route('admin.categories.delete',$category->id) }}" method="post" onsubmit="deleteRequest(event)">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button class="btn delete">Delete</button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="5" style="text-align: center;">No Category Found</td> 
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                    <div>
                        {{ $categories->links() }}
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
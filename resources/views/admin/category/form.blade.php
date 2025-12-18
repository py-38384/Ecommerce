@section('style')
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
@section('title')
    {{ $title }}
@endsection
<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Category') }}
        </h2>
    </x-slot>

    <div class="form-container">
        <div class="form-card">
            <form action="{{ isset($category)? route('admin.categories.update',$category->id): route('admin.categories.store')}}" method="post"
                enctype="multipart/form-data">
                @csrf
                @if(isset($category))
                    @method('PUT')
                @endif
                <div class="form-group">
                    <div class="back-button-container">
                        <a href="{{ route('admin.categories.index') }}" class="btn back-button"><span></span>back</a>
                    </div>
                </div>
                <div class="form-group">
                    <x-input-label for="name" :value="__('Category Name')" />
                    <x-text-input id="name" name="name" type="text" class="mt-1 block w-full"
                        value="{{ old('name', isset($category) ? $category->name : '') }}" required
                        autocomplete="name"
                        placeholder="Bags" />
                    <x-input-error class="mt-2" :messages="$errors->get('name')" />
                </div>
                <div class="form-group">
                    <label>Parent Category</label>
                    <div class="select-wrapper">
                        <select class="custom-select" name="parent_category">
                            <option value="-1">None</option>
                            @foreach ($parent_categories as $parent_category)
                                <option value="{{$parent_category->id}}" @selected(isset($category->parent_category->name) && $category->parent_category->name == $parent_category->name)>{{ $parent_category->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <x-input-error class="mt-2" :messages="$errors->get('status')" />
                </div>

                <div class="form-group">
                    <label>Hero Image</label>
                    <label class="hero-placeholder" for="hero_image">
                        @if(isset($category))
                            <img class="preview" src="{{ $category->getFirstMedia('hero_image')->getUrl() }}" alt="">
                        @else
                            <div class="images-placeholder hero">
                                <i class="fa-solid fa-image"></i>
                            </div>
                            <img class="preview" src="" alt="">
                        @endif
                        <span class="hoverEffect"><i class="fa-solid fa-camera-retro"></i></span>
                    </label>
                    <input type="file" style="display: none;" name="hero_image" id="hero_image">
                    <x-input-error class="mt-2" :messages="$errors->get('hero_image')" />
                </div>
                <div class="form-group">
                    <label>Status</label>
                    <div class="select-wrapper">
                        <select class="custom-select" name="status">
                            <option value="1" @selected(isset($category) && $category->status)>Published</option>
                            <option value="0" @selected(isset($category) && !$category->status)>Pending</option>
                        </select>
                    </div>
                    <x-input-error class="mt-2" :messages="$errors->get('status')" />
                </div>

                <div
                    style="position: sticky; bottom: 0px; background-color: rgb(255 255 255); padding: 20px 0; z-index: 10;">
                    <button type="submit" class="btn-submit">@if(isset($product)) Update @else Save @endif Category</button>
                </div>
            </form>
        </div>
    </div>
    @section('scripts')
        <script>
            document.querySelector('#hero_image').addEventListener('change', (e) => {
                const file = e.target.files[0]
                const label = $('.hero-placeholder')[0]
                if (file) {
                    const placeholder = $('.images-placeholder.hero')[0]
                    if (placeholder) {
                        placeholder.style.display = 'none'
                    }
                    const imageUrl = URL.createObjectURL(file)
                    const imageElement = label.querySelector('.preview')
                    imageElement.style.display = 'block';
                    imageElement.src = imageUrl;
                }
            })
            
        </script>
    @endsection
</x-app-layout>
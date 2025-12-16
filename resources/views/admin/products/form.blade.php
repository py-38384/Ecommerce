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

    <div class="form-container">
        <div class="form-card">
            <form action="{{ route('admin.products.store') }}" method="post" onsubmit="handleFormSubmit(event)" enctype="multipart/form-data">
                @csrf
                @if(isset($project))
                    @method('PUT')
                @endif
                <div class="form-group">
                    <div class="back-button-container">
                        <a href="{{ route('admin.products.index') }}" class="btn back-button"><span></span>back</a>
                    </div>
                </div>
                <div class="form-group">
                    <x-input-label for="product_name" :value="__('Product Name')" />
                    <x-text-input id="product_name" name="product_name" type="text" class="mt-1 block w-full"
                        value="{{ old('product_name', isset($project) ? $project->product_name : '') }}" required
                        autocomplete="product_name" placeholder="Realme C85 | 6/128GB | 6.8 Display | 1 year Official Warranty" />
                    <x-input-error class="mt-2" :messages="$errors->get('product_name')" />
                </div>
                <div class="form-group">
                    <label>Category</label>
                    <div class="select-wrapper">
                        <select class="custom-select" name="category">
                            <option value="uncategorize">Uncategorize</option>
                            @foreach ($categories as $category)
                                <option value="{{$category->id}}" @selected(isset($project->category->name) && $project->category->name == $category->name)>{{ $category->name }}</option>
                            @endforeach
                        </select>
                    </div>
                    <x-input-error class="mt-2" :messages="$errors->get('status')" />
                </div>
                <div class="form-group">
                    <div style="margin-bottom: 15px; display: flex; gap: 10px; flex-wrap: wrap;" class="tag-container">
                        @if (isset($project->tags))
                            @foreach ($project->tags as $tag)
                                <x-text-input id="tag" name="tag[]" type="text" class="mt-1" value="{{ $tag }}"
                                    placeholder="tag" autocomplete="tag" />
                            @endforeach
                        @else
                            <x-text-input id="tag" name="tag[]" type="text" class="mt-1" placeholder="tag"
                                autocomplete="tag" />
                        @endif
                    </div>
                    <button type="submit" class="btn-submit add-tag-button">Add Tag</button>
                </div>
                <div class="form-group">
                    <x-input-label for="sku" :value="__('SKU (Auto Genarate If Not Provided)')" />
                    <x-text-input id="sku" name="sku" type="text" class="mt-1 block w-full"
                        value="{{ old('sku', isset($project) ? $project->sku : '') }}"
                        placeholder="ZGA37FC3477" autocomplete="sku"/>
                    <x-input-error class="mt-2" :messages="$errors->get('sku')" />
                </div>
                <div class="form-group">
                    <x-input-label for="reguler_price" :value="__('Reguler Price')" />
                    <x-text-input id="reguler_price" name="reguler_price" type="number" class="mt-1 block w-full"
                        value="{{ old('reguler_price', isset($project) ? $project->reguler_price : '') }}"
                        placeholder="220" autocomplete="reguler_price" step="any" required/>
                    <x-input-error class="mt-2" :messages="$errors->get('reguler_price')" />
                </div>
                <div class="form-group">
                    <x-input-label for="price" :value="__('Price')" />
                    <x-text-input id="price" name="price" type="number" class="mt-1 block w-full"
                        value="{{ old('price', isset($project) ? $project->price : '') }}" placeholder="200"
                        autocomplete="price" step="any" required/>
                    <x-input-error class="mt-2" :messages="$errors->get('price')" />
                </div>
                <div class="form-group">
                    <x-input-label for="quentity" :value="__('Quentity')" />
                    <x-text-input id="quentity" name="quentity" type="number" class="mt-1 block w-full"
                        value="{{ old('quentity', isset($project) ? $project->quentity : '') }}" placeholder="70"
                        autocomplete="quentity" required/>
                    <x-input-error class="mt-2" :messages="$errors->get('quentity')" />
                </div>
                <div class="form-group">
                    <x-input-label for="alert_quentity" :value="__('Alert Quentity')" />
                    <x-text-input id="alert_quentity" name="alert_quentity" type="number" class="mt-1 block w-full"
                        value="{{ old('alert_quentity', isset($project) ? $project->alert_quentity : '') }}"
                        placeholder="10" autocomplete="alert_quentity" />
                    <x-input-error class="mt-2" :messages="$errors->get('alert_quentity')" required/>
                </div>

                <div class="form-group">
                    <label>Hero Image</label>
                    <label class="hero-placeholder" for="hero_image">
                        @if(isset($project))
                            <img class="preview"
                                src="{{ isset($project) ? asset('uploads/images/projects/' . $project->hero_image) : '' }}"
                                alt="">
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
                    <label>Gallery Images</label>
                    <div class="gallery-image-container">
                        <style>
                            .gallery-image-container .preview-container {
                                display: flex;
                            }
                        </style>
                        <div class="preview-container">
                            @if(isset($project->gallery_images))
                                @foreach ($project->gallery_images as $gallery_image)
                                    <div class="gallery-placeholder">
                                        <img class="preview"
                                            src="{{ asset('uploads/images/projects/gallery/' . $gallery_image) }}" alt="">
                                    </div>
                                @endforeach
                            @endif

                        </div>
                        <div>
                            <label for="gallery_image" class="gallery-placeholder">
                                <div class="images-placeholder">
                                    <i class="fa-solid fa-images"></i>
                                </div>
                                <span class="hoverEffect"></span>
                            </label>
                        </div>
                        <input type="file" style="display: none;" id="gallery_image" name="gallery_images[]"
                            accept="image/*" multiple>
                        <x-input-error class="mt-2" :messages="$errors->get('gallery_image')" />
                    </div>
                </div>

                <div class="form-group">
                    <label>Short Description</label>
                    <textarea class="short-desc" name="short_description"
                        placeholder="Write a short summary..." required>{{ old('short_description', isset($project) ? $project->short_description : '') }}</textarea>
                    <x-input-error class="mt-2" :messages="$errors->get('short_description')" />
                </div>

                <div class="form-group">
                    <label>Detailed Description</label>
                    <div id="editorjs"></div>
                    <input type="hidden" name="description"
                        value="{{ old('description', isset($project) ? $project->description : '') }}" id="description">
                    <x-input-error class="mt-2" :messages="$errors->get('description')" />
                </div>


                <div class="form-group">
                    <label>Featured</label>
                    <div class="select-wrapper">
                        <select class="custom-select" name="is_featured">
                            <option value=1 @selected(isset($project->is_featured) && $project->is_featured == 1)>yes
                            </option>
                            <option value=2 @selected(isset($project->is_featured) && $project->is_featured == 0)>no
                            </option>
                        </select>
                    </div>
                    <x-input-error class="mt-2" :messages="$errors->get('status')" />
                </div>
                <div class="form-group">
                    <label>Status</label>
                    <div class="select-wrapper">
                        <select class="custom-select" name="status">
                            <option @selected(isset($project) && $project->status == 'pending')>Pending</option>
                            <option @selected(isset($project) && $project->status == 'published')>Published</option>
                        </select>
                    </div>
                    <x-input-error class="mt-2" :messages="$errors->get('status')" />
                </div>

                <div
                    style="position: sticky; bottom: 0px; background-color: rgb(255 255 255); padding: 20px 0; z-index: 10;">
                    <button type="submit" class="btn-submit">Save Product</button>
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
            document.querySelector('#gallery_image').addEventListener('change', (e) => {
                const files = Array.from(e.target.files)
                const label = $('.hero-placeholder')[0]
                const preview_container = $('.preview-container')[0]
                preview_container.innerHTML = ''
                let preview_html = '';
                if (files.length > 0) {
                    files.forEach(file => {
                        const imageUrl = URL.createObjectURL(file)
                        preview_html += `
                          <div class="gallery-placeholder">
                            <img class="preview" src="${imageUrl}" alt="">
                          </div>
                        `;
                    })
                    preview_container.style.display = 'flex'
                    preview_container.innerHTML = preview_html;
                } else {

                }
            })
            async function handleFormSubmit(e) {
                e.preventDefault();
                try {
                    const content = await window.editor.save();
                    document.getElementById('description').value = JSON.stringify(content);
                    e.target.submit()
                } catch (err) {
                    console.error('Auto-save failed:', err);
                }
            }
            @if(!isset($project))
                const addCachedEditorContent = async () => {
                    const data = @json($cached_product);
                    await window.editor.isReady;
                    if (data) {
                        window.editor.render(data);
                    }
                };
                setTimeout(() => {
                    addCachedEditorContent();
                }, 100)
            @endif

                const csrf_token = document.querySelector("meta[name='csrf-token']").getAttribute('content');
            setInterval(async () => {
                try {
                    const content = await window.editor.save();
                    fetch(projectAutoSaveDarftRoute ?? '/save-project-darft', {
                        method: 'POST',
                        headers: {
                            'X-CSRF-TOKEN': csrf_token,
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ data: content })
                    })

                } catch (err) {
                    // 
                }
            }, 5000);
            const addTagButton = document.querySelector('.add-tag-button');
            const tagContainer = document.querySelector('.tag-container');
            addTagButton.addEventListener("click", (e) => {
                e.preventDefault();
                const tagInput = document.createElement('input');
                tagInput.classList.add(
                    "border-gray-300",
                    "focus:border-indigo-500",
                    "focus:ring-indigo-500",
                    "rounded-md",
                    "shadow-sm",
                    "mt-1",
                );
                tagInput.id = "tag";
                tagInput.name = "tag[]";
                tagInput.type = "text";
                tagInput.placeholder = "tag";
                tagContainer.append(tagInput);
            })
        </script>
    @endsection
</x-app-layout>
@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Upload Photo</div>
                <div class="card-body">
                    <form method="POST" action="/post" enctype="multipart/form-data">
                        @csrf

                        <div class="mb-3">
                            <label for="image" class="form-label">Choose an Image</label>
                            <div class="input-group">
                                <input type="file" class="form-control" id="image" name="image" accept="image/*" aria-describedby="inputGroupFileAddon">
                                <label class="input-group-text" for="image">Upload</label>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="caption" class="form-label">Caption</label>
                            <textarea class="form-control" id="caption" name="caption" rows="3" placeholder="Enter Caption"></textarea>
                            <div class="text-center my-2">
                                <img id="previewImg" src="" alt="" width="200">
                            </div>
                        </div>

                        <x-submitbtn text="Post it" />
                        <script>
                            function preview() {
                                document.getElementById('previewImg').src = URL.createObjectURL(event.target.files[0])
                            }
                        </script>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Edit Caption</div>
                <div class="card-body">
                    <form method="POST" action="/post/{{$post->id}}">
                        @csrf
                        @method('PUT')

                        <div class="text-center">
                            <img src="{{asset('images/posts/' . $post->image)}}" alt="{{$post->caption}}" width="200" />
                        </div>

                        <x-textarea name="caption" label="Caption" :object="$post"/>

                        <x-submitbtn text="Update Post"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

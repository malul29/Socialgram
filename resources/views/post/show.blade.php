@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card">
                <div class="card-body">
                    <x-post :post="$post" />
                    <h3 class="card-title">Comments</h3>
                    <hr>
                    @foreach($post->comments as $comment)
                    <div class="d-flex mb-3">
                        <div class="flex-shrink-0 me-2">
                            <a href="{{'@'.$comment->user->username}}">
                                <x-avatar :user="$comment->user" size="32" />
                            </a>
                        </div>
                        <div class="flex-grow-1">
                            <p class="m-0">
                                <a href="{{'@'.$comment->user->username}}">
                                    {{'@'.$comment->user->username}}
                                </a> - {{$comment->body}}
                            </p>
                            <div class="d-flex align-items-center">
                                <button class="btn btn-outline-primary btn-sm me-2" onclick="likeComment({{$comment->id}})" id="comment-btn-{{$comment->id}}">
                                    {{ ($comment->is_liked() ? '❤️ Unlike' : '🤍 Like') }}
                                </button>
                                <span class="total_count" id="comment-likescount-{{$comment->id}}">{{$comment->likes_count}} Like</span>
                                @if (Auth::user()->id == $comment->user->id)
                                <div class="ms-auto">
                                    <a href="/comment/{{$comment->id}}/edit" class="text-primary me-2">Edit</a>
                                    <a href="/comment/{{$comment->id}}/delete" class="text-danger">Delete</a>
                                </div>
                                @endif
                            </div>
                            <span class="text-end text-xs">{{ $comment->created_at->diffForHumans()}}</span>
                        </div>
                    </div>
                    @endforeach
                    <hr>
                    <form method="POST" action="/comment/{{$post->id}}">
                        @csrf

                        <x-textarea name="body" label="Your Comment" />

                        <x-submitbtn text="Post Comment" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function like(id) {
        let likesCount = 0
        likesCount = document.getElementById('post-likescount-' + id)
        const el = document.getElementById('post-btn-' + id);
        fetch('/like/POST/' + id)
            .then(response => response.json())
            .then(data => {
                el.innerText = (data.status == 'LIKE') ? '❤️Unlike' : '🤍Like';
                let currentCount = 0
                if (data.status == 'LIKE') {
                    currentCount = parseInt(likesCount.innerHTML) + 1

                } else {
                    currentCount = parseInt(likesCount.innerHTML) - 1

                }
                likesCount.innerHTML = currentCount
            });
    }
</script>
<script>
    function likeComment(id) {
        const el = document.getElementById('comment-btn-' + id);
        fetch('/like/COMMENT/' + id)
            .then(response => response.json())
            .then(data => {
                el.innerText = (data.status == 'LIKE') ? '❤️ Unlike' : '🤍 Like';
                let likesCount = 0
                let currentCount = 0
                likesCount = document.getElementById('comment-likescount-' + id)
                if (data.status == 'LIKE') {
                    currentCount = parseInt(likesCount.innerHTML) + 1 + ' Like'

                } else {
                    currentCount = parseInt(likesCount.innerHTML) - 1 + ' Like'

                }
                likesCount.innerHTML = currentCount
            });
    }
</script>

@endsection
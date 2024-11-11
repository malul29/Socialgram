<head>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>
<div class="card mb-5 shadow-sm data-aos="fade-up"">
    <div class="card-header bg-white d-flex justify-content-between align-items-center" data-aos="zoom-in-down"data-aos-duration="200" >
        <a href="/{{'@'.$post->user->username}}" class="card-title text-decoration-none">
            <x-avatar :user="$post->user" size="32"></x-avatar>
            <strong>  {{'@'.$post->user->username}}</strong>
        </a>
        <div class="text-end">
            <span class="text-end text-xs">{{ $post->created_at->diffForHumans()}}</span>
        </div>
    </div>
    <div class="card-body p-0" data-aos="zoom-in-down" data-aos-duration="200">
        <img src="{{asset('images/posts/' . $post->image)}}" alt="{{$post->caption}}" class="card-img-top" ondblclick="like({{$post->id}})" />
        <div class="p-3">
            <p class="card-text lead mb-3">{{$post->caption}}</p>
            <hr>
            <div class="d-flex justify-content-between align-items-center mt-3" data-aos="zoom-in-down" data-aos-duration="200">
                <div class="d-flex align-items-center">
                    <span class="total_count me-2" id="post-likescount-{{$post->id}}">{{$post->likes_count}}</span>
                    <button class="btn btn-outline-primary btn-sm" onclick="like({{$post->id}})" id="post-btn-{{$post->id}}">
                        {{ ($post->is_liked() ? '❤️ Unlike' : '🤍 Like') }}
                    </button>
                </div>
                <a class="btn btn-primary btn-sm" href="/post/{{$post->id}}">💬Comment</a>
            </div>
            @if(Auth::user()->id == $post->user->id)
            <div class="mt-3">
                <a href="/post/{{$post->id}}/edit" class="text-primary">Edit</a>
                <a href="/post/{{$post->id}}/delete" class="text-danger">Delete</a>
            </div>
            @endif
        </div>
    </div>
</div>
<script>
    function like(id) {
        const el = document.getElementById('post-btn-' + id);
        fetch('/like/COMMENT/' + id)
            .then(response => response.json())
            .then(data => {
                el.innerText = (data.status == 'LIKE') ? '❤️ Unlike' : '🤍 Like';
                let likesCount = 0
                let currentCount = 0
                likesCount = document.getElementById('post-likescount-' + id)
                if (data.status == 'LIKE') {
                    currentCount = parseInt(likesCount.innerHTML) + 1

                } else {
                    currentCount = parseInt(likesCount.innerHTML) - 1

                }
                likesCount.innerHTML = currentCount
            });
    }
</script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    AOS.init();
</script>

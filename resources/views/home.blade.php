<head>
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
</head>
@extends('layouts.app')

@section('content')
<div class="container" data-aos="fade-up">
    <div class="row justify-content-center">
        <div class="col-md-5 ">
            <div>
                <div class="card-body">
                    <h3 class="card-title py-3">Feed</h3>
                    @foreach($posts as $post)
                    <x-post :post="$post" />
                    @endforeach
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
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    AOS.init();
</script>

@endsection
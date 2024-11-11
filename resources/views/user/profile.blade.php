@extends('layouts.app')

@section('content')
<div class="container" >
    <div class="row justify-content-center">
        <div class="col-md-8"zoom-in-left" data-aos-duration="200">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex align-items-center mb-4">
                        <x-avatar :user="$user" class="mr-3" />
                        <div class="px-4"data-aos="zoom-in-up" data-aos-duration="200">
                            <h1 class="card-title">{{'@'.$user->username}}</h1>
                            <h3 class="card-title">{{$user->fullname}}</h3>
                            <p class="card-text">{{$user->bio}}</p>
                        </div>
                    </div>
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    <div class="d-flex px-1 mt-3 mb-3 fs-5"data-aos="zoom-in-up" data-aos-duration="200">
                        <div class="px-4">
                            <strong>{{$user->posts()->count()}}</strong> Posts
                        </div>
                        <div class="px-4">
                            <strong>{{$user->following()->count()}}</strong> Following
                        </div>
                        <div class="px-4">
                            <strong>{{$user->follower()->count()}}</strong> Followers
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        @if (Auth::user()->id == $user->id)
                        <a class="btn btn-primary" href="/user/edit">Edit Profile</a>
                        @else
                        <button class="btn btn-outline-primary" onclick="follow({{$user->id}}, this)">
                            {{ (Auth::user()->following->contains($user->id) ? 'Unfollow' : 'Follow') }}</button>
                        @endif
                    </div>


                    <script>
                        function follow(id, el) {
                            fetch('/follow/' + id)
                                .then(response => response.json())
                                .then(data => {
                                    el.innerText = (data.status == 'FOLLOW') ? 'Unfollow' : 'Follow'
                                });
                        }
                    </script>

                    <hr>

                    <div class="row justify-content-center">
                        <div class="col-md-10">
                            <div class="card rounded-4 shadow-sm">
                                <div class="card-body">

                                    <div class="card-body">
                                        @foreach($user->posts as $post)

                                        <x-post :post="$post" />

                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

@endsection
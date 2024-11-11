@extends('layouts.app')

@section('content')
<style>
    a {
        color: inherit;
        text-decoration: none;
    }
</style>

<div class="container">
    <h1>Search Results for "{{ $username }}"</h1>

    <div class="row">
        @forelse ($users as $user)
        <div class="col-md-4 mb-4">
            <div class="card">
                <div class="card-body d-flex">
                    <a href="{{ route('profileByUsername', $user->username) }}" class="me-3">
                        <x-avatar :user="$user" size="40"></x-avatar>
                    </a>
                    <div>
                        <h2 class="card-title">
                            <a href="{{ route('profileByUsername', $user->username) }}"><strong>{{ '@'.$user->username }}</strong></a>
                        </h2>
                        <div class="d-flex mt-3">
                            <h4>
                                <div class="mr-4">
                                    <strong>{{$user->posts()->count()}}</strong> Posts
                                </div>
                            </h4>
                            <h4>
                                <div class="mr-4">
                                    <strong>{{$user->following()->count()}}</strong> Following
                                </div>
                            </h4>
                            <h4>
                                <div>
                                    <strong>{{$user->follower()->count()}}</strong> Followers
                                </div>
                            </h4>
                            
                        </div>
                        <h5 class="card-title">{{ $user->fullname }}</h5>
                        <p class="card-text">{{ $user->bio }}</p>
                    </div>
                </div>
            </div>
        </div>
        @empty
        <div class="col-md-12">
            <p>No results found.</p>
        </div>
        @endforelse
    </div>
</div>
@endsection
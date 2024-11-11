@php
    $avatar_url = ($user->avatar)
            ? asset('images/avatar/' . $user->avatar)
            :"https://ui-avatars.com/api/?name=" . $user->username;

@endphp

<img src="{{$avatar_url}}" class="rounded-circle"
    alt="Foto Profile {{$user->username}}" width="{{ $size ?? 100 }}" height="{{ $size ?? 100 }}">
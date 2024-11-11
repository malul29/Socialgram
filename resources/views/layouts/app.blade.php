<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>SocialGram</title>
    <link rel="icon" href="{{ asset('images/iconsg.png')}}">


    <!-- Fonts -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">



    <!-- Scripts -->
    @vite(['resources/sass/app.scss', 'resources/js/app.js'])
    <style>
        .input-group input {
            display: none;
        }

        .input-group:hover input {
            display: block;
        }

        body::-webkit-scrollbar-track {
            background-image: linear-gradient(to bottom, #d16ba5, #c777b9, #ba83ca, #aa8fd8, #9a9ae1, #8aa7ec, #79b3f4, #69bff8, #52cffe, #41dfff, #46eefa, #5ffbf1);
        }

        body::-webkit-scrollbar-thumb {
            background-image: linear-gradient(to bottom, #d16ba5, #c777b9, #ba83ca, #aa8fd8, #9a9ae1, #8aa7ec, #79b3f4, #69bff8, #52cffe, #41dfff, #46eefa, #5ffbf1);
        }

        body::-webkit-scrollbar {
            width: 1rem;
        }

        a {
            color: inherit;
            text-decoration: none;
        }
    </style>
</head>

<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/home') }}">
                    <div class="shrink-0 flex items-center">
                        <a href="{{ route('home') }}">
                            <x-application-logo align="center" class="block h-9 w-auto fill-current text-gray-800" />
                        </a>
                    </div>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav me-auto">

                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="nav nav-underline" style="color: #d16ba5;">
                        <!-- Authentication Links -->
                        @guest
                        @if (Route::has('login'))
                        <li class="nav-item">
                            <a class="nav-link <?php echo Route::currentRouteName() == 'login' ? 'active' : ''; ?>" href="{{ route('login') }}">{{ __('Login') }}</a>
                        </li>
                        @endif

                        @if (Route::has('register'))
                        <li class="nav-item">
                            <a class="nav-link <?php echo Route::currentRouteName() == 'register' ? 'active' : ''; ?>" href="{{ route('register') }}">{{ __('Register') }}</a>
                        </li>
                        @endif
                        @else
                        <li class="nav-item">
                            <a class="nav-link <?php echo Route::currentRouteName() == 'home' ? 'active' : ''; ?>" href="/home">Timeline</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link <?php echo Route::currentRouteName() == 'post.create' ? 'active' : ''; ?>" href="/post/create">Upload</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link <?php echo Route::currentRouteName() == 'profile' ? 'active' : ''; ?>" href="/{{'@'.Auth::user()->username }}">{{ Auth::user()->username }}</a>
                        </li>

                        <form action="{{ route('searchByUsername') }}" method="GET">
                            <div class="input-group">
                                <input type="text" name="username" placeholder="Search by username" class="form-control">
                                <button type="submit" class="btn btn-primary btn-gradient">Search</button>
                            </div>
                        </form>


                        <li class="nav-item dropdown">
                            <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>

                            </a>

                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                    {{ __('Logout') }}
                                </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                    @csrf
                                </form>
                            </div>
                        </li>
                        @endguest

                    </ul>
                </div>
            </div>
        </nav>

        <main class="py-4">
            @yield('content')
        </main>
    </div>
</body>

</html>
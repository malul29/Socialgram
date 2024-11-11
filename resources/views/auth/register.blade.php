@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center" style="margin-top: 10%">
        <div class="col-md-8">
            <div class="card text-center">
                <div class="card-body">
                    <img src="{{ asset('logo/socialgram.png')}}" alt="Image" width="400">
                    <h2><strong>Register</strong></h2>

                    <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <x-input label="Username" name="username" />
                        <x-input label="Email" name="email" type="email" />
                        <x-input label="Full Name" name="fullname" />
                        <x-input label="Password" name="password" type="password" />
                        <x-input label="Ulangi Password" name="password_confirmation" type="password" />

                        <x-submitbtn text="Register" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

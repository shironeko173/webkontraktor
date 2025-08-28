<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login Form</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->	
		<link rel="icon" type="image/png" href="{{asset('assets-signIn/images/icons/favicon.ico')}}"/>
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="{{asset('assets-signIn/vendor/bootstrap/css/bootstrap.min.css')}}">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="{{asset('assets-signIn/fonts/font-awesome-4.7.0/css/font-awesome.min.css')}}">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="{{asset('assets-signIn/fonts/Linearicons-Free-v1.0.0/icon-font.min.css')}}">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="{{asset('assets-signIn/vendor/animate/animate.css')}}">
	<!--===============================================================================================-->	
		<link rel="stylesheet" type="text/css" href="{{asset('assets-signIn/vendor/css-hamburgers/hamburgers.min.css')}}">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="{{asset('assets-signIn/vendor/animsition/css/animsition.min.css')}}">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="{{asset('assets-signIn/vendor/select2/select2.min.css')}}">
	<!--===============================================================================================-->	
		<link rel="stylesheet" type="text/css" href="{{asset('assets-signIn/vendor/daterangepicker/daterangepicker.css')}}">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="{{asset('assets-signIn/css/util.css')}}">
		<link rel="stylesheet" type="text/css" href="{{asset('assets-signIn/css/main.css')}}">
	<!--===============================================================================================-->

	<!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>
</head>
<body>

    <main>
	<div class="limiter">
		<div class="container-login100" style="background-image: url({{asset('assets-signIn/images/bg.jpg')}});">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url({{asset('assets-signIn/images/bg.jpg')}});">
					<span class="login100-form-title-1">
						Sign In
					</span>
				</div>

				<form class="login100-form validate-form" method="POST" action="{{ route('login') }}">
					@csrf
					<div class="wrap-input100 validate-input m-b-26">
						<span class="label-input100">{{ __('Email Address') }}</span>
						<input class="input100" type="text" name="email" placeholder="Enter email" required>
						<span class="focus-input100"></span>

                        @error('email')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">{{ __('Password') }}</span>
						<input class="input100" type="password" name="password" placeholder="Enter password" required>
						<span class="focus-input100"></span>

                        @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                        @enderror
					</div>

					<div class="flex-sb-m w-full p-b-30">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember">
							<label class="label-checkbox100" for="ckb1">
								{{ __('Remember Me') }}
							</label>
						</div>
						
						<div>
							@if (Route::has('password.request'))
							<a class="txt1" href="{{ route('password.request') }}">
								{{ __('Forgot Your Password?') }}
							</a>
							@endif
						</div>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">
							{{ __('Login') }}
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
    </main>
	
<!--===============================================================================================-->
	<script src="{{asset('vendor/jquery/jquery-3.2.1.min.js')}}"></script>
<!--===============================================================================================-->
	<script src="{{asset('vendor/animsition/js/animsition.min.js')}}"></script>
<!--===============================================================================================-->
	<script src="{{asset('vendor/bootstrap/js/popper.js')}}"></script>
	<script src="{{asset('vendor/bootstrap/js/bootstrap.min.js')}}"></script>
<!--===============================================================================================-->
	<script src="{{asset('vendor/select2/select2.min.js')}}"></script>
<!--===============================================================================================-->
	<script src="{{asset('vendor/daterangepicker/moment.min.js')}}"></script>
	<script src="{{asset('vendor/daterangepicker/daterangepicker.js')}}"></script>
<!--===============================================================================================-->
	<script src="{{asset('vendor/countdowntime/countdowntime.js')}}"></script>
<!--===============================================================================================-->
	<script src="{{asset('js/main.js')}}"></script>
</body>
</html>
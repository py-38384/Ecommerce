<x-guest-layout>
    <div class="container display-center" style="min-height: 90vh;">
            <form method="POST" action="{{ route('login') }}" class="admin-login-form">
                @csrf
                <div class="login-title">Admin Login</div> <!-- Email Address -->
                <div class="admin-email-field">
                    <label class="admin-email-field-label" for="email">
                        Email
                    </label> <input class="admin-email-field-input" type="email" name="email" required="required" autofocus="autofocus" autocomplete="username" placeholder="Admin Email" />
                </div> <!-- Password -->
                <div class="admin-password-field">
                    <label class="admin-password-field-label" for="password">
                        Password
                    </label> <input class="admin-password-field-input" type="password" name="password" required="required" autocomplete="current-password" placeholder="Admin Password" />
                </div>
                <div class="admin-submit">
            
                    <button type="submit" class="admin-submit-button">
                        Log in
                    </button>
                </div>
            </form>
    </div>
</x-guest-layout>

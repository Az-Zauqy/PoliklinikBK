<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password - Poliklinik BK</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-gray-100 to-gray-300 min-h-screen flex items-center justify-center">
    <div class="w-full max-w-md bg-white shadow-lg rounded-lg overflow-hidden">
        <div class="p-4 sm:p-6">
            <!-- Logo -->
            <div class="text-center mb-3">
                <div class="w-12 h-12 mx-auto bg-gradient-to-br from-blue-500 to-blue-700 rounded-full flex items-center justify-center shadow-md">
                    <span class="text-xl font-bold text-white">P</span>
                </div>
                <h2 class="mt-3 text-lg font-bold text-gray-800">Reset Password</h2>
                <p class="text-xs text-gray-500">Masukkan email Anda untuk mendapatkan tautan reset password</p>
            </div>

            <!-- Form -->
            <form method="POST" action="{{ route('password.email') }}">
                @csrf

                <!-- Email Address -->
                <div class="mb-4">
                    <label for="email" class="block text-xs font-medium text-gray-700">Email</label>
                    <input id="email" type="email" name="email" class="mt-1 block w-full p-1 text-sm border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" required autofocus>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="w-full py-2 bg-blue-600 text-white text-sm font-medium rounded-md shadow-md hover:bg-blue-700 focus:outline-none focus:ring-4 focus:ring-blue-300">
                    Kirim Tautan Reset Password
                </button>
            </form>
        </div>

        <!-- Footer -->
        <div class="bg-gray-100 text-center py-2">
            <p class="text-xs text-gray-500">Ingat password Anda? <a href="{{ route('login') }}" class="text-blue-600 font-medium hover:underline">Login Sekarang</a></p>
        </div>
    </div>
</body>
</html>
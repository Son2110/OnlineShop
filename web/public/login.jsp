<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | Online Store</title>
        <!-- Updated to Bootstrap 5 -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f8f9fa;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            .login-container {
                width: 100%;
                max-width: 420px;
                padding: 20px;
            }
            
            .login-card {
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                border: none;
            }
            
            .login-header {
                background-color: #5cb85c;
                padding: 30px 20px;
                text-align: center;
                color: white;
            }
            
            .login-header h1 {
                font-size: 28px;
                font-weight: 600;
                margin-bottom: 5px;
            }
            
            .login-header p {
                color: rgba(255, 255, 255, 0.85);
                font-size: 16px;
                margin-bottom: 0;
            }
            
            .login-body {
                padding: 30px;
            }
            
            .form-floating {
                margin-bottom: 20px;
            }
            
            .form-control {
                padding: 12px 15px 12px 50px;
                height: auto;
                font-size: 16px;
                border-radius: 8px;
            }
            
            .form-control:focus {
                border-color: #5cb85c;
                box-shadow: 0 0 0 0.25rem rgba(92, 184, 92, 0.25);
            }
            
            .input-icon {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: #5cb85c;
                z-index: 10;
                font-size: 18px;
            }
            
            .password-toggle {
                position: absolute;
                right: 15px;
                top: 50%;
                transform: translateY(-50%);
                background: none;
                border: none;
                color: #6c757d;
                cursor: pointer;
                z-index: 10;
            }
            
            .password-toggle:focus {
                outline: none;
                color: #5cb85c;
            }
            
            .btn-login {
                background-color: #5cb85c;
                border-color: #5cb85c;
                padding: 12px;
                font-size: 18px;
                font-weight: 500;
                border-radius: 8px;
            }
            
            .btn-login:hover, .btn-login:focus {
                background-color: #4cae4c;
                border-color: #4cae4c;
                box-shadow: 0 0 0 0.25rem rgba(92, 184, 92, 0.25);
            }
            
            .return-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #6c757d;
                text-decoration: none;
                font-size: 15px;
                transition: color 0.2s;
            }
            
            .return-link:hover {
                color: #5cb85c;
            }
            
            .alert {
                border-radius: 8px;
                padding: 15px;
                margin-bottom: 25px;
            }
            
            .position-relative {
                position: relative;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <div class="login-card card">
                <!-- Header -->
                <div class="login-header">
                    <h1>Welcome Back</h1>
                    <p>Sign in to continue</p>
                </div>
                
                <!-- Login Form -->
                <div class="login-body">
                    <c:if test="${not empty requestScope.error}">
                        <div class="alert alert-danger" role="alert">
                            <i class="fas fa-exclamation-circle me-2"></i>
                            ${requestScope.error}
                        </div>
                    </c:if>
                
                    <form action="<%= request.getContextPath() %>/loginController" method="POST">
                        <!-- Account Input -->
                        <div class="position-relative mb-4">
                            <i class="fas fa-user input-icon"></i>
                            <input 
                                type="text" 
                                id="account" 
                                name="account" 
                                class="form-control" 
                                placeholder="Enter your account"
                                required>
                        </div>

                        <!-- Password Input -->
                        <div class="position-relative mb-4">
                            <i class="fas fa-lock input-icon"></i>
                            <input 
                                type="password" 
                                id="password" 
                                name="pass" 
                                class="form-control"
                                placeholder="Enter your password"
                                required>
                            <button type="button" class="password-toggle" onclick="togglePassword()">
                                <i id="togglePasswordIcon" class="fas fa-eye-slash"></i>
                            </button>
                        </div>

                        <!-- Submit Button -->
                        <button 
                            type="submit"
                            class="btn btn-login btn-success w-100">
                            Sign In
                        </button>
                    </form>

                    <!-- Return Link -->
                    <a href="<%= request.getContextPath() %>/listProductController" class="return-link">
                        <i class="fas fa-arrow-left me-1"></i> Return to Products
                    </a>
                </div>
            </div>
        </div>
        
        <!-- Bootstrap 5 JS Bundle -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        
        <!-- Password Toggle Script -->
        <script>
            function togglePassword() {
                let passwordInput = document.getElementById("password");
                let toggleIcon = document.getElementById("togglePasswordIcon");
                
                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    toggleIcon.className = "fas fa-eye";
                } else {
                    passwordInput.type = "password";
                    toggleIcon.className = "fas fa-eye-slash";
                }
            }
        </script>
    </body>
</html>
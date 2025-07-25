<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Account</title>
        <!-- Bootstrap 3 CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <!-- Optional: jQuery and Bootstrap JS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container" style="min-height: 100vh; padding-top: 20px;">
            <!-- Header Section -->
            <div class="panel panel-default">
                    <!-- Header Section -->
                    <div class="panel-heading" style="background-color: #5cb85c; color: white; display: flex; justify-content: center; align-items: center; height: 60px;">
                        <h3 class="panel-title" style="font-size: 24px;">Add New Account</h3>
                    </div>
            <!-- Form Section -->
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form action="<%= request.getContextPath() %>/addAccountController" method="post" class="form-horizontal">
                                <div class="row">
                                    <!-- Account -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="account" class="col-sm-4 control-label">Account</label>
                                            <div class="col-sm-8">
                                                <input type="text" 
                                                       class="form-control" 
                                                       id="account" 
                                                       name="account" 
                                                       required>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Password -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="password" class="col-sm-4 control-label">Password</label>
                                            <div class="col-sm-8">
                                                <input type="password" 
                                                       class="form-control" 
                                                       id="password" 
                                                       name="password" 
                                                       required>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- First Name -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="firstname" class="col-sm-4 control-label">First Name</label>
                                            <div class="col-sm-8">
                                                <input type="text" 
                                                       class="form-control" 
                                                       id="firstname" 
                                                       name="firstname" 
                                                       required>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Last Name -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="lastname" class="col-sm-4 control-label">Last Name</label>
                                            <div class="col-sm-8">
                                                <input type="text" 
                                                       class="form-control" 
                                                       id="lastname" 
                                                       name="lastname" 
                                                       required>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Phone -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="phone" class="col-sm-4 control-label">Phone</label>
                                            <div class="col-sm-8">
                                                <input type="tel" 
                                                       class="form-control" 
                                                       id="phone" 
                                                       name="phone" 
                                                       required>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Birthday -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="birthday" class="col-sm-4 control-label">Birth Day</label>
                                            <div class="col-sm-8">
                                                <input type="date" 
                                                       class="form-control" 
                                                       id="birthday" 
                                                       name="birthday" 
                                                       required>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Gender -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Gender</label>
                                            <div class="col-sm-8">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" 
                                                               name="gender" 
                                                               value="true" 
                                                               required>
                                                        Male
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" 
                                                               name="gender" 
                                                               value="false" 
                                                               required>
                                                        Female
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Role -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="roleInSystem" class="col-sm-4 control-label">Role in System</label>
                                            <div class="col-sm-8">
                                                <select class="form-control" 
                                                        id="roleInSystem" 
                                                        name="roleInSystem" 
                                                        required>
                                                    <option value="">Select a role</option>
                                                    <option value="1">Admin</option>
                                                    <option value="2">Manager</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <!-- Actions -->
                               <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <a href="<%= request.getContextPath() %>/listAccountController"
                                           class="btn btn-default btn-block">
                                            Cancel
                                        </a>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="submit"
                                                class="btn btn-success btn-block">
                                            Create Account
                                        </button>
                                    </div>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Account</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container" style="padding: 20px; min-height: 100vh;">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <!-- Header Section -->
                    <div style="margin-bottom: 30px;">
                        <h1 style="font-size: 30px;">Update Account</h1>
                    </div>

                    <!-- Form Section -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form action="<%= request.getContextPath() %>/updateAccountController" method="post" class="form-horizontal">
                                <div class="row">
                                    <!-- Account -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="account" class="col-sm-4 control-label">Account</label>
                                            <div class="col-sm-8">
                                                <input id="account" type="text" name="account" value="${accountToUpdate.account}" 
                                                       class="form-control" readonly>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Password -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="pass" class="col-sm-4 control-label">Password</label>
                                            <div class="col-sm-8">
                                                <input id="pass" type="password" name="pass" value="${accountToUpdate.pass}" required
                                                       class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- First Name -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="firstName" class="col-sm-4 control-label">First Name</label>
                                            <div class="col-sm-8">
                                                <input id="firstName" type="text" name="firstName" value="${accountToUpdate.firstName}" required
                                                       class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Last Name -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="lastName" class="col-sm-4 control-label">Last Name</label>
                                            <div class="col-sm-8">
                                                <input id="lastName" type="text" name="lastName" value="${accountToUpdate.lastName}" required
                                                       class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Phone -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="phone" class="col-sm-4 control-label">Phone</label>
                                            <div class="col-sm-8">
                                                <input id="phone" type="tel" name="phone" value="${accountToUpdate.phone}" required
                                                       class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Birthday -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="birthday" class="col-sm-4 control-label">Birth Day</label>
                                            <div class="col-sm-8">
                                                <input id="birthday" type="date" name="birthday" value="${accountToUpdate.birthday}" required
                                                       class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Gender -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Gender</label>
                                            <div class="col-sm-8">
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="true" ${accountToUpdate.gender ? 'checked' : ''} required>
                                                    Male
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="false" ${!accountToUpdate.gender ? 'checked' : ''} required>
                                                    Female
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Role -->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="roleInSystem" class="col-sm-4 control-label">Role in System</label>
                                            <div class="col-sm-8">
                                                <select id="roleInSystem" name="roleInSystem" required class="form-control">
                                                    <option value="1" ${accountToUpdate.roleInSystem == 1 ? 'selected' : ''}>Admin</option>                                                    
                                                    <option value="2" ${accountToUpdate.roleInSystem == 2 ? 'selected' : ''}>Manager</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Submit Button and Back Link -->
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn-primary btn-block" style="background-color: #333; border-color: #333; margin-bottom: 10px;">
                                            Update Account
                                        </button>
                                        <a href="listAccountController" class="btn btn-default btn-block">
                                            Back to list
                                        </a>
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

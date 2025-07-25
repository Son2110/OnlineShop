<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
     <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Account</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script>
            function confirmDelete(account) {
                return confirm("Are you sure you want to delete account: " + account + "?");
            }
        </script>
    </head>
    <body>
        <div class="container" style="padding: 20px; min-height: 100vh;">
            <div class="panel panel-default">
                <!-- Header Section -->
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-6">
                            <h3 class="panel-title" style="font-size: 24px;">List of Accounts</h3>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="private/addAccount.jsp" class="btn btn-success btn-sm" style="margin-right: 5px;">
                                + Create New Account
                            </a>
                            <a href="listProductController"
                                           class="btn btn-success btn-sm">
                                            Menu
                                        </a>
                            <a href="logoutController" class="btn btn-danger btn-sm">
                                Logout
                            </a>
                            
                        </div>
                    </div>
                </div>
                <!-- Body Section -->
                <div class="panel-body">
                    <!-- Account Table -->
                    <c:if test="${requestScope.accounts != null}">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead style="background-color: #5cb85c; color: white;">
                                    <tr>
                                        <th>Account</th>
                                        <th>Full Name</th>
                                        <th>Birth Date</th>
                                        <th>Gender</th>
                                        <th>Phone</th>
                                        <th>Status</th>
                                        <th>Role</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.accounts}" var="a">
                                        <tr>
                                            <td>${a.account}</td>
                                            <td>${a.lastName} ${a.firstName}</td>
                                            <td>${a.birthday}</td>
                                            <td>${a.gender ? "Male" : "Female"}</td>
                                            <td>${a.phone}</td>
                                            <td>
                                                <span class="label ${a.isUse ? 'label-success' : 'label-danger'}">
                                                    ${a.isUse ? 'Active' : 'Inactive'}
                                                </span>
                                            </td>
                                            <td>${a.roleInSystem == 1? "Admin" : "Staff"}</td>
                                            <td>
                                                <a href="updateAccountController?account=${a.account}" 
                                                   class="btn btn-warning btn-sm" style="margin-right: 5px;">
                                                    Edit
                                                </a>
                                                <a href="activeAccountController?account=${a.account}" 
                                                   class="btn btn-primary btn-sm" style="margin-right: 5px;">
                                                    Toggle Active
                                                </a>
                                                <a href="deleteAccount?account=${a.account}" 
                                                   onclick="return confirmDelete('${a.account}')"
                                                   class="btn btn-danger btn-sm">
                                                    Delete
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>

                    <!-- Pagination -->
                    <div class="row">
                        <div class="col-md-6">
                            <p style="margin-top: 8px;">Showing 1-10 of 50 Accounts</p>
                        </div>
                        <div class="col-md-6 text-right">
                            <div class="btn-group">
                                <button class="btn btn-default btn-sm">Previous</button>
                                <button class="btn btn-success btn-sm">Next</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

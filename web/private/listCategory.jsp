<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Category</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script>
            function confirmDelete(typeId) {
                return confirm("Are you sure you want to delete category ID " + typeId + "?");
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
                            <h3 class="panel-title" style="font-size: 24px;">List of Categories</h3>
                        </div>
                        <div class="col-md-6 text-right">
                            <a href="private/addCategory.jsp" class="btn btn-success btn-sm" style="margin-right: 5px;">
                                + Create New Category
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

                <!-- Body Section -->
                <div class="panel-body">
                    <!-- Category Table -->
                    <c:if test="${requestScope.categories != null}">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead style="background-color: #5cb85c; color: white;">
                                    <tr>
                                        <th>Type ID</th>
                                        <th>Category Name</th>
                                        <th>Memo</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.categories}" var="c">
                                        <tr>
                                            <td>${c.typeId}</td>
                                            <td>${c.categoryName}</td>
                                            <td>${c.memo}</td>
                                            <td>
                                                <a href="updateCategoryController?typeId=${c.typeId}" 
                                                   class="btn btn-warning btn-sm" style="margin-right: 5px;">
                                                    Update
                                                </a>
                                                <a href="deleteCategory?typeId=${c.typeId}" 
                                                   onclick="return confirmDelete(${c.typeId})"
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
                            <p style="margin-top: 8px;">Showing 1-10 of 50 Categories</p>
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
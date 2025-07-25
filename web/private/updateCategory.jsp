<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Category</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container" style="padding: 20px; min-height: 100vh;">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <!-- Header Section -->
                    <div style="margin-bottom: 30px;">
                        <h1 style="font-size: 30px;">Update Category</h1>
                    </div>

                    <!-- Form Section -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form action="<%= request.getContextPath() %>/updateCategoryController" method="post" accept-charset="UTF-8">
                                <!-- Type ID -->
                                <div class="form-group">
                                    <label for="typeId">Type ID</label>
                                    <input id="typeId" type="text" name="typeId" value="${categoryToUpdate.typeId}"
                                           class="form-control" readonly>
                                </div>

                                <!-- Category Name -->
                                <div class="form-group">
                                    <label for="categoryName">Category Name</label>
                                    <input id="categoryName" type="text" name="categoryName" value="${categoryToUpdate.categoryName}" required
                                           class="form-control">
                                </div>

                                <!-- Memo -->
                                <div class="form-group">
                                    <label for="memo">Memo</label>
                                    <textarea id="memo" name="memo" rows="3"
                                              class="form-control">${categoryToUpdate.memo}</textarea>
                                </div>

                                <!-- Submit and Back Buttons -->
                                <div class="form-group">
                                    <button type="submit" 
                                            class="btn btn-primary btn-block" style="background-color: #333; border-color: #333; margin-bottom: 10px;">
                                        Update Category
                                    </button>
                                    <a href="listCategoryController" 
                                       class="btn btn-default btn-block">
                                        Back to List
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
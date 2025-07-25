<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Category</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script>
            function validateForm() {
                let typeId = document.getElementById("typeId").value.trim();
                let categoryName = document.getElementById("categoryName").value.trim();

                if (typeId === "" || categoryName === "") {
                    alert("Please fill in all required fields.");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <div class="container" style="min-height: 100vh; display: flex; align-items: center; padding: 20px;">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-default">
                    <!-- Header Section -->
                    <div class="panel-heading" style="background-color: #5cb85c; color: white; display: flex; justify-content: center; align-items: center; height: 60px;">
                        <h3 class="panel-title" style="font-size: 24px;">Add New Category</h3>
                    </div>

                    <!-- Form Section -->
                    <div class="panel-body">
                        <form action="<%= request.getContextPath() %>/addCategoryController" method="post" onsubmit="return validateForm()">
                            <!-- Type ID Field -->
                            <div class="form-group">
                                <label for="typeId">Type ID <span style="color: red;">*</span></label>
                                <input type="text" 
                                       id="typeId" 
                                       name="typeId" 
                                       placeholder="Enter category type ID"
                                       required
                                       class="form-control">
                            </div>

                            <!-- Category Name Field -->
                            <div class="form-group">
                                <label for="categoryName">Category Name <span style="color: red;">*</span></label>
                                <input type="text" 
                                       id="categoryName" 
                                       name="categoryName" 
                                       placeholder="Enter category name"
                                       required
                                       class="form-control">
                            </div>

                            <!-- Memo Field -->
                            <div class="form-group">
                                <label for="memo">Memo (Optional)</label>
                                <textarea id="memo" 
                                          name="memo" 
                                          rows="3"
                                          placeholder="Additional details about the category (optional)"
                                          class="form-control"></textarea>
                            </div>

                            <!-- Actions -->
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <a href="<%= request.getContextPath() %>/listCategoryController"
                                           class="btn btn-default btn-block">
                                            Cancel
                                        </a>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="submit"
                                                class="btn btn-success btn-block">
                                            Create Category
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
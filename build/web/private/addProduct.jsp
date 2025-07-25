<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Product</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container" style="min-height: 100vh; display: flex; align-items: center; padding: 20px;">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <!-- Header -->
                    <div class="panel-heading" style="background-color: #5cb85c; color: white; display: flex; flex-direction: column; justify-content: center; align-items: center; height: 80px; text-align: center;">
                        <h3 class="panel-title" style="font-size: 24px;">Create New Product</h3>
                        <p style="color: #dff0d8;">Fill in the product details below</p>
                    </div>

                    <!-- Form -->
                    <div class="panel-body">
                        <form action="<%= request.getContextPath() %>/addProductController" method="post" class="form-horizontal">
                            <!-- Two Column Layout -->
                            <div class="row">
                                <!-- Product Id -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Product Id</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="productId" required
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <!-- Product Name -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Product Name</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="productName" required
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <!-- Product Image -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Image URL</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="productImage" required
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <!-- Price -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Price ($)</label>
                                        <div class="col-sm-8">
                                            <input type="number" name="price" step="0.01" required
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <!-- Discount -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Discount (%)</label>
                                        <div class="col-sm-8">
                                            <input type="number" name="discount" step="0.01" required
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <!-- Type ID -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Category ID</label>
                                        <div class="col-sm-8">
                                            <input type="number" name="typeId" required
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <!-- Account -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Account</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="account" required
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <!-- Unit -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Unit</label>
                                        <div class="col-sm-8">
                                            <input type="text" name="unit" required
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <!-- Posted Date -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Posted Date</label>
                                        <div class="col-sm-8">
                                            <input type="date" name="postedDate" required
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Brief (Full Width) -->
                            <div class="form-group">
                                <label class="col-sm-2 control-label">Brief Description</label>
                                <div class="col-sm-10">
                                    <textarea name="brief" rows="3" required
                                              class="form-control"></textarea>
                                </div>
                            </div>

                            <!-- Actions -->
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="pull-left">
                                        <a href="<%= request.getContextPath() %>/listProductController"
                                           class="btn btn-default">
                                            Cancel
                                        </a>
                                    </div>
                                    <div class="pull-right">
                                        <button type="reset"
                                                class="btn btn-warning"
                                                style="margin-right: 5px;">
                                            Reset Form
                                        </button>
                                        <button type="submit"
                                                class="btn btn-success">
                                            Create Product
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
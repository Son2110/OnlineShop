<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Product</title>
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
                        <h1 style="font-size: 30px;">Update Product</h1>
                    </div>

                    <!-- Form Section -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form action="<%= request.getContextPath() %>/updateProductController" method="post">
                                <!-- Product ID -->
                                <div class="form-group">
                                    <label for="product_id">Product ID</label>
                                    <input id="product_id" name="product_id" type="text" value="${productToUpdate.productId}" 
                                           class="form-control" readonly>
                                </div>

                                <!-- Product Name -->
                                <div class="form-group">
                                    <label for="productName">Product Name</label>
                                    <input id="productName" name="productName" type="text" value="${productToUpdate.productName}" required
                                           class="form-control">
                                </div>

                                <!-- Product Image -->
                                <div class="form-group">
                                    <label for="productImage">Product Image</label>
                                    <input id="productImage" name="productImage" type="text" value="${productToUpdate.producImage}" required
                                           class="form-control">
                                </div>

                                <!-- Brief -->
                                <div class="form-group">
                                    <label for="brief">Brief</label>
                                    <textarea id="brief" name="brief" rows="3" required
                                              class="form-control">${productToUpdate.brief}</textarea>
                                </div>

                                <!-- Posted Date -->
                                <div class="form-group">
                                    <label for="postedDate">Posted Date</label>
                                    <input id="postedDate" name="postedDate" type="date" value="${productToUpdate.postDate}" required
                                           class="form-control">
                                </div>

                                <!-- Type ID -->
                                <div class="form-group">
                                    <label for="typeId">Type ID</label>
                                    <input id="typeId" name="typeId" type="text" value="${productToUpdate.type.getTypeId()}" required
                                           class="form-control">
                                </div>

                                <!-- Account -->
                                <div class="form-group">
                                    <label for="account">Account</label>
                                    <input id="account" name="account" type="text" value="${productToUpdate.account.getAccount()}" required
                                           class="form-control">
                                </div>

                                <!-- Unit -->
                                <div class="form-group">
                                    <label for="unit">Unit</label>
                                    <input id="unit" name="unit" type="text" value="${productToUpdate.unit}" required
                                           class="form-control">
                                </div>

                                <!-- Price -->
                                <div class="form-group">
                                    <label for="price">Price</label>
                                    <input id="price" name="price" type="number" step="0.01" value="${productToUpdate.price}" required
                                           class="form-control">
                                </div>

                                <!-- Discount -->
                                <div class="form-group">
                                    <label for="discount">Discount</label>
                                    <input id="discount" name="discount" type="number" step="0.01" value="${productToUpdate.discount}" required
                                           class="form-control">
                                </div>

                                <!-- Submit Button -->
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block" style="background-color: #333; border-color: #333;">
                                        Update Product
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
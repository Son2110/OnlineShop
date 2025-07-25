<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Online Store</title>
        <!-- Updated to Bootstrap 5 -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- Google Fonts -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <style>
            :root {
                --primary-color: #5cb85c;
                --danger-color: #d9534f;
                --light-color: #f8f9fa;
                --dark-color: #212529;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f8f9fa;
                color: #333;
            }

            .navbar {
                background-color: var(--primary-color);
                padding: 1rem 0;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            .navbar-brand {
                font-weight: 700;
                font-size: 1.5rem;
                color: white;
            }

            .welcome-text {
                color: rgba(255, 255, 255, 0.9);
                font-weight: 500;
            }

            .card {
                border: none;
                transition: transform 0.3s, box-shadow 0.3s;
                height: 100%;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            }

            .card-img-top {
                height: 220px;
                object-fit: cover;
            }

            .card-body {
                padding: 1.25rem;
                display: flex;
                flex-direction: column;
            }

            .card-title {
                font-size: 1.25rem;
                font-weight: 600;
                margin-bottom: 0.5rem;
                color: var(--dark-color);
            }

            .card-brief {
                color: #6c757d;
                font-size: 0.9rem;
                margin-bottom: 1rem;
                overflow: hidden;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
            }

            .product-info {
                font-size: 0.9rem;
                margin-bottom: 1rem;
                flex-grow: 1;
            }

            .product-info p {
                margin-bottom: 0.25rem;
            }

            .price {
                font-size: 1.25rem;
                font-weight: 600;
                color: var(--primary-color);
                margin-bottom: 0.25rem;
            }

            .discount {
                color: var(--danger-color);
                font-weight: 500;
                margin-bottom: 1rem;
            }

            .btn-primary {
                background-color: #337ab7;
                border-color: #2e6da4;
            }

            .btn-warning {
                background-color: #f0ad4e;
                border-color: #eea236;
            }

            .btn-danger {
                background-color: var(--danger-color);
                border-color: #d43f3a;
            }

            .btn-success {
                background-color: var(--primary-color);
                border-color: #4cae4c;
            }

            .btn {
                border-radius: 6px;
                font-weight: 500;
                padding: 0.5rem 1rem;
            }

            .btn-sm {
                padding: 0.25rem 0.5rem;
                font-size: 0.875rem;
            }

            .action-buttons {
                display: flex;
                gap: 0.5rem;
            }

            .page-header {
                margin-bottom: 2rem;
                border-bottom: 1px solid #e9ecef;
                padding-bottom: 1rem;
            }

            @media (max-width: 768px) {
                .card-img-top {
                    height: 180px;
                }
            }
        </style>
    </head>
    <body>
        <!-- Modern Navbar with original green color -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container">
                <a class="navbar-brand" href="listProductController">
                    <i class="fas fa-store me-2"></i>Online Store                    
                </a>
                

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <c:if test="${not empty sessionScope.user}">
                            <li class="nav-item me-3">
                                <span class="welcome-text">
                                    <i class="fas fa-user-circle me-1"></i>
                                    Welcome, ${sessionScope.user.getFirstName()}
                                </span>
                            </li>
                            <li class="nav-item me-2">
                                <a href="private/addProduct.jsp" class="btn btn-sm btn-success">
                                    <i class="fas fa-plus-circle me-1"></i>Create Product
                                </a>
                            </li>
                            <li class="nav-item me-2">
                                <a href="listAccountController" class="btn btn-sm btn-success">
                                    <i class="fas fa-users me-1"></i>Accounts
                                </a>
                            </li>
                            <li class="nav-item me-2">
                                <a href="listCategoryController" class="btn btn-sm btn-success">
                                    <i class="fas fa-tags me-1"></i>Categories
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="logoutController" class="btn btn-sm btn-danger">
                                    <i class="fas fa-sign-out-alt me-1"></i>Logout
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${empty sessionScope.user}">
                            <li class="nav-item">
                                <a href="public/login.jsp" class="btn btn-primary btn-sm">
                                    <i class="fas fa-sign-in-alt me-1"></i>Login
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
<!--        <p class="text-center">Member visited : ${applicationScope.members}</p>-->

        <!-- Filter Section -->
        <div class="container mt-4">
            <div class="card shadow-sm">
                <div class="card-header bg-light">
                    <h5 class="mb-0"><i class="fas fa-filter me-2"></i>Filter Products</h5>
                </div>
                <div class="card-body">
                    <form action="listProductController" method="GET" class="row g-3">
                        <!-- Category Filter -->
                        <div class="col-md-3">
                            <label class="form-label">Category</label>
                            <select name="categoryId" class="form-select">
                                <option value="" ${empty param.categoryId ? 'selected' : ''}>All Categories</option>
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.typeId}"  ${not empty param.categoryId and param.categoryId == category.typeId ? 'selected' : ''}>
                                        ${category.categoryName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Price Range Filter -->
                        <div class="col-md-3">
                            <label class="form-label">Price Range</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                <input type="number" name="minPrice" class="form-control" placeholder="Min" min="0" 
                                       value="${param.minPrice}">
                                <input type="number" name="maxPrice" class="form-control" placeholder="Max" min="0"
                                       value="${param.maxPrice}">
                            </div>
                        </div>
                        <!-- Discount Filter -->
                        <div class="col-md-2">
                            <label class="form-label">Discount</label>
                            <select name="discountFilter" class="form-select">
                                <option value="" ${param.discountFilter == '' ? 'selected' : ''}>All Products</option>
                                <option value="hasDiscount" ${param.discountFilter == 'hasDiscount' ? 'selected' : ''}>With Discount</option>
                                <option value="noDiscount" ${param.discountFilter == 'noDiscount' ? 'selected' : ''}>No Discount</option>
                            </select>
                        </div>
                        <!-- Sort By -->
                        <div class="col-md-2">
                            <label class="form-label">Sort By</label>
                            <select name="sortBy" class="form-select">
                                <option value="" ${param.sortBy == '' ? 'selected' : ''}>Default</option>
                                <option value="priceAsc" ${param.sortBy == 'priceAsc' ? 'selected' : ''}>Price: Low to High</option>
                                <option value="priceDesc" ${param.sortBy == 'priceDesc' ? 'selected' : ''}>Price: High to Low</option>
                                <option value="discountDesc" ${param.sortBy == 'discountDesc' ? 'selected' : ''}>Highest Discount</option>
                                <option value="newest" ${param.sortBy == 'newest' ? 'selected' : ''}>Newest First</option>
                            </select>
                        </div>
                        <!-- Apply Button -->
                        <div class="col-md-2 d-flex align-items-end">
                            <button type="submit" class="btn btn-success w-100">
                                <i class="fas fa-search me-1"></i>Apply Filters
                            </button>
                        </div>
                        <!-- Reset Filters -->
                        <div class="col-12 text-end">
                            <a href="listProductController" class="text-decoration-none">
                                <i class="fas fa-times me-1"></i>Reset Filters
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div> 

        <!-- Main Content -->
        <main class="container py-5">
            <header class="page-header">
                <h2 class="text-center mb-4" style="color: #5cb85c;">Our Products</h2>
                <p class="text-center text-muted">Discover our amazing collection of high-quality products</p>
            </header>

            <c:if test="${requestScope.products != null}">
                <div class="row g-4">
                    <c:forEach items="${requestScope.products}" var="p">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="card h-100">
                                <img src="/ProductInformation${p.producImage}" class="card-img-top" alt="${p.productName}">
                                <div class="card-body d-flex flex-column">
                                    <h3 class="card-title">${p.productName}</h3>
                                    <p class="card-brief">${p.brief}</p>

                                    <div class="product-info">
                                        <p><span class="text-muted">ID:</span> #${p.productId}</p>
                                        <p><span class="text-muted">Type:</span> 
                                            <c:choose>
                                                <c:when test="${p.type.getTypeId() == 1}">Dụng cụ nhà bếp</c:when>
                                                <c:when test="${p.type.getTypeId() == 2}">Điện gia dụng</c:when>
                                                <c:when test="${p.type.getTypeId() == 3}">Trang trí nội thất</c:when>
                                                <c:when test="${p.type.getTypeId() == 4}">Dụng cụ thể thao</c:when>
                                                <c:when test="${p.type.getTypeId() == 5}">Thiết bị thông minh</c:when>
                                                <c:when test="${p.type.getTypeId() == 6}">Quần - Áo thời trang</c:when>
                                                <c:otherwise>${p.type.getTypeId()}</c:otherwise>
                                            </c:choose>
                                        </p>
                                        <p><span class="text-muted">Posted:</span> ${p.postDate}</p>
                                        <p><span class="text-muted">Account:</span> ${p.account.getAccount()}</p>
                                        <p><span class="text-muted">Unit:</span> ${p.unit}</p>
                                    </div>

                                    <div class="mt-auto">
                                        <div class="price">$${p.price}</div>
                                        <c:if test="${p.discount > 0}">
                                            <div class="discount">
                                                <i class="fas fa-tag me-1"></i>${p.discount}% Off
                                            </div>
                                        </c:if>

                                        <div class="action-buttons">
                                            <a href="productDetailController?product_id=${p.productId}" 
                                               class="btn btn-primary flex-grow-1">
                                                <i class="fas fa-eye me-1"></i>View
                                            </a>
                                            <c:if test="${not empty sessionScope.user}">
                                                <a href="updateProductController?product_id=${p.productId}" 
                                                   class="btn btn-warning">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="deleteProduct?product_id=${p.productId}" 
                                                   class="btn btn-danger">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
            <c:if test="${empty requestScope.products}">
                <div class="text-center py-5">
                    <i class="fas fa-box-open fa-4x text-muted mb-3"></i>
                    <h3>No Products Found</h3>
                    <p class="text-muted">There are currently no products available.</p>
                </div>
            </c:if>
        </main>


        <!-- Footer -->
        <footer class="bg-dark text-white py-4 mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h5>Online Store</h5>
                        <p class="small">Your one-stop destination for quality products.</p>
                    </div>
                    <div class="col-md-6 text-md-end">
                        <p class="small">© 2025 Online Store. All rights reserved.</p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Bootstrap 5 JS Bundle -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
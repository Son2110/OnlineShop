<%@page import="java.util.LinkedList"%>
<%@page import="java.util.Set"%>
<%@page import="model.Product"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${productDetail.productName} | Product Details</title>
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
                color: #333;
            }

            .product-container {
                min-height: 100vh;
                display: flex;
                align-items: center;
                padding: 40px 0;
            }

            .product-card {
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
                border: none;
            }

            .product-header {
                background-color: #5cb85c;
                padding: 20px;
                position: relative;
            }

            .product-header h1 {
                color: white;
                font-size: 24px;
                font-weight: 600;
                margin-bottom: 0;
            }

            .product-image-wrapper {
                overflow: hidden;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
                margin-bottom: 25px;
            }

            .product-image {
                width: 100%;
                height: 350px;
                object-fit: cover;
                transition: transform 0.5s ease;
            }

            .product-image:hover {
                transform: scale(1.03);
            }

            .product-title {
                font-size: 28px;
                font-weight: 600;
                margin-bottom: 10px;
                color: #333;
            }

            .product-brief {
                color: #6c757d;
                margin-bottom: 25px;
                padding-bottom: 20px;
                border-bottom: 1px solid #e9ecef;
                font-size: 16px;
                line-height: 1.6;
            }

            .product-info {
                display: grid;
                grid-template-columns: 130px 1fr;
                gap: 10px 15px;
                margin-bottom: 30px;
            }

            .info-label {
                font-weight: 500;
                color: #6c757d;
            }

            .info-value {
                font-weight: 600;
                color: #333;
            }

            .price-value {
                font-size: 24px;
                font-weight: 700;
                color: #5cb85c;
            }

            .discount-value {
                font-weight: 600;
                color: #d9534f;
            }

            .product-footer {
                background-color: #f8f9fa;
                border-top: 1px solid #e9ecef;
                padding: 20px;
            }

            .btn-back {
                background-color: #5cb85c;
                border-color: #5cb85c;
                color: white;
                padding: 8px 20px;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                font-weight: 500;
            }

            .btn-back:hover {
                background-color: #4cae4c;
                border-color: #4cae4c;
                color: white;
            }

            .action-buttons {
                display: flex;
                gap: 10px;
                justify-content: flex-end;
            }

            .btn-edit {
                background-color: #f0ad4e;
                border-color: #f0ad4e;
                color: white;
                padding: 8px 20px;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                font-weight: 500;
            }

            .btn-edit:hover {
                background-color: #ec971f;
                border-color: #ec971f;
                color: white;
            }

            .btn-delete {
                background-color: #d9534f;
                border-color: #d9534f;
                color: white;
                padding: 8px 20px;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                font-weight: 500;
            }

            .btn-delete:hover {
                background-color: #c9302c;
                border-color: #c9302c;
                color: white;
            }

            /* Recently Viewed Products Improved Styles */
            .viewed-product-card {
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                border: none;
            }

            .viewed-product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
            }

            .viewed-product-img {
                height: 160px;
                object-fit: cover;
                transition: all 0.4s ease;
            }

            .viewed-product-card:hover .viewed-product-img {
                filter: brightness(1.05);
            }

            .viewed-product-title {
                font-size: 15px;
                font-weight: 600;
                margin-bottom: 8px;
                color: #333;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .card-header h3 {
                font-size: 20px;
                font-weight: 600;
                color: #333;
            }

            .badge {
                font-size: 14px;
                padding: 6px 10px;
                font-weight: 500;
            }

            @media (max-width: 767px) {
                .viewed-product-img {
                    height: 140px;
                }
            }
        </style>
    </head>
    <body>
        <div class="product-container">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="product-card card">
                            <!-- Header -->
                            <div class="product-header">
                                <h1><i class="fas fa-box-open me-2"></i>Product Details</h1>
                            </div>

                            <!-- Product Content -->
                            <div class="card-body p-4">
                                <div class="row g-4">
                                    <!-- Image Section -->
                                    <div class="col-lg-6">
                                        <div class="product-image-wrapper">
                                            <img 
                                                src="/ProductInformation${productDetail.producImage}" 
                                                alt="${productDetail.productName}" 
                                                class="product-image">
                                        </div>
                                    </div>

                                    <!-- Details Section -->
                                    <div class="col-lg-6">
                                        <h2 class="product-title">${productDetail.productName}</h2>
                                        <p class="product-brief">${productDetail.brief}</p>

                                        <div class="product-info">
                                            <div class="info-label">Product ID</div>
                                            <div class="info-value">#${productDetail.productId}</div>

                                            <div class="info-label">Post Date</div>
                                            <div class="info-value">${productDetail.postDate}</div>

                                            <div class="info-label">Type</div>
                                            <div class="info-value">
                                                <c:choose>
                                                    <c:when test="${productDetail.type.getTypeId() == 1}">Dụng cụ nhà bếp</c:when>
                                                    <c:when test="${productDetail.type.getTypeId() == 2}">Điện gia dụng</c:when>
                                                    <c:when test="${productDetail.type.getTypeId() == 3}">Trang trí nội thất</c:when>
                                                    <c:when test="${productDetail.type.getTypeId() == 4}">Dụng cụ thể thao</c:when>
                                                    <c:when test="${productDetail.type.getTypeId() == 5}">Thiết bị thông minh</c:when>
                                                    <c:when test="${productDetail.type.getTypeId() == 6}">Quần - Áo thời trang</c:when>
                                                    <c:otherwise>${productDetail.type.getTypeId()}</c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="info-label">Account</div>
                                            <div class="info-value">${productDetail.account.getAccount()}</div>

                                            <div class="info-label">Unit</div>
                                            <div class="info-value">${productDetail.unit}</div>

                                            <div class="info-label">Price</div>
                                            <div class="price-value">$${productDetail.price}</div>

                                            <div class="info-label">Discount</div>
                                            <div class="discount-value">
                                                <i class="fas fa-tag me-1"></i>${productDetail.discount}%
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Footer -->
                            <div class="product-footer">
                                <div class="row align-items-center">
                                    <div class="col-md-6">
                                        <a href="listProductController" class="btn btn-back">
                                            <i class="fas fa-arrow-left"></i> Back to Products
                                        </a>
                                    </div>
                                    <c:if test="${not empty sessionScope.user}">
                                        <div class="col-md-6">
                                            <div class="action-buttons">
                                                <a href="updateProductController?product_id=${productDetail.productId}" 
                                                   class="btn btn-edit">
                                                    <i class="fas fa-edit"></i> Edit
                                                </a>
                                                <a href="deleteProductController?product_id=${productDetail.productId}" 
                                                   class="btn btn-delete">
                                                    <i class="fas fa-trash"></i> Delete
                                                </a>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <%
                                LinkedList<Product> viewedProducts = (LinkedList<Product>) session.getAttribute("viewedProducts");
                                if (viewedProducts != null && !viewedProducts.isEmpty()) {
                            %>
                            <!-- Recently Viewed Products Section -->
                            <div class="card mt-4 mb-4">
                                <div class="card-header bg-light">
                                    <h3 class="mb-0"><i class="fas fa-history me-2"></i>Recently Viewed</h3>
                                </div>
                                <div class="card-body py-4">
                                    <div class="row g-3">
                                        <% for (Product p : viewedProducts) {%>
                                        <div class="col-md-3 col-sm-6">
                                            <div class="card viewed-product-card h-100">
                                                <div class="position-relative">
                                                    <img src="/ProductInformation<%= p.getProducImage()%>" 
                                                         class="card-img-top viewed-product-img" 
                                                         alt="<%= p.getProductName()%>">
                                                    <div class="position-absolute top-0 end-0 m-2">
                                                        <span class="badge bg-success">$<%= p.getPrice()%></span>
                                                    </div>
                                                </div>
                                                <div class="card-body d-flex flex-column">
                                                    <h5 class="viewed-product-title" title="<%= p.getProductName()%>">
                                                        <%= p.getProductName()%>
                                                    </h5>
                                                    <div class="mt-auto text-end">
                                                        <a href="productDetailController?product_id=<%= p.getProductId()%>" 
                                                           class="btn btn-sm btn-outline-success">
                                                            <i class="fas fa-eye me-1"></i> View Details
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                            <% } else { %>
                            <p>Not view yet</p>
                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap 5 JS Bundle -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;
import model.dao.CategoryDAO;
import model.dao.ProductDAO;

/**
 *
 * @author User
 */
public class listProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet listProductController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet listProductController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
        ProductDAO productDAO = new ProductDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Product> filteredProducts;
        
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");
        String discountFilter = request.getParameter("discountFilter");
        String sortBy = request.getParameter("sortBy");
        String categoryIdStr = request.getParameter("categoryId");
        
        double minPrice = 0;
        double maxPrice = Double.MAX_VALUE;
        
        if (minPriceStr != null && !minPriceStr.isEmpty()) {
            minPrice = Double.parseDouble(minPriceStr);
        }
        
        if (maxPriceStr != null && !maxPriceStr.isEmpty()) {
            maxPrice = Double.parseDouble(maxPriceStr);
        }
        
        //Category and min-max
        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            int categoryId = Integer.parseInt(categoryIdStr);
            filteredProducts = productDAO.getProductsByPriceRangeAndCategory(minPrice, maxPrice, categoryId);
        } else {
            filteredProducts = productDAO.getProductsByPriceRange(minPrice, maxPrice);
        }
        
        // Filter by discount status
        if (discountFilter != null && !discountFilter.isEmpty()) {
            if (discountFilter.equals("hasDiscount")) {
                filteredProducts = filteredProducts.stream()
                        .filter(p -> p.getDiscount() > 0)
                        .collect(Collectors.toList());
            } else if (discountFilter.equals("noDiscount")) {
                filteredProducts = filteredProducts.stream()
                        .filter(p -> p.getDiscount() == 0)
                        .collect(Collectors.toList());
            }
        }
        
        // Sort products
        if (sortBy != null && !sortBy.isEmpty()) {
            switch (sortBy) {
                case "priceAsc":
                    filteredProducts.sort(Comparator.comparing(Product::getPrice));
                    break;
                case "priceDesc":
                    filteredProducts.sort(Comparator.comparing(Product::getPrice).reversed());
                    break;
                case "discountDesc":
                    filteredProducts.sort(Comparator.comparing(Product::getDiscount).reversed());
                    break;
                case "newest":
                    filteredProducts.sort(Comparator.comparing(Product::getPostDate).reversed());
                    break;
            }
        }
        
        
        List<Category> categories = categoryDAO.listAll();        
        request.setAttribute("categories", categories);
        
        request.setAttribute("products", filteredProducts);
        request.getRequestDispatcher("/public/productportfolio.jsp").forward(request, response);
        
    } catch (NumberFormatException e) {
        e.printStackTrace();       
    } catch (Exception e) {
        e.printStackTrace();
    }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

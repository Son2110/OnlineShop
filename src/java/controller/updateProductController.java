/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Category;
import model.Product;
import model.dao.AccountDAO;
import model.dao.CategoryDAO;
import model.dao.ProductDAO;

/**
 *
 * @author User
 */
public class updateProductController extends HttpServlet {

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
            out.println("<title>Servlet updateProductController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateProductController at " + request.getContextPath() + "</h1>");
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
            String product_id = request.getParameter("product_id");
            ProductDAO dao = new ProductDAO();
            Product dto = dao.getObjectById(product_id);
            request.setAttribute("productToUpdate", dto);
            request.getRequestDispatcher("private/updateProduct.jsp").forward(request, response);

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
        
        try {
            String product_id = request.getParameter("product_id");
            String productName = request.getParameter("productName");
            String productImage = request.getParameter("productImage");
            String brief = request.getParameter("brief");

            Date postedDate = Date.valueOf(request.getParameter("postedDate"));
            String typeId = request.getParameter("typeId");
            String account = request.getParameter("account");
            String unit = request.getParameter("unit");
            int price = Integer.parseInt(request.getParameter("price"));
            int discount = Integer.parseInt(request.getParameter("discount"));

            CategoryDAO categoryDAO = new CategoryDAO();
            Category categoryDTO = categoryDAO.getObjectById(typeId);

            AccountDAO accountDAO = new AccountDAO();
            Account accountDTO = accountDAO.getObjectById(account);

            ProductDAO dao = new ProductDAO();
            Product newProduct = new Product(product_id, productName, productImage, brief, postedDate, categoryDTO, accountDTO, unit, price, discount);
            dao.updateRec(newProduct);
            response.sendRedirect("./listProductController");
        } catch (Exception e) {
            e.printStackTrace();
        }
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

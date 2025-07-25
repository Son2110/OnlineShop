/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import Utils.ConnectDb;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Category;
import model.Product;

/**
 *
 * @author User
 */
public class ProductDAO implements Accessible<Product> {

    CategoryDAO categoryDAO = new CategoryDAO();
    AccountDAO accountDAO = new AccountDAO();

    @Override
    public int insertRec(Product o) {

        int kq = 0;
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "INSERT INTO products (productId, productName, productImage, brief, postedDate, typeId, account, unit, price, discount) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, o.getProductId());
            cmd.setString(2, o.getProductName());
            cmd.setString(3, o.getProducImage());
            cmd.setString(4, o.getBrief());
            cmd.setDate(5, (Date) o.getPostDate());
            cmd.setInt(6, o.getType().getTypeId());
            cmd.setString(7, o.getAccount().getAccount());
            cmd.setString(8, o.getUnit());
            cmd.setInt(9, o.getPrice());
            cmd.setInt(10, o.getDiscount());
            kq = cmd.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public int updateRec(Product o) {

        int kq = 0;
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "UPDATE products SET productName=?, productImage=?, brief=?, postedDate=?, typeId=?, account=?, unit=?, price=?, discount=? "
                    + "WHERE productId=?";
            PreparedStatement cmd = con.prepareStatement(sqlString);

            cmd.setString(1, o.getProductName());
            cmd.setString(2, o.getProducImage());
            cmd.setString(3, o.getBrief());
            cmd.setDate(4, (Date) o.getPostDate());
            cmd.setInt(5, o.getType().getTypeId());
            cmd.setString(6, o.getAccount().getAccount());
            cmd.setString(7, o.getUnit());
            cmd.setInt(8, o.getPrice());
            cmd.setInt(9, o.getDiscount());
            cmd.setString(10, o.getProductId());
            kq = cmd.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public int deleteRec(Product o) {

        int kq = 0;
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "DELETE FROM products WHERE productId=?";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, o.getProductId());
            kq = cmd.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public Product getObjectById(String id) {

        Product product = null;
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "SELECT * FROM products WHERE productId=?";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, id);
            ResultSet rs = cmd.executeQuery();
            if (rs.next()) {
                product = new Product(rs.getString("productId"), rs.getString("productName"), rs.getString("productImage"), rs.getString("brief"), rs.getDate("postedDate"), categoryDAO.getObjectById(rs.getString("typeId")), accountDAO.getObjectById(rs.getString("account")), rs.getString("unit"), rs.getInt("price"), rs.getInt("discount"));
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    @Override
    public List<Product> listAll() {

        List<Product> products = new ArrayList<>();
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "SELECT * FROM products";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            ResultSet rs = cmd.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getString("productId"), rs.getString("productName"), rs.getString("productImage"), rs.getString("brief"), rs.getDate("postedDate"), categoryDAO.getObjectById(rs.getString("typeId")), accountDAO.getObjectById(rs.getString("account")), rs.getString("unit"), rs.getInt("price"), rs.getInt("discount"));
                products.add(product);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }

    public List<Product> getProductsByPriceRange(double min, double max) {

        List<Product> productList = new ArrayList<>();
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "SELECT * FROM products WHERE price BETWEEN ? AND ?";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setDouble(1, min);
            cmd.setDouble(2, max);
            ResultSet rs = cmd.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getString("productId"), rs.getString("productName"), rs.getString("productImage"), rs.getString("brief"), rs.getDate("postedDate"), categoryDAO.getObjectById(rs.getString("typeId")), accountDAO.getObjectById(rs.getString("account")), rs.getString("unit"), rs.getInt("price"), rs.getInt("discount"));
                productList.add(product);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }

    public List<Product> getProductsByPriceRangeAndCategory(double min, double max, int typeId) {
        List<Product> productList = new ArrayList<>();
        try {
            Connection con = new ConnectDb().getConnection();
            String sqlString = "SELECT * FROM products WHERE price BETWEEN ? AND ? AND typeId = ?";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setDouble(1, min);
            cmd.setDouble(2, max);
            cmd.setInt(3, typeId);
            ResultSet rs = cmd.executeQuery();
            while (rs.next()) {
                Product product = new Product(rs.getString("productId"), rs.getString("productName"), rs.getString("productImage"), rs.getString("brief"), rs.getDate("postedDate"), categoryDAO.getObjectById(rs.getString("typeId")), accountDAO.getObjectById(rs.getString("account")), rs.getString("unit"), rs.getInt("price"), rs.getInt("discount"));
                productList.add(product);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }
}

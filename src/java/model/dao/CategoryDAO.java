/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import Utils.ConnectDb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author User
 */
public class CategoryDAO implements Accessible<Category> {

    @Override
    public int insertRec(Category o) {

        int kq = 0;
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "INSERT INTO categories (categoryName, memo) VALUES (?, ?)";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, o.getCategoryName());
            cmd.setString(2, o.getMemo());
            kq = cmd.executeUpdate();
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public int updateRec(Category o) {

        int kq = 0;
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "UPDATE categories SET categoryName=?, memo=? WHERE typeId=?";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, o.getCategoryName());
            cmd.setString(2, o.getMemo());
            cmd.setInt(3, o.getTypeId());
            kq = cmd.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public int deleteRec(Category o) {

        int kq = 0;
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "DELETE FROM categories WHERE typeId=?";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setInt(1, o.getTypeId());
            kq = cmd.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public Category getObjectById(String id) {

        Category category = null;
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "SELECT * FROM categories WHERE typeId=?";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, id);
            ResultSet rs = cmd.executeQuery();
            if (rs.next()) {
                category = new Category(rs.getInt("typeId"), rs.getString("categoryName"), rs.getString("memo"));
            }
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }

    @Override
    public List<Category> listAll() {

        List<Category> categories = new ArrayList<>();
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "SELECT * FROM categories";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            ResultSet rs = cmd.executeQuery();
            while (rs.next()) {
                Category category = new Category(rs.getInt("typeId"), rs.getString("categoryName"), rs.getString("memo"));
                categories.add(category);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categories;
    }

}

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
import javax.servlet.ServletContext;
import model.Account;

/**
 *
 * @author User
 */
public class AccountDAO implements Accessible<Account> {

    private ServletContext sc;
    private Connection con;

    @Override
    public int insertRec(Account o) {

        int kq = 0;
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "INSERT INTO accounts (account, pass, lastName, firstName, birthday, gender, phone, isUse, roleInSystem) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, o.getAccount());
            cmd.setString(2, o.getPass());
            cmd.setString(3, o.getLastName());
            cmd.setString(4, o.getFirstName());
            cmd.setDate(5, (Date) o.getBirthday());
            cmd.setBoolean(6, o.isGender());
            cmd.setString(7, o.getPhone());
            cmd.setBoolean(8, o.isIsUse());
            cmd.setInt(9, o.getRoleInSystem());
            kq = cmd.executeUpdate();
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public int updateRec(Account o) {

        int kq = 0;
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "UPDATE accounts SET pass=?, lastName=?, firstName=?, birthday=?, gender=?, phone=?, isUse=?, roleInSystem=? "
                + "WHERE account=?";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, o.getPass());
            cmd.setString(2, o.getLastName());
            cmd.setString(3, o.getFirstName());
            cmd.setDate(4, (Date) o.getBirthday());
            cmd.setBoolean(5, o.isGender());
            cmd.setString(6, o.getPhone());
            cmd.setBoolean(7, o.isIsUse());
            cmd.setInt(8, o.getRoleInSystem());
            cmd.setString(9, o.getAccount());
            kq = cmd.executeUpdate();
            con.close();

        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public int deleteRec(Account o) {

        int kq = 0;
        try {

            String sqlString = "DELETE FROM accounts WHERE account=?";
            Connection con = new ConnectDb().getConnection();
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, o.getAccount());

            kq = cmd.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return kq;
    }

    @Override
    public Account getObjectById(String id) {

        Account account = null;
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "SELECT * FROM accounts WHERE account = ?";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, id);
            ResultSet rs = cmd.executeQuery();
            if (rs.next()) {
                account = new Account(rs.getString("account"), rs.getString("pass"), rs.getString("lastName"), rs.getString("firstName"), rs.getDate("birthday"), rs.getBoolean("gender"), rs.getString("phone"), rs.getBoolean("isUse"), rs.getInt("roleInSystem"));

            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return account;
    }

    @Override
    public List<Account> listAll() {

        List<Account> accounts = new ArrayList<>();
        try {

            Connection con = new ConnectDb().getConnection();
            String sqlString = "SELECT * FROM accounts";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            ResultSet rs = cmd.executeQuery();
            while (rs.next()) {
                Account account = new Account(rs.getString("account"), rs.getString("pass"), rs.getString("lastName"), rs.getString("firstName"), rs.getDate("birthday"), rs.getBoolean("gender"), rs.getString("phone"), rs.getBoolean("isUse"), rs.getInt("roleInSystem"));
                accounts.add(account);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }

    public void updateIsUsed(String accountId) {

        try {
            Connection con = new ConnectDb().getConnection();
            String sqlString = "UPDATE accounts \n"
                    + "SET isUse = CASE WHEN isUse = 1 THEN 0 ELSE 1 END \n"
                    + "WHERE account = ?";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            cmd.setString(1, accountId);
            cmd.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account loginSuccess(String acc, String pass) {
        try {
            Connection con = new ConnectDb().getConnection();
            String sqlString = "SELECT * FROM accounts WHERE account = ? AND pass = ? and isUse = 1";
            PreparedStatement cmd = con.prepareStatement(sqlString);
            AccountDAO dao = new AccountDAO();
            cmd.setString(1, acc);
            cmd.setString(2, pass);

            ResultSet rs = cmd.executeQuery();
            if (rs.next()) {
                return mapResultSetToAccount(rs);
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private Account mapResultSetToAccount(ResultSet rs) throws SQLException {
        Account account = new Account();
        account.setAccount(rs.getString("account"));
        account.setPass(rs.getString("pass"));
        account.setLastName(rs.getString("lastName"));
        account.setFirstName(rs.getString("firstName"));
        account.setBirthday(rs.getDate("birthday"));
        account.setGender(rs.getBoolean("gender"));
        account.setPhone(rs.getString("phone"));
        account.setIsUse(rs.getBoolean("isUse"));
        account.setRoleInSystem(rs.getInt("roleInSystem"));
        return account;
    }

}

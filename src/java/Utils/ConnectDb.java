/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author beu29
 */
public class ConnectDb {

    private String host;
    private String port;
    private String database;
    private String user;
    private String pass;

    public ConnectDb() {
        this.host = "DESKTOP-BNOMSVV";
        this.port = "1433";
        this.database = "ProductIntro";
        this.user = "sa";
        this.pass = "12345";
    }

    public String getUrlConnect() {
        return String.format("jdbc:sqlserver://%s:%s;databaseName=%s;user=%s;password=%s;encrypt=false;characterEncoding=UTF-8;",
                this.host, this.port, this.database, this.user, this.pass);

    }

    public Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(getUrlConnect());
            System.out.println(">>> Ket noi thanh cong !!!");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectDb.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectDb.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }

}

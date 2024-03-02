/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ifyou
 */
public class DBContext {
    protected static Connection connection;

    public DBContext() {
        try {
            String user = "sa";
            String pass = "hieu1810";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=OSS";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (Exception ex) {
            System.err.println("Cannot connect database, " + ex);
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    public static void main(String[] args) {
        DBContext d = new DBContext();
        System.out.println(d.connection);

    }
}

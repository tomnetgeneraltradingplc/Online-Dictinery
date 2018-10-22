/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.disc.jdbc;
import java.sql.*;
import java.io.*;

/**
 *
 * @author thomas
 */
public class DBConnection {
    
    public static Connection connection = null;
    
    public static void main() throws IOException, SQLException, ClassNotFoundException{
     connection = getConnection();
    }
    

    
    public static Connection getConnection() throws IOException, SQLException, ClassNotFoundException{
        if(connection!=null) return connection;
        try {
            if (connection == null || connection.isClosed()) {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/entries?autoReconnect=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=CST&useSSL=false", "root", "root");
                DriverManager.setLoginTimeout(60);

                System.out.println("Connection Successful!!!");
                
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.printf("Error while connecting!!!");
        }
        return connection;
    }
    
    public static void close() throws SQLException {
        DBConnection.connection.close();

    }
    
}

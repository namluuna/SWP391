/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.Common;

import DAO.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Common.User;
import model.Common.UserAddress;

/**
 *
 * @author ifyou
 */
public class UserDAO extends DBContext{
    
    
     public void addNewUser(User user){
         try {
            // SQL INSERT query
            String sql = "INSERT INTO [users] (name, email, password, phone, is_deleted, role, status, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setString(4, user.getPhone());
            st.setInt(5, user.getIs_deleted());
            st.setInt(6, user.getRole());
            st.setInt(7, user.getStatus());
            st.setTimestamp(8, new java.sql.Timestamp(new java.util.Date().getTime()));

            // Execute INSERT
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
     }
     
     public void deleteUser(int userID){
        try {
            String sql = "UPDATE users SET [is_deleted] = 1 WHERE [id] = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public User getUserByID(String userId){
         
         try {
            // Select user with email
            String sql = "SELECT * FROM users WHERE id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String user_email = rs.getString("email");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                int is_deleted = rs.getInt("is_deleted");
                int role = rs.getInt("role");
                int status = rs.getInt("status");
                User u = new User(name, user_email, password, phone, is_deleted, role, status);
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
     
     public User searchUserByEmail(String email){
         
         try {
            // Select user with email
            String sql = "SELECT * FROM users WHERE email = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String user_email = rs.getString("email");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                int is_deleted = rs.getInt("is_deleted");
                int role = rs.getInt("role");
                int status = rs.getInt("status");
                User u = new User(name, user_email, password, phone, is_deleted, role, status);
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public User searchUserByEmailAndPassword(String userEmail, String userPassword){
         
         try {
            // Select user with email
            String sql = "SELECT * FROM users WHERE email = ? AND password = ? AND is_deleted = 0";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userEmail);
            st.setString(2, userPassword);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String user_email = rs.getString("email");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                int is_deleted = rs.getInt("is_deleted");
                int role = rs.getInt("role");
                int status = rs.getInt("status");
                User u = new User(name, user_email, password, phone, is_deleted, role, status);
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
     
    public ArrayList<User> sellectallUser(){
        ArrayList<User> users = new ArrayList<>();
        try {
            // Select address from user with user id
            String sql = "SELECT * from [users] WHERE is_deleted = 0";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int user_id = rs.getInt("id");
                String user_name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String phone = rs.getString("phone");
                int is_deleted = rs.getInt("is_deleted");
                int role = rs.getInt("role");
                int status = rs.getInt("status");
                Timestamp created_at = rs.getTimestamp("created_at");
                UserAddressDAO uadao = new UserAddressDAO();
                ArrayList user_addresses = uadao.sellectallUserAddress(user_id);
                User u = new User(user_id, user_name, email, password, phone, is_deleted, role, status, user_addresses);
                users.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public static void main(String[] args) {
        UserDAO udao = new UserDAO();
        ArrayList<User> users = new ArrayList<>();
        users = udao.sellectallUser();
        for (User user : users) {
            System.out.println(user.toString());
        }
    }
}

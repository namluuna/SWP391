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
import model.Common.PasswordResetToken;

/**
 *
 * @author ifyou
 */
public class PasswordResetTokenDAO extends DBContext{
    public void createPasswordResetToken(PasswordResetToken passwordResetToken){
        try {
            // SQL INSERT query
            String sql = "INSERT INTO [password_reset_tokens] (user_email, token, expiration_time) VALUES (?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, passwordResetToken.getUserEmail());
            st.setString(2, passwordResetToken.getToken());
            st.setTimestamp(3, new java.sql.Timestamp(new java.util.Date().getTime()));
            // Execute INSERT
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public PasswordResetToken findByUserEmail(String email){
        try {
            String sql = "  SELECT * FROM [password_reset_tokens] WHERE user_email = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String userEmail = rs.getString("user_email");
                String token = rs.getString("token");
                Timestamp expirationTime = rs.getTimestamp("expiration_time");
                PasswordResetToken passwordResetToken = new PasswordResetToken(userEmail, token, expirationTime);
                return passwordResetToken;
            }
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

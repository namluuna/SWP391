/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.Common;

import DAO.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Common.UserContract;

/**
 *
 * @author Admin
 */
public class UserContractDAO extends DBContext {

    public UserContract sellectAllUserContract(int userID) {

        try {
            String sql = "SELECT uc.[id] AS [id], uc.[user_id] AS [user_id], uc.[start_date], uc.[slot], uc.[salary] ,uc.[gender] \n"
                    + "FROM [users] AS u JOIN [user_contracts] AS uc ON u.[id] = uc.[user_id]\n"
                    + "WHERE u.[id] = ? AND u.[role] IN (2,3) AND u.[is_deleted] = 0 ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int user_id = rs.getInt("user_id");
                String start_date = rs.getString("start_date");
                int slot = rs.getInt("slot");
                String salary = rs.getString("salary");
                int gender = rs.getInt("gender");
                UserContract uc = new UserContract(id, user_id, start_date, slot, salary, gender);
                return uc;
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void addNewUserContract(UserContract usercontract) {
        try {
            // SQL INSERT query
            String sql = "INSERT INTO user_contracts (user_id, salary, slot, gender) VALUES (?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, usercontract.getUser_id());
            st.setString(2, usercontract.getSalary());
            st.setInt(3, usercontract.getSlot());
            st.setInt(4, usercontract.getGender());
            // Thực hiện truy vấn INSERT
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(UserContract user) {
        String sql = "update user_contracts SET [salary]=?,"
                + " [slot] =?,"
                + "[gender] = ?,"
                + "where id = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(4, user.getSalary());
            statement.setInt(4, user.getSlot());
            statement.setInt(5, user.getGender());
            statement.setInt(6, user.getId());
            statement.executeUpdate();
        } catch (Exception e) {
        }

    }

    public static void main(String[] args) {
        UserContractDAO udao = new UserContractDAO();

    }
}

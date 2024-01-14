/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.Common;

import DAO.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Common.UserAddress;
import java.util.ArrayList;

/**
 *
 * @author ifyou
 */
public class UserAddressDAO extends DBContext {

    public void addNewUserAddress(UserAddress userAddress) {
        try {
            // SQL INSERT query
            String sql = "INSERT INTO user_addresses (user_id, province_code, district_code, ward_code, address, created_at) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userAddress.getUser_id());
            st.setString(2, userAddress.getProvince_code());
            st.setString(3, userAddress.getDistrict_code());
            st.setString(4, userAddress.getWard_code());
            st.setString(5, userAddress.getAddress());
            st.setTimestamp(6, new java.sql.Timestamp(new java.util.Date().getTime()));

            // Thực hiện truy vấn INSERT
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<UserAddress> sellectallUserAddress(int userID) {
        ArrayList<UserAddress> userAddresses = new ArrayList<>();
        try {
            // Select address from user with user id
            String sql = "SELECT ua.[id] AS [id], ua.[user_id] AS [user_id], ua.[province_code] AS [province_code], p.[name] as [province_name], ua.[district_code] AS [district_code], d.name as [district_name], ua.[ward_code] as [ward_code], w.[name] as [ward_name], ua.[address]"
                    + " FROM [users] AS u JOIN [user_addresses] AS ua ON u.[id] = ua.[user_id]"
                    + "JOIN [provinces] AS p ON ua.[province_code] = p.[code] JOIN [districts] AS d ON ua.[district_code] = d.[code] JOIN [wards] AS w ON ua.[ward_code] = w.[code]"
                    + "WHERE u.[id] = ? AND ua.[deleted_at] IS NULL";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int user_id = rs.getInt("user_id");
                String province_code = rs.getString("province_code");
                String province_name = rs.getString("province_name");
                String district_code = rs.getString("district_code");
                String district_name = rs.getString("district_name");
                String ward_code = rs.getString("ward_code");
                String ward_name = rs.getString("ward_name");
                String address = rs.getString("address");
                UserAddress ua = new UserAddress(id, user_id, province_name, province_code, district_name, district_code, ward_name, ward_code, address);
                userAddresses.add(ua);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userAddresses;
    }

}

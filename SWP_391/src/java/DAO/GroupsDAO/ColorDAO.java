/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.GroupsDAO;

import DAO.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Categories.Category;
import model.product.Color;

/**
 *
 * @author Admin
 */
public class ColorDAO extends DBContext{
    PreparedStatement st = null;
    ResultSet rs = null;
    
    public List<Color> selectAllCategory(){
    List<Color> list = new ArrayList<>();
    try {
            String sql = "SELECT [id]\n" +
    "      ,[name]\n" +
    "      ,[description]\n" +
    "      ,[created_at]\n" +
    "      ,[deleted_at]\n" +
    "      ,[updated_at]\n" +
    "  FROM [dbo].[colors]";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {                
                list.add(new Color(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getTimestamp(4),
                            rs.getTimestamp(5)));
            }
        } catch (Exception e) {
            System.out.println("Error in ColorDAO: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean addColor(Color color) {
        try {
            String sql = "INSERT INTO colors (name, description, created_at) VALUES (?, ?, GETDATE())";
            st = connection.prepareStatement(sql);
            st.setString(1, color.getName());
            st.setString(2, color.getDescription());
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Error adding color: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean updateColor(Color color) {
        try {
            String sql = "UPDATE colors SET name=?, description=? WHERE id=?";
            st = connection.prepareStatement(sql);
            st.setString(1, color.getName());
            st.setString(2, color.getDescription());
            st.setInt(3, color.getId());
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Error updating color: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteColor(int id) {
        try {
            String sql = "DELETE FROM colors WHERE id=?";
            st = connection.prepareStatement(sql);
            st.setInt(1, id);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Error deleting color: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}

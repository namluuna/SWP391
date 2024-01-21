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
import model.product.Color;

/**
 *
 * @author Admin
 */
public class ColorDAO extends DBContext{
    PreparedStatement st = null;
    ResultSet rs = null;
    public List<Color> selectAllColor(){
        List<Color> list = new ArrayList<>();
        try {
            String sql = "select * from categories";
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
            System.out.println(e.getMessage());
        }
        return list;
    }
    public void addColor(String name, String des, String cre
            ) {
         
        try {
            String sql = "INSERT  dbo.categories ( [name], [description], created_at ) values (?, ?, ?);";
            st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, des);
            st.setString(3, cre);
            st.executeUpdate();
            
        } catch (Exception e) {
        }
    }
    public void deleteColor(String pid) {
        
        try {
            String sql = "delete from categories where id = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
     public Color getCaByID(String id) {
       
        try {
             String sql = "select * from categories where id = ?";
           st = connection.prepareStatement(sql);
            st.setString(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                return new Color(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getTimestamp(4),
                        rs.getTimestamp(5));
            }
        } catch (Exception e) {
        }
        return null;
    }
    public static void main(String[] args) {
       ColorDAO g = new ColorDAO();
        List<Color> data = g.selectAllColor();
        System.out.println(data);
    }
}

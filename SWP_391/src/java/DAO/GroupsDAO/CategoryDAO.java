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

/**
 *
 * @author MTD
 */
public class CategoryDAO extends DBContext{
    PreparedStatement st = null;
    ResultSet rs = null;
    public List<Category> selectAllCategory(){
        List<Category> list = new ArrayList<>();
        try {
            String sql = "select * from categories";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {                
             list.add(new Category(rs.getInt(1),
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
    public static void main(String[] args) {
       CategoryDAO g = new CategoryDAO();
        List<Category> data = g.selectAllCategory();
        System.out.println(data);
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.GroupsDAO;

import DAO.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Product.Form;
/**
 *
 * @author lucdu
 */
public class FormDAO extends DBContext{
    public ArrayList<Form> selectAllGroups(){
        ArrayList<Form> groupsList = new ArrayList<>();
        try {
            String sql = "select * from groups";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                int Id = rs.getInt("id");
                String Name = rs.getString("name");
                String Description = rs.getString("description");
                String Created_at = rs.getString("created_at");
                String Deleted_at = rs.getString("deleted_at");
                Form groups = new Form(Id, Name, Description, Created_at, Deleted_at);
                groupsList.add(groups);
            }
        } catch (Exception e) {
            System.out.println("getGroupsList: " + e.getMessage());
        }
        return groupsList;
    }
    public static void main(String[] args) {
       FormDAO g = new FormDAO();
        ArrayList<Form> data = g.selectAllGroups();
        System.out.println(data);
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.MaterialsDAO;

import DAO.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Materials.materials;

/**
 *
 * @author Admin
 */
public class MaterialsDAO extends DBContext {
    // ham hien thi list 
     public ArrayList<materials> getAll(){
        ArrayList<materials> materialsList = new ArrayList<>();
        try {
            String sql = "select * from materials";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                int Id = rs.getInt("id");
                String Name = rs.getString("name");
                String Description = rs.getString("description");
                String Created_at = rs.getString("created_at");
                String Deleted_at = rs.getString("deleted_at");
                String Updated_at = rs.getString("updated_at");
                materials m = new materials(Id, Name, Description, Created_at, Updated_at, Deleted_at);
                materialsList.add(m);
           
            }
        } catch (Exception e) {
            System.out.println("getMaterialsList: " + e.getMessage());
        }
        return materialsList;
     }

    // ham main
    public static void main(String[] args) {
        MaterialsDAO mdao = new MaterialsDAO();
        List<materials> data = mdao.getAll();
        System.out.println(data);

    }

}

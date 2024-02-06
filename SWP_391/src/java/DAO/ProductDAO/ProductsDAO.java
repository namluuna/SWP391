/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.ProductDAO;

import DAO.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Product.Products;

/**
 *
 * @author lucdu
 */
public class ProductsDAO extends DBContext{
    public ArrayList<Products> selectAllProducts() {
        ArrayList<Products> ProductsList = new ArrayList<>();
        try {
            String sql = "select * from products";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String Id = String.valueOf(rs.getInt("id"));
                String Code = rs.getString("code");
                String Name = rs.getString("name");
                String Description = rs.getString("description");
                String Price = String.valueOf(rs.getInt("price"));
                String Category_id = String.valueOf(rs.getInt("category_id"));
                String Form_id = String.valueOf(rs.getInt("form_id"));
                String Brand_id = String.valueOf(rs.getInt("brand_id"));
                String Material_id = String.valueOf(rs.getInt("material_id"));
                String Group_id = String.valueOf(rs.getInt("group_id"));
                String Created_at = rs.getString("created_at");
                String Deleted_at = rs.getString("deleted_at");
                String Edited_at = rs.getString("edited_at");
                Products producs = new Products(Id, Code, Name, Description, Price, Category_id, Form_id, Brand_id, Material_id, Group_id, Created_at, Edited_at, Deleted_at);
                
                ProductsList.add(producs);
            }
        } catch (Exception e) {
            System.out.println("getProductsList: " + e.getMessage());
        }
        return ProductsList;
    }
    
    public static void main(String[] args) {
        ProductsDAO p = new ProductsDAO();
        ArrayList<Products> data = p.selectAllProducts();
        System.out.println(data);
    }
    
}

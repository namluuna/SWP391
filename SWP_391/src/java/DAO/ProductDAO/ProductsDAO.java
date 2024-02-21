/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.ProductDAO;

import DAO.DBContext;
import DAO.GroupsDAO.BrandsDAO;
import DAO.GroupsDAO.CategoryDAO;
import DAO.GroupsDAO.FormDAO;
import DAO.GroupsDAO.GroupsDAO;
import DAO.MaterialsDAO.MaterialsDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Categories.Category;
import model.Groups.Brands;
import model.Groups.Groups;
import model.Materials.materials;
import model.Product.Products;
import model.Sale.Form;
import model.Sale.Product;

/**
 *
 * @author lucdu
 */
public class ProductsDAO extends DBContext {

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
                CategoryDAO cDAO = new CategoryDAO();
                Category category = cDAO.getCaByID(Category_id);
                String Form_id = String.valueOf(rs.getInt("form_id"));
                FormDAO fDAO = new FormDAO();
                Form form = fDAO.selectFormByID(Form_id);
                String Brand_id = String.valueOf(rs.getInt("brand_id"));
                BrandsDAO bDAO = new BrandsDAO();
                Brands brand = bDAO.selectbrandByID(Brand_id);
                String Material_id = String.valueOf(rs.getInt("material_id"));
                MaterialsDAO mDAO = new MaterialsDAO();
                materials material = mDAO.selectMaterialsByID(Material_id);
                String Group_id = String.valueOf(rs.getInt("group_id"));
                GroupsDAO gDAO = new GroupsDAO();
                Groups group = gDAO.selectGroupsByID(Group_id);
                Timestamp createdAt = rs.getTimestamp("created_at");
                Timestamp Edited_at = rs.getTimestamp("edited_at");
                Timestamp deletedAt = rs.getTimestamp("deleted_at");
                Products product = new Products(Id, Code, Name, Description, Price, category, form, brand, material, group, createdAt, Edited_at, deletedAt);
                ProductsList.add(product);
            }
        } catch (Exception e) {
            System.out.println("getProductsList: " + e.getMessage());
        }
        return ProductsList;
    }

    public Products selectProductByID(String id) {
        Products product = null;
        try {
            String sql = "SELECT * FROM products WHERE id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, Integer.parseInt(id));

            ResultSet rs = st.executeQuery();

            if (rs.next()) {
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

             //   product = new Products(Id, Code, Name, Description, Price, Category_id, Form_id, Brand_id, Material_id, Group_id, Created_at, Edited_at, Deleted_at);
            }
        } catch (Exception e) {
            System.out.println("selectProductsByID: " + e.getMessage());
        }
        return product;
    }

    public void createNewProduct(String code, String name, String description, String price, String categoryId, String formId, String brandId, String materialId, String groupId) {
        try {
            String sql = "INSERT INTO products (code, name, description, price, category_id, form_id, brand_id, material_id, group_id, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            st.setString(2, name);
            st.setString(3, description);
            st.setString(4, price);
            st.setInt(5, Integer.parseInt(categoryId));
            st.setInt(6, Integer.parseInt(formId));
            st.setInt(7, Integer.parseInt(brandId));
            st.setInt(8, Integer.parseInt(materialId));
            st.setInt(9, Integer.parseInt(groupId));

            // Execute the update
            st.executeUpdate();

            System.out.println("New product created successfully.");
        } catch (Exception e) {
            System.out.println("createNewProduct: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        ProductsDAO p = new ProductsDAO();
        ArrayList<Products> data = p.selectAllProducts();
        //System.out.println(data);
//        Products pro = p.selectProductByID("3");
//        System.out.println(pro);
//p.createNewProduct("NK123", "Nike co cao", "kieu dang co cao", "9000", "1", "1", "1", "1", "1");
        System.out.println(data.get(1).toString());
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.ProductDAO;

import DAO.ColorsDAO.ColorsDAO;
import DAO.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Colors.Colors;
import model.Product.ProductDetails;
import model.Product.Products;
import model.Product.Sizes;

/**
 *
 * @author lucdu
 */
public class ProductDetailDAO extends DBContext {

    public ArrayList<ProductDetails> selectAllProductDetails() {
        ArrayList<ProductDetails> ProductDetailsList = new ArrayList<>();
        try {
            String sql = "select * from product_details";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String Id = String.valueOf(rs.getInt("id"));
                String Product_id = String.valueOf(rs.getInt("product_id"));
                ProductsDAO pDAO = new ProductsDAO();
                Products product = pDAO.selectProductByID(Product_id);
                String Color_id = String.valueOf(rs.getInt("color_id"));
                ColorsDAO cDAO = new ColorsDAO();
                Colors color = cDAO.selectColorByID(Color_id);
                String Size_id = String.valueOf(rs.getInt("size_id"));
                SizeDAO sDAO = new SizeDAO();
                Sizes size = sDAO.selectSizeByID(Size_id);
                String InventoryNumber = String.valueOf(rs.getInt("inventory_number"));
                String Image_url_1 = rs.getString("image_url_1");
                String Image_url_2 = rs.getString("image_url_2");
                String Image_url_3 = rs.getString("image_url_3");
                String Image_url_4 = rs.getString("image_url_4");
                Timestamp createdAt = rs.getTimestamp("created_at");
                Timestamp editedAt = rs.getTimestamp("edited_at");
                Timestamp deletedAt = rs.getTimestamp("deleted_at");

                ProductDetails productDetail = new ProductDetails(Id, product, color, size, InventoryNumber, Image_url_1, Image_url_2, Image_url_3, Image_url_4, createdAt, editedAt, deletedAt);
                ProductDetailsList.add(productDetail);
            }
        } catch (Exception e) {
            System.out.println("getProductDetailsList: " + e.getMessage());
        }
        return ProductDetailsList;
    }

    public boolean createNewProductDetails(String productId, String colorId, String sizeId, String inventoryNumber, String imageUrl1, String imageUrl2, String imageUrl3, String imageUrl4) {
        try {
            String sql = "INSERT INTO product_details (product_id, color_id, size_id, inventory_number, image_url_1, image_url_2, image_url_3, image_url_4, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(1, productId);
            statement.setString(2, colorId);
            statement.setString(3, sizeId);
            statement.setString(4, inventoryNumber);
            statement.setString(5, imageUrl1);
            statement.setString(6, imageUrl2);
            statement.setString(7, imageUrl3);
            statement.setString(8, imageUrl4);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new product detail was inserted successfully!");
                return true;
            }
        } catch (Exception e) {
            System.out.println("createNewProductDetails: " + e.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        ProductDetailDAO pdao = new ProductDetailDAO();
        ArrayList<ProductDetails> data = pdao.selectAllProductDetails();
        System.out.println(data);
    }
}

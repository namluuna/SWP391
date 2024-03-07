/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.Common;

import DAO.DBContext;
import DAO.ProductDAO.ProductDetailDAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Common.Cart;
import model.Common.User;
import model.Product.ProductDetails;

/**
 *
 * @author ifyou
 */
public class CartDAO extends DBContext{
    public ArrayList<Cart> selectAllCartItem(int userId){
        ArrayList<Cart> cartItems = new ArrayList<>();
        try {
            // Select address from user with user id
            String sql = "SELECT * from cart_items WHERE customer_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int user_id = rs.getInt("customer_id");
                int productDetailId = rs.getInt("product_detail_id");
                int quantity = rs.getInt("quantity");
                UserDAO udao = new UserDAO();
                User customer = udao.getUserByID(String.valueOf(user_id));
                ProductDetailDAO productDetailDAO = new ProductDetailDAO();
                ProductDetails productDetail = productDetailDAO.selectProductDetailById(String.valueOf(productDetailId));
                Cart cartItem = new Cart(id, customer, productDetail, quantity);
                cartItems.add(cartItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartItems;
    }
    
    public static void main(String[] args) {
        ArrayList<Cart> cartItems = new ArrayList<>();
        CartDAO cDAO = new CartDAO();
        cartItems = cDAO.selectAllCartItem(24);
        for (Cart cartItem : cartItems) {
            System.out.println(cartItem.toString());
        }
    }
}

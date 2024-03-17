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
import model.Common.ShippingCompany;
import model.Common.User;
import model.Product.ProductDetails;

/**
 *
 * @author ifyou
 */
public class ShippingCompanyDAO extends DBContext{
    public ArrayList<ShippingCompany> getAllShippingCompany(){
        ArrayList<ShippingCompany> shippingCompanies = new ArrayList<>();
        try {
            // Select address from user with user id
            String sql = "SELECT * from shipping_companies";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int name = rs.getInt("name");
                ShippingCompany shippingcompany = new ShippingCompany(id, name);
                shippingCompanies.add(shippingcompany);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shippingCompanies;
    }
    public static void main(String[] args) {
        
    }
}

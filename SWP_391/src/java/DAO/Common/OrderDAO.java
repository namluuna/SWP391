/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.Common;

import DAO.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Common.Order;
import model.Common.OrderDetail;
import model.Common.User;
import model.Common.UserAddress;

/**
 *
 * @author ifyou
 */
public class OrderDAO extends DBContext {

    public ArrayList<Order> selectAllOrder() {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            // Select address from user with user id
            String sql = "SELECT * from orders";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String orderCode = rs.getString("order_code");
                int customerId = rs.getInt("customer_id");
                Timestamp orderDate = rs.getTimestamp("oder_date");
                int orderStatus = rs.getInt("order_status");
                int deliveryAddressId = rs.getInt("delivery_address_id");
                int shipperId = rs.getInt("shiper_id");
                Timestamp deliveryDate = rs.getTimestamp("delivery_date");
                int paymentMethod = rs.getInt("payment_method");
                String note = rs.getString("note");
                UserDAO udao = new UserDAO();
                User customer = udao.getUserByID(String.valueOf(customerId));
                User shipper = udao.getUserByID(String.valueOf(shipperId));
                UserAddressDAO usDAO = new UserAddressDAO();
                UserAddress shippingAddress = usDAO.searchByUserId(String.valueOf(customer.getId()));
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                ArrayList<OrderDetail> orderDetails = orderDetailDAO.selectByOrderId(id);
                Order order = new Order(id, orderCode, customer, orderDate, orderStatus, shippingAddress, shipper, deliveryDate, paymentMethod, orderDetails, note);
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;

    }

    public Order searchOrderByCode(String code) {
        try {
            // Select address from user with user id
            String sql = "SELECT * from orders WHERE order_code = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String orderCode = rs.getString("order_code");
                int customerId = rs.getInt("customer_id");
                Timestamp orderDate = rs.getTimestamp("oder_date");
                int orderStatus = rs.getInt("order_status");
                int deliveryAddressId = rs.getInt("delivery_address_id");
                int shipperId = rs.getInt("shiper_id");
                Timestamp deliveryDate = rs.getTimestamp("delivery_date");
                int paymentMethod = rs.getInt("payment_method");
                String note = rs.getString("note");
                UserDAO udao = new UserDAO();
                User customer = udao.getUserByID(String.valueOf(customerId));
                User shipper = udao.getUserByID(String.valueOf(shipperId));
                UserAddressDAO usDAO = new UserAddressDAO();
                UserAddress shippingAddress = usDAO.searchByUserId(String.valueOf(customer.getId()));
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                ArrayList<OrderDetail> orderDetails = orderDetailDAO.selectByOrderId(id);
                Order order = new Order(id, orderCode, customer, orderDate, orderStatus, shippingAddress, shipper, deliveryDate, paymentMethod, orderDetails, note);
                return order;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();
//        ArrayList<Order> orders = orderDAO.selectAllOrder();
//        for (Order order : orders) {
//            System.out.println(order.toString());
//        }
        Order order = orderDAO.searchOrderByCode("abcdefg");
        System.out.println(order.toString());
    }
}

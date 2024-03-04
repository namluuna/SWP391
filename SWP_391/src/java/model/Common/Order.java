/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Common;

import java.sql.Timestamp;

/**
 *
 * @author ifyou
 */
public class Order {
    private int id;
    private String orderCode;
    private User customer;
    private Timestamp orderDate;
    private int orderStatus;
    private UserAddress deliveryAddress;
    private User shipper;
    private Timestamp deliveryDate;
    private int paymentMethod;
    private String note;

    public Order(int id, String orderCode, User customer, Timestamp orderDate, int orderStatus, UserAddress deliveryAddress, User shipper, Timestamp deliveryDate, int paymentMethod, String note) {
        this.id = id;
        this.orderCode = orderCode;
        this.customer = customer;
        this.orderDate = orderDate;
        this.orderStatus = orderStatus;
        this.deliveryAddress = deliveryAddress;
        this.shipper = shipper;
        this.deliveryDate = deliveryDate;
        this.paymentMethod = paymentMethod;
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(int orderStatus) {
        this.orderStatus = orderStatus;
    }

    public UserAddress getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(UserAddress deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public User getShipper() {
        return shipper;
    }

    public void setShipper(User shipper) {
        this.shipper = shipper;
    }

    public Timestamp getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Timestamp deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public int getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(int paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", orderCode=" + orderCode + ", customer=" + customer + ", orderDate=" + orderDate + ", orderStatus=" + orderStatus + ", deliveryAddress=" + deliveryAddress + ", shipper=" + shipper + ", deliveryDate=" + deliveryDate + ", paymentMethod=" + paymentMethod + ", note=" + note + '}';
    }
    
}

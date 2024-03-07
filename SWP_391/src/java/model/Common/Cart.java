/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Common;

import model.Product.ProductDetails;

/**
 *
 * @author ifyou
 */
public class Cart {
    private int id;
    private User customer;
    private ProductDetails productDetail;
    private int quantity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public ProductDetails getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetails productDetail) {
        this.productDetail = productDetail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Cart(int id, User customer, ProductDetails productDetail, int quantity) {
        this.id = id;
        this.customer = customer;
        this.productDetail = productDetail;
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" + "id=" + id + ", customer=" + customer + ", productDetail=" + productDetail + ", quantity=" + quantity + '}';
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.Product;

/**
 *
 * @author lucdu
 */
public class Products {

    String id, code, name, descrpition, price, category_id, form_id, brand_id, material_id, group_id, created_at, edited_at, deleted_at;

    public Products() {
    }

    public Products(String id, String code, String name, String descrpition, String price, String category_id, String form_id, String brand_id, String material_id, String group_id, String created_at, String edited_at, String deleted_at) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.descrpition = descrpition;
        this.price = price;
        this.category_id = category_id;
        this.form_id = form_id;
        this.brand_id = brand_id;
        this.material_id = material_id;
        this.group_id = group_id;
        this.created_at = created_at;
        this.edited_at = edited_at;
        this.deleted_at = deleted_at;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescrpition() {
        return descrpition;
    }

    public void setDescrpition(String descrpition) {
        this.descrpition = descrpition;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getCategory_id() {
        return category_id;
    }

    public void setCategory_id(String category_id) {
        this.category_id = category_id;
    }

    public String getForm_id() {
        return form_id;
    }

    public void setForm_id(String form_id) {
        this.form_id = form_id;
    }

    public String getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(String brand_id) {
        this.brand_id = brand_id;
    }

    public String getMaterial_id() {
        return material_id;
    }

    public void setMaterial_id(String material_id) {
        this.material_id = material_id;
    }

    public String getGroup_id() {
        return group_id;
    }

    public void setGroup_id(String group_id) {
        this.group_id = group_id;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getEdited_at() {
        return edited_at;
    }

    public void setEdited_at(String edited_at) {
        this.edited_at = edited_at;
    }

    public String getDeleted_at() {
        return deleted_at;
    }

    public void setDeleted_at(String deleted_at) {
        this.deleted_at = deleted_at;
    }

    @Override
    public String toString() {
        return "Products{" + "id=" + id + ", code=" + code + ", name=" + name + ", descrpition=" + descrpition + ", price=" + price + ", category_id=" + category_id + ", form_id=" + form_id + ", brand_id=" + brand_id + ", material_id=" + material_id + ", group_id=" + group_id + ", created_at=" + created_at + ", edited_at=" + edited_at + ", deleted_at=" + deleted_at + '}';
    }

}

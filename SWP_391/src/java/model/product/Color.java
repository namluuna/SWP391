/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.product;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class Color {
    int id;
    String name , description; 
    Timestamp created_at , deleted_at;
    public Color() {
    }

    public Color(int id, String name, String description, Timestamp created_at, Timestamp deleted_at) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.created_at = created_at;
        this.deleted_at = deleted_at;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public Timestamp getDeleted_at() {
        return deleted_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public void setDeleted_at(Timestamp deleted_at) {
        this.deleted_at = deleted_at;
    }


    @Override
    public String toString() {
        return "Groups{" + "id=" + id + ", name=" + name + ", description=" + description + ", created_at=" + created_at + ", deleted_at=" + deleted_at + '}';
    }
}

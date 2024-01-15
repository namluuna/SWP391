/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.Common;

import DAO.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Common.Ward;

/**
 *
 * @author ifyou
 */
public class WardDAO extends DBContext{
    public ArrayList selectAllWard() {
        ArrayList<Ward> wards = new ArrayList<Ward>();

        try {
            String sql = "  SELECT * FROM [wards]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String code = rs.getString("code");
                String name = rs.getString("name");
                String district_code = rs.getString("district_code");
                Ward ward = new Ward(code, name, district_code);
                wards.add(ward);
            }
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
        return wards;
    }

}
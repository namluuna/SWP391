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
import model.Common.District;
/**
 *
 * @author ifyou
 */
public class DistrictDAO extends DBContext{
    public ArrayList selectAllDistrict() {
        ArrayList<District> provinces = new ArrayList<District>();

        try {
            String sql = "  SELECT * FROM [districts]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String code = rs.getString("code");
                String name = rs.getString("name");
                String province_code = rs.getString("province_code");
                District district = new District(code, name, province_code);
                provinces.add(district);
            }
        } catch (java.sql.SQLException e) {
            e.printStackTrace();
        }
        return provinces;
    }
}

package com.emergencyfinder.dao;

import com.emergencyfinder.model.Resource;
import com.emergencyfinder.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResourceDAO {

    public List<Resource> search(String category, String type, String area) {
        List<Resource> list = new ArrayList<>();

        StringBuilder sql = new StringBuilder(
            "SELECT DISTINCT r.*, rt.type_name " +
            "FROM resources r " +
            "JOIN resource_types rt ON r.type_id=rt.type_id " +
            "JOIN resource_services rs ON r.resource_id=rs.resource_id " +
            "JOIN emergency_categories ec ON rs.category_id=ec.category_id " +
            "WHERE r.verified=1 AND r.availability_status='AVAILABLE' "
        );

        List<String> params = new ArrayList<>();

        if (category != null && !category.trim().isEmpty()) {
            sql.append("AND ec.category_name=? ");
            params.add(category);
        }
        if (type != null && !type.trim().isEmpty()) {
            sql.append("AND rt.type_name=? ");
            params.add(type);
        }
        if (area != null && !area.trim().isEmpty()) {
            sql.append("AND (r.area LIKE ? OR r.city LIKE ?) ");
            params.add("%" + area + "%");
            params.add("%" + area + "%");
        }

        sql.append("ORDER BY r.is_24x7 DESC, r.verified DESC, r.name");

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setString(i + 1, params.get(i));
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Resource r = new Resource();
                    r.setResourceId(rs.getInt("resource_id"));
                    r.setName(rs.getString("name"));
                    r.setTypeName(rs.getString("type_name"));
                    r.setAddress(rs.getString("address"));
                    r.setArea(rs.getString("area"));
                    r.setCity(rs.getString("city"));
                    r.setPhone(rs.getString("phone"));
                    r.setLatitude(rs.getDouble("latitude"));
                    r.setLongitude(rs.getDouble("longitude"));
                    r.setIs24x7(rs.getBoolean("is_24x7"));
                    r.setAvailabilityStatus(rs.getString("availability_status"));
                    r.setVerified(rs.getBoolean("verified"));
                    list.add(r);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Resource findById(int id) {
        String sql =
            "SELECT r.*, rt.type_name FROM resources r " +
            "JOIN resource_types rt ON r.type_id=rt.type_id " +
            "WHERE r.resource_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Resource r = new Resource();
                    r.setResourceId(rs.getInt("resource_id"));
                    r.setName(rs.getString("name"));
                    r.setTypeName(rs.getString("type_name"));
                    r.setAddress(rs.getString("address"));
                    r.setArea(rs.getString("area"));
                    r.setCity(rs.getString("city"));
                    r.setPhone(rs.getString("phone"));
                    r.setLatitude(rs.getDouble("latitude"));
                    r.setLongitude(rs.getDouble("longitude"));
                    r.setIs24x7(rs.getBoolean("is_24x7"));
                    r.setAvailabilityStatus(rs.getString("availability_status"));
                    r.setVerified(rs.getBoolean("verified"));
                    return r;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}

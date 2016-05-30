/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.jspwebproject.dao.impl;

import com.leapfrog.jspwebproject.dao.DepartmentDAO;
import com.leapfrog.jspwebproject.dbutil.DbConnection;
import com.leapfrog.jspwebproject.entity.Department;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class DepartmentDAOImpl implements DepartmentDAO {

    private DbConnection conn = new DbConnection();

    @Override
    public int insert(Department d) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO tbl_departments(name,description,status) VALUES(?,?,?)";
        conn.open();
        PreparedStatement stmt = conn.initStatement(sql);
        stmt.setString(1, d.getName());
        stmt.setString(2, d.getDescription());
        stmt.setBoolean(3, d.isStatus());
        int result = conn.executeUpdate();
        conn.close();
        return result;

    }

    private Department mapData(ResultSet rs) throws SQLException {
        Department d = new Department();
        d.setId(rs.getInt("id"));
        d.setName(rs.getString("name"));
        d.setDescription(rs.getString("description"));
        d.setAddedDate(rs.getDate("added_date"));
        if (rs.getDate("modified_date") != null) {
            d.setModifiedDate(rs.getDate("modified_date"));
        }
        d.setStatus(rs.getBoolean("status"));
        return d;

    }

    @Override
    public List<Department> getAll() throws ClassNotFoundException, SQLException {
        List<Department> deptList = new ArrayList<>();
        String sql = "SELECT * FROM tbl_departments";
        conn.open();
        conn.initStatement(sql);
        ResultSet rs = conn.executeQuery();
        while (rs.next()) {

            deptList.add(mapData(rs));
        }
        conn.close();
        return deptList;

    }

    @Override
    public Department getById(int id) throws ClassNotFoundException, SQLException {
        Department d = null;
        String sql = "SELECT * FROM tbl_departments WHERE id=?";
        conn.open();
        PreparedStatement stmt = conn.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = conn.executeQuery();
        while (rs.next()) {
            d = mapData(rs);
        }
        conn.close();
        return d;
    }

    @Override
    public int update(Department d) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE tbl_departments set name=?,description=?,modified_date=?,status=? WHERE id=?";
        conn.open();
        PreparedStatement stmt = conn.initStatement(sql);
        stmt.setString(1, d.getName());
        stmt.setString(2, d.getDescription());
        stmt.setDate(3, new Date(d.getModifiedDate().getTime()));
        stmt.setBoolean(4, d.isStatus());
        stmt.setInt(5,d.getId());
        int result = conn.executeUpdate();
        conn.close();
        return result;
    }

    @Override
    public int delete(int id) throws ClassNotFoundException, SQLException {
        conn.open();
        String sql = "DELETE FROM tbl_departments WHERE id=?";
        PreparedStatement stmt = conn.initStatement(sql);
        stmt.setInt(1,id);
        int result = conn.executeUpdate();
        conn.close();
        return result;
    }

}

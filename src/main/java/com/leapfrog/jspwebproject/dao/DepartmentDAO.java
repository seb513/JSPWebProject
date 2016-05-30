/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.jspwebproject.dao;

import com.leapfrog.jspwebproject.entity.Department;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface DepartmentDAO {
    int insert(Department d)throws ClassNotFoundException,SQLException;
    int update(Department d)throws ClassNotFoundException,SQLException;
    int delete(int id) throws ClassNotFoundException,SQLException;
    List<Department> getAll()throws ClassNotFoundException,SQLException;
    Department getById(int id)throws ClassNotFoundException,SQLException;
}

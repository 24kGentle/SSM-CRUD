package com.wy.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wy.crud.bean.Department;
import com.wy.crud.bean.Employee;
import com.wy.crud.dao.DepartmentMapper;
import com.wy.crud.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService{
    @Autowired
	private DepartmentMapper departmentMapper;
	
	@Override
	public List<Department> getDepts() {
		// TODO Auto-generated method stub
		List<Department> list = departmentMapper.selectByExample(null);
		return list;
	}
}

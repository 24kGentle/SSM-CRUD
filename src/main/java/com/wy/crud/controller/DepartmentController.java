package com.wy.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.wy.crud.bean.Department;
import com.wy.crud.bean.Employee;
import com.wy.crud.bean.Msg;
import com.wy.crud.service.DepartmentService;

/**
 * 处理和部门有关的请求
 * @author WANGYANG
 *
 */
@Controller
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentDervice;
    
	@ResponseBody
	@RequestMapping("/depts")
	public Msg getDepts() {
		List<Department> list = departmentDervice.getDepts();
		return Msg.success().add("depts", list);
	}
}

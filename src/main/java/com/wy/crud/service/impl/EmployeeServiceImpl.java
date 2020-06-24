package com.wy.crud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wy.crud.bean.Employee;
import com.wy.crud.bean.EmployeeExample;
import com.wy.crud.bean.EmployeeExample.Criteria;
import com.wy.crud.bean.Msg;
import com.wy.crud.dao.EmployeeMapper;
import com.wy.crud.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService{

	@Autowired
	EmployeeMapper employeeMapper;
	
	@Override
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		List<Employee> selectByExampleWithDept = employeeMapper.selectByExampleWithDept(null);
	    return selectByExampleWithDept;
	}

	@Override
	public void saveEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(employee);
	}

	/**
	 * 校验用户名是否可用
	 * return true 代表当前姓名客户是否可用    false   代表不可用
	 */
	@Override
	public boolean checkUser(String empName) {
		// TODO Auto-generated method stub
		EmployeeExample employeeExample = new EmployeeExample();
		Criteria createCriteria = employeeExample.createCriteria();
		createCriteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(employeeExample);
		return count == 0;
	}

	@Override
	public Employee getEmp(Integer id) {
		// TODO Auto-generated method stub
		Employee selectByPrimaryKey = employeeMapper.selectByPrimaryKey(id);
		return selectByPrimaryKey;
	}

	/**
	 * 员工更新
	 */
	@Override
	public void updateEmp(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	@Override
	public void deleteEmp(Integer id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void deleteBatch(List<Integer> ids) {
		// TODO Auto-generated method stub
		EmployeeExample employeeExample = new EmployeeExample();
	    Criteria createCriteria = employeeExample.createCriteria();
	    //delete from xxx where emp_id in (1,2,3,.....)
	    createCriteria.andEmpIdIn(ids);
		employeeMapper.deleteByExample(employeeExample);
	}
	


}

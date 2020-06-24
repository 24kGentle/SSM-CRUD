package com.wy.crud.service;

import java.util.List;

import com.wy.crud.bean.Employee;
import com.wy.crud.bean.Msg;

public interface EmployeeService {

	public List<Employee> getAll();

	public void saveEmp(Employee employee);

	public boolean checkUser(String empName);
	
	public Employee getEmp(Integer id);

	public void updateEmp(Employee employee);

	public void deleteEmp(Integer id);

	public void deleteBatch(List<Integer> ids);

}

package com.wy.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wy.crud.bean.Department;
import com.wy.crud.bean.Employee;
import com.wy.crud.dao.DepartmentMapper;
import com.wy.crud.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void testCRUD() {
		System.out.println(departmentMapper);
//		try {
//		departmentMapper.insertSelective(new Department(1,"开发部"));
//		departmentMapper.insertSelective(new Department(2,"测试部"));
//		System.out.println("插入成功");
//	}catch(Exception e) {
//		e.printStackTrace();
//		System.out.println("插入失败");
//	}
		
//		employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@163.com",1));
//		System.out.println("插入成功");
		
		//批量插入
		EmployeeMapper employeeMapper = sqlSession.getMapper(EmployeeMapper.class);
		for(int i=0; i<1000; i++) {
		String uid = UUID.randomUUID().toString().substring(0,5) + i;
        employeeMapper.insertSelective(new Employee(null,uid,"M",uid + "@163.com",1));
	}
		System.out.println("批量插入完成");
	}
}

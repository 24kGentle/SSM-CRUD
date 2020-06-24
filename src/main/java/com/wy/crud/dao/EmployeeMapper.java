package com.wy.crud.dao;

import com.wy.crud.bean.Employee;
import com.wy.crud.bean.EmployeeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper {
    long countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);

    int insert(Employee record);

    int insertSelective(Employee record);

    List<Employee> selectByExample(EmployeeExample example);
    
    Employee selectByPrimaryKey(Integer enmId);
    
    List<Employee> selectByExampleWithDept(EmployeeExample example);
   
    Employee selectByPrimaryKeyWithDept(Integer count);
    
    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);
    
    int updateByPrimaryKeySelective(@Param("record") Employee record);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

	void deleteByPrimaryKey(Integer id);
}
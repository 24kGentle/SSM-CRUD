package com.wy.crud.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wy.crud.bean.Employee;
import com.wy.crud.bean.Msg;
import com.wy.crud.service.EmployeeService;

/**
 * @author wangyang
 */
@Controller
public class EmployeeController {
    @Autowired
	EmployeeService employeeService;
    
    @ResponseBody
    @RequestMapping("/emps")
    public Msg getEmpsWithJson(@RequestParam(value="pn", defaultValue = "1")Integer pn, Model model) {
    	//在查询之前只需要调用，传入页码、以及每页的大小
    	PageHelper.startPage(pn, 5);
    	//startPage之后紧跟的这个查询就是一个分页查询
    	List<Employee> emps = employeeService.getAll();
    	//使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就可以了
    	//分装了详细的分页信息，包括我们查出来的数据，传入连续显示的页数
    	PageInfo pageInfo = new PageInfo(emps,5);
    	return Msg.success().add("pageInfo", pageInfo);
    }
    
    
    //@RequestMapping("/emps")
    public String getEmps(@RequestParam(value="pn", defaultValue = "1")Integer pn, Model model) {
    	//在查询之前只需要调用，传入页码、以及每页的大小
    	PageHelper.startPage(pn, 5);
    	//startPage之后紧跟的这个查询就是一个分页查询
    	List<Employee> emps = employeeService.getAll();
    	//使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就可以了
    	//分装了详细的分页信息，包括我们查出来的数据，传入连续显示的页数
    	PageInfo pageInfo = new PageInfo(emps,5);
    	model.addAttribute("pageInfo", pageInfo);
    	return "list";
    }
    
	@ResponseBody
	@RequestMapping(value="/emp",method = RequestMethod.POST)
	public Msg saveEmp(@Valid Employee employee,BindingResult bindingResult) {
		
		Map<String,Object> map = new HashMap<>();
		List<FieldError> fieldErrors = bindingResult.getFieldErrors();
		for (FieldError fieldError : fieldErrors) {
			System.out.println("错误的字段名为：" + fieldError.getField());
			System.out.println("错误信息:" + fieldError.getDefaultMessage());
			map.put(fieldError.getField(), fieldError.getDefaultMessage());
		}
		
		if(bindingResult.hasErrors()) {
		   return Msg.fail().add("errorFields", map);	
		}else {
		employeeService.saveEmp(employee);
		return Msg.success();
		}
	}
	
	/**
	 * 检查用户名是否可用
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuse(@RequestParam("empName")String empName) {
		//先判断用户名是否是合法的表达式
//		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
//		if(!regx.matches(regx)) {
//			return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-15位中文");
//		}
		//数据库用户名重复校验
		boolean b = employeeService.checkUser(empName);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "用户名不可用");
		}
	}
	
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id) {
		Employee emp = employeeService.getEmp(id);
		return Msg.success().add("emp", emp);
	}
	
	
	/**
	 * 如果直接发送ajax=PUT请求引发的血案:
	 *   PUT请求，请求体中的数据，request.geteParamter("empName")拿不到
	 *   Tomcat一看是PUT不会封装请求体中的数据为map，只有POST形式的请求才封装为map
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	public Msg saveEmp(Employee employee) {
		System.out.println(employee);
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	/**
	 * 单个批量二合一
	 * 批量删除  1-2-3
	 * 单个删除 1
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="emp/{ids}",method =RequestMethod.DELETE)
	public Msg deleteEmpById(@PathVariable("ids") String ids) {
		System.out.println(ids);
		//批量删除与单个删除
		if(!ids.contains("-")) {
			employeeService.deleteEmp(Integer.valueOf(ids));
		}else {
			List<Integer> list = new ArrayList<>();
			String[] str_ids = ids.split("-");
			for (String id : str_ids) {
				list.add(Integer.parseInt(id));
			}
			employeeService.deleteBatch(list);
		}
		
		return Msg.success();
	}
	
}

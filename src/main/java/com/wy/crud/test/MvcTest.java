package com.wy.crud.test;

import java.util.List;
import java.util.function.Consumer;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.wy.crud.bean.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration   
@ContextConfiguration(locations= {"classpath:applicationContext.xml","classpath:dispatcherServlet.xml"})
public class MvcTest {
	//传入SpringMVC的ioc
	@Autowired
	WebApplicationContext webApplicationContext;
	
	MockMvc mockMvc;
	
	@Before
	public void initMockMvc() {
		mockMvc= MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
	}
	
	@SuppressWarnings("unchecked")
	@Test
	public void testPage() throws Exception {
		//模拟请求拿到返回值
		MvcResult andReturn = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "5")).andReturn();
		//请求成功以后，请求域中会有pageInfo;我们可以取出pageInfo进行校验
		MockHttpServletRequest request = andReturn.getRequest();
	    @SuppressWarnings("rawtypes")
		PageInfo pageInfo =(PageInfo) request.getAttribute("pageInfo");
	    System.out.println("当前页码：" + pageInfo.getPageNum());
	    System.out.println("总页码：" + pageInfo.getPages());
	    System.out.println("总记录数：" + pageInfo.getTotal());
	    System.out.println("在页面需要连续显示的页码");
	    int[] navigatepageNums = pageInfo.getNavigatepageNums();
	    for (int i : navigatepageNums) {
			System.out.println(" " + i);
		}
	    
	   @SuppressWarnings("rawtypes")
	List list = pageInfo.getList();
	   list.forEach(new Consumer<Employee>() {

		@Override
		public void accept(Employee t) {
			// TODO Auto-generated method stub
			System.out.println("ID: " + t.getEmpId() + "===>Name: " + t.getEmpName());
		}
	});
	}

}

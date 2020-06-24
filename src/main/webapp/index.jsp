<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
       
     %>

<!-- 引入jquery -->
<script type="text/javascript"
	src="${APP_PATH}/static/js/jquery-2.1.1.min.js"></script>
<!-- Bootstrap CSS -->
<link
	href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap JS -->
<script
	src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<title>SSM-CRUD</title>
</head>
<body>


<!-- 员工修改的模态框 -->
<div id="empUpdateModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">

  <div class="modal-content">
  
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="model-title" id="myModalLabel">员工修改</h4>
  </div>
  <div class="modal-body" id="emp_update_modal">

					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_update_input" name="empName"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="email_update_input"
									name="email" placeholder="email@163.com">
									<span class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									id="gender1_update_input" name="gender" value="M"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									id="gender2_update_input" name="gender" value="F"> 女
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<!--部门提交部门id即可  -->
								<select class="form-control" name="dId">
								</select>
							</div>
						</div>


					</form>

				</div>
  <div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
    <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
  </div>
</div></div></div>




 
<!-- 员工添加的模态框 -->
<div id="empAssModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
  
  
  <div class="modal-content">
  
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="model-title" id="myModalLabel">员工添加</h4>
  </div>
  <div class="modal-body" id="emp_add_modal">

					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="empName_add_input"
									name="empName" placeholder="empName">
									<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="email_add_input"
									name="email" placeholder="email@163.com">
									<span class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									id="gender1_add_input" name="gender" value="M"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									id="gender2_add_input" name="gender" value="F"> 女
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label">deptName</label>
							<div class="col-sm-4">
								<!--部门提交部门id即可  -->
								<select class="form-control" name="dId" id="dept_add_select">
								</select>
							</div>
						</div>


					</form>

				</div>
  <div class="modal-footer">
    <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
  </div>
</div></div></div>


	<!-- 搭建页面显示 -->
	<div class="container">
		<!--标题  -->
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!--按钮  -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
					<tr>
					    <th>
					       <input type="checkbox" id="check_all"/>
					    </th>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
					</thead>
					
					<tbody>
				    </tbody>

				</table>
			</div>

		</div>

		<!-- 显示分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area">
				
			</div>
			<!--分页条信息  -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
     var totalRecord;
	 var currentPage;
     //页面加载完以后，直接发送ajax请求，要到分页数据
    $(function() {
    	to_page(1);
             
    });

    //解析员工数据
    function build_emps_table(result) {
        //清空table表格
        $("#emps_table tbody").empty();
          var emps = result.extend.pageInfo.list;
          $.each(emps,function(index,item) {
              var checkBoxTd = $("<td><input type='checkbox' class='check_item' /></td>")
              var empIdTd = $("<td></td>").append(item.empId);
              var empNameTd = $("<td></td>").append(item.empName);
              var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女" );
              var emailTd = $("<td></td>").append(item.email);
              var deptNameTd = $("<td></td>").append(item.department.deptName);
              var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                            .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
               //为编辑按钮添加一个自定义的属性，来表示当前员工id
              editBtn.attr("edit-id",item.empId);
                
              var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                            .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");

              //为删除按钮添加一个自定义的属性来表示当前删除的员工id
              delBtn.attr("delete-id",item.empId);
              
              var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
              //append方法完成以后还是返回以前的元素
              $("<tr></tr>").append(checkBoxTd)
              .append(empIdTd)
              .append(empNameTd)
              .append(genderTd)
              .append(emailTd)
              .append(deptNameTd)
              .append(btnTd)
              .appendTo("#emps_table tbody");
              });          
        }

    //解析显示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
           $("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum+"页,总共"+result.extend.pageInfo.pages+"页，总共"+result.extend.pageInfo.total+"条记录");
         totalRecord =  result.extend.pageInfo.total;
         currentPage = result.extend.pageInfo.pageNum;
        }
    //解析显示分页条
   function build_page_nav(result){
	   $("#page_nav_area").empty();
	   var ul = $("<ul></ul>").addClass("pagination");
	   var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
	   var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
     
	   
       //添加首页和前一页的提示
	  ul.append(firstPageLi).append(prePageLi);
	   
       $.each(result.extend.pageInfo.navigatepageNums,function(index,item) {
             var numLi = $("<li></li>").append($("<a></a>").append(item));
             if(result.extend.pageInfo.pageNum == item) {
            	 numLi.addClass("active");
             }
             numLi.click(function(){
  
                  to_page(item);
                 });
             ul.append(numLi);
           });
       if(result.extend.pageInfo.hasPreviousPage == false) {
    	   firstPageLi.addClass("disabled");
    	   prePageLi.addClass("disabled");
           }else {
        	   firstPageLi.click(function() {
                   to_page(1);

        		    });  

        	    prePageLi.click(function() {
        	    	to_page(result.extend.pageInfo.pageNum - 1);
        		    });
               }
	   var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
	   var lastPageLi =$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
	  
		  
       if(result.extend.pageInfo.hasNextPage == false) {
    	   nextPageLi.addClass("disabled");
    	   lastPageLi.addClass("disabled");
           }else {
        	   nextPageLi.click(function() {
        		   to_page(result.extend.pageInfo.pageNum + 1);
        		   });
        	   lastPageLi.click(function() {
                   to_page(result.extend.pageInfo.pages);
                   });
               }
	   
	   //添加下一页和末页的提示
	   ul.append(nextPageLi).append(lastPageLi);
      
	  var navEle = $("<nav></nav>").append(ul);

	  navEle.appendTo("#page_nav_area");
   }


   function to_page(pn) {
        $.ajax({
               url:"${APP_PATH}/emps",
               data:"pn="+pn,
               type:"GET",
               success:function(result) {
                   // console.log(result)
                	 build_emps_table(result);
                	 build_page_info(result);
                	 build_page_nav(result);
                     }
                  });
	   }

   //点击新增按钮弹出模态框
$("#emp_add_modal_btn").click(function() {
	//表单重置(数据+样式)
	reset_form("#emp_add_modal form");
       //发送ajax请求，查出部门信息，显示在下拉列表中
          getDepts("#dept_add_select");
      //弹出模态框
      $("#empAssModal").modal({
              backdrop:"static"

          });
	
});

function reset_form(ele) {
    $(ele)[0].reset();
    //清空表单样式 及内容 
    $(ele).find("*").removeClass("has-error has-success");
    $(ele).find(".help-block").text("");
	
}
//查出部门信息，显示在下拉列表中
function getDepts(ele) {
	$(ele).empty();
$.ajax({
     url:"${APP_PATH}/depts",
     type:"GET",
     success:function(result) {
        $.each(result.extend.depts,function() {
              var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
              optionEle.appendTo(ele);

            });
         }	
});
}

//点击保存，保存员工
$("#emp_save_btn").click(function() {
      //先对提交的数据交给服务器进行校验
   /*    if(!validate_add_form()) {
          return false;
         };  */
if($(this).attr("ajax-va") == "error") {
	alert("保存失败");
    return false;
};     
	//发送ajax请求
    $.ajax({
         url:"${APP_PATH}/emp",
         type:"POST",
         data:$("#emp_add_modal form").serialize(),
         success:function(result) {
             if(result.code == 100) {
            	//关闭模块框  
            	 $("#empAssModal").modal('hide');
            	 // 跳到最后一页
                 to_page(totalRecord);
                 }else {
                    //显示失败信息
                     if(undefined != result.extend.errorFields.email) {
                           show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                         }
                     if(undefined != result.extend.errorFields.empName) {
                    	 show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                         }
                     }
            
               
        	 
             }

        });
      

	   });


function validate_add_form() {
       //1.拿到要校验的数据，使用正则表达式
      var empName = $("#empName_add_input").val();
      var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
      if(!regName.test(empName)) {
            //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
            show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字的组合");      
            return false;
          }else {
        	  show_validate_msg("#empName_add_input","success","");
              }
      var email = $("#email_add_input").val();
      var regName1 = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
      //验证邮箱信息 
     if(!regName1.test(email)) {
         //alert("邮箱格式不正确");
         show_validate_msg("#email_add_input","error","邮箱格式不正确");
        return false;
         }else {
        	 show_validate_msg("#email_add_input","success","");
             }
     return true;
}

function show_validate_msg(ele,status,msg) {
	//清除当前元素的校验状态
	$(ele).parent().removeClass("has-success has-error");
	$(ele).next("span").text("");
if("success" == status) {
	 $(ele).parent().addClass("has-success");
	  $(ele).next("span").text(msg);
}else if("error" == status)
	$(ele).parent().addClass("has-error");
    $(ele).next("span").text(msg);
	
}

$("#empName_add_input").change(function() {
	 //var empName1 = this.value;
      //发送ajax请求校验用户名是否可用 
       $.ajax({
           url:"${APP_PATH}/checkuser",
           type:"GET",    
           data:"empName="+$("#empName_add_input").val(),
           success:function(result) {
                 if(result.code==100) {
                	 show_validate_msg("#empName_add_input","success","用户名可用");
                	 $("#emp_save_btn").attr("ajax-va","success");
                     }else {
                    	 show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    	 $("#emp_save_btn").attr("ajax-va","error");
                         }
               }
            });
});

//我们是按钮创建之前就绑定了click，所以绑定不上   jquery新版没有live，使用on替代
$(document).on("click",".edit_btn",function() {
	//查出部门信息，并显示部门列表
	getDepts("#empUpdateModal select");
	//查出员工信息
	getEmp($(this).attr("edit-id"));

	//把员工的id传递给模态框的更新按钮
    $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
	
	//弹出模态框
    $("#empUpdateModal").modal({
            backdrop:"static"

        });
	
});

//单个删除
$(document).on("click",".delete_btn",function() {
	//弹出是否删除提示框
	var empName = $(this).parents("tr").find("td:eq(2)").text();
	var empId = $(this).attr("delete-id");
	if(confirm("确认删除【"+empName+"】吗?")) {
        //确认，发送ajax请求删除即可
        $.ajax({
            url:"${APP_PATH}/emp/"+empId,
            type:"POST",
             data:"&_method=DELETE",
             success:function(result) {
                alert(result.msg);
                to_page(currentPage);
                 }       
            });
		}
});


function getEmp(id) {
	$.ajax({
       url:"${APP_PATH}/emp/"+deleteBtn.attr(""),
       type:"GET",
       success:function(result) {
            var empData = result.extend.emp;
            $("#empName_update_input").text(empData.empName);
            $("#email_update_input").val(empData.email);
            $("#empUpdateModal input[name=gender]").val([empData.gender]);
            $("#empUpdateModal select").val([empData.dId]);
           }
		}) 
}

//点击更新，更新员工信息
$("#emp_update_btn").click(function() {
	//验证邮箱是否合法
	  var email = $("#email_update_input").val();
      var regName1 = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
      //验证邮箱信息 
     if(!regName1.test(email)) {
         //alert("邮箱格式不正确");
         show_validate_msg("#email_update_input","error","邮箱格式不正确");
        return false;
         }else {
        	 show_validate_msg("#email_update_input","success","");
             }

     //发送ajax请求保存更新的员工数据
     $.ajax({
         url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
         type:"POST",
         data:$("#emp_update_modal form").serialize()+"&_method=PUT",
         //data:$("#emp_update_modal form").serialize(),
         success:function(result) {
              //关闭模块框
              $("#empUpdateModal").modal("hide");
             //回到主页面
              to_page(currentPage);
             }
         });
});

//完成全选/全不选功能
$("#check_all").click(function() {
      //attr获取checked是undefined
      //我们这些dom原生的属性用prop;attr获取自定义的值
      //prop修改和读取dom原生的值 
    //alert($(this).prop("checked"));
	$(".check_item").prop("checked",$(this).prop("checked"));
});

$(document).on("click",".check_item",function() {
	//判断当前选择中的元素是否为5个
	var flag = $(".check_item:checked").length == $(".check_item").length;
	$("#check_all").prop("checked",flag);
});


$("#emp_delete_all_btn").click(function() {
    
	   var empNames = "";
	   var del_idstr = "";
      $.each($(".check_item:checked"),function(){
    	  empNames += $(this).parents("tr").find("td:eq(2)").text()+",";

    	  del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
      });
      // 去除empName,del_idstr多余的，
      empNames = empNames.substring(0,empNames.length-1);
      del_idstr = del_idstr.substring(0,del_idstr.length-1);
          if(confirm("确认删除【"+empNames+"】吗?")) {
              //确认，发送ajax请求删除即可
              $.ajax({
                  url:"${APP_PATH}/emp/"+del_idstr,
                  type:"POST",
                  data:"&_method=DELETE",
                  success:function(result){
                      alert(result.msg);
                      //回到当前页面 
                      to_page(currentPage);
                      }
                    });
          } 
	
});


   
	</script>
</body>
</html>
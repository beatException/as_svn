<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
   <div id="user_list5"></div>
    <script type="text/javascript">
       $("#user_list5").datagrid({
	         url:"findAllUsers",
	          columns:[[
	           {field:"id",title:"标示",width:100,checkbox:true},
	           {field:"name",title:"账号",width:100}
	          ]],
	          toolbar:[
	          {text:"添加",iconCls:"icon-add" ,handler:function(){addUser();}},
	          {text:"删除",iconCls:"icon-remove",handler:function(){deleteUser();}},
	          {text:"修改",iconCls:"icon-edit"}
	          ]
	         }); 
	         
	         function deleteUser() {
		//定义一个数组,存放数据的id
		alert(213);
		var ids = [];
		var rs = $("#tab_user").datagrid("getSelections");

		for (var i = 0; i < rs.length; i++) {

			ids[i] = rs[i].id

		}
		var str = JSON.stringify(ids);
		alert(str);
		$.ajax({
			url : "deleteUsers",
			type : "post",
			data : str,
			contentType : "application/json",
			success : function(data) {
				alert(data);
				$("#tab_user").datagrid("reload");

			}
	    });
	    }
		 

	     
    </script>
   
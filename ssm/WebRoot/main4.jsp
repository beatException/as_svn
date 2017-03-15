<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
   <div id="user_list"></div>
   <div id="qx_window" class="easyui-window" data-options="closed:true,modal:true" style="width:400px;height:300px">
       <ul id="tree_qx" class="easyui-tree" url="findAllModules" checkbox=true></ul>
       <a href="javascript:save()" class="easyui-linkbutton">保存</a>
   </div>
  
    <script type="text/javascript">
       $("#user_list").datagrid({
	         url:"findAllUsers",
	          columns:[[
	           {field:"id",title:"标示",width:100,checkbox:true},
	           {field:"name",title:"账号",width:100}
	          ]],
	          toolbar:[
	          {text:"添加",iconCls:"icon-add" ,handler:function(){addUser();}},
	          {text:"删除",iconCls:"icon-remove",handler:function(){deleteUser();}},
	          {text:"修改",iconCls:"icon-edit"},
	          {text:"权限",iconCls:"icon-search",handler:function(){fp();}}
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
		 function fp(){
		 
		   var row= $("#user_list").datagrid("getSelected");
	      //给树填充数据
	       $("#tree_qx").tree({
	          cascadeCheck:false,
	          url:"findAllModules?id="+ row.id+"&time="+new Date()
	       });
		 
		 
		 $("#qx_window").window("open");
		 
		 
		 }
function save(){
	     //用户
	       var row= $("#user_list").datagrid("getSelected");
	       //分配给用户的模块
	       var ns=$("#tree_qx").tree("getChecked");
	       var ids=[];
	       ids[0]=row.id;
	       ids[1]=ns[0].id;
	       var j=JSON.stringify(ids);
	       $.ajax({
	        url:"updateQx",
	        data:j,
	        type:"post",
	        contentType:"application/json",
	        success:function(data){
	           $("#qx_window").window("close");
	        }
	       });
	       
	     }
	     
    </script>
   
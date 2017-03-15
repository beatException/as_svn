<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/easyui.css" />
<link rel="stylesheet" href="css/icon.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/easyui.js"></script>
<script type="text/javascript">
$(function() {
	    //获取拥有权限的模块
	    $.getJSON("findModuleByUser?id="+${u.id},function(data){
	    //遍历数组
	       $.each(data,function(a,b){
	         
	           $("#module").accordion("add",{
	            title:b.text,
	            content:"<ul id='tree"+b.id+"' class='easyui-tree' url='findModuleByPid?id="+b.id+"'></ul>"
	           });
	           //指定监听函数
	           $("#tree"+b.id).tree({
	             //node:所点击的树的节点
	             onClick:function(node){
	       alert(node.url);
	             //判断node.text命名的tab是否存在
	              var isHad=$("#work").tabs("exists",node.text);	              
	              if(isHad){
	              //激活
	                $("#work").tabs("select",node.text);
	              }else{
	             
	              //添加tab,tab的内容由{}定义
	                 $("#work").tabs("add",{
	                   title:node.text,
	                   href:node.url,
	                   closable:true
	                 });
	              }
	             
	             }
	           });
	          
	       });
	    });
	    
		 
	});
	
	 
</script>

</head>
<body>
	<div class="easyui-layout" style="width:100%;height:500px">
		<div data-options="region:'north'" split="true" style="height:20%">
		welcome:${u.name}
		</div>
		<div data-options="region:'west'" split="true" style="width:200px">
			<div id="module" class="easyui-accordion">
				 
			</div>


		</div>
		<div data-options="region:'center'" split="true">

			<div id="work" class="easyui-tabs"></div>
		</div>

	</div>

	<div id="p" class="easyui-panel" title="Basic Panel"
		data-options="fit:true" style="width: 700px; height: 200px;">


		<div title="Title2" data-options="iconCls:'icon-reload',selected:true"
			style="padding:10px;">
			
			<input id="vv" class="easyui-validatebox" data-options="required:true,validType:'email'"/>
			
			</div>



	</div>

</body>
</html>
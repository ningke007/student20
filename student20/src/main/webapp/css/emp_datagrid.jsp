<%@ page pageEncoding="UTF-8" %>
<% request.setAttribute("path", request.getContextPath()); %>
<!DOCTYPE HTML>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${path }/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="${path }/css/themes/icon.css">	
		<link rel="stylesheet" type="text/css" href="${path }/css/style.css">
		<script type="text/javascript" src="${path }/js/jquery.min.js"></script>
		<script type="text/javascript" src="${path }/js/jquery.easyui.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$('#tab').datagrid({
					title:'员工信息',
					width:600,
					height:400,
					fitColumns:true,
					url:'${path}/emp/findAllEmp.do',
					columns:[[
						{field:'id',title:'ID',width:100},					
						{field:'name',title:'名字',width:100},	
						{field:'age',title:'年龄',width:100},	
						{field:'dept',title:'部门',width:100,
							formatter:function(value,row,index){
								console.log(row.dept);
								return row.dept.dname;
							}
						},	
					]]
				});
			});
		</script>
	</head>
	<body>
		<table id="tab"></table>
	</body>
</html>
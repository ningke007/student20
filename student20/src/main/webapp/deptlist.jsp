<%@ page pageEncoding="UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>department</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/themes/icon.css">	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">	
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
	
		<script type="text/javascript">
		
		$(function(){
			/* $.ajax({
				type: "GET",
				url: "${pageContext.request.contextPath }/weather.do",
				dataType: "json",
				success: function(data){
					$('#weather').text(data[0]+"市 ："+data[1]+" 更新时间："+data[2]);
				},
			});		 */
			/* $('#p').panel({
				title: "部门信息",
				width:480,
				height:300,
				//fit:true, //匹配父容器大小
				collapsible:true, //是否显示折叠按钮
				minimizable:true, // 是否显示最小化按钮
				maximizable:true, // 是否显示最大化按钮
				closable:true,
				href:'${pageContext.request.contextPath }/dept.jsp',
			}); */
			/* datagrid */
			$('#dg').datagrid({
				title:'部门表',
				fit:true, //适配父容器
				fitColumns:true, //自动匹配列宽
				url:'${pageContext.request.contextPath }/dept/showAllDept.do',
				columns:[[
					{field:'ck',checkbox:true,width:100},//添加复选框
					{field:'did',title:'ID',width:100},
					{field:'dname',title:'NAME',width:100},
					{field:'note',title:'NOTE',width:100},
					{field:'o',title:'option',width:100,
						/**
  								value: 当前字段匹配到的值
  								row : 当前行的值
  								index :当前行的下标
  							*/
  							//返回
  						formatter:function(value,row,index){
  							console.log(row.did);
							return '<a href="${pageContext.request.contextPath }/dept/findDeptByDid.do?did='+row.did+'">详情</a>';  						
  						}
					},
				]],
				//分页相关属性
				pagination:true, //显示分页栏
				pageList:[3,6], //定义每页展示信息条数的可选列表
				pageSize:3, //指定默认每页展示条数    值必须是pageList中的值
				pageNumber:1,//指定默认展示第几页信息
				pagePosition:'bottom', // 指定分页工具栏的位置 可选值 top(上)  bottom(下)  both(上下)
				toolbar:[
					{
						text:'添加',
						iconCls:'icon-add',
						handler:function(){
							//初始化一个dialog
							$('#dl').dialog({
								title:'添加部门信息',
								width:350,
								height:300,
								buttons:[//dialog对话框底部按钮
									{	//配置按钮属性
										text:'提交',
										iconCls:'icon-ok',
										handler:function(){//点击按钮执行
											// 初始化异步方式提交的表单											
											$('#fom').form({
												url:'${pageContext.request.contextPath }/dept/addDept.do',
												onSubmit:function(){  //表单提交前执行
													//验证表单的合法性
													/**
													validate方法， 自动完成所有表单字段验证，
														当所有表单字段数据合法返回true,如果有一个不合法 返回 false
													*/
													var f=$('#fom').form('validate');
													/**
														返回 true 正常提交表单
														返回 false 阻止表单提交
													*/
													return f;
												},
												success:function(d){
													console.log("======添加成功回调函数====");
													if(d){
														//关闭dialog
														$('#dl').dialog('close');
														//刷新datagrid
														$('#dg').datagrid('load');
													}
												},
											});
											// 手动提交表单
									   		$('#fom').submit();
											
											/* // 使用ajax执行添加操作
											var dname = $('#dname').val();//获取dialog对话框表单中的数据
											var note = $('#note').val();
											$.ajax({
												type:'POST',
												url:'${pageContext.request.contextPath }/dept/addDept.do',
												data:'dname='+dname+'&note='+note,
												success:function(data){
													alert("插入成功");
													if(data){//若添加成功执行
														alert("okokokokok");
														//关闭dialog
														$('#dl').dialog('close');
														//刷新datagrid
														$('#dg').datagrid('load');
													}
												},
											}); */
										}
									}
								],
							});
						}
					},
					{
						text:'删除',
						iconCls:'icon-remove',
						handler:function(){
							//获取选中行的数据
							var selRow = $('#dg').datagrid('getChecked');
							if(selRow==null){
								$.messager.alert('提示','请您选中要修改的行','warning');
							}else{
								//存放did的集合
								//var ss = new Array(); //定义数组
								var ss = [];  //定义数组方式二
								for(var i=0;i<selRow.length;i++){
									console.log("遍历批删选中的对象    "+selRow[i].did);
									ss[i] = selRow[i].did;
									//发送ajax请求
								}
								console.log("赋值后的集合   "+ss)
								for(var i=0;i<ss.length;i++){
									console.log("查看赋值后的 集合    ======="+ss);
								}
								$.ajax({
										type:'POST',
										url:'${pageContext.request.contextPath }/dept/deleteMore.do',
										data:{'dids':ss},
										success:function(data){
											if(data){
												//刷新datagrid
											    $('#dg').datagrid('load');
											}
										}
								});
							}
						},
					},
					{
						text:'修改',
						iconCls:'icon-edit',
						handler:function(){
							//获取选中行数据
							var selRow = $('#dg').datagrid('getSelected');
							//判断用户是否选中
							if(selRow==null){
								$.messager.alert('提示','请您选中要修改的行','warning');
							}else{
								//给表单填充默认的数据
								$('#fom').form('load',{
									did:selRow.did,
									dname:selRow.dname,
									note:selRow.note,
								});
								//初始化dialog
								$('#dl').dialog({
									title:'修改',
									width:350,
									height:200,
									buttons:[
										{
											text:'确定',
											iconCls:'icon-ok',
											handler:function(){
												//初始化方式提交异步表单
												$('#fom').form({
													url:"${pageContext.request.contextPath }/dept/updateDept.do",
													onSubmit:function(){
														//表单验证
														return $('#fom').form('validate');
													},
													success:function(d){
														//
														if(d){
															//关闭dialog
															$('#dl').dialog('close');
															//刷新datagrid
															$('#dg').datagrid('load');
														};
													},
												});
												//手动提交表单
												$('#fom').submit();
											}
										}
									]
								});
							}
						},
					}
				]
			});
		});
		/* function openpanel(){
			$("#p").panel('open');
		} */
	</script>
	
	</head>
	<body>
		<div id="wrap">
			<div id="top_content"> 
				<div id="header">
					<div id="rightheader">
						<p>
							<a href="${pageContext.request.contextPath }/user/exist.do">安全退出</a>&nbsp;&nbsp;&nbsp;&nbsp;2009/11/20
							<br />
						</p>
					</div>
					<div id="topheader">
						<h1 id="title">
							<!-- <a href="#">main</a> --><font color="white" size="6px"><span id="weather"></span></font><br>
						</h1>
					</div>
					<div id="navigation">
					</div>
				</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						Welcome!
					</h1>
					
					<!-- datagrid数据表格 -->
					<div style="width:750px;height:350px;border:solid silver 3px">
					<table id="dg">
					</table>
					</div>
					
					<!-- 对话框dialog -->
					<div id="dl" class="dl" style="display:none;">
						<!-- <form action="">
							<div>
								部门名称：<input type="text" name="dname" id="dname"/>
							</div>
							<div>
								部门描述：<input type="text" name="note" id="note"/>
							</div>
						</form> -->
						<form id="fom">
							<input type="hidden" name="did"/><br>
							name：<input type="text" name="dname" class="easyui-validatebox"
									data-options="required:true"/><br>
							note：<input type="text" name="note" class="easyui-validatebox"
									data-options="required:true"/><br>
						</form>
					</div>
					
					<!-- panel面板引入外部数据 -->
					<!-- <div style="width:600;height:500;border:solid silver 3px">
					<div id="p" class="easyui-panel">
					</div>
					</div> 
					<a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="openpanel()">打开</a>-->
					<%-- <table class="table">
						<tr class="table_header">
							<td>
								ID
							</td>
							<td>
								Name
							</td>
							<td>
								note
							</td>
							<td>
								Operation
							</td>
						</tr>
						<c:forEach items="${requestScope.depts}" var="dept">
						<tr class="row1">
							<td>
								${dept.did}
							</td>
							<td>
								${dept.dname}
							</td>
							<td>
								${dept.note}
							</td>
							<td>
								<a href="${pageContext.request.contextPath }/dept/findDeptByDid.do?did=${dept.did}">详情</a>
								<a href="${pageContext.request.contextPath }/dept/showBack.do?did=${dept.did}">update</a>
							</td>
						</tr>
						</c:forEach>
					</table> --%>
					<%-- <p>
						<input type="button" class="button" value="Add Department" onclick="location='${pageContext.request.contextPath}/addDepartment.jsp'"/>
					</p> --%>
				</div>
			</div>
			<div id="footer">
				<div id="footer_bg">
				ABC@126.com
				</div>
			</div>
		</div>
	</body>
</html>

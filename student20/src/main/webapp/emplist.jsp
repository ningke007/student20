<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>emplist</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/themes/icon.css">	
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
		<script type="text/javascript">
			function dd(eid){
				$.messager.confirm('确认窗口','您确认删除么？',function(f){
					if(f){
						location.href="${pageContext.request.contextPath }/ems/deleteEmsById.do?eid="+eid;
					}else{
						alert('已取消');
					}
				});
			}
		</script>
	</head>
	<body>
		<div id="wrap">
			<div id="top_content"> 
				<div id="header">
					<div id="rightheader">
						<p>
							2009/11/20
							<br />
						</p>
					</div>
					<div id="topheader">
						<h1 id="title">
							<a href="#">main</a>
						</h1>
					</div>
					<div id="navigation">
					</div>
				</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						${sessionScope.dept.dname}
					</h1>
					<table class="table">
						<tr class="table_header">
							<td>
								ID
							</td>
							<td>
								Name
							</td>
							<td>
								Salary
							</td>
							<td>
								Age
							</td>
							<td>
								Operation
							</td>
						</tr>
						<c:forEach items="${requestScope.dept.ems}" var="e" varStatus="stu">
						<tr class="row1"> 
							<td>
								${stu.count}
							</td>
							<td>
								${e.ename}
							</td>
							<td>
								${e.salary}
							</td>
							<td>
								${e.age}
							</td>
							<td>
								<a href="javascript:void(0)" onclick="dd(${e.eid })">delete emp</a>&nbsp;<a href="${pageContext.request.contextPath }/ems/showBackEms.do?eid=${e.eid }">update emp</a>
							</td>
						</tr>
						</c:forEach>
					</table>
					<p>
						<input type="button" class="button" value="Add Employee" onclick="location='${pageContext.request.contextPath }/addEmp.jsp'"/>
					</p>
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

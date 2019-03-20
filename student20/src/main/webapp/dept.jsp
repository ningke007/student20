<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setAttribute("path", request.getContextPath());  %>
<!DOCTYPE HTML>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
		
	</head>
	<body>
		<table class="table">
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
			<c:forEach items="${sessionScope.depts}" var="dept">
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
		</table>
	</body>
</html>

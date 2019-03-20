<%@ page pageEncoding="UTF-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>update dept</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath }/css/style.css" />
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
								<a href="#">Main</a>
							</h1>
						</div>
						<div id="navigation">
						</div>
					</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						update dept info:
					</h1>
					<form action="${pageContext.request.contextPath }/dept/updateDept.do" method="post">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<!-- <td valign="middle" align="right">
									id:
								</td> -->
								<td valign="middle" align="left">
									<input type="hidden" class="inputgri" name="did" value="${requestScope.dept.did }"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									name:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="dname" value="${requestScope.dept.dname }"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									note:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="note" value="${requestScope.dept.note }"/>
								</td>
							</tr>
							
						</table>
						<p>
							<input type="submit" class="button" value="Confirm" />
						</p>
					</form>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DB.DBConnect"%>

<%
String sql = "select v.m_no, m.m_name, count(*) from TBL_VOTE_202005 v, TBL_MEMBER_202005 m where m.m_no = v.m_no group by v.m_no, m.m_name order by count(*) desc";

Connection conn = DBConnect.getConnection();
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<header>
		<jsp:include page="./layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="./layout/nav.jsp"></jsp:include>
	</nav>
	<section class="section">
		<h2>후보자등수</h2>
		<table class="table_line">
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>총투표건수</th>
			</tr>
			<%while(rs.next()) { %>
			<tr class = "center">
				<td><%=rs.getInt("M_NO") %></td>
				<td><%=rs.getString("M_NAME") %></td>
				<td><%=rs.getInt("COUNT(*)") %></td>
			</tr>
			<%} %>
		</table>


	</section>
	<footer>
		<jsp:include page="./layout/footer.jsp"></jsp:include>
	</footer>


</body>
</html>
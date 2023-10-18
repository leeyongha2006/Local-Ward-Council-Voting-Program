<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "DB.DBConnect" %>
<%@ page import = "java.sql.*" %>
<%
    String sql="select v_name, v_jumin, "
    		+ "case when substr(v_jumin, 7, 1) = '1' then '남' else '여' end as 성별, "
    		+ "m_no, substr(v_time, 1, 2) || ':' || substr(v_time, 3,2) as v_time, case when v_confirm = 'Y' then '확인' else '미확인' end as v_confirm " 
    		+ "from tbl_vote_202005 where v_area = '제1투표장'";

    Connection conn = DBConnect.getConnection();
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();
   
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="css/style.css">
</head>
<body>
<header>
	<jsp:include page = "layout/header.jsp"></jsp:include>
</header>
<nav>
	<jsp:include page = "layout/nav.jsp"></jsp:include>
</nav>
<section class="section">
	<h2>투표검수조회</h2>
	<table class = "table_line">
		<tr>
			<th>성명</th>
			<th>생년월일</th>
			<th>나이</th>
			<th>성별</th>
			<th>후보번호</th>
			<th>투표시간</th>
			<th>유전자확인</th>
		</tr>
		<% while(rs.next()) { 
			String year = rs.getString("v_jumin"); 	
		    String year2 = year.substring(0);
		    String total = "19" + year2.substring(0,2) + "년" + year2.substring(2, 4) + "월" + year2.substring(4, 6) + "일생";
		    
		    int age = 2020-(Integer.parseInt(rs.getString("v_jumin").substring(0, 2))+1900);
		
		%>
		<tr>
			<td><%= rs.getString("v_name") %></td>
			<td><%= total %></td>
			<td><%= "만 " + age +"세" %></td>
			<td><%= rs.getString("성별") %></td>
			<td><%= rs.getString("m_no") %></td>
			<td><%= rs.getString("v_time") %></td>
			<td><%= rs.getString("v_confirm") %></td>
		</tr>		          
		<% } %>             
	</table>
</section>
<footer>
	<jsp:include page = "layout/footer.jsp"></jsp:include>
</footer>
</body>
</html>
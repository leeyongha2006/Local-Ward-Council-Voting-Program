<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DBConnect" %>

<%
String sql = "SELECT m.m_no, m.m_name, p.p_name, " +
             "CASE m.p_school " +
             "WHEN '1' THEN '고졸' " +
             "WHEN '2' THEN '학사' " +
             "WHEN '3' THEN '석사' " +
             "WHEN '4' THEN '박사' " +
             "END AS p_school, substr(m.m_jumin,1,6)||'-'||substr(m.m_jumin,7,13) as m_jumin, m.m_city, " +
             "p.p_tel1, p.p_tel2, p.p_tel3 " +
             "FROM tbl_member_202005 m, tbl_party_202005 p " +
             "WHERE m.p_code = p.p_code";

Connection conn = DBConnect.getConnection();
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보조회</title>
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
<h2>후보조회</h2>
    <table class="table_line">
        <tr>
            <th>후보번호</th>
            <th>성명</th>
            <th>소속정당</th>
            <th>학력</th>
            <th>주민번호</th>
            <th>지역구</th>
            <th>대표전화</th>
        </tr>
        <%
        while(rs.next()) {
            String phone = rs.getString("p_tel1") + "-" + rs.getString("p_tel2") + "-" + rs.getString("p_tel3");
        %>
            <tr class="center">
                <td><%=rs.getString("m_no")%></td>
                <td><%=rs.getString("m_name")%></td>
                <td><%=rs.getString("p_name")%></td>
                <td><%=rs.getString("p_school")%></td>
                <td><%=rs.getString("m_jumin")%></td>
                <td><%=rs.getString("m_city")%></td>
                <td><%=phone%></td>
            </tr>
        <%
        }
        %>
    </table>
</section>
<footer>
		<jsp:include page="./layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>

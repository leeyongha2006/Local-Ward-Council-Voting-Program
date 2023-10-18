<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "DB.DBConnect" %>
<%@ page import = "java.sql.*" %>

<%
request.setCharacterEncoding("UTF-8");
String sql = "insert into TBL_VOTE_202005 values(?,?,?,?,?,?)";
Connection conn = DBConnect.getConnection();
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, request.getParameter("V_JUMIN"));
ps.setString(2, request.getParameter("V_NAME"));
ps.setString(3, request.getParameter("M_NO"));
ps.setString(4, request.getParameter("V_TIME"));
ps.setString(5, request.getParameter("V_AREA"));
ps.setString(6, request.getParameter("V_CONFIRM"));
ps.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>
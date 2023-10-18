<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DB.DBConnect"%>

<%
Connection conn = DBConnect.getConnection();

String sql = "select * from tbl_member_202005";

PreparedStatement pstmt = conn.prepareStatement(sql);

ResultSet rs = pstmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>vote</title>
<script type="text/javascript">
	function checkValue() {
		if (!document.data.V_JUMIN.value) {
			alert("주민번호 입력안됨")
			data.V_JUMIN.focus();
			return false;
		} else if (!document.data.V_NAME.value) {
			alert("주민번호 입력안됨")
			data.V_NAME.focus();
			return false;
		} else if (!document.data.M_NO.value) {
			alert("주민번호 입력안됨")
			data.M_NO.focus();
			return false;
		} else if (!document.data.V_TIME.value) {
			alert("주민번호 입력안됨")
			data.V_TIME.focus();
			return false;
		} else if (!document.data.V_AREA.value) {
			alert("주민번호 입력안됨")
			data.V_AREA.focus();
			return false;
		} else if (!document.data.V_CONFIRM.value) {
			alert("주민번호 입력안됨")
			data.V_CONFIRM.focus();
			return false;
		}

		return true;
		alert("투표완료")

	}
</script>


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
		<h2>투표하기</h2>
		<form name="data" action="vote_p.jsp" method="post"
			onsubmit="return checkValue()">
			<table class="table_line">
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="V_JUMIN"> 예 :
						8906153154726</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="V_NAME"></td>
				</tr>
				<tr>
					<th>투표번호</th>
					<td><select name="M_NO">
							<%
							while (rs.next()) {
							%>
							<option value="<%=rs.getString("M_NO")%>">[<%=rs.getString("M_NO")%>]<%=rs.getString("M_NAME")%></option>
							<%
							}
							%>
					</select></td>
				</tr>
				<tr>
					<th>투표시간</th>
					<td><input type="text" name="V_TIME"></td>
				</tr>
				<tr>
					<th>투표장소</th>
					<td><input type="text" name="V_AREA"></td>
				</tr>
				<tr>
					<th>유권자확인</th>
					<td><input type="radio" name="V_CONFIRM" value="Y">확인<input
						type="radio" name="V_CONFIRM" value="N">미확인</td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="투표하기"> <input
						type="reset" value="다시하기"></th>
				</tr>
			</table>

		</form>

	</section>
	<footer>
		<jsp:include page="./layout/footer.jsp"></jsp:include>
	</footer>

</body>
</html>
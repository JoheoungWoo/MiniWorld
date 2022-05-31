<%@ page import="java.sql.*" contentType="text/html;charset=utf-8"%>

<%

int num3 = 0;

int status = 0;

try{
	num3 = (Integer)session.getAttribute("num");            // request에서 id 파라미터를 가져온다
	status = (Integer)session.getAttribute("status");
} catch (NullPointerException e) {
	status = 0;
}

	request.setCharacterEncoding("utf-8");

	Connection conn = null;

	Statement stmt = null;

	PreparedStatement pstmt = null;

	ResultSet rs = null;

	String url = "jdbc:sqlserver://114.204.148.250:1433;databaseName=testdb"; // 데이터베이스 서버 연결. 네이버에 자신의 공인IP주소를 검색해서 치고 DB의 이름을 적는다.

	String user = "test"; /*db 아이디*/

	String password = "1234"; /*db 비밀번호*/

	String value = request.getParameter("msg");

	String getPwd = null; /*DB에서 가져온 password 값을 저장할 변수*/
	String getNickName = null; /*DB에서 가져온 nickname 값을 저장할 변수*/
	int getPoint = 5; /*DB에서 가져온 point 값을 저장할 변수*/

	//String query = "INSERT INTO userData (userRoom) VALUES ('"+value+"') ON DUPLICATE KEY UPDATE userRoom=''"+value+"''  ";
	String query = "UPDATE userData SET userComent = '"+value+"' WHERE num = '"+num3+"' ";

	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // 드라이버 로딩하기

	conn = DriverManager.getConnection(url, user, password);
		
	pstmt = conn.prepareStatement(query);

	pstmt.executeUpdate();


	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();

%>
<html>
<head>
</head>
<body>
<script>
opener.location.reload();
self.close();
</script>
</body>
</html>
<%@ page import="java.sql.*" contentType="text/html;charset=utf-8"%>

<%

int num3 = 0;

int status = 0;

String id = null;

try{
	num3 = (Integer)session.getAttribute("num");            // request에서 id 파라미터를 가져온다
	status = (Integer)session.getAttribute("status");
	id = (String)session.getAttribute("id");
} catch (NullPointerException e) {
	status = 0;
}

	String num4 = Integer.toString(num3);
	request.setCharacterEncoding("utf-8");

	Connection conn = null;

	Statement stmt = null;

	PreparedStatement pstmt = null;

	ResultSet rs = null;

	String url = "jdbc:sqlserver://114.204.148.250:1433;databaseName=testdb"; // 데이터베이스 서버 연결. 네이버에 자신의 공인IP주소를 검색해서 치고 DB의 이름을 적는다.

	String user = "test"; /*db 아이디*/

	String password = "1234"; /*db 비밀번호*/

	String id3 = request.getParameter("ID");

	String pwd = request.getParameter("PWD");

	String com = request.getParameter("COM");	

	String getId = null;
	String getPwd = null; /*DB에서 가져온 password 값을 저장할 변수*/
	String getNickName = null; /*DB에서 가져온 nickname 값을 저장할 변수*/
	String asnull = null;

	String query = "SELECT userId FROM userData WHERE userId='"+id3+"' ";

	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // 드라이버 로딩하기
	conn = DriverManager.getConnection(url, user, password); // SQL 서버 연결하기
	stmt = conn.createStatement(); // SQL문 준비하기
	rs = stmt.executeQuery(query); // SQL문 실행하기 (28행 query 의 내용이 rs 변수에 저장됨!)


	if(rs!=null){
	while(rs.next()){ // rs에 저장된 값들을 연속해서 찾아온다.
	   getId = rs.getString("userId"); // DB의 id라는 이름의 열을 getID라는 변수에 저장함.
	
	 	}
 	}
	if(getId == asnull){
	
	String query2 = "INSERT INTO userData (userId,userPwd,userComent) VALUES ('"+id3+"','"+pwd+"','"+com+"')";
	//String query = "UPDATE board SET userComent = '"+value+"' WHERE num = '"+num3+"' ";
		
	pstmt = conn.prepareStatement(query2);

	pstmt.executeUpdate();

	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();

	} else {

	if(rs != null) rs.close();
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();

%>
<script>
alert("중복 ID 입니다");
</script>
<%
	//response.sendRedirect("login.jsp");
            }

	




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
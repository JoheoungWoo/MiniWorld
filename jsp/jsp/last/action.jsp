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

	String id = request.getParameter("ID"); /*boxloby html에서 name="변수" 의 값과 연결*/
	String pwd = request.getParameter("PWD"); /*boxloby html에서 name="변수" 의 값과 연결*/

	String getId = null; /*DB에서 가져온 id 값을 저장할 변수*/
	String getPwd = null; /*DB에서 가져온 password 값을 저장할 변수*/
	int getNum = 0;

	String query = "SELECT num,userId,userPwd FROM userData WHERE userId='"+id+"' and userPwd='"+pwd+"' "; // 33행의 쿼리랑 연동되는 행임.

	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // 드라이버 로딩하기
	conn = DriverManager.getConnection(url, user, password); // SQL 서버 연결하기
	stmt = conn.createStatement(); // SQL문 준비하기
	rs = stmt.executeQuery(query); // SQL문 실행하기 (28행 query 의 내용이 rs 변수에 저장됨!)

	if(rs!=null){
	while(rs.next()){ // rs에 저장된 값들을 연속해서 찾아온다.
	   getId = rs.getString("userId"); // DB의 id라는 이름의 열을 getID라는 변수에 저장함.
		 getPwd = rs.getString("userPwd"); // DB의 password라는 이름의 열을 getPwd라는 변수에 저장함.
		 getNum = rs.getInt("num"); // DB의 nickname라는 이름의 열을 getNickName라는 변수에 저장함.
	 }
 }

	if(rs != null) rs.close();
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();


	if(getId == null || getPwd == null ){ // getID 또는 getPwd가 null, 즉 입력한 아이디 또는 비밀번호가 데이터베이스에 존재하지 않는 값일 경우
		response.sendRedirect("login.jsp"); // loginfail 페이지로 즉시 이동시킨다. 값이 존재할 경우는 아래의 html문이 실행된다.
	} else {
		session.setAttribute("id", getId); 
		session.setAttribute("num", getNum); 
		session.setAttribute("status", 1); 
	 
		session.setMaxInactiveInterval(30*60);
		response.sendRedirect("main.jsp");
	}


%>
<html>
<head>
</head>
<body>
</body>
</html>
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


	
	String getRoom = null;
	String getComent = null;
	String getId = null;
	int getNum = 0;	
	String getContent[] = new String[3];
	String getTitle[] = new String[3];
	String getBackground = null;
	

	String query = "SELECT num,userRoom,userComent,userId,background FROM userData WHERE num='"+num3+"' "; // 33행의 쿼리랑 연동되는 행임.

	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // 드라이버 로딩하기
	conn = DriverManager.getConnection(url, user, password); // SQL 서버 연결하기
	stmt = conn.createStatement(); // SQL문 준비하기
	rs = stmt.executeQuery(query); // SQL문 실행하기 (28행 query 의 내용이 rs 변수에 저장됨!)

	if(rs!=null){
	while(rs.next()){ // rs에 저장된 값들을 연속해서 찾아온다.
		 getNum = rs.getInt("num"); // DB의 password라는 이름의 열을 getPwd라는 변수에 저장함.
		 getRoom = rs.getString("userRoom"); // DB의 nickname라는 이름의 열을 getNickName라는 변수에 저장함.
		 getComent = rs.getString("userComent"); // DB의 nickname라는 이름의 열을 getNickName라는 변수에 저장함.
		 getId = rs.getString("userId"); // DB의 nickname라는 이름의 열을 getNickName라는 변수에 저장함.
		getBackground = rs.getString("background");
	 }
 	}
	

	String query2 = "SELECT TOP 3 title,content FROM board WHERE userNum='"+num3+"' ORDER BY num desc "; // 3개만로드
	stmt = conn.createStatement(); // SQL문 준비하기
	rs = stmt.executeQuery(query2); // SQL문 실행하기 (28행 query 의 내용이 rs 변수에 저장됨!)
	if(rs!=null){
	int z = 0;
	while(rs.next()){ // rs에 저장된 값들을 연속해서 찾아온다.
		 getContent[z] = rs.getString("content"); // DB의 nickname라는 이름의 열을 getNickName라는 변수에 저장함.
		getTitle[z] = rs.getString("title");
		z++;
	 }
 	}


	if(rs != null) rs.close();
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();





%>

<html>
  <head>
    <title>MINIWORLD</title>
    <style>

      body{
        margin: 0;
        height: 970px;
        background-image: url(img/bg.png);
        background-repeat: no-repeat;
        background-size: 2000px 970px;
      }

      .header{
        margin: 0;
        height: 90px;
        background-image: url(img/header.png);
        background-repeat: no-repeat;
        background-size: 1900px 90px;
      }

      .header_table{
        border-collapse: collapse;
        width: 1900px;
        height: 90px;
      }

      .logo{
        width:400px;
        height: 90px;
        text-align: right;
      }

      .header_space{ /*헤더 로고와 로그아웃 버튼 사이의 빈 공간*/
        width: 1180px;
        height: 90px;
      }

      .space_top{ /*헤더영역과 중앙라인 사이의 빈 공간*/
        width: 100%;
        height: 60px;
      }

      .main{ /*중앙 라인*/
        display: flex;
        width: 100%;
        height: 730px;
      }

      .main_left{ /*중앙 라인의 빈공간중 왼쪽*/
        width: 25%;
        height: 730px;
      }

      .main_area{ /*중앙 라인의 빈공간중 가운데 (배경설정)*/
        height: 730px;
        background-image: url(img/back.png);
        background-repeat: no-repeat;
        background-size: 950px 730px;
      }

      .main_top_padding{ /*배경의 나무 테두리 부분 제외 - 위쪽*/
        width: 950px;
        height: 30px;
      }

      .main_mid{
        width: 950px;
        height: 670px;
        display: flex;
      }

      .main_left_padding{ /*배경의 나무 테두리 부분 제외 - 왼쪽*/
        width: 30px;
        height: 670px;
      }

      .main_area_1{ /*실질적인 내용 작성 부분임! 매우 중요한 곳이니 내용 배치를 바꾸게 되면 이 부분을 조심할 것*/
        width: 350px;
        height: 670px;
        padding: 20px;
      }

      .main_area_2{ /*실질적인 내용 작성 부분임! 매우 중요한 곳이니 내용 배치를 바꾸게 되면 이 부분을 조심할 것*/
        width: 540px;
        height: 670px;
        padding: 20px;
      }

      .main_right_padding{ /*배경의 나무 테두리 부분 제외 - 오른쪽*/
        width: 30px;
        height: 670px;
      }

      .main_bottom_padding{ /*배경의 나무 테두리 부분 제외 - 아래쪽*/
        width: 950px;
        height: 30px;
      }

      .main_right{ /*중앙 라인의 빈공간중 오른쪽*/
        width: 25%;
        height: 730px;
      }

      .footer{
        width: 100%;
        height: 50px;
        text-align: center;
      }

/*여기서부터는 main_area 영역의 내부 오브젝트들을 관리하는 css 영역임.
추가적으로 무언가를 편집할거면 이 주석 아래의 부분을 고칠 것!*/

      .profile{
        width:300px;
        height: 300px;
        margin-top: 20px;
        margin-bottom: 10px;
	border : 1px solid #666;
      }

      .myroom{
        width: 450px;
        height: 240px;
        margin-top: 20px;
	border : 1px solid #666;
      }

      .diaryimg{
        margin-top: 20px;
      }

      .diary{
        width: 450px;
        height: 30px;
        margin-top: 20px;
	border : 1px solid #666;
      }

      button{
        background-color:transparent;
        border: 0;
      }

      .menu_button{
        margin-top: 10px;
      }

      .content3Img{
        width:30px;
        height:30px;
        float: left;
      }
      .img_set {
        width:100px;
        height:100px;
        margin: 50px 0px 20px 100px;
      }
      .text_set {
	text-align: center;
      }
      .arr{
         float: left;
      }

    </style>
  </head>
  <body>
  <form action="logout.jsp">

  <div class="header">
    <table class="header_table" border=0>
    <tr>
      <td class="logo"><img src="img/logo2.png"></td>
      <td class="header_space"></td>
      <td><button type="submit"><img src="img/logout.png"></button></td>
<input type="hidden" id="score_pass" name="score_pass" value="<%=getRoom%>">
    </tr>
    </table>
  </div>

  <div class="space_top"></div>

  <div class="main">

    <div class="main_left"></div>

    <div class="main_area">
      <div class="main_top_padding"></div>

      <div class="main_mid">
      <div class="main_left_padding"></div>

<!-- 실질적으로 건들일 수 있는 영역 (시작부분) -->
        <div class="main_area_1">
          <img src = "img/profile.png">
          <div class="profile">
              <img class="img_set" id="imgSet" src="">
              <h3 class="text_set"><%=getComent%></h3>
          </div>
          <button type="button" class="menu_button" onclick="popup()"><img src="img/button1.png"></button>
          <button type="button" class="menu_button"><a href="myroom.jsp"><img src="img/button2.png"></a></button>
          <button type="button" class="menu_button" onclick="popup2()"><img src="img/button3.png"></button>
          <button type="button" class="menu_button" onclick="popup3()"><img src="img/button4.png"></button>
        </div>

        <div class="main_area_2">
          <img src = "img/myroom.png">
          <div class="myroom" id="room">


    <div class="arr">
        <img src="" id="room1" class="content3Img"><img src="" id="room2" class="content3Img"><img src="" id="room3" class="content3Img"><img src="" id="room4" class="content3Img"><img src="" id="room5" class="content3Img">
        <img src="" id="room6" class="content3Img"><img src="" id="room7" class="content3Img"><img src="" id="room8" class="content3Img"><img src="" id="room9" class="content3Img"><img src="" id="room10" class="content3Img">
        <img src="" id="room11" class="content3Img"><img src="" id="room12" class="content3Img"><img src="" id="room13" class="content3Img"><img src="" id="room14" class="content3Img"><img src="" id="room15" class="content3Img">
    </div>
    <div class="arr">
        <img src="" id="room16" class="content3Img"><img src="" id="room17" class="content3Img"><img src="" id="room18" class="content3Img"><img src="" id="room19" class="content3Img"><img src="" id="room20" class="content3Img">
        <img src="" id="room21" class="content3Img"><img src="" id="room22" class="content3Img"><img src="" id="room23" class="content3Img"><img src="" id="room24" class="content3Img"><img src="" id="room25" class="content3Img">
        <img src="" id="room26" class="content3Img"><img src="" id="room27" class="content3Img"><img src="" id="room28" class="content3Img"><img src="" id="room29" class="content3Img"><img src="" id="room30" class="content3Img">
    </div>
    <div class="arr">
        <img src="" id="room31" class="content3Img"><img src="" id="room32" class="content3Img"><img src="" id="room33" class="content3Img"><img src="" id="room34" class="content3Img"><img src="" id="room35" class="content3Img">
        <img src="" id="room36" class="content3Img"><img src="" id="room37" class="content3Img"><img src="" id="room38" class="content3Img"><img src="" id="room39" class="content3Img"><img src="" id="room40" class="content3Img">
        <img src="" id="room41" class="content3Img"><img src="" id="room42" class="content3Img"><img src="" id="room43" class="content3Img"><img src="" id="room44" class="content3Img"><img src="" id="room45" class="content3Img">
    </div>
    <div class="arr">
        <img src="" id="room46" class="content3Img"><img src="" id="room47" class="content3Img"><img src="" id="room48" class="content3Img"><img src="" id="room49" class="content3Img"><img src="" id="room50" class="content3Img">
        <img src="" id="room51" class="content3Img"><img src="" id="room52" class="content3Img"><img src="" id="room53" class="content3Img"><img src="" id="room54" class="content3Img"><img src="" id="room55" class="content3Img">
        <img src="" id="room56" class="content3Img"><img src="" id="room57" class="content3Img"><img src="" id="room58" class="content3Img"><img src="" id="room59" class="content3Img"><img src="" id="room60" class="content3Img">
    </div>
    <div class="arr">
        <img src="" id="room61" class="content3Img"><img src="" id="room62" class="content3Img"><img src="" id="room63" class="content3Img"><img src="" id="room64" class="content3Img"><img src="" id="room65" class="content3Img">
        <img src="" id="room66" class="content3Img"><img src="" id="room67" class="content3Img"><img src="" id="room68" class="content3Img"><img src="" id="room69" class="content3Img"><img src="" id="room70" class="content3Img">
        <img src="" id="room71" class="content3Img"><img src="" id="room72" class="content3Img"><img src="" id="room73" class="content3Img"><img src="" id="room74" class="content3Img"><img src="" id="room75" class="content3Img">
    </div>
    <div class="arr">
        <img src="" id="room76" class="content3Img"><img src="" id="room77" class="content3Img"><img src="" id="room78" class="content3Img"><img src="" id="room79" class="content3Img"><img src="" id="room80" class="content3Img">
        <img src="" id="room81" class="content3Img"><img src="" id="room82" class="content3Img"><img src="" id="room83" class="content3Img"><img src="" id="room84" class="content3Img"><img src="" id="room85" class="content3Img">
        <img src="" id="room86" class="content3Img"><img src="" id="room87" class="content3Img"><img src="" id="room88" class="content3Img"><img src="" id="room89" class="content3Img"><img src="" id="room90" class="content3Img">
    </div>
    <div class="arr">
        <img src="" id="room91" class="content3Img"><img src="" id="room92" class="content3Img"><img src="" id="room93" class="content3Img"><img src="" id="room94" class="content3Img"><img src="" id="room95" class="content3Img">
        <img src="" id="room96" class="content3Img"><img src="" id="room97" class="content3Img"><img src="" id="room98" class="content3Img"><img src="" id="room99" class="content3Img"><img src="" id="room100" class="content3Img">
        <img src="" id="room101" class="content3Img"><img src="" id="room102" class="content3Img"><img src="" id="room103" class="content3Img"><img src="" id="room104" class="content3Img"><img src="" id="room105" class="content3Img">
    </div>
    <div class="arr">
        <img src="" id="room106" class="content3Img">
        <img src="" id="room107" class="content3Img">
        <img src="" id="room108" class="content3Img"><img src="" id="room109" class="content3Img"><img src="" id="room110" class="content3Img">
        <img src="" id="room111" class="content3Img"><img src="" id="room112" class="content3Img"><img src="" id="room113" class="content3Img"><img src="" id="room114" class="content3Img"><img src="" id="room115" class="content3Img">
        <img src="" id="room116" class="content3Img"><img src="" id="room117" class="content3Img"><img src="" id="room118" class="content3Img"><img src="" id="room119" class="content3Img"><img src="" id="room120" class="content3Img">
    </div>





          </div>
          <img class="diaryimg" src= "img/diary.png">

          <div class="diary">
               <%=getId%> : <input type="text" size="10" maxlength='50' value="<%=getTitle[0]%>" >
	  내용 : <input type="text" size="20" maxlength='50' value="<%=getContent[0]%>" >
          </div>
          <div class="diary">
               <%=getId%> : <input type="text" size="10" maxlength='50' value="<%=getTitle[1]%>" >
	  내용 : <input type="text" size="20" maxlength='50' value="<%=getContent[1]%>" >
          </div>
          <div class="diary">
               <%=getId%> : <input type="text" size="10" maxlength='50' value="<%=getTitle[2]%>" >
	  내용 : <input type="text" size="20" maxlength='50' value="<%=getContent[2]%>" >
          </div>
        </div>
<!-- 실질적으로 건들일 수 있는 영역 (끝부분) -->

      <div class="main_right_padding"></div>
      </div>
      <div class="main_bottom_padding"></div>
    </div>

    <div class="main_right"></div>
  </div>

  <div class="footer">
    상태확인 : <%=num3%><br>
    <b>Copyright by 2018141043_조형우</b>
    <address>hataraci9350@daum.net</address>
  </div>
  </form>
<script>
window.onload = function () {
	var score2 = document.getElementsByName("score_pass"); // 게임 점수가 저장될 객체
	var score = score2[0].value;
            var img = document.getElementById("imgSet");
	var time = new Date().getTime();
	var array = [];
	var back = document.getElementById("room");
	var set3 = <%=getBackground%>;
	if(set3 == null) {
		set3 = 1;
	}
	
	back.style.backgroundImage= "url('http://114.204.148.250:8080/jsp/jsp/last/img/sky<%=getBackground%>.jpg')";
	back.style.backgroundSize = "450px 240px";
	back.style.backgroundRepeat ="no-repeat";

	
	img.src = "http://114.204.148.250:8080/jsp/ftpserver/userProfile/<%=getId%>.png?time=" + time;

	img.onerror = function() { // 이미지 없을 시
		img.src = "http://114.204.148.250:8080/jsp/ftpserver/userProfile/<%=getId%>.jpg?time=" + time;
		img.onerror = function() { // 이미지 없을 시
			img.src = "http://114.204.148.250:8080/jsp/jsp/last/img/cat.png?time=" + time;
		}
	}


	for(var i = 0; i<=119;i++) {
		array[i] = document.getElementById("room" + (i+1));
		array[i].src = "http://114.204.148.250:8080/jsp/jsp/last/img/my0.png?time=" + time;
	}

	var j = [];
	var value = null;
	value = score;
	if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
		alert("빈값" + value);
	} else { 

		j = value.split("_");
	} 
	for(var k = 0;k<j.length-1;k++){
		if(k[j] !=0) {
		document.getElementById("room" + (k + 1)).src = "./img/my" + j[k]  + ".png?time=" + time;
		}
		
	}
}
        function popup(){
            var url = "profile.jsp";
            var name = "pop test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        function popup2(){
            var url = "dieary.jsp";
            var name = "pop test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        function popup3(){
            var url = "set.jsp";
            var name = "pop test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
</script>
  </body>
</html>

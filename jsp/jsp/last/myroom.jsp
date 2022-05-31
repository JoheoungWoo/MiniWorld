<%@ page import="java.sql.*" contentType="text/html;charset=utf-8"%>

<html>
  <head>
    <title>MINIWORLD</title>
    <script>
        function ForSubmit() {
            var arrRadio = document.getElementsByName("main");
            var sum2 = "";
            for(var i=0; i<arrRadio.length; i++){
                sum2 += arrRadio[i].value + "_";
            }
            for(var i=0; i<arrRadio.length; i++){
                arrRadio[i].value = sum2;
            }	
        }
    </script>
    <script type="text/javascript" src="./css/script1.js"></script>
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
        width: 500px;
        height: 670px;
        padding: 20px;
      }

      .main_area_2{ /*실질적인 내용 작성 부분임! 매우 중요한 곳이니 내용 배치를 바꾸게 되면 이 부분을 조심할 것*/
        width: 390px;
        height: 670px;
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

      button{
        background-color:transparent;
        border: 0;
      }

      .myroom{
        width: 450px;
        height: 240px;
        margin-top: 20px;
border : 1px solid #666;
      }
      .divroom{
        width: 100%;
        height: 30px;
      }

      .object_img{
        margin-top: 45px;
      }

      .object{
        width: 300px;
        height: 300px;
        margin-top: 15px;
        border : 1px solid #666;
      }

      .roomback_img{
        margin-top: 15px;
      }

      .roomback{
        width: 300px;
        height: 90px;
        margin-top: 15px;
        border : 1px solid #666;
      }

      .save_button{
        margin-top: 30px;
        margin-left: 150px;
      }

      .ad{
        width: 450px;
        height: 220px;
        margin-top: 20px;
border : 1px solid #666;
      }

    .room_input{
         width: 30px;height: 30px;opacity: 0.8;float:left;
    }
    [type=radio] { position: absolute;opacity: 0;width: 0;height: 0;}
    [type=radio] {cursor: pointer;}
    [type=radio]:checked + img {outline: 1px solid #000000;}

    .select_button{width: 30px;height: 30px;opacity: 0.9;float:left;}

    </style>
  </head>
  <body>

  <div class="header">
    <table class="header_table" border=0>
    <tr>
      <td class="logo"><img src="img/logo2.png"></td>
      <td class="header_space"></td>
      <td><button type="button"><a href="logout.jsp"><img src="img/logout.png"></a></button></td>
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
        <img src = "img/myroom.png">
        <div class="myroom" id="room">

<form action="action2.jsp" method="get">
                <div class="divRoom">
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img1" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img2" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img3" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img4" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img5" class="room_input"></label>		
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img6" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img7" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img8" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img9" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img10" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img11" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img12" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img13" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img14" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img15" class="room_input"></label>
                </div>
                <div class="divRoom">
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img16" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img17" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img18" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img19" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img20" class="room_input"></label>		
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img21" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img22" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img23" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img24" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img25" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img26" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img27" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img28" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img29" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img30" class="room_input"></label>
                </div>
                <div class="divRoom">
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img31" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img32" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img33" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img34" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img35" class="room_input"></label>		
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img36" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img37" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img38" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img39" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img40" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img41" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img42" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img43" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img44" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img45" class="room_input"></label>
                </div>
                <div class="divRoom">
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img46" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img47" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img48" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img49" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img50" class="room_input"></label>		
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img51" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img52" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img53" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img54" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img55" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img56" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img57" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img58" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img59" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img60" class="room_input"></label>
                </div>
                <div class="divRoom">
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img61" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img62" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img63" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img64" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img65" class="room_input"></label>		
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img66" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img67" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img68" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img69" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img70" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img71" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img72" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img73" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img74" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img75" class="room_input"></label>
                </div>
                <div class="divRoom">
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img76" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img77" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img78" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img79" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img80" class="room_input"></label>		
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img81" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img82" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img83" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img84" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img85" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img86" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img87" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img88" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img89" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img90" class="room_input"></label>
                </div>
                <div class="divRoom">
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img91" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img92" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img93" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img94" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img95" class="room_input"></label>		
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img96" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img97" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img98" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img99" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img100" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img101" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img102" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img103" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img104" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img105" class="room_input"></label>
                </div>
                <div class="divRoom">
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img106" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img107" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img108" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img109" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img110" class="room_input"></label>		
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img111" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img112" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img113" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img114" class="room_input"></label>			
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img115" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img116" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img117" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img118" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img119" class="room_input"></label>
                    <label class="room_input"><input type = "radio" name = "main" value = "0"><img src="./img/my_1.png" id="img120" class="room_input"></label>
                </div>

            
                
            <div class="mainSpace3"></div>


        </div>
        <div class="ad"></div>
        </div>

        <div class="main_area_2">
        <img src = "img/object.png" class="object_img">
        <div class="object">

<div class="divSelect">
                        <img src="./img/sun.png" class="select_button" onclick="change1()">
                        <img src="./img/moon.png" class="select_button" onclick="change2()">
                        <img src="./img/cloud.png" class="select_button" onclick="change3()">
                        <img src="./img/cloud2.png" class="select_button" onclick="change4()">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                    </div>
                    <div class="divSelect">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button"">
                        <img src="./img/noImg2.png" class="select_button">
                    </div>

                    <div class="divSelect">
                        <img src="./img/doorTop.png" class="select_button" onclick="change5()">
                        <img src="./img/fishing1_1.png" class="select_button" onclick="change6()">
                        <img src="./img/fishing1_2.png" class="select_button" onclick="change7()">
                        <img src="./img/flower1.png" class="select_button" onclick="change8()">
                        <img src="./img/cat.png" class="select_button" onclick="change9()">
                        <img src="./img/dog.png" class="select_button" onclick="change10()">
                        <img src="./img/bed2_1.png" class="select_button" onclick="change11()">
                        <img src="./img/bed1_1.png" class="select_button" onclick="change12()">
                        <img src="./img/bed1_2.png" class="select_button" onclick="change13()">
                        <img src="./img/noImg2.png" class="select_button">
                    </div>
                    <div class="divSelect">
                        <img src="./img/doorButtom.png" class="select_button" onclick="change14()">
                        <img src="./img/fishing1_3.png" class="select_button" onclick="change15()">
                        <img src="./img/fishing1_4.png" class="select_button" onclick="change16()">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/bed2_2.png" class="select_button" onclick="change17()">
                        <img src="./img/bed3_2.png" class="select_button" onclick="change18()">
                        <img src="./img/bed3_1.png" class="select_button" onclick="change19()">
                        <img src="./img/noImg2.png" class="select_button">
                    </div>
                    <div class="divSelect">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button">
                        <img src="./img/noImg2.png" class="select_button"">
                        <img src="./img/noImg2.png" class="select_button">
                    </div>
                    <div class="divSelect">
                        <img src="./img/water1_1.png" class="select_button" onclick="change20()">
                        <img src="./img/water1_2.png" class="select_button" onclick="change21()">
                        <img src="./img/table.png" class="select_button" onclick="change22()">
                        <img src="./img/pict.png" class="select_button" onclick="change23()">
                        <img src="./img/window.png" class="select_button" onclick="change24()">
                        <img src="./img/book.png" class="select_button" onclick="change25()">
                        <img src="./img/eat1.png" class="select_button" onclick="change26()">
                        <img src="./img/pict2.png" class="select_button" onclick="change27()">
                        <img src="./img/noImg2.png" class="select_button"">
                        <img src="./img/noImg2.png" class="select_button">
                    </div>


        </div>
        <img src = "img/roomback.png" class="roomback_img">
        <div class="roomback">
             <img src="./img/sky1.jpg" class="select_button" onclick="bak1()">
             <img src="./img/sky2.jpg" class="select_button" onclick="bak2()">
             <img src="./img/sky3.jpg" class="select_button" onclick="bak3()">
<input type="hidden" value="1" id="main2" name="main2">
        </div>
        <button type="submit" onclick="ForSubmit()"><img src="img/save.png"></button>
        </div>
        </form>
<!-- 실질적으로 건들일 수 있는 영역 (끝부분) -->

      <div class="main_right_padding"></div>
      </div>
      <div class="main_bottom_padding"></div>
    </div>

    <div class="main_right"></div>
  </div>

  <div class="footer">
    <br>
    <b>Copyright by 2018141043_조형우</b>
    <address>hataraci9350@daum.net</address>
  </div>
<script>
function bak1() {
	var back = document.getElementById("room");
	var back2 = document.getElementById("main2");
	back.style.backgroundImage= "url('./img/sky1.jpg?212')";
	back.style.backgroundSize = "450px 240px";
	back.style.backgroundRepeat ="no-repeat";
	back2.value = "1";
}
function bak2() {
	var back = document.getElementById("room");
	var back2 = document.getElementById("main2");
	back.style.backgroundImage= "url('./img/sky2.jpg?123')";
	back.style.backgroundSize = "450px 240px";
	back.style.backgroundRepeat ="no-repeat";
	back2.value = "2";
}
function bak3() {
	var back = document.getElementById("room");
	var back2 = document.getElementById("main2");
	back.style.backgroundImage= "url('./img/sky3.jpg?123')";
	back.style.backgroundSize = "450px 240px";
	back.style.backgroundRepeat ="no-repeat";
	back2.value = "3";
}
</script>
  </body>
</html>

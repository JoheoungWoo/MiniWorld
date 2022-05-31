<%@ page import="java.sql.*" contentType="text/html;charset=utf-8"%>

<html>
<head>
  <title>MINIWORLD</title>
  <style>

    body{
      margin:0;
      height:970px;
      background-image: url(img/bg.png);
      background-repeat: no-repeat;
      background-size: 2000px 970px;
    }

    .empty_area_top{
      width: 100%;
      height: 200px;
    }

    .main_area{
      width: 100%;
      height: 500px;
      display: flex;
    }

    .empty_area_bottom{
      width: 100%;
      height: 200px;
    }

    .footer{
      width: 100%;
      height: 70px;
      text-align: center;
    }

    .empty_area_left{
      width: 33%;
      height: 500px;
    }

    .empty_area_right{
      width: 33%;
      height: 500px;
    }

    .main_area_login{
      background-image: url(img/login.png);
      background-repeat: no-repeat;
      width: 660px;
      height: 500px;
    }

    .logo{
      text-align: center;
      width: 660px;
      height: 200px;
    }

    .login_area{
      display: flex;
    }

    .empty_area_main_left{
      text-align: center;
      width: 50px;
      height: 300px;
    }

    .empty_area_main_right{
      text-align: center;
      width: 50px;
      height: 300px;
    }

    .login_box{
      width: 350px;
      height: 250px;
      text-align: right;
    }

    .login_button{
      text-align: left;
      width: 210px;
      height: 250px;
    }

    .li_style{
      list-style-type: none;
      text-align: left;
    }

    .text{
      width: 200px;
      height: 40px;
      text-align: center;
    }

    button{
      background-color:transparent;
       border : 0;
       outline : 0;
    }

    .b{
      color: #000000;
    }

    .address{
      color: #000000;
    }

  </style>
</head>
<body>
<form action="action.jsp">
  <div class="empty_area_top">
  </div>
  <div class="main_area">

    <div class="empty_area_left"></div>

    <div class="main_area_login">

      <div class="logo"><br><br><br><img src="img/logo.png"></div>

      <div class="login_area">
        <div class="empty_area_main_left"></div>

        <div class="login_box">
          <br>
          <h1><b>ACCOUNT</b></h1>

        <table align=right>
        <ul>
        <tr>
          <td><li class="li_style"><label for="ID">ID</label></li></td>
          <td><input type="text" name="ID" class="text" required></td>
        </tr>
        <tr>
          <td><li class="li_style"><label for="ID">PW</label></li></td>
          <td><input type="password" name="PWD" class="text" required></td>
        </tr>
        </ul>
        </table>

        </div>

        <div class="login_button">
          <br><br><br><br><br>
        <button type="submit"><img src="img/loginbutton.png?1231"></button><br>
        <button type="button" onclick="popup()"><img src="img/joinbutton.png"></button>
        </div>

        <div class="empty_area_main_right"></div>
      </div>

    </div>

    <div class="empty_area_right"></div>

  </div>
  <div class="empty_area_bottom">
  </div>
  <div class="footer">
    <b class="b">Copyright by 2018141043_조형우</b>
    <address class="address">hataraci9350@daum.net</address>
  </div>
</form>
</body>
<script>
        function popup(){
            var url = "signUp.jsp";
            var name = "pop test";
            var option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
</script>
</html>

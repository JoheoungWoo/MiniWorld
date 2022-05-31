<%@ page import="java.sql.*" contentType="text/html;charset=utf-8"%>

<html>
<head>
</head>
<body>
<form name="myHiddenForm" action="action2.jsp" method="get">
<input type="hidden" id="set" name="main" value="">
<input type="hidden" id="set2" name="main2" value="1">
</form>

<input type="button" value="세팅1" onclick="click1()">
<input type="button" value="세팅2" onclick="click2()">
<input type="button" value="세팅3" onclick="click3()">


</body>
<script>
function click1() {
var arrRadio = document.getElementById("set");
var arrRadio2 = document.getElementById("set2");
arrRadio.value="1_0_0_0_0_0_4_0_0_0_4_0_0_0_0_0_0_0_0_24_24_0_0_24_24_0_0_0_0_0_0_0_23_0_24_24_0_0_24_24_0_27_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_8_0_0_0_0_0_0_0_5_0_0_0_0_0_0_24_0_0_0_0_0_0_0_14_0_0_0_0_22_0_24_0_9_0_0_12_13_";
arrRadio2.value="1";
document.myHiddenForm.submit();
}
function click2() {
var arrRadio = document.getElementById("set");
var arrRadio2 = document.getElementById("set2");
arrRadio.value="0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_1_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_3_0_0_3_0_0_0_3_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_27_23_0_0_0_0_0_5_0_0_6_7_0_0_0_0_0_0_0_0_11_11_14_0_0_15_16_0_0_9_0_22_0_10_26_17_17_";
arrRadio2.value="2";
document.myHiddenForm.submit();
}
function click3() {
var arrRadio = document.getElementById("set");
var arrRadio2 = document.getElementById("set2");
arrRadio.value="0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_2_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_4_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_23_0_0_20_21_0_0_27_0_0_0_0_0_0_0_0_0_0_0_0_0_9_8_0_0_0_0_5_0_0_0_0_0_0_0_0_25_25_0_0_0_0_14_0_0_0_22_0_10_0_0_25_25_0_0_0_";
arrRadio2.value="3";
document.myHiddenForm.submit();
}	
</script>
</html>
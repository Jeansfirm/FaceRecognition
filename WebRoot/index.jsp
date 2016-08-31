<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Jeanfoz's Face Recognition System</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		body{background:#BFB773}
		h1{
			color:#ffffff;
			text-shadow:2px 2px 5px #000000;
			width:480px;
			margin:0 auto;
			text-align:center;
			}
		.box{
			 height:480px;
			 width:680px;
			 border:1px solid #000;
			 background:#fff;
			 margin:0 auto;
			 box-shadow:2px 2px 5px #000;
			 text-align:center;
			}
		.btn{
			display:block;
			height:36px;
			width:150px;
			border:1px solid #000;
			margin:10px auto;
			line-height:36px;
			background:#000;
			color:#fff;
			box-shadow:2px 2px 5px #000;
			border-radius:18px;
			text-decoration:none;
			}
		.btn:hover{
			background:#4B515F;
			}
	</style>
	<script type="text/javascript">
		function openBrows()
		{
			var obj=document.getElementById("fileChoice");
			obj.click();
		}
	</script>
  </head>
  
  <body>
    <h1>Recognition System Of Face</h1>
    <form action="fileUp.htm" method="post" enctype="multipart/form-data">
    	<!--Form Submitting Area:Start-->
    	<div class="box">
    		<!--File select button-->
    		<input type="file" id="fileChoice" name="imgfile" style="display:none"/>
    		<a href="javascript:void(0);" class="btn" onclick="openBrows()">Select File</a>
    		<input type="submit" value="Resolve" class="btn"/>
    	</div>
    	<!--Form Submitting Area:End-->
    </form>
  </body>
</html>

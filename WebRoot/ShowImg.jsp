<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.File"%>
<%@page import="com.facepp.http.PostParameters"%>
<%@page import="com.facepp.http.HttpRequests"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

HttpRequests hrs=new HttpRequests("36b2f15a78609b71f06bb54170d63334","HHVOYsH816T1jMPdjbwTE9gedCMfHO18");
PostParameters pps=new PostParameters();
String imgPath=application.getRealPath("/")+"/"+request.getAttribute("imgPath");
pps.setImg(new File(imgPath));
JSONObject result=hrs.detectionDetect(pps);
//System.out.println(result);
JSONArray faces=result.getJSONArray("face");
StringBuffer strBuf=new StringBuffer();
for(int i=0;i<faces.length();i++)
{
	JSONObject face=faces.getJSONObject(i);
	JSONObject attribute=face.getJSONObject("attribute");
	JSONObject age=attribute.getJSONObject("age");
	int ageValue=age.getInt("value");
	int ageRange=age.getInt("range");
	JSONObject gender=attribute.getJSONObject("gender");
	String genderValue=gender.getString("value");
	Double genderCfd=gender.getDouble("confidence");
	strBuf.append("Person").append(i+1);
	strBuf.append(" Age:").append(ageValue).append(";Range:").append(ageRange);
	strBuf.append(";Gender:").append(genderValue).append(";Confidence:").append(genderCfd).append("%");
	strBuf.append(";   ");
}
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
			 text-align:left;
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
    		<img style="float:left" src="${imgPath}" width="300" height="400"/>
    		<div style="float:left"><%=strBuf.toString() %></div>
    	</div>
    	<!--Form Submitting Area:End-->
    </form>
  </body>
</html>

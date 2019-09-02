<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/btn_style.css">
</head>
<body>
<s:form action="%{ pageContext.request.contextPath }/file_saveUpload.action" id="form"  method='post' enctype='multipart/form-data' >
	<button class="button btn_style2" type="button" onClick="uploadphoto.click()">选择文件</button>
  	<input type="file" id="uploadphoto"  name="uploadfile" value="上传文件" style="display:none"/>
  	<input type="submit" />
</s:form>
</body>
</html>
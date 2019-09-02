<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

<head>
<meta charset="UTF-8">
<title>hover effects for horizontal menu with icons</title>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>


<!--外调图标库-->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.8.1/css/all.css'>

<!--主要样式-->
<link rel="stylesheet" href="css/backgroundstyle.css">


</head>
<script>

</script>
<style>
.box{
position:absolute;right:0; bottom:0;
width:400px;height:300px;
}
</style>
<body >
      
      <div class="menu" style="overflow:hidden;">
        <ul class="clear">
          <li>
            <a href="${ pageContext.request.contextPath }/file_getAllfile.action" title="Home" target="mainFrame">
              <i class="fa fa-home" aria-hidden="true"></i>
              <span class="link-text">首页</span>
            </a>
          </li>
          <li>
            <a href="#" id="show" title="upload" >
         <!--   <a href="${ pageContext.request.contextPath }/index_upload.action" title="upload" target="mainFrame"> --> 
              <i class="far fa-lightbulb" aria-hidden="true"></i>
              <span class="link-text">上传</span>
            </a>
          </li>
          <li>
            <a href="#" title="Portfolio">
              <i class="fas fa-pencil-alt" aria-hidden="true"></i>
              <span class="link-text">编辑</span>
            </a>
          </li>
          <li>
            <a href="#" title="Blog">
              <i class="far fa-comment" aria-hidden="true"></i>
              <span class="link-text">博客</span>
            </a>
          </li>
          <li>
            <a href="#" title="Contact">
              <i class="far fa-envelope" aria-hidden="true"></i>
              <span class="link-text">邮箱</span>
            </a>
          </li>
        </ul>
      </div>
  
  
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>prvate disc</title>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<!--外调图标库-->
<!--  
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.8.1/css/all.css'>-->
<link rel="stylesheet" type="text/css" href="css/translucent/style.css"/>
	<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="css/translucent/jquery-translucent.js"></script>
<script type="text/javascript" src="js/jquery.1.7.2.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".PopupLayer").css({"top":$(".PopupLayer").outerHeight()*-1+"px","opacity":0});//载入页面时将元素置于页面可见区域的顶部达到自上而下显示效果（PS：还有隐藏效果）
	function notice_show()//显示
	{
		var browser_visible_region_height=document.documentElement.clientHeight;//获取浏览器可见区域高度
		var element_height=$(".PopupLayer").outerHeight();//获取元素高度:height+paelement_heighting+margin
		//计算元素显示时的top值
		var element_show_top=(browser_visible_region_height-element_height)/2;
		$(".PopupLayer").stop(true).animate({top:element_show_top,opacity:1},1800);
	}
	
	function notice_hidden()//隐藏
	{
		var element_height=$(".PopupLayer").outerHeight();//获取元素高度:height+paelement_heighting+margin
		var ee=-element_height;//元素隐藏时的top值
		$(".PopupLayer").stop(true).animate({top:ee,opacity:0},1000);
	}
	
	$("a.close").click(function(){
		var element_height=$(".PopupLayer").outerHeight();//获取元素高度:height+paelement_heighting+margin
		var ee=-element_height;//元素隐藏时的top值
		$(".PopupLayer").animate({opacity:0},1000).animate({top:ee},0);
	})//点击关闭按钮隐藏
	
	$("a.btn").click(function(){
		$(".PopupLayer").animate({top:$(document).height(),opacity:0},1000)
	})
	
	$("#open").click(function(){
		notice_show();
	})//单击按钮触发显示
	
	$("#close").click(function(){
		notice_hidden();
	})//单击按钮触发隐藏
	
	function check()
	{
		var kk=$(".PopupLayer").outerHeight()*-1;//获取元素高度:height+paelement_heighting+margin
		var ww=$(document).height();
		var qq=parseInt($(".PopupLayer").css("top"));//获取元素当前的top值，String类型转换为number类型
		
		if(qq == kk || qq == ww)
		{
			return;
		}
		else//弹出层自适应浏览器窗口大小。
		{
			var browser_visible_region_height=document.documentElement.clientHeight;//获取浏览器可见区域高度
			var element_height=$(".PopupLayer").outerHeight();//获取元素高度:height+paelement_heighting+margin
			//计算元素显示时的top值
			var element_show_top=(browser_visible_region_height-element_height)/2;
			$(".PopupLayer").stop(true).animate({top:element_show_top},1500);
		}
	}
	
	$(window).resize(function(){
		check();
	})//自适应浏览器窗口大小
	
})
</script>

<!--主要样式-->
<link rel="stylesheet" href="css/backgroundstyle.css">

<link href="css/menustyle.css" rel="stylesheet" />

</head>
<style>
*{margin:0;padding:0;overflow:hidden;}
.PopupLayer{width:600px;height:400px;padding:10px;position:fixed;_position:absolute;left:50%;margin-left:-300px;background:#fff;background-clip:padding-box;border-radius:10px;border:10px solid #666;border:15px solid rgba(0, 0, 0, 0.2);}
.PopupLayer a.close{display:block;width:30px;height:30px;float:right;background:url(img/close.jpg) no-repeat;overflow:hidden;}
.PopupLayer a.close:hover{background-position:-30px;}
.PopupLayer p{font:13px "宋体";line-height:30px;letter-spacing:0.1em;margin-top:35px;}
.PopupLayer p span{color:#7d7d7d;}
.PopupLayer ul{list-style:none;width:475px;height:103px;margin:30px auto 0;border:1px dashed #e4e4e4;overflow:hidden;}
.PopupLayer ul li{float:left;width:95px;height:103px;overflow:hidden;}
.PopupLayer ul li a{display:block;}
.PopupLayer a.btn{display:block;width:100px;height:38px;line-height:38px;text-align:center;color:#fff;font-weight:bold;letter-spacing:0.1em;float:right;background:url(img/btn_bg.jpg) repeat-x;border-radius:8px;margin:40px 30px 0 0;}
/* btn_content */
.btn_content{margin:50px auto;top:327px;width:204px;height:25px;}
.btn_content button{width:100px;height:25px;line-height:25px;background:#F60;border:1px solid #989898;margin-right:2px;}
.btn_content button:hover{color:#fff;}
.top{
width:100%;height:100px;
float:left;
}
.left{
background:#fff;
position:absolute;
top:100px;
left:0;
width:100px;height:100%;
}

.right{
background:#fff;
position:absolute;
top:100px;
left:103px;
height:100%;
width:100%;
}
#show{}
</style>
<script>
function showDiv(){
	 $('#ca').css('display','block');
}

function closeit(){
	 $('#ca').css('display','none');
	}
	
function reload(){
	 document.getElementById("ifrmname").contentWindow.location.reload(true);
}
</script>
<body>
<div class="top">
<input type="button" name="Button" value="Button" onclick="reload()"/>  

</div>

<div class="left">
	<div class="menu" style="overflow:hidden;">
        <ul class="clear">
          <li>
            <a href="${ pageContext.request.contextPath }/file_findByUser"  title="Home">
              <i class="fa fa-home" aria-hidden="true"></i>
              <span class="link-text">首页</span>
            </a>
          </li>
          <li>
            <a href="#" id="open" onclick="showDiv()" title="upload" >
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
</div>
<div class="right">
<!--  
<div>
	<ul class="head">
			<li style="width:52%"><span>全部文件</span></li>
	</ul>
</div>
<div>
	<ul class="title">
		<li style="width:52%">文件名</li>
		<li style="width:17%">大小</li>
		<li style="width:23%">修改日期</li>
	</ul>
</div>


<div>

	<ul class="fileItem">
		<li style="width:50%" class="filename" ><a href="http://localhost:8080/Disk/file_findByDirname.action?path=E:;Program Files;disk_user;caiyuxi123;doc">张三</a></li>
		<li style="width:17%">&nbsp;&nbsp;&nbsp;&nbsp;</li>
		<li style="width:23%">2019-10-09</li>
	</ul>
</div>-->

<iframe  id="ifrmname" src="${ pageContext.request.contextPath }/file_getAllfile.action" width="100%" height="100%" FRAMEBORDER=0 SCROLLING=AUTO style="border:none"></iframe>
</div>


<div class="PopupLayer">
<div><a class="close" href="javascript:void(0);"></a></div>
<div>
<%@include file="upload.jsp" %>
</div>
<!--
<form id='myupload' action='${ pageContext.request.contextPath }/file_saveUpload.action' method='post' enctype='multipart/form-data'>
<div id="upbt">
<input type="file" name="upload">
<input type="submit">
</div>
</form>  -->
</div><!--PopupLayer end
<div id="ca" style="width:800px;height:400px;background:#fff;border:2px solid green;display:none;position:absolute;right:0;bottom:0">
<div align="right"><b><a href="javascript:closeit()">[关闭]</a></b></div>
</div>-->

</body>

</html>
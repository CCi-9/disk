<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>php-ajax无刷新上传(带进度条)demo</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width , initial-scale=1.0 , user-scalable=0 , minimum-scale=1.0 , maximum-scale=1.0" />
<script type='text/javascript' src='js/jquery-2.0.3.min.js'></script>
<script type='text/javascript' src='js/jquery.form.js'></script>
<link href="css/upload.css" type="text/css" rel="stylesheet"/>
</head>
<script>
function uploadFile(){
    var formData = new FormData($('#myupload')[0]);//生成空的form对象
  
    $.ajax({
        url: "${ pageContext.request.contextPath }/file_saveUpload.action",
        data: formData,
        type: 'POST',
        processData:false,
        contentType:false,
        success: function(arg){
            // 当请求执行完成之后，自动调用
            // arg:服务器返回的数据
        	document.getElementById("ifrmname").contentWindow.location.reload(true);
        },
        error: function(){
            // 当请求错误之后，自动调用
        }
    })
}

</script>
<body>
<div id="upload" width="100%">
注意：<br>
1.上传的视频文件单文件不能超过4G;
2.上传的视频格式必须*.mp4 *.rar。
</div>

<form id='myupload' method='post' enctype='multipart/form-data'>
<div id="upbt">
<div id="btn"><input type="button" class="uploadbtn" value="选择文件" onClick="uploadphoto.click()" id="select"><input type="button" onclick="uploadFile()"  value="开始上传"  id="ups"></div>
</div>
<div style="margin:10px auto;   overflow:hidden; margin-top:10px;">
    <input type="file" id="uploadphoto"  name="uploadfile" value="上传文件" style="display:none" onChange="filesize(this)" />
  
<table width="100%" border="0" id="table" cellpadding="1" cellspacing="1">
  <tr bgcolor="#4a5464" align="center" >
    <td width="27%">文件名</td>
    <td width="17%">文件大小</td>
	<td width="30%">上传进度</td>
    <td width="12%">上传状态</td>
    <td width="14%">操作</td> 

  </tr> 
  <tr id="list" style="background:url(css/bg.jpg); display:none;">
    <td><div id="text"></div></td>
    <td><div id="big"></div></td>
	<td><div class="progress">
    <div class="progress-bar progress-bar-striped" ><span class="percent">0%</span></div>
  </div> </td>
    <td><div id="uped">等待上传</div></td>
    <td><a href="javascript:viod(0)" id="del">移除</a></td> 
  </tr> 
</table> 


  <!--<div id="text"></div> 
  <div class="imglist"> </div>
  <p class="res"></p> -->
</div>
  </form> 
<script type="text/javascript">
 function filesize(ele) { 
    var filesize = (ele.files[0].size/(1024*1024)).toFixed(2);   
	$('#big').html(filesize+"MB");
	$('#text').html(ele.files[0].name);
}  
$(document).ready(function(e) {
   var progress = $(".progress"); 
   var progress_bar = $(".progress-bar");
   var percent = $('.percent'); 
    $("#del").click(function(){
	var objFile=document.getElementsByTagName('input')[2];  
     objFile.value=""; 
	 $("#list").hide();
	});
    $("#uploadphoto").change(function(){ 
		$("#list").show();
	});
   $("#ups").click(function(){
   var file = $("#uploadphoto").val(); 
   if(file!=""){   
     $('#uped').html("上传中……");   
  	 $("#myupload").ajaxSubmit({  
  		dataType:  'json', //数据格式为json 
  		beforeSend: function() { //开始上传  
  			var percentVal = '0%';
  			progress_bar.width(percentVal);
  			percent.html(percentVal);
  		}, 
  		uploadProgress: function(event, position, total, percentComplete) { 
  			var percentVal = percentComplete + '%'; //获得进度 
  			progress_bar.width(percentVal); //上传进度条宽度变宽 
  			percent.html(percentVal); //显示上传进度百分比 
  		},  		
  	}); 
	}
   });

});
</script>
</body>
</html>
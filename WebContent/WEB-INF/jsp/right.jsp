<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
	<link rel="stylesheets" type="text/css" href="themes/icon.css">
	<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script >
$(function(){
	$("html").bind('contextmenu',function(e){
		e.preventDefault();
		$('#bodymenu').menu('hide', {
			left: e.pageX,
			top: e.pageY
		});
	});
});
</script >
<script >
createNewDir = function (){
	var fileDiv = document.querySelector('.fileDiv');
	var fileItem = document.createElement('ul');
	fileItem.className = "fileItem";
	var li1 = document.createElement('li');
	li1.style.width = "52%";
	li1.className = "filename";
	li1.innerHTML = "<p style='width:150px' id='pid' onblur='checkFile()' contenteditable='true'>新建文件夹</p>";
	fileItem.appendChild(li1);
	fileDiv.appendChild(fileItem);
	var pid = document.getElementById("pid");
	pid.focus();
}


function checkFile(){
	var pid = document.getElementById("pid");
	
    $.ajax({
        url: "${ pageContext.request.contextPath }/file_createNewFile.action?name="+pid.innerHTML,
        data: "json",
        type: 'POST',
        processData:false,
        contentType:false,
        success: function(data){
 				if(data === 'dir has exist'){
 					alert("文件夹已存在");
 				}
 				window.location.reload();
        },
        error: function(){
            // 当请求错误之后，自动调用
        }
    })
}
/*右键菜单注释菜单
$(function(){
	$("html").bind('contextmenu',function(e){
		if(!($.contains($(".fileDiv")[0],e.target) || $("#aijquery")[0]==e.target)){		
		e.preventDefault();
		$('#bodymenu').menu('show', {
			left: e.pageX,
			top: e.pageY
		});
		}
		
	});
});

$(".fileItem").mouseover(function(){
	  $(".fileItem").css("background-color","yellow");
	});



$(function(){
	$(".fileDiv").bind('contextmenu',function(e){
		e.preventDefault();
		$('#filemenu').menu('show', {
			left: e.pageX,
			top: e.pageY
		});
	});
});




function fileHandler(item){
	if(item.name === 'download'){
    	var $eleForm = $("<form method='post'></form>");
	    $eleForm.attr("action","/fileTest2/download");
	
	    var myInput = $("<input type='text'></input>");
	    myInput.attr("style","display:none");
	    myInput.attr("name","name");
	    myInput.attr("value",downLoadFile);
	    $(document.body).append($eleForm);
	
	    $eleForm.append(myInput); 
	    $eleForm.submit();
	}
}*/


</script>
<style>
*{margin:0;padding:0}

div{display:block;height:36px;}
.headDiv{width:100%}
ul{list-style: none;   
	border-top-color: #fff;
    height: 36px;
    color: #888;
    overflow: hidden;}
    .head span{display:inline}
span{display:none}
li{padding-left:15px;line-height: 36px;}
.title{background-color:#fefefe;}
.title li:hover{background-color: #fafafa;}
.filename{padding-left:37px;background:url('img/dir.png') no-repeat; background-position:center left;position:absolute;left:15px;
}
.fileItem{padding-left:15px;}
.fileItem .filesize{position:absolute;left:52%;}
.fileItem .lastModified{position:absolute;left:69%;}

.fileItem:hover {background-color: #fafafa;}
.fileItem:hover span{position:absolute;right:10%;display:inline;}
a{text-decoration: none;}
a:visited{color: #888;}
a:link {color: #888;} 
a:hover {color: #09AAFF;} 
.headDiv{position: fixed;z-index:999;background:#fefefe}

.li1{position:absolute;top:36px;left:0;}
.li2{position:absolute;top:36px;left:52%;}
.li3{position:absolute;top:36px;left:69%;}
.fileDiv{position: relative;top:72px;}
</style>

<body>
<div class="headDiv">
	<ul class="head" >
		<s:if test="#session.fileInfo.name == 'root'">
			<li style="width:52%;"><span>全部 文件</span>&nbsp;&nbsp;&nbsp;
				<span><a href="javascript:void(0);" onclick="createNewDir()">新建文件夹</a></span></li>
		</s:if>
		<s:else>
			<li style="width:52%;">
				<span><a href="${ pageContext.request.contextPath }/file_goBack.action?path=<s:property value="#session.fileInfo.path" />">返回上一级</a></span>&nbsp;&nbsp;&nbsp;
				<span><a href="${ pageContext.request.contextPath }/file_getAllfile.action">全部文件</a></span>&nbsp;&nbsp;&nbsp;
				<span><a href="javascript:void(0);" onclick="createNewDir()">新建文件夹</a></span></li>
		</s:else>
	</ul>
	<ul class="title" >
		<li style="width:52%" class="li1">文件名</li>
		<li style="width:17%" class="li2">大小</li>
		<li style="width:23%" class="li3">修改日期</li>
	</ul>
</div>
<div class="fileDiv" >
<s:iterator var="dir" value="#session.dir_list">
	<ul class="fileItem">
		<li style="width:52%" class="filename" >
			<a href="${ pageContext.request.contextPath }/file_findByDirname.action?path=<s:property value="#dir.path" />">
				<s:property value="#dir.name" />
			</a><span id="span"><a>下载</a>&nbsp;&nbsp;&nbsp;
			<a href="${ pageContext.request.contextPath }/file_delete.action?deletePath=<s:property value="#dir.path"/>">删除</a>
			</span>
		</li>
		<li style="width:17%" class="filesize">&nbsp;&nbsp;&nbsp;&nbsp;</li>
		<li style="width:23%" class="lastModified"><s:property value="#dir.last_modified" /></li>
	</ul>
</s:iterator>
<s:iterator var="f" value="#session.file_flist">
	<ul class="fileItem" id="12">
		<li style="width:52%" class="filename">
		<s:property value="#f.name" />
		<span id="span">
			<a href="${ pageContext.request.contextPath }/file_download.action?inputPath=<s:property value="#f.path"/>&downloadFilename=<s:property value="#f.name" />">下载</a>&nbsp;&nbsp;&nbsp;
			<a href="${ pageContext.request.contextPath }/file_delete.action?deletePath=<s:property value="#f.path"/>">删除</a></span>
		</li>
		<li style="width:17%" class="filesize"><s:property value="#f.size" />M</li>
		<li style="width:23%" class="lastModified"><s:property value="#f.last_modified" /></li>
	</ul>
</s:iterator>
</div>
<!-- 右键菜单 
<div id="filemenu" class="easyui-menu"  data-options="onClick:fileHandler" style="width:100px;">
	<div data-options="name:'download'">下载</div>
	<div data-options="name:'delete'">删除</div>
</div>-->

<div id="bodymenu" class="easyui-menu" >
</div>

</body>
</html>
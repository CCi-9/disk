<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>登陆</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/lib/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/login.css" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/tooltips.css" />


<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/js/jquery.pure.tooltips.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/lib/layui/layui.js"></script>
<script>

function checkUsername(){
	var username = document.getElementById("username_register").value;
	if(username == ""){
		$.pt({
			target: $("#username_register"),
			position: 'r',
			align: 't',
			width: 'auto',
			height: 'auto',
			content: "用户名不能为空"
		});
		return false;
	}
	
	if(username.trim().length < 6){
		$.pt({
			target: $("#username_register"),
			position: 'r',
			align: 't',
			width: 'auto',
			height: 'auto',
			content:"用户名不能少于6位"
		});
		return false;
	}
	
	// 1.创建异步交互对象
	var xhr = createXmlHttp();
	// 2.设置监听
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				$.pt({
					target: $("#username_register"),
					position: 'r',
					align: 't',
					width: 'auto',
					height: 'auto',
					content: xhr.responseText
				});
				
			}
		}
	}
	// 3.打开连接
	xhr.open("GET","${ pageContext.request.contextPath }/user_findByUsername.action?time="+new Date().getTime()+"&userName="+username,true);
	// 4.发送
	xhr.send(null);
}

function createXmlHttp(){
	   var xmlHttp;
	   try{ // Firefox, Opera 8.0+, Safari
	        xmlHttp=new XMLHttpRequest();
	    }
	    catch (e){
		   try{// Internet Explorer
		         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		      }
		    catch (e){
		      try{
		         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		      }
		      catch (e){}
		      }
	    }

		return xmlHttp;
	 }

function createUUID(){
	
}

</script>
<style>

body {
	margin:0;
	padding:0;
	overflow:hidden;
	background:#2d9b95;
	background:-moz-radial-gradient(center,ellipse cover,#2d9b95 0%,#0e1329 100%);
	background:-webkit-radial-gradient(center,ellipse cover,#2d9b95 0%,#0e1329 100%);
	background:-o-radial-gradient(center,ellipse cover,#2d9b95 0%,#0e1329 100%);
	background:-ms-radial-gradient(center,ellipse cover,#2d9b95 0%,#0e1329 100%);
	background:radial-gradient(ellipse at center,#2d9b95 0%,#0e1329 100%);
	filter:progid:DXImageTransform.Microsoft.gradient( startColorstr='#2d9b95',endColorstr='#0e1329',GradientType=1 );
	background:-webkit-gradient(radial,center center,0px,center center,100%,color-stop(0%,#2d9b95),color-stop(100%,#0e1329));
}
.box {background:#000000; position:absolute;margin-left:-14%; z-index:3;opacity: 0.6;left:50%;}
.box-login{width:450px; height:295px;margin-top:-10%;top:50%;}
.box-register{width:450px; height:385px;margin-top:-8%;top:46%;}
.box-reset{width:450px; height:385px;margin-top:-8%;top:46%;}
#register {display:none;}
#reset{display:none;}
</style>

</head>
<body>

<canvas></canvas>

<div class="beg-login-box box box-login layui-anim-up" id="login">
	<header>
		<h1 style="color:#FFFFFF">欢迎登录</h1>
	</header>
	<div class="beg-login-main">
		<form action="${ pageContext.request.contextPath }/user_login.action" onsubmit="return login()" id="loginForm" class="layui-form" method="post"><input name="__RequestVerificationToken" type="hidden" value="fkfh8D89BFqTdrE2iiSdG_L781RSRtdWOH411poVUWhxzA5MzI8es07g6KPYQh9Log-xf84pIR2RIAEkOokZL3Ee3UKmX0Jc8bW8jOdhqo81" />		
			<div class="layui-form-item">
				<label class="beg-login-icon">
				<i class="layui-icon">&#xe612;</i>
			</label>
				<input id="username" type="text" name="userName" lay-verify="userName" autocomplete="off" placeholder="请输入登录名" class="layui-input">
			</div>
			<div class="layui-form-item">
				<label class="beg-login-icon">
				<i class="layui-icon">&#xe642;</i>
			</label>
				<input id="password" type="password" name="password" lay-verify="password" autocomplete="off" placeholder="请输入密码" class="layui-input">
			</div>
			<div class="layui-form-item">
			
				<div class="beg-pull-left beg-login-remember" style="color:#FFFFFF;margin-top: 1%;">
					<label>记住帐号？</label>
					<input type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF" checked>
				</div>
				
				<div class="beg-pull-right" style="margin-top: 4%;">
					<a class="btn pull-left btn-link text-muted" onClick="goto_forget()" style="color:#FFFFFF;cursor:pointer;">忘记密码?</a>
				</div>
				<div class="beg-clear"></div>
			</div>
			
			<div class="layui-form-item">
				<div class="beg-pull-left beg-login-remember" style="color:#FFFFFF;margin-top: -2%;">
					<button class="layui-btn layui-btn-radius layui-btn-primary" onclick="goto_register();return false;">
					 注册
				</div>
				
				<div class="beg-pull-right">
					<input type="submit" value="登陆" class="layui-btn layui-btn-radius" style="margin-top: 4%;">
				
			
				</div>
			</div>
		</form>
	</div>
</div>

<div class="beg-login-box box box-register layui-anim-rotate" id="register">
	<header>
		<h1 style="color:#FFFFFF">欢迎注册</h1>
	</header>
	<div class="beg-login-main">
		<form action="${ pageContext.request.contextPath }/user_registUser.action"  onsubmit="return register();" id="registForm" class="layui-form" method="post"><input name="__RequestVerificationToken" type="hidden" value="fkfh8D89BFqTdrE2iiSdG_L781RSRtdWOH411poVUWhxzA5MzI8es07g6KPYQh9Log-xf84pIR2RIAEkOokZL3Ee3UKmX0Jc8bW8jOdhqo81" />		
			<div class="layui-form-item">
				<label class="beg-login-icon">
				<i class="layui-icon">&#xe612;</i>
			</label>
		
				<input id="username_register" type="text"  name="userName" lay-verify="userName" autocomplete="off" placeholder="请输入用户名" class="layui-input" onblur="checkUsername()"><span id="span1"></span>
			</div>
			<div class="layui-form-item">
				<label class="beg-login-icon">
					<i class="layui-icon">&#xe642;</i>
				</label>
				<input id="password_register" type="password" name="password" lay-verify="password" autocomplete="off" placeholder="密码只能是5-15位" class="layui-input"><span id="password_span"></span>
			</div>
			<div class="layui-form-item">
				<label class="beg-login-icon">
					<i class="layui-icon">&#xe642;</i>
				</label>
				<input id="determine_password_register" type="password" name="repassword" lay-verify="password" autocomplete="off" placeholder="确认密码" class="layui-input">
			</div>
			<div class="layui-form-item">
				<label class="beg-login-icon">
					<i class="layui-icon">&#xe6b2;</i>
				</label>
				<input id="regcode_register" type="text" name="email" lay-verify="regcode" autocomplete="off" placeholder="请输入邮箱" class="layui-input">
			</div>
			<div class="layui-form-item">
				<div class="beg-pull-left beg-login-remember" style="color:#FFFFFF;margin-top: 6%;">
					<input type="submit" class="layui-btn" value="注册">
					
				</div>
				
				<div class="beg-pull-right">
					<button class="layui-btn layui-btn layui-btn-primary" style="margin-top: 18%;" onClick="goto_login();return false;">
					<i class="layui-icon">&#xe650;</i> 返回登录
				</button>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="beg-login-box box box-reset layui-anim-rotate" id="reset">
	<header>
		<h1 style="color:#FFFFFF">重置密码</h1>
	</header>
	<div class="beg-login-main">
		<form action="" class="layui-form" method="post"><input name="__RequestVerificationToken" type="hidden" value="fkfh8D89BFqTdrE2iiSdG_L781RSRtdWOH411poVUWhxzA5MzI8es07g6KPYQh9Log-xf84pIR2RIAEkOokZL3Ee3UKmX0Jc8bW8jOdhqo81" />		
			<div class="layui-form-item">
				<label class="beg-login-icon">
				<i class="layui-icon">&#xe612;</i>
			</label>
				<input id="username_reset" type="text" name="userName" lay-verify="userName" autocomplete="off" placeholder="请输入用户名" class="layui-input">
			</div>
			<div class="layui-form-item">
				<label class="beg-login-icon">
					<i class="layui-icon">&#xe6b2;</i>
				</label>
				<input id="regcode_reset" type="text" name="regcode" lay-verify="regcode" autocomplete="off" placeholder="请输入注册码" class="layui-input">
			</div>
			<div class="layui-form-item">
				<label class="beg-login-icon">
					<i class="layui-icon">&#xe642;</i>
				</label>
				<input id="password_reset" type="password" name="password" lay-verify="password" autocomplete="off" placeholder="请输入重置密码" class="layui-input">
			</div>
			<div class="layui-form-item">
				<label class="beg-login-icon">
					<i class="layui-icon">&#xe642;</i>
				</label>
				<input id="determine_password_reset" type="password" name="password" lay-verify="password" autocomplete="off" placeholder="确认密码" class="layui-input">
			</div>
			<div class="layui-form-item">
				<div class="beg-pull-left beg-login-remember" style="color:#FFFFFF;margin-top: 6%;">
					<button class="layui-btn" onclick="reset_pwd();return false;">
					<i class="layui-icon">&#xe650;</i> 重置
				</div>
				
				<div class="beg-pull-right">
					<button class="layui-btn layui-btn layui-btn-primary" style="margin-top: 18%;" onClick="goto_login();return false;">
					<i class="layui-icon">&#xe650;</i> 返回登录
				</button>
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
window.requestAnimFrame = (function(){
  return  window.requestAnimationFrame || 
    window.webkitRequestAnimationFrame || 
    window.mozRequestAnimationFrame    || 
    window.oRequestAnimationFrame      || 
    window.msRequestAnimationFrame     ||  
    function( callback ){
    window.setTimeout(callback, 1000 / 60);
  };
})();

var canvas = document.getElementsByTagName("canvas")[0];
var ctx = canvas.getContext("2d");
var w = $(document).width();
var h = $(document).height();
canvas.width = w;
canvas.height = h;

var mols = [];

function init(){
  for(var i=0;i<18;i++){
    var mol = new generate_mol("C8H10N4O2");
    mols.push(mol);
    var mol = new generate_mol("C6H6O");
    mols.push(mol);
    var mol = new generate_mol("C6H6");
    mols.push(mol);
  }
}

function draw(){
  canvas.width = canvas.width;
  for(var i=0;i<mols.length;i++){
    var m = mols[i];
    m.x += m.vx;
    if(m.x >= w-100 || m.x <= 0){
      m.vx = -m.vx;
    }
    m.y += m.vy;
    if(m.y >= h-100 || m.y <= 0){
      m.vy = -m.vy;
    }
    
    m.r += 0.005;
    m.draw();
  }
}

function generate_mol(mol){
  this.x = Math.random()*w;
  this.y = Math.random()*h;
  this.vx = Math.random()*-2;
  this.vy = Math.random()*2;
  this.vr = 0.1;
  this.r = Math.random()*Math.PI;
  this.draw = function(){
    if(mol == "C6H6O"){
      //Phenol
      ctx.save();
      ctx.translate(this.x+20,this.y+80);
      ctx.rotate(this.r);
      ctx.translate(-this.x+20,-this.y-80);
      ctx.beginPath();
      ctx.moveTo(this.x,this.y + 5);
      ctx.lineTo(this.x,this.y + 30);
      ctx.lineTo(this.x - 26,this.y + 45);
      ctx.lineTo(this.x - 26,this.y + 75);
      ctx.lineTo(this.x,this.y + 90);
      ctx.lineTo(this.x + 26,this.y + 75);
      ctx.lineTo(this.x + 26,this.y + 45);
      ctx.lineTo(this.x,this.y + 30);
      ctx.moveTo(this.x - 20,this.y + 47);
      ctx.lineTo(this.x - 20,this.y + 73);
      ctx.moveTo(this.x,this.y + 83);
      ctx.lineTo(this.x + 22,this.y + 70);
      ctx.moveTo(this.x,this.y + 36);
      ctx.lineTo(this.x + 22,this.y + 49);
      ctx.strokeStyle = "rgba(255,255,255,0.2)";
      ctx.lineWidth = 3;
      ctx.stroke();
      ctx.fillStyle = "rgba(255,255,255,0.2)";
      ctx.font = "15px Arial";
      ctx.fillText("OH", this.x - 5, this.y);
      ctx.closePath();
      ctx.restore();
    }
    else if(mol == "C8H10N4O2"){
      //Caffeine
      ctx.save();
      ctx.translate(this.x+20,this.y+80);
      ctx.rotate(this.r);
      ctx.translate(-this.x+20,-this.y-80);
      ctx.beginPath();
      ctx.moveTo(this.x,this.y + 5);
      ctx.lineTo(this.x,this.y + 22);
      ctx.moveTo(this.x-9,this.y + 35);
      ctx.lineTo(this.x - 26,this.y + 45);
      ctx.lineTo(this.x - 26,this.y + 75);
      ctx.lineTo(this.x,this.y + 90);
      ctx.lineTo(this.x + 18,this.y + 80);
      ctx.moveTo(this.x + 26,this.y + 68);
      ctx.lineTo(this.x + 26,this.y + 45);
      ctx.lineTo(this.x + 9,this.y + 35);
      ctx.moveTo(this.x - 20,this.y + 47);
      ctx.lineTo(this.x - 20,this.y + 73);
      ctx.moveTo(this.x + 23,this.y + 42);
      ctx.lineTo(this.x + 36,this.y + 32);
      ctx.moveTo(this.x + 26,this.y + 46);
      ctx.lineTo(this.x + 39,this.y + 36);
      ctx.moveTo(this.x + 34,this.y + 81);
      ctx.lineTo(this.x + 48,this.y + 90);
      ctx.moveTo(this.x - 2,this.y + 88);
      ctx.lineTo(this.x - 2,this.y + 110);
      ctx.moveTo(this.x + 3,this.y + 88);
      ctx.lineTo(this.x + 3,this.y + 110);
      ctx.moveTo(this.x - 26,this.y + 45);
      ctx.lineTo(this.x - 46,this.y + 38);
      ctx.moveTo(this.x - 60,this.y + 44);
      ctx.lineTo(this.x - 74,this.y + 58);
      ctx.lineTo(this.x - 61,this.y + 77);
      ctx.moveTo(this.x - 58,this.y + 49);
      ctx.lineTo(this.x - 68,this.y + 59);
      ctx.moveTo(this.x - 46,this.y + 82);
      ctx.lineTo(this.x - 26,this.y + 73);
      ctx.moveTo(this.x - 60,this.y + 86);
      ctx.lineTo(this.x - 70,this.y + 100);
      ctx.strokeStyle = "rgba(255,255,255,0.2)";
      ctx.lineWidth = 3;
      ctx.stroke();
      ctx.fillStyle = "rgba(255,255,255,0.2)";
      ctx.font = "15px Arial";
      ctx.fillText("CH", this.x - 5, this.y);
      ctx.fillText("3", this.x + 18, this.y+6);
      ctx.fillText("N", this.x - 5, this.y+37);
      ctx.fillText("O", this.x + 38, this.y+35);
      ctx.fillText("N", this.x + 21, this.y+81);
      ctx.fillText("CH", this.x + 50, this.y+99);
      ctx.fillText("3", this.x + 72, this.y+105);
      ctx.fillText("O", this.x - 5, this.y+124);
      ctx.fillText("N", this.x - 59, this.y+42);
      ctx.fillText("N", this.x - 59, this.y+84);
      ctx.fillText("H  C", this.x - 98, this.y+114);
      ctx.fillText("3", this.x - 87, this.y+119);
      ctx.closePath();
      ctx.restore();
    }
    else if(mol == "C6H6"){
      //Benzene
      ctx.save();
      ctx.translate(this.x+20,this.y+80);
      ctx.rotate(this.r);
      ctx.translate(-this.x+20,-this.y-80);
      ctx.beginPath();
      ctx.moveTo(this.x,this.y + 30);
      ctx.lineTo(this.x - 26,this.y + 45);
      ctx.lineTo(this.x - 26,this.y + 75);
      ctx.lineTo(this.x,this.y + 90);
      ctx.lineTo(this.x + 26,this.y + 75);
      ctx.lineTo(this.x + 26,this.y + 45);
      ctx.lineTo(this.x,this.y + 30);
      ctx.moveTo(this.x - 20,this.y + 47);
      ctx.lineTo(this.x - 20,this.y + 73);
      ctx.moveTo(this.x,this.y + 83);
      ctx.lineTo(this.x + 22,this.y + 70);
      ctx.moveTo(this.x,this.y + 36);
      ctx.lineTo(this.x + 22,this.y + 49);
      ctx.strokeStyle = "rgba(255,255,255,0.2)";
      ctx.lineWidth = 3;
      ctx.stroke();
      ctx.closePath();
      ctx.restore();
    }
  }
}

init();

function animloop() {
  draw();
  requestAnimFrame(animloop);
}

$(function(){
	layui.use(['layer', 'form'], function() {
		var layer = layui.layer,
			$ = layui.jquery,
			form = layui.form();
	});
})

function login(){
	var username = $("#username").val();
	var password = $("#password").val();
	if(username.trim().length < 6){
		$.pt({
			target: $("#username"),
			position: 'r',
			align: 't',
			width: 'auto',
			height: 'auto',
			content:"用户名不能少于6位"
		});
		return false;
	}
	//密码只能是5-15位
	var regExp = new RegExp("^.{5,15}$");
	if(!regExp.test(password)){
		$.pt({
			target: $("#password"),
			position: 'r',
			align: 't',
			width: 'auto',
			height: 'auto',
			content:"密码只能是5-15位"
		});
		return false;
	}
}

function goto_register(){
	$("#register").show();
	$("#login").hide();
	$("#reset").hide();
}

function register(){
	var regcode_register = $("#regcode_register").val();
	var username_register = $("#username_register").val();
	var password_register = $("#password_register").val();
	var determine_password_register = $("#determine_password_register").val();

	
	//密码只能是5-15位
	var regExp = new RegExp("^.{5,15}$");
	if(!regExp.test(password_register)){
		$.pt({
			target: $("#password_register"),
			position: 'r',
			align: 't',
			width: 'auto',
			height: 'auto',
			content:"密码只能是5-15位"
		});
		return false;
	}
	//两次输入的密码要一致
	if(password_register != determine_password_register){
		$.pt({
			target: $("#determine_password_register"),
			position: 'r',
			align: 't',
			width: 'auto',
			height: 'auto',
			content:"两次输入的密码不一致"
		});
		return false;
	}
	//注册码不能为空
	if(regcode_register == ""){
		$.pt({
			target: $("#regcode_register"),
			position: 'r',
			align: 't',
			width: 'auto',
			height: 'auto',
			content:"注册码不能为空"
		});
		return false;
	}
	
}
function goto_login(){
	$("#register").hide();
	$("#login").show();
	$("#reset").hide();
}
function goto_forget(){
	$("#register").hide();
	$("#login").hide();
	$("#reset").show();
}

function reset_pwd(){
	var regcode_reset = $("#regcode_reset").val();
	var username_reset = $("#username_reset").val();
	var password_reset = $("#password_reset").val();
	var determine_password_reset = $("#determine_password_reset").val();
	if(username_reset.trim().length < 6){
		$.pt({
			target: $("#username_reset"),
			position: 'r',
			align: 't',
			width: 'auto',
			height: 'auto',
			content:"用户名不能少于6位"
		});
		return false;
	}
	//注册码不能为空
	if(regcode_reset == ""){
		$.pt({
			target: $("#regcode_reset"),
			position: 'r',
			align: 't',
			width: 'auto',
			height: 'auto',
			content:"注册码不能为空"
		});
		return false;
	}
	//密码只能是5-15位
	var regExp = new RegExp("^.{5,15}$");
	if(!regExp.test(password_reset)){
		$.pt({
			target: $("#password_reset"),
			position: 'r',
			align: 't',
			width: 'auto',
			height: 'auto',
			content:"密码只能是5-15位"
		});
		return false;
	}
	//两次输入的密码要一致
	if(password_reset != determine_password_reset){
		$.pt({
			target: $("#determine_password_reset"),
			position: 'r',
			align: 't',
			width: 'auto',
			height: 'auto',
			content:"两次输入的密码不一致"
		});
		return false;
	}
	alert("密码重置成功");
}
animloop();
</script>

</body>
</html>


<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags"  prefix="s"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>message</title>
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="css/login.css" />
<link rel="stylesheet" href="css/tooltips.css" />

<meta http-equiv='refresh' content='3;url=http://101.132.37.90:8080/Disk/index_login.action'/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.pure.tooltips.js"></script>
<script type="text/javascript" src="lib/layui/layui.js"></script>
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
	<header style="margin: 117px">
		<h1 style="color:#FFFFFF">
			<s:actionmessage/>
	        <s:actionerror/>
		</h1>
	</header>
</div>

<div class="beg-login-box box box-register layui-anim-rotate" id="register">

</div>

<div class="beg-login-box box box-reset layui-anim-rotate" id="reset">
	ccc
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


function goto_register(){
	$("#register").show();
}

animloop();
</script>

</body>
</html>


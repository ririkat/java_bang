<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="com.jb.client.model.vo.Client,com.jb.owner.model.vo.Owner" %>
<% 
	Client loginClient = (Client)session.getAttribute("loginClient"); 
	Owner loginOwner = (Owner)session.getAttribute("loginOwner");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>호텔</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
<!-- 
#fffcf0 : 누리끼리색
#dedcee : 옅은 남?보라?색
#6a60a9 : 진한 남?보라?색
#fbd14b : 노랭이
-->

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/honeycss.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/riri.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/reservationCSS.css">

<script src="<%=request.getContextPath() %>/js/bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.4.1.js"></script>

</head>

<body>

	<!-- 헤더 -->
	<!-- 네이게이션 -->
	<header>
		<nav class="navbar navbar-inverse navbg">
		
<!--  		<nav class="navbar navbar-inverse navbar-fixed-top navbg"> -->
			<!--위에 코드로하면 헤더가 바디까지 섹션을 먹어서 바디 윗부분이 짤림,-->
			
			<div class="container nav">
				<div class="navbar-header ">
					<!-- 화면이 줄었을때 버튼생성,스펜포함 -->
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand navfont" href="<%=request.getContextPath()%>/index.jsp">자바방</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right font2">
					<!-- 로그인 정책 
					1. 회원로그인/업주 로그인 두종류로 구성
					2. 관리자는 회원로그인에서 권한이 1인 경우 관리자로 설정 -->
						<li><a class="aa" href="<%=request.getContextPath()%>/notice/noticeList">게시판</a></li>
						<% if (loginClient == null&&loginOwner==null) {%>
							<li><a class="aa" href="<%=request.getContextPath()%>/views/client/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
						<%}%>
						<%if(loginClient!=null&&loginOwner==null){//1.회원로그인 된 경우
							if(loginClient.getAuthority()==1 ) { %><!-- 회원 중 관리자로 로그인 된 경우 -->
							<li>
								<a class="aa" href="<%=request.getContextPath()%>/master/pensionList">관리자메뉴</a>
							</li>
						<%}%>
	                        <li><a class="aa" href="<%=request.getContextPath()%>/views/client/mypageHome.jsp">마이페이지</a></li>
	                        <li><a class="aa" href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
						<%}%>
						
						<%if(loginClient==null&&loginOwner!=null){%>
	                        <li><a class="aa" href="<%=request.getContextPath()%>/views/owner/ownerMypage.jsp">마이페이지</a></li>
	                        <li><a class="aa" href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
						<%}%>
						
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- 헤더 끝 -->
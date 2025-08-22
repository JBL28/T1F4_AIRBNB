<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Airbnb Clone</title>
    <style>
        header {
            background-color: #f5f5f5;
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }
        nav a {
            margin: 0 10px;
            text-decoration: none;
        }
    </style>
</head>
<body>
<header>
    <h1>Airbnb Clone</h1>
    <nav>
        <a href="<%=request.getContextPath()%>/index.jsp">홈</a>

        <!-- 로그인 여부 체크 -->
        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <!-- 로그인 안 했을 때 -->
                <a href="<%=request.getContextPath()%>/login">로그인</a>            
            </c:when>
            <c:otherwise>
                <!-- 로그인 했을 때 -->
                <p>${sessionScope.user.name}님</p>
                <a href="<%=request.getContextPath()%>/logout">로그아웃</a>
            </c:otherwise>
        </c:choose>
    </nav>
</header>

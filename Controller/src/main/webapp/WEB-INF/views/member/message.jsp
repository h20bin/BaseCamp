<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 쪽지함</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />
    
    <style>
        body { font-family: 'Pretendard', sans-serif; background-color: #f9fafb; padding: 30px; }
        .card { border-radius: 12px; border: none; box-shadow: 0 4px 10px rgba(0,0,0,0.05); }
        .table th { background-color: #f8f9fa; }
    </style>
</head>
<body>

<div class="container">
    <div class="card p-4">
        <h3 class="fw-bold mb-4">📬 내 쪽지함</h3>
        
        <table class="table table-hover">
            <thead>
                <tr>
                    <th width="100">보낸이</th>
                    <th>내용</th>
                    <th width="150">날짜</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty msgList}">
                        <tr>
                            <td colspan="3" class="text-center py-4">도착한 쪽지가 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${msgList}" var="msg">
                            <tr>
                                <td class="text-danger fw-bold">${msg.senderId}</td>
                                <td>${msg.content}</td>
                                <td class="text-muted" style="font-size:13px;">
                                    <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${msg.sendDate}"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        
        <div class="text-center mt-3">
            <a href="/" class="btn btn-secondary">메인으로</a>
        </div>
    </div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<table class="table table-hover text-center align-middle">
    <thead class="table-light">
        <tr>
            <th>일자</th>
            <th>승리 팀 (Home)</th>
            <th>점수</th>
            <th>패배 팀 (Away)</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${empty gameList}">
                <tr>
                    <td colspan="5">등록된 경기 기록이 없습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach var="game" items="${gameList}">
                    <tr>
                        <td><fmt:formatDate value="${game.gameDate}" pattern="yyyy-MM-dd" /></td>
                        
                        <td class="fw-bold text-primary">${game.homeTeamName}</td>
                        
                        <td>
                            <span class="badge bg-dark fs-6">${game.homeScore}</span>
                        </td>
                        
                        <td class="text-secondary">${game.awayTeamName}</td>
                        
                        <td>${game.stadium}</td>
                    </tr>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>
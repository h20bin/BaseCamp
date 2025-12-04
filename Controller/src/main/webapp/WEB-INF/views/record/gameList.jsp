<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table class="table table-hover text-center">
    <thead class="table-light">
        <tr>
            <th>일자</th>
            <th>경기</th>
            <th>스코어</th>
            <th>구장</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="game" items="${gameList}">
            <tr>
                <td><fmt:formatDate value="${game.game_date}" pattern="yyyy-MM-dd" /></td>
                <td>${game.homeTeamName} vs ${game.awayTeamName}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty game.home_score}">
                            ${game.home_score} : ${game.away_score}
                        </c:when>
                        <c:otherwise>
                            예정
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${game.stadium}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

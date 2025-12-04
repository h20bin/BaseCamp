<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table class="table table-hover text-center">
    <thead class="table-light">
        <tr>
            <th>선수명</th>
            <th>팀</th>
            <th>포지션</th>
            <th>타율(AVG)</th>
            <th>홈런(HR)</th>
            <th>평균자책점(ERA)</th>
            <th>삼진(SO)</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="player" items="${playerList}">
            <tr>
                <td>${player.name}</td>
                <td>${player.teamName}</td>
                <td>${player.position}</td>

                <!-- 타율 (없으면 - 표시) -->
                <td>
                    <c:choose>
                        <c:when test="${not empty player.avg}">
                            ${player.avg}
                        </c:when>
                        <c:otherwise>-</c:otherwise>
                    </c:choose>
                </td>

                <!-- 홈런 -->
                <td>
                    <c:choose>
                        <c:when test="${not empty player.homerun}">
                            ${player.homerun}
                        </c:when>
                        <c:otherwise>-</c:otherwise>
                    </c:choose>
                </td>

                <!-- ERA -->
                <td>
                    <c:choose>
                        <c:when test="${not empty player.era}">
                            ${player.era}
                        </c:when>
                        <c:otherwise>-</c:otherwise>
                    </c:choose>
                </td>

                <!-- SO -->
                <td>
                    <c:choose>
                        <c:when test="${not empty player.strikeouts}">
                            ${player.strikeouts}
                        </c:when>
                        <c:otherwise>-</c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

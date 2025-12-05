<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table class="table table-hover text-center">
    <thead class="table-light">
        <tr>
            <th>순위</th>
            <th>팀명</th>
            <th>승</th>
            <th>패</th>
            <th>팀 승률</th>
            <th>팀 타율</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="team" items="${teamList}">
            <tr>
                <td>${team.rankNo}</td>
                <td class="fw-bold">${team.teamName}</td>
                <td>${team.wins}</td>
                <td>${team.losses}</td>
                <td>${team.winRate}</td>
                <td>${team.teamAvg}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
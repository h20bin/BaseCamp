<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container-main">
    <h2 class="page-title">2025 KBO 리그 순위</h2>
    
    <div class="card shadow-sm">
        <div class="card-body">
            <table class="table table-hover text-center">
                <thead class="table-light">
                    <tr>
                        <th>순위</th>
                        <th>팀명</th>
                        <th>경기</th>
                        <th>승</th>
                        <th>무</th>
                        <th>패</th>
                        <th>승률</th>
                        <th>타율</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${teamList}" var="team">
                        <tr>
                            <td>${team.rankNo}</td>
                            <td class="fw-bold text-primary">${team.teamName}</td>
                            <td>${team.wins + team.losses + team.draws}</td>
                            <td>${team.wins}</td>
                            <td>${team.draws}</td>
                            <td>${team.losses}</td>
                            <td>${team.losses}</td>
                            <td>${team.winRate}</td>
                            <td>${team.teamAvg}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

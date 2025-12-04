<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table class="table table-hover text-center">
    <thead class="table-light">
        <tr>
            <th>순위</th>
            <th>팀명</th>
            <th>승</th>
            <th>패</th>
            <th>승률</th>
            <th>타율</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="team" items="${teamList}">
            <tr>
                <td>${team.rank_no}</td>
                <td>${team.team_name}</td>
                <td>${team.wins}</td>
                <td>${team.losses}</td>
                <td>${team.win_rate}</td>
                <td>${team.team_avg}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

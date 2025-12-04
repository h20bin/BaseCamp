<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>선수 · 팀 · 경기 기록</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: Pretendard, sans-serif; background-color: #f9fafb; }
        .tab-content { background-color: white; padding: 30px; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); margin-top: 20px; }
        .page-title { font-size: 32px; font-weight: 800; margin-top: 40px; text-align:center; }
    </style>
</head>
<body>

<div class="container">
    <h1 class="page-title">📊 야구 기록 보기</h1>

    <!-- TAB MENU -->
    <ul class="nav nav-tabs mt-4 fw-bold" id="recordTab" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active" id="player-tab" data-bs-toggle="tab" data-bs-target="#player" type="button" role="tab">
                선수 기록
            </button>
        </li>

        <li class="nav-item" role="presentation">
            <button class="nav-link" id="team-tab" data-bs-toggle="tab" data-bs-target="#team" type="button" role="tab">
                팀 기록
            </button>
        </li>

        <li class="nav-item" role="presentation">
            <button class="nav-link" id="game-tab" data-bs-toggle="tab" data-bs-target="#game" type="button" role="tab">
                경기 기록
            </button>
        </li>
    </ul>

    <!-- TAB CONTENT -->
    <div class="tab-content">

        <!-- 선수 기록 -->
        <div class="tab-pane fade show active" id="player" role="tabpanel">
            <jsp:include page="/WEB-INF/views/record/playerList.jsp"/>
        </div>

        <!-- 팀 기록 -->
        <div class="tab-pane fade" id="team" role="tabpanel">
            <jsp:include page="/WEB-INF/views/record/teamList.jsp"/>
        </div>

        <!-- 경기 기록 -->
        <div class="tab-pane fade" id="game" role="tabpanel">
            <jsp:include page="/WEB-INF/views/record/gameList.jsp"/>
        </div>
<!-- 홈 화면 이동 버튼 (Floating Action Button) -->
<a href="/" 
   class="btn btn-primary rounded-circle shadow-lg" 
   data-bs-toggle="tooltip" 
   title="홈 화면으로 이동"
   style="
        position: fixed;
        bottom: 30px;
        right: 30px;
        width: 60px;
        height: 60px;
        font-size: 26px;
        display: flex;
        align-items: center;
        justify-content: center;
   ">
    🏠
</a>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    [...tooltipTriggerList].map(t => new bootstrap.Tooltip(t));
</script>

</body>
</html>

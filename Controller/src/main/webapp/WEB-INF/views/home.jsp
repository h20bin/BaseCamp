<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basecamp - 야구 데이터베이스</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />

    <style>
        body { font-family: 'Pretendard', sans-serif; background-color: #f9fafb; color: #191f28; height: 100vh; display: flex; flex-direction: column; }
        .navbar { padding: 15px 40px; background-color: transparent; }
        .navbar-brand { font-weight: 900; font-size: 26px; color: #3182f6 !important; letter-spacing: -0.5px; display: flex; align-items: center; gap: 8px; }
        .btn-auth-group { display: flex; gap: 10px; align-items: center; }
        .user-welcome { font-weight: 600; font-size: 15px; color: #191f28; margin-right: 10px; }
        .user-welcome span { color: #3182f6; font-weight: 800; }
        .btn-ghost { color: #333 !important; font-weight: 600; font-size: 15px; background: transparent; border: none; padding: 8px 12px; text-decoration: none; transition: color 0.2s; }
        .btn-ghost:hover { color: #3182f6 !important; }
        .btn-primary-fill { background-color: #3182f6 !important; color: #ffffff !important; font-weight: 600; font-size: 15px; padding: 10px 24px; border-radius: 8px; border: none; text-decoration: none; box-shadow: 0 2px 5px rgba(49, 130, 246, 0.3); display: inline-block; transition: background-color 0.2s; }
        .btn-primary-fill:hover { background-color: #1b64da !important; }
        .main-container { flex: 1; display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center; margin-top: -40px; }
        .main-title { font-size: 46px; font-weight: 800; margin-bottom: 20px; color: #191f28; line-height: 1.3; letter-spacing: -1px; }
        .main-subtitle { font-size: 18px; color: #8b95a1; margin-bottom: 50px; line-height: 1.6; }
        .action-buttons { display: flex; gap: 20px; justify-content: center; flex-wrap: wrap; }
        .btn-lg-custom { padding: 18px 36px; font-size: 18px; border-radius: 16px; font-weight: 700; text-decoration: none; display: inline-flex; align-items: center; gap: 12px; transition: all 0.2s ease; box-shadow: 0 4px 12px rgba(0,0,0,0.05); min-width: 220px; justify-content: center; }
        .btn-blue { background-color: #3182f6; color: white; border: 1px solid #3182f6; }
        .btn-blue:hover { background-color: #1b64da; color: white; transform: translateY(-3px); box-shadow: 0 8px 20px rgba(49, 130, 246, 0.3); }
        .btn-white { background-color: white; color: #191f28; border: 1px solid #e5e8eb; }
        .btn-white:hover { background-color: #f9fafb; color: #3182f6; border-color: #3182f6; transform: translateY(-3px); box-shadow: 0 8px 20px rgba(0,0,0,0.08); }
        
        /* 팀 정보 카드 스타일 */
        .team-card { background: white; border-radius: 20px; padding: 40px; box-shadow: 0 10px 30px rgba(0,0,0,0.05); width: 100%; max-width: 600px; margin-bottom: 30px; }
        .team-stat-item { flex: 1; }
        .team-stat-label { font-size: 14px; color: #8b95a1; margin-bottom: 5px; }
        .team-stat-value { font-size: 32px; font-weight: 800; color: #191f28; }
        .team-stat-divider { width: 1px; height: 50px; background-color: #e5e8eb; margin: 0 20px; }

        /* 선수 정보 카드 스타일 (추가됨) */
        .player-cards-wrapper { display: flex; gap: 20px; justify-content: center; margin-bottom: 50px; flex-wrap: wrap; }
        .player-card { background: white; border-radius: 16px; padding: 25px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); width: 220px; text-align: left; border: 1px solid #e5e8eb; transition: transform 0.2s; }
        .player-card:hover { transform: translateY(-5px); }
        .player-team { font-size: 13px; color: #8b95a1; margin-bottom: 5px; font-weight: 600; }
        .player-name { font-size: 20px; font-weight: 800; color: #191f28; margin-bottom: 15px; }
        .player-stat-row { display: flex; justify-content: space-between; align-items: flex-end; border-top: 1px solid #f2f4f6; padding-top: 15px; }
        .stat-label { font-size: 13px; color: #6b7684; font-weight: 600; }
        .stat-value { font-size: 22px; font-weight: 800; color: #3182f6; }

        footer { text-align: center; font-size: 12px; color: #ddd; padding: 20px; }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                <i class="fa-solid fa-baseball-bat-ball"></i> Basecamp
            </a>

            <div class="ms-auto btn-auth-group">
                <c:choose>
                    <c:when test="${empty loginUser}">
                        <a href="/member/login" class="btn-ghost">로그인</a>
                        <a href="/member/signup" class="btn-primary-fill">회원가입</a>
                    </c:when>

                    <c:otherwise>
                        <span class="user-welcome">
                            <span>${loginUser.nickName}</span>님, 환영합니다!
                        </span>
                        <a href="/member/logout" class="btn-ghost">로그아웃</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>

    <div class="main-container">
        
        <c:choose>
            <%-- Case 1: 로그인 + 관심구단(myTeam) 정보 있음 --%>
            <c:when test="${not empty loginUser and not empty myTeam}">
                
                <div class="mb-4">
                    <span class="badge bg-primary bg-opacity-10 text-primary mb-2 rounded-pill px-3 py-2 fw-bold">MY TEAM</span>
                    <h1 class="main-title" style="font-size: 40px; margin-bottom: 10px;">
                        ${myTeam.teamName}의 오늘 기록
                    </h1>
                </div>

                <div class="team-card">
                    <div class="d-flex justify-content-between align-items-center text-center">
                        <div class="team-stat-item">
                            <div class="team-stat-label">현재 순위</div>
                            <div class="team-stat-value">${myTeam.rankNo}위</div>
                        </div>
                        <div class="team-stat-divider"></div>
                        <div class="team-stat-item">
                            <div class="team-stat-label">승률</div>
                            <div class="team-stat-value text-primary">${myTeam.winRate}</div>
                        </div>
                        <div class="team-stat-divider"></div>
                        <div class="team-stat-item">
                            <div class="team-stat-label">팀 타율</div>
                            <div class="team-stat-value">${myTeam.teamAvg}</div>
                        </div>
                    </div>
                    <div class="mt-4 pt-4 border-top text-center">
                        <a href="/record/team?id=${myTeam.teamId}" class="text-decoration-none fw-bold" style="color: #3182f6;">
                            상세 기록 확인하기 <i class="fa-solid fa-chevron-right ms-1"></i>
                        </a>
                    </div>
                </div>

                <c:if test="${not empty myPlayers}">
                    <div class="mb-4 mt-5">
                        <span class="badge bg-success bg-opacity-10 text-success mb-2 rounded-pill px-3 py-2 fw-bold">MY PLAYERS</span>
                        <h2 class="fw-bold" style="font-size: 28px;">나의 관심 선수</h2>
                    </div>

                    <div class="player-cards-wrapper">
                        <c:forEach var="player" items="${myPlayers}">
                            <div class="player-card">
                                <div class="player-team">${player.teamName} · ${player.playerType}</div>
                                <div class="player-name">${player.name}</div>
                                <div class="player-stat-row">
                                    <span class="stat-label">${player.statLabel}</span>
                                    <span class="stat-value">${player.statValue}</span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>

            </c:when>

            <%-- Case 2: 로그인 안 함 or 관심구단 없음 --%>
            <c:otherwise>
                <h1 class="main-title">
                    야구 데이터와 커뮤니티가<br>
                    하나로 만나는 곳
                </h1>
                
                <p class="main-subtitle">
                    <c:choose>
                        <c:when test="${not empty loginUser}">
                            ${loginUser.nickName}님, 관심 구단을 설정하시면<br>
                            메인 화면에서 바로 팀 기록을 확인할 수 있습니다.
                        </c:when>
                        <c:otherwise>
                            KBO 선수들의 상세한 기록을 확인하고,<br>
                            야구 팬들과 자유롭게 소통해보세요.
                        </c:otherwise>
                    </c:choose>
                </p>
            </c:otherwise>
        </c:choose>

        <div class="action-buttons">
            <a href="/record/list" class="btn-lg-custom btn-blue">
                <i class="fa-solid fa-chart-simple"></i> 선수 기록 보러가기
            </a>

            <a href="/board/list" class="btn-lg-custom btn-white">
                <i class="fa-solid fa-comments"></i> 자유게시판 바로가기
            </a>

            <c:if test="${not empty loginUser}">
                <a href="/member/modify" class="btn-lg-custom btn-white" style="color:#555;">
                    <i class="fa-solid fa-gear"></i> 내 정보 수정
                </a>
            </c:if>
        </div>

    </div>

    <footer>
        Server Time: ${serverTime}
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
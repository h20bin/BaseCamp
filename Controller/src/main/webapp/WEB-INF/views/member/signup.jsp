<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basecamp - 회원가입</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />

    <style>
        :root { --primary-color: #3182f6; --bg-color: #f9fafb; --text-main: #191f28; }
        body { font-family: 'Pretendard', sans-serif; background-color: var(--bg-color); }
        .container-signup { max-width: 450px; margin: 50px auto; padding: 30px; background: white; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); }
        .form-title { font-size: 28px; font-weight: 800; margin-bottom: 30px; text-align: center; }
        .form-control, .form-select { border-radius: 8px; padding: 12px; margin-bottom: 15px; }
        .btn-signup-submit { background-color: var(--primary-color); color: white; font-weight: 700; padding: 12px; border-radius: 8px; }
        .btn-signup-submit:hover { background-color: #1b64da; color: white; }
    </style>
</head>
<body>

    <div class="container-signup">
        <h2 class="form-title">
            <i class="fa-solid fa-user-plus me-2" style="color: var(--primary-color);"></i>
            Basecamp 회원가입
        </h2>

        <%-- ▼▼▼ [추가됨] Controller에서 보낸 실패 메시지가 있으면 경고창 띄우기 ▼▼▼ --%>
        <c:if test="${not empty msg}">
            <script>
                alert("${msg}");
            </script>
        </c:if>

        <form action="/member/signup" method="post"> 
            
            <div class="mb-3">
                <label for="userId" class="form-label">아이디</label>
                <input type="text" name="userId" id="userId" class="form-control" required placeholder="영문, 숫자 5~20자">
            </div>

            <div class="mb-3">
                <label for="userPw" class="form-label">비밀번호</label>
                <input type="password" name="userPw" id="userPw" class="form-control" required placeholder="8자리 이상, 특수문자 포함">
            </div>

            <div class="mb-3">
                <label for="userName" class="form-label">이름</label>
                <input type="text" name="userName" id="userName" class="form-control" required placeholder="이름">
            </div>
            
            <div class="mb-3">
                <label for="nickName" class="form-label">닉네임</label>
                <input type="text" name="nickName" id="nickName" class="form-control" required placeholder="사이트에서 사용할 닉네임">
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input type="email" name="email" id="email" class="form-control" required placeholder="이메일 주소">
            </div>

            <div class="mb-4">
                <label for="phone" class="form-label">휴대폰 번호</label>
                <input type="text" name="phone" id="phone" class="form-control" required placeholder="010-xxxx-xxxx">
            </div>

            <div class="mb-4">
                <label for="favTeamId" class="form-label">관심 구단 (선택)</label>
                <select name="favTeamId" id="favTeamId" class="form-select">
                    <option value="" selected>-- 선택 안함 --</option> 
                    <c:forEach items="${teamList}" var="team">
                        <option value="${team.teamId}">${team.teamName}</option>
                    </c:forEach>
                </select>
            </div>
            
            <div class="mb-4">
                <label class="form-label">관심 선수 3명 (선택)</label>
                <select name="favPlayerId1" class="form-select mb-2">
                    <option value="" selected>-- 관심 선수 1 (선택 안함) --</option>
                    <c:forEach items="${playerList}" var="player">
                        <option value="${player.playerId}">[${player.teamName} - ${player.playerType}] ${player.name}</option>
                    </c:forEach>
                </select>
                <select name="favPlayerId2" class="form-select mb-2">
                    <option value="" selected>-- 관심 선수 2 (선택 안함) --</option>
                    <c:forEach items="${playerList}" var="player">
                        <option value="${player.playerId}">[${player.teamName} - ${player.playerType}] ${player.name}</option>
                    </c:forEach>
                </select>
                <select name="favPlayerId3" class="form-select">
                    <option value="" selected>-- 관심 선수 3 (선택 안함) --</option>
                    <c:forEach items="${playerList}" var="player">
                        <option value="${player.playerId}">[${player.teamName} - ${player.playerType}] ${player.name}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn btn-signup-submit w-100">가입 완료</button>

            <p class="text-center text-muted mt-3" style="font-size: 14px;">
                이미 계정이 있으신가요? 
                <a href="/member/login" class="text-decoration-none" style="font-weight: 600; color: var(--primary-color);">로그인</a>
            </p>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
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
        /* 기본 설정 */
        body {
            font-family: 'Pretendard', sans-serif;
            background-color: #f9fafb;
            color: #191f28;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* 내비게이션 바 */
        .navbar {
            padding: 15px 40px;
            background-color: transparent; 
        }
        
        .navbar-brand {
            font-weight: 900;
            font-size: 26px;
            color: #3182f6 !important;
            letter-spacing: -0.5px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* 버튼 그룹 */
        .btn-auth-group {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        /* 유저 환영 문구 */
        .user-welcome {
            font-weight: 600;
            font-size: 15px;
            color: #191f28
            margin-right: 10px;
        }
        .user-welcome span {
            color: #3182f6; /* 이름 강조 */
            font-weight: 800;
        }

        /* 버튼 스타일들 */
        .btn-ghost {
            color: #333 !important;
            font-weight: 600;
            font-size: 15px;
            background: transparent;
            border: none;
            padding: 8px 12px;
            text-decoration: none;
            transition: color 0.2s;
        }
        .btn-ghost:hover { color: #3182f6 !important; }
        
        .btn-primary-fill {
            background-color: #3182f6 !important; 
            color: #ffffff !important;           
            font-weight: 600;
            font-size: 15px;
            padding: 10px 24px;
            border-radius: 8px;
            border: none;
            text-decoration: none;
            box-shadow: 0 2px 5px rgba(49, 130, 246, 0.3);
            display: inline-block;
            transition: background-color 0.2s;
        }
        .btn-primary-fill:hover { background-color: #1b64da !important; }

        /* 메인 컨테이너 */
        .main-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            margin-top: -60px;
        }

        .main-title {
            font-size: 42px;
            font-weight: 800;
            margin-bottom: 12px;
            color: #191f28;
            line-height: 1.4;
        }

        .main-subtitle {
            font-size: 17px;
            color: #8b95a1;
            margin-bottom: 40px;
        }

        /* 검색창 */
        .search-box-wrapper {
            position: relative;
            width: 100%;
            max-width: 580px;
            margin-bottom: 30px;
        }
        .search-input {
            width: 100%;
            height: 64px;
            padding: 0 70px 0 32px; 
            border-radius: 32px;
            border: 2px solid transparent;
            background: white;
            font-size: 17px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            transition: all 0.3s;
        }
        .search-input:focus {
            outline: none;
            border-color: #3182f6;
            box-shadow: 0 10px 30px rgba(49, 130, 246, 0.15);
        }
        .search-btn {
            position: absolute;
            right: 25px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            font-size: 22px;
            color: #3182f6;
            cursor: pointer;
        }

        /* 바로가기 링크 */
        .quick-link {
            font-size: 14px;
            color: #8b95a1;
            text-decoration: none;
            border-bottom: 1px solid transparent;
            transition: all 0.2s;
        }
        .quick-link:hover {
            color: #3182f6;
            border-bottom-color: #3182f6;
        }

        footer {
            text-align: center;
            font-size: 12px;
            color: #ddd;
            padding: 20px;
        }
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
                    <%-- 1. 로그인이 안 된 상태 --%>
                    <c:when test="${empty loginUser}">
                        <a href="/member/login" class="btn-ghost">로그인</a>
                        <a href="/member/signup" class="btn-primary-fill">회원가입</a>
                    </c:when>

                    <%-- 2. 로그인 된 상태 --%>
                    <c:otherwise>
                        <span class="user-welcome">
                            <!-- [수정됨] .name -> .userName -->
                            <span>${loginUser.userName}</span>님, 환영합니다!
                        </span>
                        <a href="/member/logout" class="btn-ghost">로그아웃</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>

    <div class="main-container">
        
        <h1 class="main-title">
            모든 야구 기록을<br>한 곳에서 검색하세요
        </h1>
        
        <p class="main-subtitle">
            <c:choose>
                <c:when test="${not empty loginUser}">
                    <!-- [수정됨] .name -> .userName -->
                    ${loginUser.userName}님, 오늘은 어떤 기록이 궁금하신가요?
                </c:when>
                <c:otherwise>
                    KBO 선수, 구단, 경기 데이터를 쉽고 빠르게 찾아보세요.
                </c:otherwise>
            </c:choose>
        </p>

        <form action="/search" method="get" class="search-box-wrapper">
            <input type="text" name="query" class="search-input" placeholder="선수명, 구단명 입력 (예: 류현진)">
            <button type="submit" class="search-btn">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </form>

        <div>
            <a href="/board/list" class="quick-link">
                <i class="fa-solid fa-list-ul"></i> 자유게시판 바로가기
            </a>
        </div>
    </div>

    <footer>
        Server Time: ${serverTime}
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
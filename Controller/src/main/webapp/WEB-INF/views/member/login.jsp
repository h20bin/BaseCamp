<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basecamp - 로그인</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />

    <style>
        :root {
            --primary-color: #3182f6; /* 토스 블루 */
            --bg-color: #f9fafb;
            --text-main: #191f28;
            --text-sub: #8b95a1;
            --border-color: #e5e8eb;
        }

        body {
            font-family: 'Pretendard', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-main);
            height: 100vh;
            display: flex;
            align-items: center;     /* 수직 중앙 정렬 */
            justify-content: center; /* 수평 중앙 정렬 */
            margin: 0;
        }

        /* 로그인 카드 컨테이너 */
        .login-container {
            width: 100%;
            max-width: 420px;
            padding: 20px;
        }

        /* 로고 영역 */
        .brand-logo {
            text-align: center;
            margin-bottom: 40px;
        }
        .brand-logo a {
            font-weight: 900;
            font-size: 32px;
            color: var(--primary-color);
            text-decoration: none;
            letter-spacing: -1px;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        /* 폼 박스 스타일 */
        .login-box {
            background: white;
            padding: 40px 30px;
            border-radius: 24px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.06); /* 부드러운 그림자 */
            border: 1px solid white;
        }

        .login-title {
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
            color: var(--text-main);
        }

        /* 입력창 디자인 */
        .input-group-custom {
            position: relative;
            margin-bottom: 16px;
        }
        .input-group-custom input {
            width: 100%;
            height: 52px;
            padding: 0 15px 0 45px; /* 아이콘 공간 */
            border: 1px solid #ddd;
            border-radius: 12px;
            font-size: 15px;
            background-color: #fff;
            transition: all 0.2s;
            outline: none;
        }
        .input-group-custom input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(49, 130, 246, 0.1);
        }
        .input-group-custom i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #adb5bd;
            font-size: 18px;
            transition: color 0.2s;
        }
        /* 입력창 포커스시 아이콘 색상 변경 */
        .input-group-custom input:focus + i { 
            color: var(--primary-color); 
        }
        /* fontawesome 아이콘 위치 조정 핵 */
        .input-group-custom i { pointer-events: none; }


        /* 로그인 버튼 */
        .btn-login {
            width: 100%;
            height: 52px;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 700;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        .btn-login:hover {
            background-color: #1b64da;
        }

        /* 하단 링크 */
        .auth-links {
            margin-top: 25px;
            text-align: center;
            font-size: 14px;
            color: var(--text-sub);
        }
        .auth-links a {
            color: var(--text-sub);
            text-decoration: none;
            margin: 0 8px;
            transition: color 0.2s;
        }
        .auth-links a:hover {
            color: var(--text-main);
            text-decoration: underline;
        }
        .divider {
            color: #e5e8eb;
        }

    </style>
</head>
<body>

    <c:if test="${not empty msg}">
        <script>
            alert("${msg}");
        </script>
    </c:if>

    <div class="login-container">
        
        <div class="brand-logo">
            <a href="/">
                <i class="fa-solid fa-baseball-bat-ball"></i> Basecamp
            </a>
        </div>

        <div class="login-box">
            <h2 class="login-title">로그인</h2>

            <form action="/member/login" method="post">
                
                <div class="input-group-custom">
                    <input type="text" name="userId" placeholder="아이디" required autofocus>
                    <i class="fa-regular fa-user"></i>
                </div>

                <div class="input-group-custom">
                    <input type="password" name="userPw" placeholder="비밀번호" required>
                    <i class="fa-solid fa-lock"></i>
                </div>

                <button type="submit" class="btn-login">
                    로그인
                </button>
            </form>

            <div class="auth-links">
                <a href="/member/signup">회원가입</a>
                <span class="divider">|</span>
                <a href="/">홈으로</a>
            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
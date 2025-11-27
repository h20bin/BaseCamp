<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        :root {
            --primary-color: #3182f6;
            --bg-color: #f9fafb;
            --text-main: #191f28;
            --text-sub: #8b95a1;
            --border-color: #e5e8eb;
        }

        body {
            font-family: 'Pretendard', sans-serif;
            background-color: var(--bg-color);
            color: var(--text-main);
        }

        /* 내비게이션 바 */
        .navbar {
            padding: 15px 40px;
            background-color: white;
            border-bottom: 1px solid var(--border-color);
        }
        .navbar-brand {
            font-weight: 900;
            font-size: 24px;
            color: var(--primary-color) !important;
            letter-spacing: -0.5px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        /* 메인 컨테이너 */
        .container-main {
            max-width: 600px;
            margin: 50px auto;
            padding: 0 20px;
        }

        /* 폼 카드 스타일 */
        .form-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
            padding: 40px;
            border: 1px solid var(--border-color);
        }

        .page-title {
            font-size: 24px;
            font-weight: 800;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid var(--text-main);
            text-align: center;
        }

        /* 입력 필드 커스텀 */
        .form-label {
            font-weight: 600;
            font-size: 15px;
            color: var(--text-main);
            margin-bottom: 8px;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            border: 1px solid #ddd;
            font-size: 15px;
            transition: all 0.2s;
        }
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(49, 130, 246, 0.1);
        }

        .helper-text {
            font-size: 12px;
            color: var(--text-sub);
            margin-top: 5px;
        }

        /* 버튼 영역 */
        .btn-area {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
        }
        
        .btn-custom {
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 15px;
            border: none;
            text-decoration: none;
            transition: 0.2s;
            cursor: pointer;
        }

        /* 등록 버튼 */
        .btn-submit {
            background-color: var(--primary-color);
            color: white;
            width: 100%;
        }
        .btn-submit:hover { background-color: #1b64da; color: white; }

        /* 취소 버튼 */
        .btn-cancel {
            background-color: #f2f4f6;
            color: var(--text-main);
            width: 100%;
            text-align: center;
            display: inline-block;
        }
        .btn-cancel:hover { background-color: #e5e8eb; color: black; }
        
        /* 알림 메시지 영역 */
        .alert-msg {
            color: #e03131;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

    </style>
</head>
<body>

    <nav class="navbar navbar-expand">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                <i class="fa-solid fa-baseball-bat-ball"></i> Basecamp
            </a>
            <div class="ms-auto">
                <a href="/member/login" class="text-decoration-none text-muted fw-bold me-3">로그인</a>
            </div>
        </div>
    </nav>

    <div class="container-main">
        
        <div class="form-card">
            <h2 class="page-title">회원가입</h2>

            <% if(request.getAttribute("msg") != null) { %>
                <div class="alert-msg">
                    <i class="fa-solid fa-circle-exclamation"></i> ${msg}
                </div>
            <% } %>

            <form action="/member/signup" method="post">
                
                <div class="mb-4">
                    <label for="userId" class="form-label">아이디</label>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력해 주세요." required>
                </div>

                <div class="mb-4">
                    <label for="userPw" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호를 입력해 주세요." required>
                    <div class="helper-text">* 특수문자 포함 8자리 이상 입력해주세요.</div>
                </div>

                <div class="mb-4">
                    <label for="userName" class="form-label">이름</label>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="이름을 입력해 주세요." required>
                </div>

                <div class="mb-4">
                    <label for="userEmail" class="form-label">이메일</label>
                    <input type="email" class="form-control" id="userEmail" name="email" placeholder="example@email.com">
                </div>

                <div class="row g-2 mt-4">
                    <div class="col-6">
                        <a href="/" class="btn-custom btn-cancel">취소</a>
                    </div>
                    <div class="col-6">
                        <button type="submit" class="btn-custom btn-submit">
                            가입하기
                        </button>
                    </div>
                </div>
            </form>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
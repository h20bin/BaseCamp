<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basecamp - 게시글 수정</title>
    
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
            max-width: 800px;
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
        
        /* 읽기 전용 필드 (작성자) */
        .form-control[readonly] {
            background-color: #f2f4f6;
            color: var(--text-sub);
            border-color: #eee;
            cursor: not-allowed;
        }

        /* 버튼 영역 */
        .btn-area {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
        }
        
        .btn-custom {
            padding: 10px 24px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 15px;
            border: none;
            text-decoration: none;
            transition: 0.2s;
        }

        /* 저장 버튼 */
        .btn-save {
            background-color: var(--primary-color);
            color: white;
        }
        .btn-save:hover { background-color: #1b64da; color: white; }

        /* 취소 버튼 */
        .btn-cancel {
            background-color: #f2f4f6;
            color: var(--text-main);
        }
        .btn-cancel:hover { background-color: #e5e8eb; color: black; }

    </style>
</head>
<body>

    <nav class="navbar navbar-expand">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                <i class="fa-solid fa-baseball-bat-ball"></i> Basecamp
            </a>
            <div class="ms-auto">
                <a href="#" class="text-decoration-none text-muted fw-bold me-3">로그인</a>
            </div>
        </div>
    </nav>

    <div class="container-main">
        
        <div class="form-card">
            <h2 class="page-title">게시글 수정</h2>

            <form action="/board/modify" method="post">
                <input type="hidden" name="page" value="<c:out value='${cri.page}'/>">
                <input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum}'/>">
                <input type="hidden" name="bno" value="<c:out value='${board.bno}'/>">

                <div class="mb-4">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="title" name="title" value="<c:out value='${board.title}'/>" required>
                </div>

                <div class="mb-4">
                    <label for="writer" class="form-label">작성자</label>
                    <input type="text" class="form-control" id="writer" name="writer" value="<c:out value='${board.writer}'/>" readonly>
                </div>

                <div class="mb-4">
                    <label for="content" class="form-label">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="12" required><c:out value='${board.content}'/></textarea>
                </div>

                <div class="btn-area">
                    <a href="/board/get?bno=<c:out value='${board.bno}'/>&page=<c:out value='${cri.page}'/>&perPageNum=<c:out value='${cri.perPageNum}'/>" class="btn-custom btn-cancel">
                        취소
                    </a>

                    <button type="submit" class="btn-custom btn-save">
                        <i class="fa-solid fa-check"></i> 수정 완료
                    </button>
                </div>
            </form>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
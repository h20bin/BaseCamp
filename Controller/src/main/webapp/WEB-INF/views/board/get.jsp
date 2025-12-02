<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basecamp - ${board.title}</title>
    
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
            max-width: 800px; /* 읽기 편한 너비 */
            margin: 50px auto;
            padding: 0 20px;
        }

        /* 게시글 카드 스타일 */
        .post-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
            padding: 40px;
            border: 1px solid var(--border-color);
            margin-bottom: 30px;
        }

        /* 헤더 영역 (제목, 정보) */
        .post-header {
            border-bottom: 1px solid var(--border-color);
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        .post-title {
            font-size: 28px;
            font-weight: 800;
            margin-bottom: 15px;
            line-height: 1.4;
        }
        .post-meta {
            display: flex;
            gap: 15px;
            font-size: 14px;
            color: var(--text-sub);
            align-items: center;
        }
        .meta-divider {
            width: 1px;
            height: 12px;
            background-color: #ddd;
        }

        /* 본문 영역 */
        .post-content {
            font-size: 16px;
            line-height: 1.8;
            color: #333;
            min-height: 200px;
            white-space: pre-wrap; /* 줄바꿈 유지 (Textarea 대용) */
        }

        /* 버튼 그룹 */
        .btn-group-custom {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .btn-action {
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            font-size: 15px;
            border: none;
            transition: 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        
        /* 목록 버튼 (회색) */
        .btn-list {
            background-color: #f2f4f6;
            color: var(--text-main);
        }
        .btn-list:hover { background-color: #e5e8eb; color: black; }

        /* 수정 버튼 (파란색) */
        .btn-modify {
            background-color: var(--primary-color);
            color: white;
        }
        .btn-modify:hover { background-color: #1b64da; color: white; }

        /* 삭제 버튼 (빨간색) */
        .btn-remove {
            background-color: #fff0f0;
            color: #e03131;
        }
        .btn-remove:hover { background-color: #ffe3e3; }

    </style>
</head>
<body>

    <nav class="navbar navbar-expand">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                <i class="fa-solid fa-baseball-bat-ball"></i> Basecamp
            </a>
            
            <div class="ms-auto d-flex align-items-center gap-3">
                <c:choose>
                    <%-- 로그인 했을 때 --%>
                    <c:when test="${not empty loginUser}">
                        <span class="fw-bold text-dark">
                            👋 ${loginUser.userName}님 
                        </span>
                        <a href="/member/logout" class="btn btn-sm btn-outline-secondary fw-bold">
                            로그아웃
                        </a>
                    </c:when>
                    
                    <%-- 로그인 안 했을 때 --%>
                    <c:otherwise>
                        <a href="/member/login" class="text-decoration-none text-muted fw-bold">
                            로그인
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
            </div>
    </nav>

    <div class="container-main">
        
        <div class="post-card">
            
            <div class="post-header">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <span class="badge bg-secondary bg-opacity-10 text-secondary px-2 py-1" style="font-weight: 500;">
                        No. <c:out value="${board.bno}"/>
                    </span>
                </div>
                
                <h1 class="post-title">
                    <c:out value="${board.title}"/>
                </h1>

                <div class="post-meta">
                    <span><i class="fa-regular fa-user"></i> <c:out value="${board.writer}"/></span>
                    <span class="meta-divider"></span>
                    <span><i class="fa-regular fa-calendar"></i> <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></span>
                </div>
            </div>

            <div class="post-content">
<c:out value="${board.content}"/>
            </div>

        </div>

        <div class="btn-group-custom">
            <a href="/board/list?page=<c:out value='${cri.page}'/>&perPageNum=<c:out value='${cri.perPageNum}'/>" class="btn-action btn-list">
                <i class="fa-solid fa-list"></i> 목록
            </a>

            <div class="d-flex gap-2">
                <a href="/board/modify?bno=<c:out value='${board.bno}'/>&page=<c:out value='${cri.page}'/>&perPageNum=<c:out value='${cri.perPageNum}'/>" class="btn-action btn-modify">
                    <i class="fa-solid fa-pen-to-square"></i> 수정
                </a>
                
                <button id="removeBtn" class="btn-action btn-remove">
                    <i class="fa-solid fa-trash"></i> 삭제
                </button>
            </div>
        </div>

        <form id="removeForm" action="/board/remove" method="post">
            <input type="hidden" name="bno" value="<c:out value='${board.bno}'/>">
            <input type="hidden" name="page" value="<c:out value='${cri.page}'/>">
            <input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum}'/>">
        </form>

    </div>

    <script>
        document.getElementById("removeBtn").addEventListener("click", function(){
            if(confirm("정말로 이 게시글을 삭제하시겠습니까?")){
                document.getElementById("removeForm").submit();
            }
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
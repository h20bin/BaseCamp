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
            max-width: 800px;
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

        /* 헤더 영역 */
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
            justify-content: space-between; /* 양쪽 정렬로 변경 */
            align-items: center;
            font-size: 14px;
            color: var(--text-sub);
        }
        .meta-info {
            display: flex;
            gap: 15px;
            align-items: center;
        }
        .meta-divider {
            width: 1px;
            height: 12px;
            background-color: #ddd;
        }

        /* 신고 버튼 스타일 */
        .btn-report {
            font-size: 13px;
            color: #e03131;
            background-color: #fff5f5;
            border: 1px solid #ffc9c9;
            padding: 5px 12px;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            transition: 0.2s;
        }
        .btn-report:hover {
            background-color: #ffc9c9;
            color: #c92a2a;
        }

        /* 블라인드 처리 알림창 */
        .blind-alert {
            text-align: center;
            padding: 60px 20px;
            background-color: #f8f9fa;
            border-radius: 12px;
            color: #868e96;
            border: 1px dashed #ced4da;
        }

        /* 본문 영역 */
        .post-content {
            font-size: 16px;
            line-height: 1.8;
            color: #333;
            min-height: 200px;
            white-space: pre-wrap; 
        }
        .post-image {
            max-width: 100%;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid #eee;
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
        
        .btn-list { background-color: #f2f4f6; color: var(--text-main); }
        .btn-list:hover { background-color: #e5e8eb; color: black; }

        .btn-modify { background-color: var(--primary-color); color: white; }
        .btn-modify:hover { background-color: #1b64da; color: white; }

        .btn-remove { background-color: #fff0f0; color: #e03131; }
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
                    <c:when test="${not empty loginUser}">
                        <span class="fw-bold text-dark">
                            👋 ${loginUser.userName}님 
                        </span>
                        <a href="/member/logout" class="btn btn-sm btn-outline-secondary fw-bold">
                            로그아웃
                        </a>
                    </c:when>
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
                    <div class="meta-info">
                        <span><i class="fa-regular fa-user"></i> <c:out value="${board.writer}"/></span>
                        <span class="meta-divider"></span>
                        <span><i class="fa-regular fa-calendar"></i> <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/></span>
                        <span class="meta-divider"></span>
                        <span><i class="fa-regular fa-eye"></i> <c:out value="${board.viewcnt}"/></span>
                    </div>

                    <c:if test="${not empty loginUser and loginUser.userId ne board.writer}">
                        <button id="reportBtn" class="btn-report">
                            <i class="fa-solid fa-bullhorn"></i> 신고하기
                        </button>
                    </c:if>
                </div>
            </div>

            <c:choose>
                <c:when test="${board.reportCnt >= 5 and loginUser.auth ne 'ROLE_ADMIN'}">
                    <div class="blind-alert">
                        <i class="fa-solid fa-triangle-exclamation fa-2x mb-3 text-danger"></i>
                        <h4 class="fw-bold text-dark">다수의 신고로 인해 블라인드 처리된 게시글입니다.</h4>
                        <p class="mb-0 mt-2">관리자의 검토 후 복구될 수 있습니다.</p>
                    </div>
                </c:when>
                
                <c:otherwise>
                    <div class="post-content">
                        <c:if test="${not empty board.fileName}">
                            <div class="text-center">
                                <img src="/board/display?fileName=${board.fileName}" class="post-image" alt="첨부 이미지">
                            </div>
                        </c:if>

                        <c:out value="${board.content}"/>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>

        <div class="btn-group-custom">
            <a href="/board/list?page=<c:out value='${cri.page}'/>&perPageNum=<c:out value='${cri.perPageNum}'/>" class="btn-action btn-list">
                <i class="fa-solid fa-list"></i> 목록
            </a>

            <c:if test="${loginUser.userId eq board.writer or loginUser.auth eq 'ROLE_ADMIN'}">
                <div class="d-flex gap-2">
                    <a href="/board/modify?bno=<c:out value='${board.bno}'/>&page=<c:out value='${cri.page}'/>&perPageNum=<c:out value='${cri.perPageNum}'/>" class="btn-action btn-modify">
                        <i class="fa-solid fa-pen-to-square"></i> 수정
                    </a>
                    
                    <button id="removeBtn" class="btn-action btn-remove">
                        <i class="fa-solid fa-trash"></i> 삭제
                    </button>
                </div>
            </c:if>
        </div>

        <form id="removeForm" action="/board/remove" method="post">
            <input type="hidden" name="bno" value="<c:out value='${board.bno}'/>">
            <input type="hidden" name="page" value="<c:out value='${cri.page}'/>">
            <input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum}'/>">
        </form>

        <form id="reportForm" action="/board/report" method="post">
            <input type="hidden" name="bno" value="<c:out value='${board.bno}'/>">
            <input type="hidden" name="userId" value="${loginUser.userId}">
            <input type="hidden" name="page" value="<c:out value='${cri.page}'/>">
            <input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum}'/>">
        </form>

    </div>

    <script>
        // 삭제 버튼 스크립트
        const removeBtn = document.getElementById("removeBtn");
        if(removeBtn) {
            removeBtn.addEventListener("click", function(){
                if(confirm("정말로 이 게시글을 삭제하시겠습니까?")){
                    document.getElementById("removeForm").submit();
                }
            });
        }

        // [추가됨] 신고 버튼 스크립트
        const reportBtn = document.getElementById("reportBtn");
        if(reportBtn) {
            reportBtn.addEventListener("click", function(){
                if(confirm("이 게시글을 신고하시겠습니까?\n(허위 신고 시 제재될 수 있습니다.)")){
                    document.getElementById("reportForm").submit();
                }
            });
        }
        
        // 신고 완료 메시지 처리 (Controller에서 rttr로 보낸 msg)
        const msg = "${msg}";
        if(msg && msg !== "") {
            alert(msg);
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
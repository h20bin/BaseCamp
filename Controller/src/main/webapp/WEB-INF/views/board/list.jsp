<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basecamp - 자유게시판</title>
    
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

        /* 내비게이션 바 (홈화면과 동일) */
        .navbar {
            padding: 15px 40px;
            background-color: white; /* 게시판은 본문이 길어서 흰 배경 권장 */
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
            max-width: 1000px; /* 게시판은 넓게 */
            margin: 50px auto;
            padding: 0 20px;
        }

        /* 페이지 타이틀 영역 */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .page-title {
            font-size: 24px;
            font-weight: 800;
        }

        /* 글쓰기 버튼 */
        .btn-write {
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            transition: 0.2s;
            border: none;
        }
        .btn-write:hover {
            background-color: #1b64da;
            color: white;
        }

        /* 게시판 테이블 스타일 */
        .board-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
            overflow: hidden; /* 모서리 둥글게 유지 */
            border: 1px solid var(--border-color);
        }
        
        .table {
            margin-bottom: 0;
            border-collapse: collapse;
        }
        .table thead th {
            background-color: #f9fafb;
            color: var(--text-sub);
            font-weight: 600;
            font-size: 13px;
            padding: 16px;
            border-bottom: 1px solid var(--border-color);
            border-top: none;
        }
        .table tbody td {
            padding: 16px;
            vertical-align: middle;
            font-size: 15px;
            border-bottom: 1px solid var(--border-color);
            color: var(--text-main);
        }
        
        /* 제목 링크 스타일 */
        .title-link {
            text-decoration: none;
            color: var(--text-main);
            font-weight: 600;
            transition: color 0.2s;
            display: block;
            max-width: 500px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .title-link:hover {
            color: var(--primary-color);
        }

        /* 페이지네이션 커스텀 */
        .pagination {
            justify-content: center;
            margin-top: 40px;
            gap: 5px;
        }
        .page-item .page-link {
            border: none;
            border-radius: 8px;
            color: var(--text-sub);
            font-weight: 500;
            padding: 8px 16px;
            background: transparent;
        }
        .page-item.active .page-link {
            background-color: var(--primary-color);
            color: white;
            font-weight: 700;
            box-shadow: 0 4px 10px rgba(49, 130, 246, 0.3);
        }
        .page-item .page-link:hover:not(.active) {
            background-color: #f1f3f5;
            color: var(--text-main);
        }

        /* 반응형: 모바일에서 불필요한 컬럼 숨기기 */
        @media (max-width: 768px) {
            .col-viewcnt, .col-regdate { display: none; }
            .title-link { max-width: 200px; }
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
                <a href="#" class="text-decoration-none text-muted fw-bold me-3">로그인</a>
            </div>
        </div>
    </nav>

    <div class="container-main">
        
        <div class="page-header">
            <h2 class="page-title">자유게시판</h2>
            <a href="/board/register" class="btn-write">
                <i class="fa-solid fa-pen"></i> 글쓰기
            </a>
        </div>

        <div class="board-card">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th class="text-center" width="80">번호</th>
                        <th>제목</th>
                        <th width="120">작성자</th>
                        <th class="col-regdate text-center" width="150">작성일</th>
                        <th class="col-viewcnt text-center" width="100">조회</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="board">
                        <tr>
                            <td class="text-center text-muted"><c:out value="${board.bno}"/></td>
                            <td>
                                <a class="title-link" href='/board/get?bno=<c:out value="${board.bno}"/>&page=<c:out value="${pageMaker.cri.page}"/>&perPageNum=<c:out value="${pageMaker.cri.perPageNum}"/>'>
                                    <c:out value="${board.title}"/>
                                </a>
                            </td>
                            <td><c:out value="${board.writer}"/></td>
                            <td class="col-regdate text-center text-muted" style="font-size: 13px;">
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}"/>
                            </td>
                            <td class="col-viewcnt text-center text-muted">
                                <c:out value="${board.viewcnt}"/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <nav aria-label="Page navigation">
            <ul class="pagination">
                
                <c:if test="${pageMaker.prev}">
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page=${pageMaker.startPage - 1}" aria-label="Previous">
                            <i class="fa-solid fa-chevron-left"></i>
                        </a>
                    </li>
                </c:if>

                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="page-item ${pageMaker.cri.page == num ? 'active' : ''}">
                        <a class="page-link" href="/board/list?page=${num}">${num}</a>
                    </li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page=${pageMaker.endPage + 1}" aria-label="Next">
                            <i class="fa-solid fa-chevron-right"></i>
                        </a>
                    </li>
                </c:if>

            </ul>
        </nav>

    </div>

    <script>
        var result = '${result}';
        if (result && result !== '' && !isNaN(result)) {
            // alert 대신 조금 더 부드러운 방식도 좋지만, 일단 기능 유지를 위해 alert 사용
            alert(result + "번 글이 성공적으로 등록되었습니다.");
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
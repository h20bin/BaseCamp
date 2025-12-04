<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basecamp</title>
    
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
            max-width: 1000px;
            margin: 50px auto;
            padding: 0 20px;
        }

        /* 페이지 타이틀 영역 */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            height: 50px; 
        }
        .page-title {
            font-size: 28px;
            font-weight: 800;
        }

        /* 글쓰기 버튼 */
        .btn-write-custom {
            background-color: #3182f6 !important; 
            color: white !important;              
            border: none !important;
            padding: 12px 25px !important;
            font-size: 16px !important;
            font-weight: bold !important;
            border-radius: 8px !important;
            text-decoration: none !important;
            display: inline-block !important;    
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            line-height: normal !important;
        }
        .btn-write-custom:hover {
            background-color: #1b64da !important; 
            color: white !important;
            transform: translateY(-2px);
        }
        .btn-write-custom i { margin-right: 5px; }

        /* 게시판 테이블 스타일 */
        .board-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
            overflow: hidden;
            border: 1px solid var(--border-color);
        }
        
        .table { margin-bottom: 0; border-collapse: collapse; }
        .table thead th {
            background-color: #f9fafb;
            color: var(--text-sub);
            font-weight: 600;
            font-size: 14px;
            padding: 18px 16px;
            border-bottom: 1px solid var(--border-color);
            border-top: none;
        }
        .table tbody td {
            padding: 18px 16px;
            vertical-align: middle;
            font-size: 15px;
            border-bottom: 1px solid var(--border-color);
            color: var(--text-main);
        }
        
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
        .title-link:hover { color: var(--primary-color); }

        /* 페이지네이션 스타일 */
        .pagination {
            justify-content: center;
            margin-top: 40px;
            gap: 8px;
        }
        
        .pagination .page-item .page-link {
            background-color: #ffffff !important;   
            color: #333333 !important;              
            border: 1px solid #dee2e6 !important;   
            border-radius: 8px !important;
            font-weight: 600 !important;
            padding: 8px 16px !important;
        }

        .pagination .page-item.active .page-link {
            background-color: #3182f6 !important;   
            border-color: #3182f6 !important;       
            color: #ffffff !important;              
            z-index: 3 !important;                  
            box-shadow: 0 4px 10px rgba(49, 130, 246, 0.4) !important;
        }

        .pagination .page-item .page-link:hover {
            background-color: #e9ecef !important;
            color: #3182f6 !important;
        }
        .pagination .page-item.active .page-link:hover {
            background-color: #1b64da !important;
            color: #ffffff !important;
        }

        /* 탭 메뉴 스타일 */
        .nav-tabs .nav-link {
            color: #495057;
            border: none;
            border-bottom: 2px solid transparent;
            font-weight: 500;
        }
        .nav-tabs .nav-link.active {
            color: var(--primary-color);
            border-bottom: 2px solid var(--primary-color);
            background: none;
            font-weight: 700;
        }
        .nav-tabs .nav-link:hover {
            border-color: transparent;
            color: var(--primary-color);
        }

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
            <div class="ms-auto d-flex align-items-center">
                <c:choose>
                    <c:when test="${empty loginUser}">
                        <a href="/member/login" class="text-decoration-none text-muted fw-bold me-3">로그인</a>
                        <a href="/member/signup" class="btn btn-primary btn-sm fw-bold">회원가입</a>
                    </c:when>
                    <c:otherwise>
                        <span class="me-3 fw-bold text-dark">
                            ${loginUser.userName}님
                        </span>
                        
                        <a href="/member/message" class="btn btn-outline-primary btn-sm me-2 fw-bold">
                            <i class="fa-regular fa-envelope"></i> 쪽지함
                        </a>

                        <a href="/member/logout" class="btn btn-outline-secondary btn-sm">로그아웃</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>

    <div class="container-main">
        
        <ul class="nav nav-tabs mb-4">
            <li class="nav-item">
                <a class="nav-link ${category == 'FREE' || category == null ? 'active' : ''}" href="/board/list?category=FREE">자유게시판</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${category == 'QNA' ? 'active' : ''}" href="/board/list?category=QNA">Q&A 게시판</a>
            </li>
        </ul>

        <div class="page-header">
            <h2 class="page-title">
                <c:choose>
                    <c:when test="${category == 'QNA'}">Q&A 게시판</c:when>
                    <c:otherwise>자유게시판</c:otherwise>
                </c:choose>
            </h2>
            
            <c:if test="${not empty loginUser}">
                <a href="/board/register" class="btn-write-custom">
                    <i class="fa-solid fa-pen"></i> 글쓰기
                </a>
            </c:if>
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
                        <tr class="${board.isNotice == 'Y' ? 'table-secondary' : ''}">
                            
                            <td class="text-center text-muted">
                                <c:choose>
                                    <c:when test="${board.isNotice == 'Y'}">
                                        <span class="badge bg-danger">공지</span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${board.bno}"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            
                            <td>
                                <a class="title-link" href='/board/get?bno=<c:out value="${board.bno}"/>&page=<c:out value="${pageMaker.cri.page}"/>&perPageNum=<c:out value="${pageMaker.cri.perPageNum}"/>&category=<c:out value="${category}"/>'>
                                    
                                    <c:if test="${board.isNotice == 'Y'}">
                                        <span class="text-danger fw-bold me-1">[필독]</span>
                                    </c:if>
                                    
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
                        <a class="page-link" href="/board/list?page=${pageMaker.startPage - 1}&category=${category}" aria-label="Previous">
                            <i class="fa-solid fa-chevron-left"></i>
                        </a>
                    </li>
                </c:if>

                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="page-item ${pageMaker.cri.page == num ? 'active' : ''}">
                        <a class="page-link" href="/board/list?page=${num}&category=${category}">${num}</a>
                    </li>
                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="page-item">
                        <a class="page-link" href="/board/list?page=${pageMaker.endPage + 1}&category=${category}" aria-label="Next">
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
            alert(result + "번 글이 성공적으로 등록되었습니다.");
        }
        
        var msg = '${msg}';
        if(msg && msg !== '') {
            alert(msg);
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
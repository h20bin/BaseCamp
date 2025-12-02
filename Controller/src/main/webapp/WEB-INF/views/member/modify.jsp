<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basecamp - 회원정보 수정</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />

    <style>
        body { background-color: #f9fafb; font-family: 'Pretendard', sans-serif; display: flex; align-items: center; justify-content: center; min-height: 100vh; }
        .edit-card { background: white; padding: 40px; border-radius: 20px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); width: 100%; max-width: 500px; }
        .form-label { font-weight: 600; font-size: 14px; margin-bottom: 8px; color: #333; }
        .form-control, .form-select { border-radius: 12px; padding: 12px; font-size: 15px; border: 1px solid #e1e4e8; }
        .btn-primary { background-color: #3182f6; border: none; padding: 12px; border-radius: 12px; font-weight: 700; width: 100%; }
        .btn-secondary { background-color: #f2f4f6; border: none; color: #333; padding: 12px; border-radius: 12px; font-weight: 700; width: 100%; }
    </style>
</head>
<body>

    <div class="edit-card">
        <h3 class="text-center fw-bold mb-4">내 정보 수정</h3>

        <%-- 비밀번호 불일치 등의 메시지가 있으면 표시 --%>
        <c:if test="${not empty msg}">
            <div class="alert alert-danger text-center small p-2 mb-3">${msg}</div>
        </c:if>

        <form action="/member/modify" method="post">
            <div class="mb-3">
                <label class="form-label">아이디</label>
                <input type="text" name="userId" class="form-control" value="${loginUser.userId}" readonly style="background-color: #f8f9fa;">
            </div>

            <div class="mb-3">
                <label class="form-label">비밀번호</label>
                <input type="password" name="userPw" class="form-control" value="${loginUser.userPw}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">이름</label>
                <input type="text" name="userName" class="form-control" value="${loginUser.userName}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">닉네임</label>
                <input type="text" name="nickName" class="form-control" value="${loginUser.nickName}">
            </div>
            
            <div class="mb-3">
                <label class="form-label">이메일</label>
                <input type="email" name="email" class="form-control" value="${loginUser.email}">
            </div>
            
            <div class="mb-3">
                <label class="form-label">전화번호</label>
                <input type="text" name="phone" class="form-control" value="${loginUser.phone}">
            </div>

            <div class="mb-4">
                <label class="form-label">관심 구단</label>
                <select name="favTeamId" class="form-select">
                    <option value="">선택 안함</option>
                    <c:forEach var="team" items="${teamList}">
                        <option value="${team.teamId}" ${loginUser.favTeamId == team.teamId ? 'selected' : ''}>
                            ${team.teamName}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="d-flex gap-2">
                <a href="/" class="btn btn-secondary">취소</a>
                <button type="submit" class="btn btn-primary">수정 완료</button>
            </div>
        </form>

        <hr class="my-4">
        
        <div class="text-center">
            <button class="btn btn-link text-danger text-decoration-none btn-sm fw-bold" onclick="showDeleteModal()">
                회원 탈퇴하기
            </button>
        </div>
    </div>

    <div class="modal fade" id="deleteModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold text-danger">정말 탈퇴하시겠습니까?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p class="text-muted small">탈퇴 시 모든 정보가 삭제되며 복구할 수 없습니다.<br>본인 확인을 위해 비밀번호를 입력해주세요.</p>
                    <form id="deleteForm" action="/member/remove" method="post">
                        <input type="password" name="userPw" class="form-control" placeholder="비밀번호 입력" required>
                    </form>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-light fw-bold" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-danger fw-bold" onclick="document.getElementById('deleteForm').submit()">탈퇴 확인</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function showDeleteModal() {
            var myModal = new bootstrap.Modal(document.getElementById('deleteModal'));
            myModal.show();
        }
    </script>
</body>
</html>
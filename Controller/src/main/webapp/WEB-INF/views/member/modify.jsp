<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basecamp - 마이페이지</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/static/pretendard.min.css" />

    <style>
        body { background-color: #f9fafb; font-family: 'Pretendard', sans-serif; display: flex; align-items: center; justify-content: center; min-height: 100vh; padding: 20px 0; }
        .edit-card { background: white; padding: 40px; border-radius: 20px; box-shadow: 0 4px 20px rgba(0,0,0,0.05); width: 100%; max-width: 550px; }
        .form-label { font-weight: 600; font-size: 14px; margin-bottom: 8px; color: #333; }
        .form-control, .form-select { border-radius: 12px; padding: 12px; font-size: 15px; border: 1px solid #e1e4e8; }
        .btn-primary { background-color: #3182f6; border: none; padding: 12px; border-radius: 12px; font-weight: 700; width: 100%; }
        .btn-secondary { background-color: #f2f4f6; border: none; color: #333; padding: 12px; border-radius: 12px; font-weight: 700; width: 100%; }
        
        /* 알림 설정 스타일 추가 */
        .settings-group { background-color: #f8f9fa; border-radius: 12px; padding: 20px; border: 1px solid #e1e4e8; }
        .form-check-input { cursor: pointer; width: 3em; height: 1.5em; }
        .setting-item { display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; }
        .setting-item:last-child { margin-bottom: 0; }
        .setting-title { font-size: 15px; font-weight: 600; color: #333; }
        .setting-desc { font-size: 12px; color: #888; margin-top: 2px; }
    </style>
</head>
<body>

    <c:if test="${not empty msg}">
        <script>alert("${msg}");</script>
    </c:if>

    <div class="edit-card">
        <h3 class="text-center fw-bold mb-4">마이페이지</h3>

        <form action="/member/modify" method="post">
            <h6 class="fw-bold mb-3 text-secondary" style="font-size: 13px;">기본 정보</h6>
            
            <div class="mb-3">
                <label class="form-label">아이디</label>
                <input type="text" name="userId" class="form-control" value="${loginUser.userId}" readonly style="background-color: #f8f9fa;">
            </div>

            <div class="mb-3">
                <label class="form-label">비밀번호 변경</label>
                <input type="password" name="userPw" class="form-control" value="${loginUser.userPw}" placeholder="변경할 비밀번호를 입력하세요" required>
            </div>

            <div class="row mb-3">
                <div class="col-6">
                    <label class="form-label">이름</label>
                    <input type="text" name="userName" class="form-control" value="${loginUser.userName}" required>
                </div>
                <div class="col-6">
                    <label class="form-label">닉네임</label>
                    <input type="text" name="nickName" class="form-control" value="${loginUser.nickName}">
                </div>
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
                    <option value="T9999">선택 안함</option>
                    <c:forEach var="team" items="${teamList}">
                        <option value="${team.teamId}" ${loginUser.favTeamId == team.teamId ? 'selected' : ''}>
                            ${team.teamName}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <hr class="my-4" style="border-top: 1px dashed #ddd;">

            <div class="mb-4">
                <h6 class="fw-bold mb-3 text-secondary" style="font-size: 13px;">알림 설정</h6>
                <div class="settings-group">
                    
                    <div class="setting-item">
                        <div>
                            <div class="setting-title">경기 알림</div>
                            <div class="setting-desc">관심 구단의 경기 시작 및 결과를 알려드립니다.</div>
                        </div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" role="switch" name="alertGame" id="alertGame" checked>
                        </div>
                    </div>

                    <hr class="my-3" style="border-color: #eee;">

                    <div class="setting-item">
                        <div>
                            <div class="setting-title">커뮤니티 알림</div>
                            <div class="setting-desc">내 글에 달린 댓글이나 좋아요 알림을 받습니다.</div>
                        </div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" role="switch" name="alertCommunity" id="alertCommunity" checked>
                        </div>
                    </div>

                    <hr class="my-3" style="border-color: #eee;">

                    <div class="setting-item">
                        <div>
                            <div class="setting-title">마케팅 알림</div>
                            <div class="setting-desc">이벤트 및 혜택 정보를 받습니다.</div>
                        </div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" role="switch" name="alertMarketing" id="alertMarketing">
                        </div>
                    </div>

                </div>
            </div>

            <div class="d-flex gap-2 mt-4">
                <a href="/" class="btn btn-secondary">취소</a>
                <button type="submit" class="btn btn-primary">저장 하기</button>
            </div>
        </form>

        <hr class="my-4">
        
        <div class="text-center">
            <button class="btn btn-link text-secondary text-decoration-none btn-sm" style="font-size: 13px;" onclick="showDeleteModal()">
                더 이상 서비스를 이용하지 않으시나요? <span class="text-danger fw-bold ms-1">회원 탈퇴</span>
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
                    <p class="text-danger fw-bold small text-center mb-3">탈퇴 시 3개월간 재가입이 제한됩니다.</p>
                    
                    <form id="deleteForm" action="/member/remove" method="post">
                        
                        <div class="mb-3">
                            <label class="form-label">탈퇴 사유</label>
                            <select name="withdrawalReason" class="form-select" required>
                                <option value="" disabled selected>사유를 선택해주세요</option>
                                <option value="이용빈도 낮음">잘 사용하지 않아요</option>
                                <option value="서비스 불만">서비스 이용이 불편해요</option>
                                <option value="개인정보 보호">개인정보 보호를 위해</option>
                                <option value="기타">기타</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">비밀번호 확인</label>
                            <input type="password" name="userPw" class="form-control" placeholder="본인 확인을 위해 비밀번호 입력" required>
                        </div>

                    </form>
                </div>
                
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-light fw-bold" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-danger fw-bold" onclick="submitDeleteForm()">탈퇴 확인</button>
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

        // 폼 유효성 검사 후 제출
        function submitDeleteForm() {
            var form = document.getElementById('deleteForm');
            if(form.checkValidity()) {
                if(confirm('정말로 탈퇴하시겠습니까? 돌이킬 수 없습니다.')) {
                    form.submit();
                }
            } else {
                form.reportValidity();
            }
        }
        
        // (선택사항) 알림 버튼 클릭 시 UI 효과를 위한 스크립트
        // 실제 DB 저장은 form submit시 name값(alertGame 등)이 'on'으로 넘어가거나 null로 넘어가는 것으로 처리됨
        document.querySelectorAll('.form-check-input').forEach(toggle => {
            toggle.addEventListener('change', function() {
                console.log(this.id + ' changed to ' + this.checked);
            });
        });
    </script>
</body>
</html>
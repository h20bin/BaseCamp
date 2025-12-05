package org.mnu.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.mnu.domain.MemberVO;
import org.mnu.domain.MessageVO;

public interface MemberMapper {
    
    // 1. 회원 등록
    public void insertMember(MemberVO member);

    // 2. 회원 정보 읽기
    public MemberVO read(String userId);

    // 3. 로그인
    public MemberVO login(MemberVO member); 
    
    // 4. 회원 정보 수정
    public int updateMember(MemberVO member);

    // 5. 회원 탈퇴
    public int deleteMember(MemberVO member);

    // 6. 탈퇴 기록 저장
    public void insertWithdrawal(@Param("userId") String userId, @Param("reason") String reason);

    // 7. 재가입 제한 확인
    public int checkRejoinRestriction(String userId);

    // ★ 관리자 경고 시스템 메서드 ★
    
    // 8. 경고 횟수 증가
    public void increaseWarningCnt(String userId);

    // 9. 현재 경고 횟수 조회 (★수정됨: int -> Integer)
    // DB에서 null이 넘어올 경우를 대비해 Integer로 변경
    public Integer getWarningCnt(String userId);

    // 10. 활동 정지 처분
    public void suspendMember(@Param("userId") String userId, @Param("days") int days);

    // 11. 영구 정지 (비활성화)
    public void disableMember(String userId);

    // 12. 쪽지 발송
    public void sendMessage(@Param("targetId") String targetId, @Param("senderId") String senderId, @Param("content") String content);

    // 13. 내 쪽지 목록 가져오기
    public List<MessageVO> getMyMessages(String userId);
}
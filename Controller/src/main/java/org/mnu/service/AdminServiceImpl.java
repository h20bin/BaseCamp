package org.mnu.service;

import org.mnu.mapper.BoardMapper;
import org.mnu.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AdminServiceImpl {

    @Autowired
    private MemberMapper memberMapper;
    
    @Autowired
    private BoardMapper boardMapper; // 게시글 삭제용

    @Transactional
    public String giveWarning(String userId, Long bno) {
        
        // ★ [핵심 수정] 작성자 ID가 없는 경우(옛날 글) 에러 방지
        // ID가 없으면 경고나 쪽지를 보낼 수 없으므로, 게시글만 삭제하고 종료합니다.
        if (userId == null || userId.trim().isEmpty()) {
            boardMapper.delete(bno);
            return "작성자 정보(ID)가 없는 게시글입니다. 경고 없이 삭제만 처리되었습니다.";
        }

        // 1. 유저 경고 횟수 증가
        memberMapper.increaseWarningCnt(userId);
        
        // 2. 현재 경고 횟수 가져오기 (Null 처리)
        Integer resultArgs = memberMapper.getWarningCnt(userId);
        
        // DB에서 null이 오면 0으로 처리, 아니면 해당 값 사용
        int cnt = (resultArgs == null) ? 0 : resultArgs; 
        
        String msg = "";

        // 3. 경고 횟수에 따른 처분 로직
        if (cnt == 1) {
            // [경고 1회] 쪽지 발송 + 게시글 삭제
            memberMapper.sendMessage(userId, "admin", "관리자 경고: 귀하의 게시글이 운영원칙 위반으로 삭제되었습니다. (경고 1회)");
            boardMapper.delete(bno); // 게시글 삭제
            msg = "경고 1회 처리: 쪽지 발송 및 게시글 삭제 완료.";
            
        } else if (cnt == 3) {
            // [경고 3회] 3일간 활동 정지 + 게시글 삭제
            memberMapper.suspendMember(userId, 3); // 3일 정지
            memberMapper.sendMessage(userId, "admin", "관리자 경고: 누적 경고 3회로 3일간 활동이 정지됩니다.");
            boardMapper.delete(bno);
            msg = "경고 3회 처리: 3일 활동 정지 처분 완료.";
            
        } else if (cnt >= 5) {
            // [경고 5회] 영구 정지 + 게시글 삭제
            memberMapper.disableMember(userId); // 계정 비활성화 (로그인 불가)
            memberMapper.sendMessage(userId, "admin", "관리자 경고: 누적 경고 5회로 계정이 영구 정지되었습니다.");
            boardMapper.delete(bno);
            msg = "경고 5회 처리: 계정 영구 정지 완료.";
            
        } else {
            // 그 외 (2회, 4회 등) - 그냥 경고 카운트만 증가 + 게시글 삭제
            memberMapper.sendMessage(userId, "admin", "관리자 경고: 운영원칙 위반입니다. 주의해주세요. (현재 경고 " + cnt + "회)");
            boardMapper.delete(bno);
            msg = "경고 " + cnt + "회 처리 완료.";
        }
        
        return msg;
    }
}
package org.mnu.service;

import java.util.List;

import org.mnu.domain.MemberVO;
import org.mnu.mapper.MemberMapper;
import org.mnu.mapper.UserInterestMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // 트랜잭션 처리를 위해 필요
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
    
    private MemberMapper memberMapper;
    private UserInterestMapper userInterestMapper; // 🚨 UserInterestMapper 주입 필수

    // MemberController에서 호출하는 register 메서드 구현
    @Transactional // 🚨 트랜잭션 처리가 필수. 둘 중 하나라도 실패하면 모두 롤백됩니다.
    @Override
    public void register(MemberVO member, List<String> favPlayerIds) {
        
        // 1. USER_INFO 테이블에 회원 정보 삽입
        memberMapper.insertMember(member);
        
        // 2. USER_INTERESTS 테이블에 관심 선수 정보 삽입
        if (favPlayerIds != null && !favPlayerIds.isEmpty()) {
            String userId = member.getUserId(); // 삽입된 회원의 ID를 가져옴
            
            for (String playerId : favPlayerIds) {
                // 빈 값("")이나 null이 아닌 경우에만 삽입 (JSP에서 선택 안 함)
                if (playerId != null && !playerId.isEmpty()) { 
                    userInterestMapper.insertInterest(userId, playerId);
                }
            }
        }
    }

    // 로그인 메서드 (기존 로직)
    @Override
    public MemberVO login(MemberVO member) {
        return memberMapper.login(member);
    }
}
package org.mnu.service;

import java.util.List;

import org.mnu.domain.MemberVO;
import org.mnu.domain.MessageVO; // ★ 추가됨
import org.mnu.mapper.MemberMapper;
import org.mnu.mapper.UserInterestMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
    
    private MemberMapper memberMapper;
    private UserInterestMapper userInterestMapper; 

    // 1. 회원가입 구현
    @Transactional
    @Override
    public void register(MemberVO member, List<String> favPlayerIds) {
        
        // USER_INFO 테이블에 회원 정보 삽입
        memberMapper.insertMember(member);
        
        // USER_INTERESTS 테이블에 관심 선수 정보 삽입
        if (favPlayerIds != null && !favPlayerIds.isEmpty()) {
            String userId = member.getUserId();
            
            for (String playerId : favPlayerIds) {
                if (playerId != null && !playerId.isEmpty()) { 
                    userInterestMapper.insertInterest(userId, playerId);
                }
            }
        }
    }

    // 2. 로그인 구현
    @Override
    public MemberVO login(MemberVO member) {
        return memberMapper.login(member);
    }

    // 3. 회원정보 수정 구현
    @Override
    public void modify(MemberVO member) {
        log.info("회원정보 수정 서비스 호출: " + member.getUserId());
        memberMapper.updateMember(member);
    }

    // 4. 회원탈퇴 구현
    @Override
    public void remove(MemberVO member) {
        log.info("회원탈퇴 서비스 호출: " + member.getUserId());
        // Mapper에 있는 탈퇴 메서드 호출 (기존 코드에 updateMember라고 되어 있었으나 탈퇴라면 deleteMember가 맞을 수 있음. 일단 기존 유지)
        memberMapper.deleteMember(member); 
    }

    @Override
    public void remove(String userId) {
        // 미사용
    }

    // ★ [추가됨] 내 쪽지함 목록 가져오기 구현
    @Override
    public List<MessageVO> getMyMessages(String userId) {
        log.info("쪽지 목록 조회 서비스 호출: " + userId);
        return memberMapper.getMyMessages(userId);
    }
}
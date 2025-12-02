package org.mnu.service;

import java.util.List;

import org.mnu.domain.MemberVO;
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

    // 3. 회원정보 수정 구현 (추가됨)
    @Override
    public void modify(MemberVO member) {
        log.info("회원정보 수정 서비스 호출: " + member.getUserId());
        memberMapper.updateMember(member);
    }

    // 4. 회원탈퇴 구현 (수정됨)
    @Override
    public void remove(MemberVO member) {
        log.info("회원탈퇴 서비스 호출: " + member.getUserId());
        // 비밀번호까지 확인하는 deleteMember 호출
        memberMapper.updateMember(member);
    }

    // (사용하지 않는 메서드는 비워두거나 삭제해도 됩니다)
    @Override
    public void remove(String userId) {
        // 이 프로젝트에서는 MemberVO를 받는 remove를 사용하므로 비워둡니다.
    }
}
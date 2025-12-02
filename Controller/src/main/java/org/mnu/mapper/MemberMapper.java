package org.mnu.mapper;

import org.mnu.domain.MemberVO;

public interface MemberMapper {
    
    // 1. 회원 등록
    public void insertMember(MemberVO member);

    // 2. 회원 정보 읽기
    public MemberVO read(String userId);

    // 3. 로그인
    public MemberVO login(MemberVO member); 
    
    // 4. 회원 정보 수정 (추가됨)
    public int updateMember(MemberVO member);

    // 5. 회원 탈퇴 (추가됨)
    public int deleteMember(MemberVO member);
}
package org.mnu.mapper;

import org.mnu.domain.MemberVO;

public interface MemberMapper {
    // 회원 등록
    public void insertMember(MemberVO member);

    // 중복 아이디 체크 또는 회원 정보 읽기
    public MemberVO read(String userId); 
}
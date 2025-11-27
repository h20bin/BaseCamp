package org.mnu.service;

import org.mnu.domain.MemberVO;

public interface MemberService {
    
    // 회원가입
    public void register(MemberVO member);

    // 로그인
    public MemberVO login(MemberVO member);
}
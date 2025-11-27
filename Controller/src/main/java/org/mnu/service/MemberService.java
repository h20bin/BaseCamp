package org.mnu.service;

import org.mnu.domain.MemberVO;

public interface MemberService {
    // 회원가입
    public void register(MemberVO member);
}
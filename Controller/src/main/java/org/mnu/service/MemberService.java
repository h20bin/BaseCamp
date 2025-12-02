package org.mnu.service;

import java.util.List; // List import 추가
import org.mnu.domain.MemberVO;

public interface MemberService {
    
    // 회원가입: 관심 선수 목록을 추가로 받도록 시그니처 변경
    public void register(MemberVO member, List<String> favPlayerIds);

    // 로그인
    public MemberVO login(MemberVO member);

	public void remove(String userId);
	public void remove(MemberVO member);

	void modify(MemberVO member);
}
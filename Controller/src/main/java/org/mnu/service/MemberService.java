package org.mnu.service;

import java.util.List;
import org.mnu.domain.MemberVO;
import org.mnu.domain.MessageVO; // ★ 추가됨

public interface MemberService {
    
    // 회원가입
    public void register(MemberVO member, List<String> favPlayerIds);

    // 로그인
    public MemberVO login(MemberVO member);

    public void remove(String userId);
    public void remove(MemberVO member);

    public void modify(MemberVO member);

    // ★ [추가됨] 내 쪽지함 목록 가져오기
    public List<MessageVO> getMyMessages(String userId);
}
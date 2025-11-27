package org.mnu.service;

import org.mnu.domain.MemberVO;
import org.mnu.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberMapper mapper;

    @Override
    public void register(MemberVO member) {
        log.info("Member Register......" + member);
        // 실제 비밀번호는 암호화(BCrypt)해야 하지만, 여기서는 단순 삽입
        mapper.insertMember(member);
    }
}
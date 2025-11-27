package org.mnu.service;

import org.mnu.domain.MemberVO;
import org.mnu.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class MemberServiceImpl implements MemberService {

    @Setter(onMethod_ = @Autowired)
    private MemberMapper mapper;

    @Override
    public void register(MemberVO member) {
        log.info("회원가입 서비스 실행: " + member);
        mapper.insertMember(member);
    }

    @Override
    public MemberVO login(MemberVO member) {
        log.info("로그인 서비스 실행: " + member);
        // DB에서 일치하는 회원 정보를 가져와서 리턴
        return mapper.login(member); 
    }
}
package org.mnu.controller;

import org.mnu.domain.MemberVO;
import org.mnu.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/member/*") // URL 경로를 /member/로 설정
@AllArgsConstructor
public class MemberController {

    private MemberService memberService; // 의존성 주입

    // GET /member/signup : 회원가입 폼 보여주기
    @GetMapping("/signup")
    public void signupGet() {
        log.info("signup page request...");
        // 뷰 리졸버에 의해 /WEB-INF/views/member/signup.jsp로 연결
    }

    // POST /member/signup : 회원가입 처리
    @PostMapping("/signup")
    public String signupPost(MemberVO member, RedirectAttributes rttr) {
        log.info("register member: " + member);

        // 서비스 계층을 통해 회원 등록
        memberService.register(member);

        rttr.addFlashAttribute("signupResult", "success");
        // 성공 후 홈 페이지나 로그인 페이지로 리다이렉트
        return "redirect:/"; 
    }
    
    // 이 외에 로그인 (/member/login) 등 다른 매핑도 필요합니다.
}
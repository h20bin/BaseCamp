package org.mnu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mnu.domain.MemberVO;
import org.mnu.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
public class MemberController {

    private MemberService service;

    // 1. 회원가입 페이지 이동
    // [수정] 주소를 /member/signup으로 변경
    @GetMapping("/member/signup")
    public String signup() {
        // [중요] 주소는 signup이지만, 실제 파일은 register.jsp를 보여줍니다.
        return "member/register"; 
    }

    // 2. 회원가입 처리
    // [수정] form 태그의 action도 /member/signup으로 요청될 것이므로 매핑 변경
    @PostMapping("/member/signup")
    public String signup(MemberVO member, RedirectAttributes rttr) {
        log.info("회원가입 요청: " + member);

        // 비밀번호 유효성 검사
        if (!member.getUserPw().matches("^(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?]).{8,}$")) {
            rttr.addFlashAttribute("msg", "비밀번호는 8자리 이상, 특수문자를 포함해야 합니다.");
            // [수정] 실패 시 다시 signup 페이지로 리다이렉트
            return "redirect:/member/signup"; 
        }

        service.register(member);
        rttr.addFlashAttribute("msg", "회원가입이 완료되었습니다. 로그인해주세요.");
        return "redirect:/member/login"; 
    }

    // 3. 로그인 페이지 이동
    @GetMapping("/member/login")
    public void loginInput(String error, String logout) {
        log.info("로그인 페이지 진입");
    }

    // 4. 로그인 처리
    @PostMapping("/member/login")
    public String login(MemberVO member, HttpServletRequest request, RedirectAttributes rttr) {
        log.info("로그인 시도: " + member);
        
        MemberVO loginVo = service.login(member);

        if (loginVo != null) {
            log.info("로그인 성공: " + loginVo);
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", loginVo); 
            return "redirect:/"; 
        } else {
            log.info("로그인 실패");
            rttr.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "redirect:/member/login"; 
        }
    }

    // 5. 로그아웃 처리
    @GetMapping("/member/logout")
    public String logout(HttpServletRequest request) {
        log.info("로그아웃 실행");
        HttpSession session = request.getSession();
        session.invalidate(); 
        return "redirect:/"; 
    }
}
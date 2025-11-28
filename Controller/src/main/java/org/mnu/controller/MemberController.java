package org.mnu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mnu.domain.MemberVO;
import org.mnu.service.MemberService;
import org.mnu.service.RecordService; // 🌟 추가
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; // 🌟 추가
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping; // 🌟 @RequestMapping("/member/")을 사용하지 않았지만, 필요할 경우를 대비하여 추가
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
public class MemberController {

    private MemberService service;      // MemberService
    private RecordService recordService; // 🌟 RecordService 추가 (팀/선수 목록 조회용)

    // 1. 회원가입 페이지 이동 및 데이터 로드
    @GetMapping("/member/signup")
    public String signup(Model model) { // Model 파라미터 추가
        log.info("회원가입 페이지 진입 - 데이터 로드");
        
        // 1. 관심 구단 목록 로드
        model.addAttribute("teamList", recordService.getAllTeams()); 
        
        // 2. 관심 선수 목록 로드
        model.addAttribute("playerList", recordService.getAllPlayers()); 
        
        return "member/signup"; 
    }

    // 2. 회원가입 처리
    @PostMapping("/member/signup")
    public String signup(MemberVO member, 
                         String favPlayerId1, // 🌟 관심 선수 1
                         String favPlayerId2, // 🌟 관심 선수 2
                         String favPlayerId3, // 🌟 관심 선수 3
                         RedirectAttributes rttr) {
        
        log.info("회원가입 요청: " + member);
        log.info("관심 선수 ID: " + favPlayerId1 + ", " + favPlayerId2 + ", " + favPlayerId3);

        // 비밀번호 유효성 검사 (기존 로직 유지)
        if (!member.getUserPw().matches("^(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?]).{8,}$")) {
            rttr.addFlashAttribute("msg", "비밀번호는 8자리 이상, 특수문자를 포함해야 합니다.");
            return "redirect:/member/signup"; 
        }

        // 🌟 [관심 구단 NOT NULL 제약조건 회피 로직]
        // DB 설계상 필수이지만, UI에서 선택 사항이므로 빈 값(""), null이 넘어올 경우 임시 값 처리
        if (member.getFavTeamId() == null || member.getFavTeamId().isEmpty()) {
            // DB 제약 조건을 피하기 위해, Service/Mapper 단에서 NULL 삽입 또는 더미 ID ('T999' 등) 처리 필요
            // 여기서는 Service 단에서 처리할 수 있도록 null로 설정하여 전달합니다.
            member.setFavTeamId(null);
        }

        // 🌟 [관심 선수 ID 목록 정리]
        List<String> favPlayerIds = new ArrayList<>();
        if (favPlayerId1 != null && !favPlayerId1.isEmpty()) favPlayerIds.add(favPlayerId1);
        if (favPlayerId2 != null && !favPlayerId2.isEmpty()) favPlayerIds.add(favPlayerId2);
        if (favPlayerId3 != null && !favPlayerId3.isEmpty()) favPlayerIds.add(favPlayerId3);

        // 🌟 서비스 호출 (회원 정보와 관심 선수 목록을 함께 전달)
        // 이 코드가 작동하려면 MemberService 인터페이스에 register(MemberVO member, List<String> favPlayerIds) 메서드가 정의되어야 합니다.
        service.register(member, favPlayerIds);
        
        rttr.addFlashAttribute("msg", "회원가입이 완료되었습니다. 로그인해주세요.");
        return "redirect:/member/login"; 
    }

    // 3. 로그인 페이지 이동 (기존 로직 유지)
    @GetMapping("/member/login")
    public void loginInput(String error, String logout) {
        log.info("로그인 페이지 진입");
    }

    // 4. 로그인 처리 (기존 로직 유지)
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

    // 5. 로그아웃 처리 (기존 로직 유지)
    @GetMapping("/member/logout")
    public String logout(HttpServletRequest request) {
        log.info("로그아웃 실행");
        HttpSession session = request.getSession();
        session.invalidate(); 
        return "redirect:/"; 
    }
}
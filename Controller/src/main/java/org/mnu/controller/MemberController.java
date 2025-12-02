package org.mnu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mnu.domain.MemberVO;
import org.mnu.service.MemberService;
import org.mnu.service.RecordService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    private RecordService recordService; // 구단/선수 목록 가져오기용

    // 1. 회원가입 페이지
    @GetMapping("/member/signup")
    public String signup(Model model) {
        log.info("회원가입 페이지 진입");
        model.addAttribute("teamList", recordService.getAllTeams());
        model.addAttribute("playerList", recordService.getAllPlayers());
        return "member/signup";
    }

    // 2. 회원가입 처리
    @PostMapping("/member/signup")
    public String signup(MemberVO member, String favPlayerId1, String favPlayerId2, String favPlayerId3, RedirectAttributes rttr) {
        log.info("회원가입 요청: " + member);

        // 비밀번호 유효성 검사
        if (!member.getUserPw().matches("^(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?]).{8,}$")) {
            rttr.addFlashAttribute("msg", "비밀번호는 8자리 이상, 특수문자를 포함해야 합니다.");
            return "redirect:/member/signup"; 
        }

        // 관심구단 null 처리
        if (member.getFavTeamId() == null || member.getFavTeamId().isEmpty()) {
            member.setFavTeamId(null);
        }

        // 관심선수 목록 처리
        List<String> favPlayerIds = new ArrayList<>();
        if (favPlayerId1 != null && !favPlayerId1.isEmpty()) favPlayerIds.add(favPlayerId1);
        if (favPlayerId2 != null && !favPlayerId2.isEmpty()) favPlayerIds.add(favPlayerId2);
        if (favPlayerId3 != null && !favPlayerId3.isEmpty()) favPlayerIds.add(favPlayerId3);

        service.register(member, favPlayerIds);
        rttr.addFlashAttribute("msg", "회원가입 완료. 로그인해주세요.");
        return "redirect:/member/login"; 
    }

    // 3. 로그인 페이지
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
            log.info("로그인 성공");
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", loginVo); 
            return "redirect:/"; 
        } else {
            log.info("로그인 실패");
            rttr.addFlashAttribute("msg", "아이디 또는 비밀번호 불일치");
            return "redirect:/member/login"; 
        }
    }

    // 5. 로그아웃
    @GetMapping("/member/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate(); 
        return "redirect:/"; 
    }

    // ================= [새로 추가된 기능] =================

    // 6. 회원정보 수정 페이지 이동
    @GetMapping("/member/modify")
    public String modify(HttpSession session, Model model) {
        log.info("회원정보 수정 페이지 진입");
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        
        if (loginUser == null) {
            return "redirect:/member/login";
        }
        
        // 수정 화면에서도 구단 목록을 다시 보여줘야 변경 가능
        model.addAttribute("teamList", recordService.getAllTeams());
        return "member/modify";
    }

    // 7. 회원정보 수정 처리
    @PostMapping("/member/modify")
    public String modifyProcess(MemberVO member, RedirectAttributes rttr, HttpSession session) {
        log.info("정보 수정 요청: " + member);
        
        // DB 업데이트 실행 (Service에 modify 메서드가 구현되어 있어야 함)
        // service.modify(member); 
        
        // 세션 정보 갱신 (수정된 정보를 즉시 반영하기 위해)
        session.setAttribute("loginUser", member);
        rttr.addFlashAttribute("msg", "회원정보가 수정되었습니다.");
        
        return "redirect:/";
    }

    // 8. 회원 탈퇴 처리
    @PostMapping("/member/remove")
    public String remove(String userPw, HttpSession session, RedirectAttributes rttr) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        
        if(loginUser == null) return "redirect:/member/login";
        
        // 비밀번호 확인 후 탈퇴 (Service에 remove 메서드가 구현되어 있어야 함)
        if(loginUser.getUserPw().equals(userPw)) {
             service.remove(loginUser.getUserId()); 
            session.invalidate(); // 탈퇴했으므로 로그아웃 처리
            rttr.addFlashAttribute("msg", "탈퇴가 완료되었습니다.");
            return "redirect:/";
        } else {
            rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
            return "redirect:/member/modify";
        }
    }
}
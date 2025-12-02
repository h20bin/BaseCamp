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
    private RecordService recordService; 

    // 1. 회원가입 페이지
    @GetMapping("/member/signup")
    public String signup(Model model) {
        log.info("회원가입 페이지 진입");
        model.addAttribute("teamList", recordService.getAllTeams());
        model.addAttribute("playerList", recordService.getAllPlayers());
        return "member/signup";
    }

    // 2. 회원가입 처리 (중복 아이디 에러 처리 추가됨)
    @PostMapping("/member/signup")
    public String signup(MemberVO member, String favPlayerId1, String favPlayerId2, String favPlayerId3, RedirectAttributes rttr) {
        log.info("회원가입 요청: " + member);

        if (!member.getUserPw().matches("^(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>/?]).{8,}$")) {
            rttr.addFlashAttribute("msg", "비밀번호는 8자리 이상, 특수문자를 포함해야 합니다.");
            return "redirect:/member/signup"; 
        }

        if (member.getFavTeamId() == null || member.getFavTeamId().isEmpty()) {
            member.setFavTeamId(null);
        }

        List<String> favPlayerIds = new ArrayList<>();
        if (favPlayerId1 != null && !favPlayerId1.isEmpty()) favPlayerIds.add(favPlayerId1);
        if (favPlayerId2 != null && !favPlayerId2.isEmpty()) favPlayerIds.add(favPlayerId2);
        if (favPlayerId3 != null && !favPlayerId3.isEmpty()) favPlayerIds.add(favPlayerId3);

        try {
            // 회원가입 실행 (DB 저장)
            service.register(member, favPlayerIds);
            
        } catch (org.springframework.dao.DuplicateKeyException e) {
            // [수정됨] 아이디 중복 시 500 에러 대신 메시지 출력
            log.error("아이디 중복 발생: " + member.getUserId());
            rttr.addFlashAttribute("msg", "이미 사용 중인 아이디입니다. 다른 아이디를 사용해주세요.");
            return "redirect:/member/signup"; 
            
        } catch (RuntimeException e) {
            // 3개월 제한 등 기타 에러 처리
            rttr.addFlashAttribute("msg", e.getMessage());
            return "redirect:/member/signup";
        }

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

    // 6. 회원정보 수정 페이지 이동
    @GetMapping("/member/modify")
    public String modify(HttpSession session, Model model) {
        log.info("회원정보 수정 페이지 진입");
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        
        if (loginUser == null) {
            return "redirect:/member/login";
        }
        
        model.addAttribute("teamList", recordService.getAllTeams());
        return "member/modify";
    }

    // 7. 회원정보 수정 처리
    @PostMapping("/member/modify")
    public String modifyProcess(MemberVO member, RedirectAttributes rttr, HttpSession session) {
        log.info("정보 수정 요청: " + member);
        
        // [수정됨] 주석 해제하여 실제 수정 기능 동작하게 함
        service.modify(member); 
        
        // 세션 갱신
        session.setAttribute("loginUser", member);
        rttr.addFlashAttribute("msg", "회원정보가 수정되었습니다.");
        
        return "redirect:/";
    }

    // 8. 회원 탈퇴 처리 (사유 포함)
    @PostMapping("/member/remove")
    public String remove(String userPw, String withdrawalReason, HttpSession session, RedirectAttributes rttr) {
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        
        if(loginUser == null) return "redirect:/member/login";
        
        if(loginUser.getUserPw().equals(userPw)) {
            try {
                // [수정됨] 사유(withdrawalReason)까지 서비스로 전달
                service.remove(loginUser);
                
                session.invalidate(); // 탈퇴 성공 시 로그아웃
                rttr.addFlashAttribute("msg", "탈퇴가 완료되었습니다. (3개월간 재가입 제한)");
                return "redirect:/";
                
            } catch (Exception e) {
                rttr.addFlashAttribute("msg", "탈퇴 처리 중 오류: " + e.getMessage());
                return "redirect:/member/modify";
            }
        } else {
            rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
            return "redirect:/member/modify";
        }
    }
}
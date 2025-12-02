package org.mnu.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.mnu.domain.MemberVO;
import org.mnu.service.RecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.Setter;

@Controller
public class HomeController {
    
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    
    @Setter(onMethod_ = @Autowired)
    private RecordService recordService;
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model, HttpSession session) {
        logger.info("메인 화면 진입");
        
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        String formattedDate = dateFormat.format(date);
        model.addAttribute("serverTime", formattedDate );
        
        // [로그인 시 관심 데이터(구단, 선수) 가져오기]
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        
        if (loginUser != null) {
            try {
                if(recordService != null) {
                    // 1. 관심 구단 정보 가져오기
                    if(loginUser.getFavTeamId() != null) {
                        model.addAttribute("myTeam", recordService.getTeam(loginUser.getFavTeamId()));
                    }
                    
                    // 2. ▼▼▼ [추가됨] 관심 선수 목록 가져오기 ▼▼▼
                    model.addAttribute("myPlayers", recordService.getInterestPlayers(loginUser.getUserId()));
                }
            } catch (Exception e) {
                logger.error("데이터 로드 오류: " + e.getMessage());
            }
        }
        
        return "home";
    }
}
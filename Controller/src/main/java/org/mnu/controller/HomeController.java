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
    
    // 관심 구단 정보를 가져오기 위해 RecordService 주입
    @Setter(onMethod_ = @Autowired)
    private RecordService recordService;
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model, HttpSession session) {
        logger.info("Welcome home! The client locale is {}.", locale);
        
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
        String formattedDate = dateFormat.format(date);
        model.addAttribute("serverTime", formattedDate );
        
        // [추가 기능] 로그인한 사용자라면 -> 관심 구단 정보를 가져온다.
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        
        if (loginUser != null && loginUser.getFavTeamId() != null) {
            try {
                // RecordService에 getTeam(String teamId) 메서드가 있어야 함
                if(recordService != null) {
                    model.addAttribute("myTeam", recordService.getTeam(loginUser.getFavTeamId()));
                }
            } catch (Exception e) {
                logger.error("관심 구단 로드 오류: " + e.getMessage());
            }
        }
        
        return "home";
    }
}
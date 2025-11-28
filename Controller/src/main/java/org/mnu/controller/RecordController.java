package org.mnu.controller;

import org.mnu.service.RecordService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/record/*")
@AllArgsConstructor
public class RecordController {

    private RecordService service;

    // 팀 순위 페이지
    @GetMapping("/team")
    public void team(Model model) {
        log.info("team rank page...");
        model.addAttribute("teamList", service.getTeamRankings());
    }

    // 타자/투수 기록 페이지
    @GetMapping("/player")
    public void player(Model model) {
        log.info("player rank page...");
        model.addAttribute("batterList", service.getBatterRankings());
        model.addAttribute("pitcherList", service.getPitcherRankings());
    }
}
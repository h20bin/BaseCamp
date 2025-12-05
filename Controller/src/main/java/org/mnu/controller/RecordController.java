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

    private final RecordService service;

    // 통합 기록 페이지 (여기서 모든 데이터를 다 넘겨줍니다)
    @GetMapping("/list")
    public void recordList(Model model) {
        log.info("기록 메인 페이지 진입 - 데이터 로딩 중...");
        
        // 1. 팀 순위 데이터
        model.addAttribute("teamList", service.getTeamRankings());
        
        // 2. 선수 기록 (투수/타자 통합 or 개별, 여기선 통합 리스트인 playerList 사용)
        // 화면에서 타자/투수를 섞어서 보여주는 경우 getAllPlayers 사용
        model.addAttribute("playerList", service.getAllPlayers());
        
        // 3. 경기 기록 데이터
        model.addAttribute("gameList", service.getGameList());
    }
    
    // 개별 페이지가 필요 없다면 아래 메서드들은 제거해도 됩니다.
    // 하지만 AJAX 호출이나 별도 페이지 접속을 위해 남겨두셔도 무방합니다.
    @GetMapping("/team")
    public void team(Model model) {
        model.addAttribute("teamList", service.getTeamRankings());
    }

    @GetMapping("/player")
    public void player(Model model) {
        model.addAttribute("batterList", service.getBatterRankings());
        model.addAttribute("pitcherList", service.getPitcherRankings());
    }
}